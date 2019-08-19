<?php

namespace Eshop\SampleBundle\Controller;

use Doctrine\Tests\Common\DataFixtures\TestEntity\User;
use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\Goods;
use Eshop\SampleBundle\Entity\Menu;
use Eshop\SampleBundle\Entity\News;
use Eshop\SampleBundle\Entity\Services;
use Eshop\SampleBundle\Entity\Support;
use Eshop\SampleBundle\Entity\Users;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Eshop\SampleBundle\Entity\GoodsToCategory;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use FOS\CKEditorBundle\Form\Type\CKEditorType;
use Eshop\SampleBundle\Helper\Ean13;
use BG\BarcodeBundle\Util\Base1DBarcode as barCode;
use BG\BarcodeBundle\Util\Base2DBarcode;
use Symfony\Component\Translation\TranslatorInterface;


class AdminController extends Controller
{
    /**
     * Lists pictures action
     *
     * @param Request $request
     * @return Response
     */
    public function listPicturesAction(Request $request){
        $category = $request->query->get("category",1);
        $list = $this->getDoctrine()->getRepository(News::class)->findBy(["category" => $category], ['ordering' => 'ASC'] );
        if($request->isXmlHttpRequest()) {
            return $this->render('@EshopSample/Admin/ajax-image-list.html.twig',["list" => $list, "category" => $category]);
        }else{
            return $this->render('@EshopSample/Admin/images-list.html.twig',["list" => $list, "category"=> $category]);
        }
    }

