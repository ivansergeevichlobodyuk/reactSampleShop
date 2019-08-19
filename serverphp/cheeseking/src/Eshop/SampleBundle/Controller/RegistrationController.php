<?php
/**
 * Created by PhpStorm.
 * User: ivanlobodyuk
 * Date: 26.12.18
 * Time: 14:24
 */

namespace Eshop\SampleBundle\Controller;

use Eshop\SampleBundle\Entity\Currencies;
use Eshop\SampleBundle\Form\UserType;
use Eshop\SampleBundle\Entity\Users;
use Eshop\SampleBundle\Helper\SmsClient;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Form;
use Symfony\Component\Form\FormError;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Translation\Loader\YamlFileLoader;
use Symfony\Component\Translation\TranslatorInterface;


class RegistrationController extends Controller
{
    /**
     * @Route("/register", name="user_registration")
     */
    public function registerAction(Request $request, UserPasswordEncoderInterface $passwordEncoder, \Swift_Mailer $mailer, TranslatorInterface $translator)
    {
        $securityContext = $this->container->get('security.authorization_checker');

        if ($securityContext->isGranted('IS_AUTHENTICATED_FULLY')) {
            return $this->redirectToRoute('catalog_home');
        }

        $user = new Users();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        $message = [];
        $json_answer = [];
        $land = $request->getLocale();

        if ( $request->isXmlHttpRequest() ){
            if (!$this->captchaverify($request->get('captcha'))){
                $json_answer["plainPassword.second"] = $translator->trans("WRONG_CAPTCHA",[],'translations',$land);
            }
            foreach ( ["name","phone"] as $field ){
                $error = $form[$field]->getErrors();
                foreach ( $error As $item ){
                   $json_answer[$field] = $translator->trans($item->getMessageTemplate( ),[],'translations', $land);
                }
            }
            foreach ( ["plainPassword.first","plainPassword.second"] AS $field ){
                $keys = explode(".",$field);
                $error = $form[$keys[0]][$keys[1]]->getErrors();
                foreach ( $error As $item ){
                    $json_answer[$field] = $translator->trans($item->getMessageTemplate( ),[],'translations', $land);
                }
            }

            if ( !empty($json_answer) ){
                return new Response(json_encode($json_answer),Response::HTTP_INTERNAL_SERVER_ERROR, array('content-type' => 'application/json'));
            }else{

                $plainPassword = $user->getPlainPassword();
                $registeredUser = $this->_registerUser($user, $passwordEncoder, $request);

                $dataContent = $this->renderView(
                    '@EshopSample/Admin/email-registered.html.twig',
                    ["item" => $user, "password" => $plainPassword ,"locale" => $request->getLocale()]
                );

                if ( $registeredUser->getEmail() != ''){
                    $message = (new \Swift_Message('Register user'))
                        ->setFrom('send@example.com')
                        ->setTo($registeredUser->getEmail())
                        ->setBody(
                            $dataContent,
                            'text/html'
                        );
                    $result = $mailer->send($message);
                }
                return new Response(json_encode(["hash" => $registeredUser->getHash()]),Response::HTTP_OK, array('content-type' => 'application/json'));
            }
        }else{
            if ($form->isSubmitted() && $form->isValid()) {
                $this->_registerUser($user, $passwordEncoder, $request);
                return $this->redirectToRoute('catalog_home');
            }
        }

        return $this->render(
            '@EshopSample/Security/register.html.twig',
            array('form' => $form->createView())
        );
    }

    /**
     * Shows verify form with input and 2 buttons: re-send sms and check code
     *
     * @param Request $request
     * @return Response
     * @throws \Exception
     */
    public function verifyShowSendUserAction( Request $request ){
        $user = $this->getDoctrine()->getRepository(Users::class)->findOneBy(["hash"=>$request->query->get("verify")]);
        if ( $user ){
            if ( !$user->getVerify() ){

                // we don\t send sms if user put wring code more than 4 time in one hour
                if ( $user->getLastDateCheckCode( ) != null && $user->getLastDateCheckCode( )->diff( new \DateTime( date('Y-m-d H:i:s')))->format("%h") < 1 &&  $user->getCountCheckCode()+1 > 4 ) {
                    return $this->render("@EshopSample/Security/count-code-try-later.html.twig");
                }

                // if count of trying more than 15 and last try was less than 3 hours show try send code later
                if ($user->getCountSMSSend()+1 > 4  &&  $user->getLastDateSendSMS( )->diff( new \DateTime(date('Y-m-d H:i:s')) )->format('%h') < 3 ){
                    return $this->render("@EshopSample/Security/verify-try-later.html.twig");
                }
                return $this->render("@EshopSample/Security/verify.html.twig", ['verify' => $request->query->get("verify")]);
            }else{
               throw $this->createNotFoundException( );
            }
        }else{
            throw $this->createNotFoundException( );
        }
    }

