<?php

namespace Eshop\SampleBundle\Controller;

use Doctrine\Tests\Common\DataFixtures\TestEntity\User;
use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\Goods;
use Eshop\SampleBundle\Entity\Menu;
use Eshop\SampleBundle\Entity\News;
use Eshop\SampleBundle\Entity\Services;
use Eshop\SampleBundle\Entity\Support;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Eshop\SampleBundle\Entity\GoodsToCategory;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Serializer\SerializerInterface;


class DefaultController extends Controller
{

    /**
     * Here most popular products should be
     *
     * @return Response
     */
    public function indexAction( )
    {
        $listForSlider = $this->getDoctrine()->getRepository(News::class)->findBy(["category" => 1, "isActive" => 1],["ordering" =>"ASC"]);
        $listForBottom = $this->getDoctrine()->getRepository(News::class)->findBy(["category" => 2,"isActive" => 1],["ordering" =>"ASC"]);;
        $listForGallery = $this->getDoctrine()->getRepository(News::class)->findBy(["category" => 3,"isActive" => 1],["ordering" =>"ASC"]);
        return $this->render('@EshopSample/Default/index.html.twig',["listForSlider" => $listForSlider, "listForBottom" => $listForBottom, "rand" => 1 ,"listForGallery" => $listForGallery]);
    }


    /**
     * Generates random string
     *
     * @param int $length
     * @return string
     */
    private function _generateRandomString($length = 10){
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    /**
     *
     */
    public function publicStartPageAction(){
        return $this->render('@EshopSample/Main/start.html.twig');
    }

    /**
     * Services list action
     *
     * @return Response
     */
    public function servicesListAction( ){
        return $this->render('@EshopSample/Default/services.html.twig', ["list" => $this->getDoctrine()->getRepository(Services::class)->findAll() ]);
    }

    /**
     * Add support request to db
     *
     *
     * @param Request $request
     * @return Response
     * @throws \Exception
     */
    public function sendRequestAction( Request $request ){
        $newRequest = new Support();
        $newRequest->setDescription($request->get("description"));
        $newRequest->setPhone($request->get("phone"));
        $newRequest->setName($request->get("name"));
        $newRequest->setDate(new \DateTime());
        $manager = $this->getDoctrine()->getManager();
        $manager->persist($newRequest);
        $manager->flush();
        $response = new Response(json_encode(["ok"]),Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }

    /**
     *
     */
    public function getMenuAction( ){
        die;
        $categories = $this->getDoctrine()->getRepository(GoodsToCategory::class);
        $menu = $categories->findBy(array("priority" => 1));
        $leftMenu = array();
        foreach ($menu AS $item ){
            $leftMenu[$item->getCategories()->getId()] = [
                'id' => $item->getCategories()->getId(),
                'name' => $item->getCategories()->getCategoryName()
            ];
        }
        return $this->render('@EshopSample/Main/menu.html.twig', array("menu" => $leftMenu));
    }

    /**
     * Gets iter item
     *
     * @param int $parent
     * @return array
     */
    private function iterMenu($parent = 0){
        $scheme = $this->getDoctrine()->getRepository(Categories::class);
        $menu = $scheme->findBy(["parenId" => $parent],['ordering' => 'ASC']);

        $menuResult = [];
        if ( $parent = 0 ){
            $ids = [];
        }
        foreach ( $menu as $item ){
            $data = $this->iterMenu($item->getId());
            $menuResult[$item->getId()] = ["data" => $item,  "child"=>$data];
        }

        return $menuResult;
    }


    /**
     * @param Request $request
     */
    public function cropperAction( Request $request ){
        return $this->render("@EshopSample/Main/cropper.html.twig", []);
    }

    /**
     * Set caching menu
     *
     */
    public function _setCachingMenuAction(){
        $manager = $this->getDoctrine()->getManager();
        $cached = serialize($this->iterMenu( ));
        $menu = new Menu();
        $menu->setData($cached);
        $menu->setDate(new \DateTime());

        $manager->persist($menu);
        $manager->flush();

        $response = new Response(
                                json_encode(["cached"=>true]),
                                Response::HTTP_OK,
                                array('content-type' => 'application/json')
        );

        return $response;
    }

    /**
     * Gets caching menu
     *
     */
    private function getCachingMenu(){
        $repoMenu = $this->getDoctrine()->getRepository(Menu::class);
        $menu = $repoMenu->findCurrentScheme();
        $cached = null;
        if ( $menu ){
            $cached = unserialize($menu["data"]);
        }
        return $cached;
    }

    /**
     * Swithcer language action
     *
     * @param Request $request
     * @return Response
     */
    public function switchLanguageAction( Request $request ){

        $user = $this->getUser();
        if ( $user ) {
            $user->setLocale($request->request->get("lang"));
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();
            $response = new Response(
                json_encode(["message" => "Lang changed"]),
                Response::HTTP_OK,
                array('content-type' => 'application/json')
            );

        }else{

            $response = new Response(
                json_encode(["message" => "Not logged"]),
                Response::HTTP_OK,
                array('content-type' => 'application/json')
            );
        }
        return $response;
    }



    /**
     * Gets all menu scheme action
     *
     * @param SerializerInterface $serializer
     * @param Request $request
     * @return Response
     */
    public function getAllMenuSchemeAction( SerializerInterface $serializer, Request $request ){
        $time1 = microtime(true);
        $cached = $this->getCachingMenu();
        if ( $cached ){
            $menu = $cached;
        }else{
            $menu = $this->iterMenu();
            $this->_setCachingMenuAction();
        }
        //print_r($menu); die;
        $time2 = microtime(true);
        $resultMenu = $time2-$time1;
        $locale = $request->getLocale();
        $category = explode("-",$request->get("category"));
        $currentCategory = $category[count($category)-1];
        $menu = $serializer->serialize($menu,'json');
        return new Response($menu,Response::HTTP_OK);
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function getSubMenu( Request $request ){
        $categories = $this->getDoctrine()->getRepository(GoodsToCategory::class);
        $menu = $categories->findBy(array("priority" => 1));
        $leftMenu = array();
        foreach ($menu AS $item ){
            $leftMenu[$item->getCategories()->getId()] = ['id' => $item->getCategories()->getId(), 'name' => $item->getCategories()->getCategoryName()];
        }
        return $this->render('@EshopSample/Main/menu.html.twig', array("menu" => $leftMenu));
    }

    /**
     * List of pictures
     *
     * @param Request $request
     * @return Response
     */
    public function listPicturesAction( Request $request ){

        return $this->render("@EshopSample/Admin/pictureswrap.html.twig");
    }


    /**
     * News page
     *
     * @return Response
     */
    public function newsAction(){

        return $this->render('@EshopSample/Default/news.html.twig');
    }
    public function servicesAction(){

        return $this->render('@EshopSample/Default/services.html.twig');
    }
    public function contactsAction(){

        return $this->render('@EshopSample/Default/contacts.html.twig');
    }
    public function deliveryPaymentAction(){

        return $this->render('@EshopSample/Default/delivery-payment.html.twig');
    }
}