    /**
     * Add file to filesystem
     *
     * @param Request $request
     * @return Response
     */
    public function addPicturesAction( Request $request ){
        $count = count($this->getDoctrine()->getRepository(News::class)->findBy(["category" => $request->get("category")]));

        $submittedToken = $request->request->get('token');
        if ( !$this->isCsrfTokenValid("profile-form", $submittedToken) ) {
            return new Response(
                json_encode(["message"=>"Wrong csrf token"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }

        foreach ( $request->files->get("file") AS $reqFile ) {
            $news  = new News();
            $news->setFileName($reqFile->getClientOriginalName( ));
            $news->setArticleRu("change this text");
            $news->setArticleUa("change this text");
            $news->setIsActive(0);
            $news->setIsArchive(0);
            $count++;
            $news->setOrdering($count);
            $fileNamePhysic = $this->generateRandomString(8) . "-" . $reqFile->getClientOriginalName();
            $news->setPhysicFileName($fileNamePhysic);
            $news->setCategory($request->query->get("category", 1));
            $manager = $this->getDoctrine()->getManager();
            $manager->persist($news);
            $manager->flush();
            $directory = $this->container->getParameter('kernel.root_dir') . '/../web/bundles/eshopsample/files/';
            $reqFile->move($directory, $fileNamePhysic);
        }
        $response = new Response(json_encode(["ok"]),Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }

    /**
     * Reads article action
     *
     * @param Request $request
     * @param $id
     * @return Response
     */
    public function readArticleAction(Request $request, $id){
        $article = $this->getDoctrine()->getRepository(News::class)->findOneBy(["isActive"=>1,"id" => $id]);
        if ( !$article ){
            throw $this->createNotFoundException('NOT_FOUND');
        }
        if ( $request->query->get('lang') ){
            $methodName = "getArticle".ucfirst($request->query->get('lang'));
        }else{
            $methodName = "getArticle".ucfirst($request->getLocale());
        }
        return $this->render( '@EshopSample/Admin/item-article.html.twig', ['article' => $article->$methodName(), "item" => $article ] );
    }

    /**
     * Updates ordering
     *
     * @param Request $request
     * @return Response
     */
    public function updateOrderingAction(Request $request){


        $submittedToken = $request->request->get('token');
        if ( !$this->isCsrfTokenValid("profile-form", $submittedToken) ) {
            return new Response(
                json_encode(["message"=>"Wrong csrf token"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }

        foreach ( $request->get('data') As $itemData ){
            $new = $this->getDoctrine()->getRepository(News::class)->find($itemData['id']);
            $new->setOrdering($itemData['ordering']);
            $manager = $this->getDoctrine()->getManager();
            $manager->persist($new);
            $manager->flush();
           // echo " id ".$itemData['id']. " ordering ".$itemData['ordering'];
        }
        //die;
        $response = new Response(json_encode(["ok"]),Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }


    /**
     * Updates active/inactive
     *
     * @param Request $request
     * @return Response
     */
    public function updateActiveAction(Request $request){

        $submittedToken = $request->request->get('token');
        if ( !$this->isCsrfTokenValid("profile-form", $submittedToken) ) {
            return new Response(
                json_encode(["message"=>"Wrong csrf token"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }

        $new = $this->getDoctrine()->getRepository(News::class)->find($request->get("id"));
        $new->setIsActive($request->get("active"));
        $manager = $this->getDoctrine()->getManager();
        $manager->persist($new);
        $manager->flush();
        $response = new Response(json_encode(["ok"]),Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }

    /**
     * Remove action
     *
     * @return Response
     */
    public function removeAction(Request $request){

        $submittedToken = $request->request->get('token');
        if ( !$this->isCsrfTokenValid("profile-form", $submittedToken) ) {
            return new Response(
                json_encode(["message"=>"Wrong csrf token"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }

        $new = $this->getDoctrine()->getRepository(News::class)->find($request->get("id"));
        unlink($this->container->getParameter('kernel.root_dir') . '/../web/bundles/eshopsample/files/'.$new->getPhysicFileName( ));
        $em = $this->getDoctrine()->getEntityManager();
        $em->remove($new);
        $em->flush();
        $response = new Response(json_encode(["ok"]),Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }

    /**
     * Gets item action
     *
     * @param Request $request
     * @param $id
     * @return Response
     */
    public function getItemAction( Request $request, $id ){
        $item = $this->getDoctrine()->getRepository(News::class)->find($id);
        $rand = $this->generateRandomString(20);

        $categories = [1=> "SLIDER",2 => "BANNER", 3 => "GALLERY"];

        $message = $this->get('translator')->trans("YOU_EDITED_ITEM", ['%number' => $item->getOrdering(), '%category' =>
            lcfirst($this->get('translator')->trans($categories[$item->getCategory()], [] ,'translations', $request->getLocale()))
        ], 'translations', $request->getLocale());

        $builder = $this->createFormBuilder();
        $form = $builder->add('article_ua', CKEditorType::class, array(
            'config_name' => 'my_config',
            'data' => $item->getArticleUa(),
            'attr' => array("id"=>"article-".$item->getId()),
            'inline' => true,
            'input_sync' => true,
            'label' => ' ',
            'label_attr' => array('id' => "text-ua", 'class'=>'uk-form-label'),
            'filebrowsers' => array(
                'VideoUpload',
                'VideoBrowse',
            ),
            'config'      => array('uiColor' => '#ffffff',
                "data-link" =>"linkff"
            )
        ))->add(
            'article_ru', CKEditorType::class , array(
                'config_name' => 'my_config',
                'data' => $item->getArticleRu(),
                'attr' => array("id"=>"article-".$item->getId()),
                'inline' => true,
                'input_sync' => true,
                'label' => ' ',
                'label_attr' => array('id' => "text-ru", 'class'=>'uk-form-label'),
                'filebrowsers' => array(
                    'VideoUpload',
                    'VideoBrowse',
                ),
                'config'      => array('uiColor' => '#ffffff',
                    "data-link" =>"linkff"
                )
            )

            )->getForm();

        return $this->render( '@EshopSample/Admin/item.html.twig', ['item' => $item, 'rand' => $rand , 'form' => $form->createView(), 'message' => $message] );
    }

    public function loadPicAction(Request $request){
        return $this->render('@EshopSample/Admin/pic.html.twig', ['src' => $request->query->get("src"), "rand" => $this->generateRandomString(12)]);
    }

    /**
     * Edits news action
     *
     * @param Request $request
     * @param $id
     * @return Response
     */
    public function editPicturesAction( Request $request, $id, TranslatorInterface $translator ){
        $submittedToken = $request->request->get('token');
        if ( !$this->isCsrfTokenValid("profile-form", $submittedToken) ) {
            return new Response(
                json_encode(["message"=>"Wrong csrf token"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }

        $item = $this->getDoctrine()->getRepository(News::class)->find($id);
        $newName = $this->generateRandomString(5)."-".$item->getPhysicFileName();
        $item->setPhysicFileName($newName);
        if ( $request->files->get('croppedImage') ){
            $file = $request->files->get('croppedImage');
            $directory = $this->container->getParameter('kernel.root_dir') . '/../web/bundles/eshopsample/files/';
            try{
                if ( !$file->move($directory, $newName) ){
                    return  new Response(["message" => $this->trans("ERROR_UPLOAD")],500, array('content-type' => 'application/json'));
                }
            }Catch(\Exception $exception){
               return new Response(json_encode(["message" => $exception->getMessage()]),500, array('content-type' => 'application/json'));
            }
        }

        $item->setArticleRu($request->get("article_ru"));
        $item->setArticleUa($request->get("article_ua"));
        $item->setIsActive($request->get("is_active"));
        $manager = $this->getDoctrine()->getManager();
        $manager->persist($item);
        $manager->flush();

        return new Response(json_encode(["ok"]),Response::HTTP_OK, array('content-type' => 'application/json'));
    }

    /**
     * Gets Users data
     *
     * @param Request $request
     * @return Response
     */
    public function getUserDataAction(Request $request){
        $bcHTMLRaw1 = 0;
        $bcHTMLRaw2 = 0;

        if ( !$this->getUser()->getVerify() ){
            return $this->redirect($this->generateUrl('show_sms_verification_form')."?verify=".$this->getUser()->getHash());
        }

        if ( $this->getUser()->getPromocode() ){
            $myBarcode = new barCode();
            $myBarcode2D = new Base2DBarcode();
            $myBarcode->savePath = $this->container->getParameter('kernel.root_dir') . '/../web/bundles/eshopsample/files/';
            $bcHTMLRaw1 = $myBarcode->getBarcodeHTML($this->getUser()->getPromocode(), 'EAN13', 1.75, 45, "black");
            $bcHTMLRaw2 = $myBarcode2D->getBarcodeHTML($this->getUser()->getPromocode(), 'QRCODE', 10, 10, "black");
        }
        return $this->render('@EshopSample/Admin/profile.html.twig', [
            "user" => $this->getUser(),
            "bcHTMLRaw1" => $bcHTMLRaw1,
            "bcHTMLRaw2" => $bcHTMLRaw2,
            "isAjax" => $request->isXmlHttpRequest()
        ]);
    }

    /**
     * Generates new code action
     *
     */
    public function generateNewCodeAction( Request $request ){
        $submittedToken = $request->request->get('token');
        if ( !$this->isCsrfTokenValid("profile-form", $submittedToken) ) {
            return new Response(
                json_encode(["message"=>"Wrong csrf token"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }
        $user = $this->getDoctrine()->getRepository(Users::class)->find($this->getUser()->getId());
        $user->setPromocode(Ean13::create());
        $manager = $this->getDoctrine()->getManager();
        $manager->persist($user);
        $manager->flush();
        $bcHTMLRaw = 0;
        if ( $this->getUser()->getPromocode() ){
            $myBarcode = new barCode();
            $myBarcode2D = new Base2DBarcode();
            $myBarcode->savePath = $this->container->getParameter('kernel.root_dir') . '/../web/bundles/eshopsample/files/';
            $bcHTMLRaw1 = $myBarcode->getBarcodeHTML($this->getUser()->getPromocode(), 'EAN13', 1.75, 45, "#000000");
            $bcHTMLRaw2 = $myBarcode2D->getBarcodeHTML($this->getUser()->getPromocode(), 'QRCODE', 10, 10, "#000000");
        }

        return $this->render('@EshopSample/Admin/profile.html.twig', ["user" => $this->getUser(), "bcHTMLRaw1" => $bcHTMLRaw1,"bcHTMLRaw2" => $bcHTMLRaw2]);

    }

    /**
     * Updates profile action
     *
     * @param Request $request
     * @return Response
     */
    public function updateProfileAction( Request $request ){
        $submittedToken = $request->request->get('token');
        if ( !$this->isCsrfTokenValid("profile-form", $submittedToken) ) {
            return new Response(
                json_encode(["message"=>"Wrong csrf token"]),
                Response::HTTP_NOT_ACCEPTABLE,
                array('content-type' => 'application/json')
            );
        }

        $user = $this->getDoctrine()->getRepository(Users::class)->find($this->getUser()->getId());
        $user->setName($request->get("name"));
        $user->setSurname($request->get("surname"));
        $user->setAddress($request->get("address"));
        $manager = $this->getDoctrine()->getManager();
        $manager->persist($user);
        $manager->flush();

        return new Response(json_encode(["ok"]),Response::HTTP_OK, array('content-type' => 'application/json'));
    }

    /**
     * Generates random string
     *
     * @param int $length
     * @return string
     */
    private function generateRandomString($length = 10){
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}