    /**
     * Sends sms code action if all condition is true
     *
     * @param Request $request
     * @return Response
     */
    public function sendSMSVerificationCodeAction( Request $request, TranslatorInterface $translator ){

        $user = $this->getDoctrine()->getRepository(Users::class)->findOneBy(["hash"=>$request->get("verify")]);
        if ( $user ){
            if ( !$user->getVerify() ){

                // we don\t send sms if user put wring code more than 4 time in one hour
                if ( $user->getLastDateCheckCode( ) != null && $user->getLastDateCheckCode( )->diff( new \DateTime( date('Y-m-d H:i:s')))->format("%h") < 1 &&  $user->getCountCheckCode()+1 > 4 ) {
                    //echo "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$";
                    return  new Response(json_encode(
                        [
                            "message" => $translator->trans("COUNT_PUT_CODE_TRYING_FROM_SMS_EXCEEDED", [], 'translations', $request->getLocale()),
                            "redirect" => $this->generateUrl('show_sms_verification_form', ['verify' => $request->get('verify')])
                        ]
                    ),
                        Response::HTTP_FORBIDDEN, ['content-type' => 'application/json']
                    );
                }


                // if count of trying more than 4 and last try was less than 3 hours show try send code later
                if ($user->getCountSMSSend()+1 > 4  &&  $user->getLastDateSendSMS( )->diff( new \DateTime(date('Y-m-d H:i:s')) )->format('%h') < 3 ){
//                    return $this->render("@EshopSample/Security/verify-try-later.html.twig");
                    return  new Response(json_encode(
                        [
                            "message"  => $translator->trans("COUNT_SENDED_SMS_EXCEEDED", [], 'translations', $request->getLocale()),
                            "redirect" => $this->generateUrl('show_sms_verification_form', ['verify' => $request->get('verify')])
                        ]
                    ),
                        Response::HTTP_FORBIDDEN, ['content-type' => 'application/json']
                    );

                }

                // if user havan't activation code or last generation code date more than 3 hours generate code and set generation date!
                if ( !$user->getActivationCode( ) || $user->getLastDateCreateCode( )->diff( new \DateTime( date('Y-m-d H:i:s')))->format("%h") > 3 ){
                    $code = $this->_generateDigitCode(4);
                    $user->setActivationCode($code);
                    $user->setLastDateCreateCode( new \DateTime( date('Y-m-d H:i:s') ) );
                   // echo "<br /> code is new generated ".$code;
                }else{
                    $code = $user->getActivationCode();
                  //  echo "<br /> code use from db ".$code;
                }
                $sms = new SmsClient('', '', $this->getParameter('apisms_key'));
                $id = $sms->sendSMS($this->getParameter('apisms_name'), $user->getPhone(), $translator->trans("YOUR_CODE", [], 'translations', $request->getLocale()).$code );
                if($sms->hasErrors() && false ){
                    return  new Response(json_encode(
                        [
                            "message" => $translator->trans("SMS_SERVICE_DOWN_LOGIN_WITH_YOU_CREDENTIALS_AND_TRY_LATER", [], 'translations', $request->getLocale()),
                            "redirect" => $this->generateUrl('login')
                        ]
                    ),
                        Response::HTTP_GATEWAY_TIMEOUT, ['content-type' => 'application/json']
                    );
                }else{
                    $user->setLastDateSendSMS(new \DateTime(date('Y-m-d H:i:s')));
                    $user->setCountSMSSend($user->getCountSMSSend()+1);
                    $manager = $this->getDoctrine()->getManager();
                    $manager->persist($user);
                    $manager->flush();
                    //echo "<br /> code ".$code;
                    //echo "<br /> count ".$user->getCountSMSSend();
                    return  new Response(json_encode(
                        [
                            "message" => $translator->trans("SMS_WAS_SEND_OK", [], 'translations', $request->getLocale()),
                            "redirect" => $this->generateUrl('show_sms_verification_form', ['verify' => $request->get('verify')])
                        ]
                    ),
                        Response::HTTP_OK, ['content-type' => 'application/json']
                    );

                }
            }else{
                return  new Response(json_encode(
                    [
                        "message"  => $translator->trans("ALREADY_VERIFIED", [], 'translations', $request->getLocale()),
                        "redirect" => $this->generateUrl('login')
                    ]
                ),
                    Response::HTTP_NOT_ACCEPTABLE, ['content-type' => 'application/json']
                );
            }
        }else{
            return  new Response(json_encode(
                [
                    "message" => $translator->trans("WRONG_HASH_NAME", [], 'translations', $request->getLocale()),
                    "redirect" => $this->generateUrl('login')
                ]
            ),
                Response::HTTP_NOT_FOUND, ['content-type' => 'application/json']
            );
        }

    }

