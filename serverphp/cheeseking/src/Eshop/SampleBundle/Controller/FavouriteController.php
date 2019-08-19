<?php

namespace Eshop\SampleBundle\Controller;

use Eshop\SampleBundle\Entity\Cart;
use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\Currencies;
use Eshop\SampleBundle\Entity\Favourites;
use Eshop\SampleBundle\Entity\Goods;

use Eshop\SampleBundle\Entity\Order;
use Eshop\SampleBundle\Entity\OrdersLogger;
use Eshop\SampleBundle\Entity\OrdersProduct;
use Eshop\SampleBundle\Entity\Statuses;
use Symfony\Component\HttpFoundation\Cookie;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


class FavouriteController extends Controller
{

    /**
     * Adds to wish list action
     *
     * @param Request $request
     * @return Response
     */
    public function addToWishListAction(Request $request){

        $favourites = new Favourites();
        $good = $this->getDoctrine()->getRepository(Goods::class)->find($request->request->get('product_id'));
        $favourites->setGoods($good);
        $isNewCookies = false;
        $user = $this->getUser();
        $userLoggedId = '';
        if ( $user ){
            $favourites->setUsers($user);
        }else{
            $cookies = $request->cookies;
            if ( $cookies->has("cart_user_id") ){
                $userLoggedId = $cookies->get("cart_user_id");
            }else{
                $isNewCookies = true;
                $userLoggedId = $this->generateRandomString(15);
                $cookieNew =  new Cookie("cart_user_id", $userLoggedId);
            }
            $favourites->setHash($userLoggedId);
        }

        $em = $this->getDoctrine()->getManager();
        $em->persist($favourites);
        $em->flush( );

        $response = $this->getWishListAction($request, false, $userLoggedId);

        if ( $isNewCookies ){
            //print_r("GGGGGGGGG"); die;
            $response->headers->setCookie($cookieNew);
        }
        return $response;
    }

    /**
     * Wish list count action
     *
     * @param Request $request
     * @return Response
     */
    public function wishListCountAction( Request $request ){
        return  $this->getWishListAction($request, false);
    }

    /**
     * Gets wish list and render or get wish list data
     *
     * @param Request $request
     * @param bool $isRender
     * @return array|Response
     */
    public function getWishListAction( Request $request, $isRender  = true, $userLoggedId = false ){

        $data = $this->_getWishListData( $request, $userLoggedId );
        if ( $isRender ){
            $response = $this->render('@EshopSample/Favs/favs-list.html.twig',
                [
                    'data' => $data['dataCart'],
                    'currency' =>  $data['currency']->getCurCode(),
                    "countItem" => $data['countItem'],
                    "total" => $data['total']
                ]
            );
        }else{
            $response = new Response( json_encode([
                "total" => round($data['total'],2),
                "currency" => $data['currency']->getCurCode(),
                "countItem" => $data['countItem']
            ]),Response::HTTP_OK,
                array('content-type' => 'application/json'));
        }
        return $response;
    }

    /**
     * @param Request $request
     * @return array
     */
    private function _getWishListData(Request $request, $hashId){
        $user  = $this->getUser( );
        $role = ($user)?$user->getRoles()[0]:null;

        if ( $user ){
            $favs = $this->getDoctrine( )->getRepository(Favourites::class)->findBy(["users" => $user]);
        }else{
            $cookies = $request->cookies;
            $isLoggout = true;
            if ( $cookies->has("cart_user_id") ){
                $userLoggedId = $cookies->get("cart_user_id");
            }else{
                $userLoggedId = $hashId;
            }
            $favs = $this->getDoctrine( )->getRepository(Favourites::class)->findBy(["hash" => $userLoggedId]);
        }
        $dataCart = [];
        $countItem = 0;
        $currency = $user?($user->getDefaultCurrency()):$this->getDoctrine()->getRepository(Currencies::class)->findOneBy(["isDefault"=>1]);
        $nameMethod = "getName".ucfirst($request->getLocale());
        foreach ( $favs AS $item ){
            if ( $role ) {
                $price = ($role == "ROLE_BUYER") ? $item->getGoods()->getPriceType1( ) / $currency->getNationalConvertationKoefficient( ) : $item->getGoods()->getPriceType2() / $currency->getNationalConvertationKoefficient();
            }else{
                $price = $item->getGoods()->getPriceRecommended( );
            }
            $dataCart[$item->getGoods()->getId()] = [
                "productName" => $item->getGoods()->$nameMethod(),
                "productId" => $item->getGoods()->getId(),
                "multiply" => $item->getGoods()->getMultiply(),
                "price" =>  $price
            ];
            $countItem += 1;
        }
        $total = 0;

        foreach ( $dataCart AS $goods_id => $cartItem ){
            $curPrice =  round($cartItem['price'],2);
            $dataCart[$goods_id]['priceTotal'] = $curPrice;
            $total += $curPrice;
        }
        return [ "dataCart" => $dataCart, "currency" => $currency, "total" => $total, "countItem" => $countItem ];
    }

    /**
     * @param int $length
     * @return string
     */
    private function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    /**
     * Remove from list actions
     *
     * @param Request $request
     * @return Response
     */
    public function removeFromListAction(Request $request){
        $user = $this->getUser();
        if ( $user ){
            $favsGoodsFromCart =
                $this->getDoctrine()->getRepository(Favourites::class)
                    ->findOneBy([
                        "goods" =>$request->request->get("good_id"),
                        "users" =>$user
                    ]);
        }else{
            $favsGoodsFromCart =
                $this->getDoctrine()->getRepository(Favourites::class)
                    ->findOneBy([
                        "goods" =>$request->request->get("good_id"),
                        "hash" =>$request->cookies->get("cart_user_id")
                    ]);
        }
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($favsGoodsFromCart);
        $entityManager->flush();
        return new Response( json_encode(["removed" => "OK"]),Response::HTTP_OK,
                array('content-type' => 'application/json'));
    }


}