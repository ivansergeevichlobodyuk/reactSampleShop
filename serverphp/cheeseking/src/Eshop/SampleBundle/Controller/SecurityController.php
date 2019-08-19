<?php
/**

 */
namespace Eshop\SampleBundle\Controller;

//use Elastica\Request;
use Doctrine\DBAL\Platforms\Keywords\ReservedKeywordsValidator;
use Eshop\SampleBundle\Entity\Users;
//use Symfony\Bundle\TwigBundle\Controller\ExceptionController;
use Symfony\Component\HttpFoundation\Request;
//use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
//use Symfony\Component\HttpFoundation\Response;
//use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
//use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Core\Tests\Encoder\PasswordEncoder;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\HttpFoundation\Response;
use Eshop\SampleBundle\Helper\SmsClient;
/**
 * SecurityController description
 *
 */
class SecurityController extends Controller
{

    /**
     * Logins default action
     *
     * @param Request $request
     * @param AuthenticationUtils $authenticationUtils
     * @return mixed
     */
    public function loginAction(Request $request, AuthenticationUtils $authenticationUtils)
    {
        //die;
        $securityContext = $this->container->get('security.authorization_checker');

        if ($securityContext->isGranted('IS_AUTHENTICATED_FULLY')) {
            return $this->redirectToRoute('catalog_home');
        }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();

        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('@EshopSample/Security/login.html.twig', array(
            'last_username' => $lastUsername,
            'error'         => $error,
        ));
    }

    /**
     * Change show action
     *
     */
    public function changeShowAction(Request $request){
        $user = $this->getDoctrine()->getRepository(Users::class)
            ->findOneBy(["hash"=>$request->query->get("hashId")]);
        if ( !$user ){
            throw $this->createNotFoundException('NOT_FOUND');
        }
        return $this->render('@EshopSample/Security/change.html.twig', ["hash" => $request->query->get("hashId")]);
    }



    /**
     * Change password action
     *
     * @param Request $request
     * @param UserPasswordEncoderInterface $passwordEncoder
     * @return Response
     */
    public function changeAction( Request $request, UserPasswordEncoderInterface $passwordEncoder,  \Swift_Mailer $mailer ){
        $user = $this->getDoctrine()->getRepository(Users::class)->findOneBy(["hash"=>$request->query->get("hashId")]);
        if ( !$user ){
            throw $this->createNotFoundException('NOT_FOUND');
        }

        $submittedToken = $request->request->get('token');

        if ( !$this->isCsrfTokenValid("change-form", $submittedToken) ) {
            return new Response(
                json_encode(["message"=>"Wrong csrf token"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }

            if ( !preg_match( '/^(?=.*[0-9])(?=.*[a-z])([a-zA-Z0-9]{5,})$/', $request->get("password")  ) ){
            return new Response(
                json_encode(["message"=>"Wrong!"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }

        if ( !empty($request->get("password")) ){
            $password = $passwordEncoder->encodePassword($user, trim($request->get("password")) );
            $user->setPassword($password);
            $manager = $this->getDoctrine()->getManager();
            $manager->persist($user);
            $manager->flush();

            $dataContent =  $this->renderView(
                '@EshopSample/Admin/email-changed.html.twig',
                ["item" => $user, "locale" => $request->getLocale(), "pass" => $request->get("password")]
            );

            $message = (new \Swift_Message('Password reset'))
                ->setFrom('send@example.com')
                ->setTo($user->getEmail())
                ->setBody(
                    $dataContent,
                    'text/html'
                );

            $mailer->send($message);

            $response = new Response(
                json_encode(["message"=>"OK"]),
                Response::HTTP_OK,
                array('content-type' => 'application/json')
            );
        }

        return $response;


    }

    /**
     * Reset show form
     *
     * @param Request $request
     * @return Response
     */
    public function resetShowAction(Request $request){
        return $this->render('@EshopSample/Security/reset.html.twig');
    }

    /**
     * Password encoder
     *
     * @param Request $request
     * @param UserPasswordEncoderInterface $passwordEncoder
     * @return Response
     */
    public function resetAction(Request $request, UserPasswordEncoderInterface $passwordEncoder, \Swift_Mailer $mailer){
        $isByEmail = $request->get("email")?true:false;
        $data = $isByEmail?['email' => $request->get('email')]:['phone' => $request->get('phone')];

        $user = $this->getDoctrine()->getRepository(Users::class)->findOneBy($data);
        $submittedToken = $request->request->get('token');

        if ( $this->isCsrfTokenValid("reset-form", $submittedToken) ) {
            if ($user) {
                $user->setHash($this->_generateHash(24));
                $passClear = $this->_generateHash(6);
                $password = $passwordEncoder->encodePassword($user, $passClear);
                $user->setPassword($password);

                $dataContent = ($isByEmail)?$this->renderView(
                    '@EshopSample/Admin/email-reset.html.twig',
                    ["item" => $user, "locale" => $request->getLocale(), "pass" => $passClear]
                ):$this->renderView(
                    '@EshopSample/Admin/phone-message.html.twig',
                    ["item" => $user, "locale" => $request->getLocale(), "pass" => $passClear]
                );
                if ( $isByEmail ){
                    $message = (new \Swift_Message('Password reset'))
                        ->setFrom('send@example.com')
                        ->setTo($user->getEmail())
                        ->setBody(
                            $dataContent,
                            'text/html'
                        );
                    $resultSend = $mailer->send($message);
                }else{
                        if ( $user->getLastDateResetSendSMS( ) != null && $user->getLastDateResetSendSMS( )->diff( new \DateTime( date('Y-m-d H:i:s')))->format("%h") < 1 &&  $user->getCountCheckCode()+1 > 2 ){
                            $resultSend = false;
                        }else {
                            $sms = new SmsClient('', '', $this->getParameter('apisms_key'));
                            $id = $sms->sendSMS($this->getParameter('apisms_name'), $user->getPhone(), $dataContent );
                            if($sms->hasErrors() & false ){
                                $resultSend = false;
                            }else {
                                $user->setCountResetSMS($user->getCountResetSMS() + 1);
                                $user->setLastDateResetSendSMS(new \DateTime(date('Y-m-d H:i:s')));
                                $resultSend = true;
                            }
                        }
                }

                if ( $resultSend ){
                    $manager = $this->getDoctrine()->getManager();
                    $manager->persist($user);
                    $manager->flush();
                    $response = new Response(
                        json_encode(["message" => "OK"]),
                        Response::HTTP_OK,
                        array('content-type' => 'application/json')
                    );
                }else{
                    $response = new Response(
                        json_encode(["message" => $this->get("translator")->trans("CANT_SEND_TRY_LATER", [] , 'translations', $request->getLocale())]),
                        Response::HTTP_GATEWAY_TIMEOUT,
                        array('content-type' => 'application/json')
                    );
                }


            } else {
                $response = new Response(
                    json_encode(["message" => $this->get("translator")->trans($isByEmail?"EMAIL_NOT_FOUND":"PHONE_NOT_FIND", [] , 'translations', $request->getLocale()) ]),
                    Response::HTTP_NOT_FOUND,
                    array('content-type' => 'application/json')
                );
            }
        }else{
            $response = new Response(
                json_encode(["message" => "WRONG TOKEN"]),
                Response::HTTP_NOT_FOUND,
                array('content-type' => 'application/json')
            );
        }
        return $response;
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


}