    /**
     * Checks code
     *
     *
     * @param Request $request
     * @param TranslatorInterface $translator
     * @return Response
     * @throws \Exception
     */
    public function checkCodeAction( Request $request, TranslatorInterface $translator ){
        $user = $this->getDoctrine()->getRepository(Users::class)->findOneBy(["hash"=>$request->get("hash")]);
        $response = new Response(json_encode(
                [
                    "message" => $translator->trans("CODE_WRONG",[],'translations', $request->getLocale()),
                    "redirect" => null
                ]
            ),
                Response::HTTP_NOT_ACCEPTABLE, ['content-type' => 'application/json']
            );
           // die;
        if ( $user ){
            if ( $user->getLastDateCheckCode( ) != null && $user->getLastDateCheckCode( )->diff( new \DateTime( date('Y-m-d H:i:s')))->format("%h") < 1 &&  $user->getCountCheckCode()+1 > 4 ) {
                    $response = new Response(json_encode(
                        [
                            "message" => $translator->trans("COUNT_EXPIRE_PLZ_TRY_AFTER_ONE_HOUR", [], 'translations', $request->getLocale()),
                            "redirect" => $this->generateUrl('show_sms_verification_form', ['verify' => $request->get('hash')])
                        ]
                    ),
                        Response::HTTP_NOT_ACCEPTABLE, ['content-type' => 'application/json']
                    );
            }
            elseif ( strcmp(trim((string)$user->getActivationCode()), trim((string)$request->get("code"))) === 0  ){
                $user->setVerify(1);
                $user->setActivationCode(0);
                $response =  new Response(json_encode(
                    [
                        "message" => $translator->trans("CODE_OK_YOU_CAN_LOGIN_NOW",[],'translations', $request->getLocale()),
                        "redirect" => $this->generateUrl("login")
                    ]
                ),
                    Response::HTTP_OK, ['content-type' => 'application/json']);
            }
            $user->setLastDateCheckCode(new \DateTime(date('Y-m-d H:i:s')));
            $user->setCountCheckCode($user->getCountCheckCode()+1);
            $manager = $this->getDoctrine()->getManager();
            $manager->persist($user);
            $manager->flush();
        }
        return $response;
    }


    /**
     * @param $recaptcha
     * @return mixed
     */
    public function captchaverify($recaptcha){
        $url = "https://www.google.com/recaptcha/api/siteverify";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, array(
            "secret"=>"6Ld44KkUAAAAAHP0XLlczxYrxv7-TkwvstYrOVbJ","response"=>$recaptcha));
        $response = curl_exec($ch);
        curl_close($ch);
        $data = json_decode($response);

        return $data->success;
    }


    /**
     * Register user action
     *
     */
    private function _registerUser($user, UserPasswordEncoderInterface $passwordEncoder, Request $request){
        $password = $passwordEncoder->encodePassword($user, $user->getPlainPassword());
        $entityManager = $this->getDoctrine()->getManager();
        $user->setPassword($password);
        $user->setRoles('["ROLE_BUYER"]');
        $user->setUsername($request->request->get("user")["email"]?$request->request->get("user")["email"]:$request->request->get("user")["phone"]);
        $user->setEmail($request->request->get("user")["email"]?$request->request->get("user")["email"]:"");
        $user->setLocale("ua");
        $user->setHash($this->_generateHash(14));

        $currency = $entityManager->getRepository(Currencies::class)->findOneBy(["isDefault" => 1]);
        $user->setDefaultCurrency($currency);
        $entityManager->persist($user);
        $entityManager->flush( );
        return $user;
    }

    /**
     * Generate hash
     *
     * @param int $length
     * @return string
     */
    private function _generateHash($length = 10){
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    /**
     * Generates digit code
     *
     * @param int $length
     * @return string
     */
    private function _generateDigitCode($length = 4){
        $characters = '0123456789';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

}


