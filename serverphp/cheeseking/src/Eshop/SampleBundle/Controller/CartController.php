<?php

namespace Eshop\SampleBundle\Controller;

use Eshop\SampleBundle\Entity\Cart;
use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\Currencies;
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
use Symfony\Component\PropertyAccess\Exception\AccessException;


class CartController extends Controller
{


    const STATUS_NEW = 1;

    const STATUS_PAYED = 2;

    const PAYED_FAIL = 3;

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
     * Checkout form display
     *
     * @param Request $request
     * @return Response
     */
    public function checkoutStartAction( Request $request ){
        $user = $this->getUser();
        $data = [];
        $data["firstname"]  = $user?$user->getName():"";
        $data["secondname"] = $user?$user->getSurname():"";
        $data["phone"]      = $user?$user->getPhone():"";
        $data["city"]   = $user?$user->getCity():"";
        $data["address"]   = $user?$user->getAddress():"";
        $data["email"] = $user?$user->getEmail():"";
        $data["delivery_type"] = " ";

        $currency = ($this->getUser())?$this->getUser()->getDefaultCurrency():$this->getDoctrine()->getRepository(Currencies::class)->findOneBy(["isDefault" => 1]);
        $entityManager = $this->getDoctrine()->getManager();
        $cartData = $this->_getsCartsData( $request );
        $isOnlineAllowed = $this->getParameter("allow_online_payment");
        $response = $this->render('@EshopSample/Cart/checkout.html.twig', ["data" => $data, "cartData" => $cartData, 'isOnlineAllowed' => $isOnlineAllowed]);
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

    /**
     * Adds action
     *
     * @param Request $request
     * @return Response
     */
    public function addAction(Request $request)
    {
        $response = new Response(json_encode(["ok"]),Response::HTTP_OK, array('content-type' => 'application/json'));
        $user = $this->getUser( );
        $userLoggedId = null;
        $isNewCookies = false;
        if ( empty($user) ){
                $cookies = $request->cookies;
                $isLoggout = true;
                if ( $cookies->has("cart_user_id") ){
                    $userLoggedId = $cookies->get("cart_user_id");
                }else{
                    $isNewCookies = true;
                    $userLoggedId = $this->generateRandomString(15);
                    $cookies =  new Cookie("cart_user_id", $userLoggedId);
                }
            }
        $count = $request->request->get("count")?$request->request->get("count"):1;
        $good = $this->getDoctrine()->getRepository(Goods::class)->find($request->request->get("good_id"));
        $goodsFromCart = $this->_getGoodsFromCart( $good, $user, $userLoggedId );
        $entityManager = $this->getDoctrine()->getManager();
        if ( empty( $goodsFromCart ) ){
                $cart = new Cart( );
                $cart->setGoods( $good );
                $cart->setCount($count);
                if ( $user ){
                    $cart->setUsers($user);
                }else{
                    $cart->setHash($userLoggedId);
                }
                $entityManager->persist($cart);
                $entityManager->flush( );
        }else{
             $newCount = $goodsFromCart->getCount()+$count;
             $goodsFromCart->setCount($newCount);
             $entityManager->persist($goodsFromCart);
             $entityManager->flush();
        }
            $response = $this->showListAction( $request, false );
            if ( $isNewCookies ){
                $response->headers->setCookie($cookies);
            }

        return $response;
    }


    /**
     * Updates cart item data
     *
     * @param Request $request
     * @return Response
     */
    public function updateAction(Request $request){
        $user = $this->getUser( );
        $userLoggedId = null;
        if ( empty($user) ){
            $cookies = $request->cookies;
            $isLoggout = true;
            if ( $cookies->has("cart_user_id") ){
                $userLoggedId = $cookies->get("cart_user_id");
            }else{
                $isNewCookies = true;
                $userLoggedId = $this->generateRandomString(15);
                $cookies =  new Cookie("cart_user_id", $userLoggedId);
            }
        }
        {
            $currency = $user?($user->getDefaultCurrency()):$this->getDoctrine()->getRepository(Currencies::class)->findOneBy(["isDefault"=>1]);
            $good = $this->getDoctrine()->getRepository(Goods::class)->find($request->request->get("good_id"));
            $goodsFromCart = $this->_getGoodsFromCart( $good, $user, $userLoggedId );
            $action = $request->request->get("action");
            $entityManager = $this->getDoctrine()->getManager();
            if ( $action == 'update' ){
                $newCount = $request->request->get("count");
                $goodsFromCart->setCount($newCount);
                $entityManager->persist($goodsFromCart);
                $entityManager->flush( );
            }elseif ( $action == 'add' ){
                $newCount = $request->request->get("count")+1;
                $goodsFromCart->setCount($newCount);
                $entityManager->persist($goodsFromCart);
                $entityManager->flush( );
            }elseif( $action == 'remove' ){
                $newCount = $request->request->get("count")-1;
                $goodsFromCart->setCount($newCount);
                $entityManager->persist($goodsFromCart);
                $entityManager->flush( );
            }elseif ( $action == 'removeAll' ){
                $entityManager->remove($goodsFromCart);
                $entityManager->flush();
                $newCount = 0;
            }
            $role = $user?$user->getRoles()[0]:null;
            $itemPrice = ( $role == "ROLE_BUYER")?($good->getPriceType1()/$currency->getNationalConvertationKoefficient()):($good->getPriceType2()/$currency->getNationalConvertationKoefficient());
            $data = ["newCount" => $newCount,
                    "newPrice" =>  round($newCount*$good->getMultiply()*$itemPrice,2) ];

            $response = new Response(
                json_encode($data),
                Response::HTTP_OK,
                array('content-type' => 'application/json')
            );

        }

        return $response;
    }

    /**
     * Gets goods from the cart
     *
     * @param $good
     * @param $userId
     * @param $hashId
     * @return array
     */
    private function _getGoodsFromCart($good, $userId, $hashId){
        if ( $hashId ){
            $good = $this->getDoctrine()->getRepository(Cart::class)
                ->findOneBy(['goods' => $good,'hash' => $hashId]);
        }else{
            $good = $this->getDoctrine()->getRepository(Cart::class)
                ->findOneBy(['goods' => $good,'users' => $userId]);
        }

       return $good;
    }

    /**
     * Shows list action, return carts total
     *
     * @param Request $request
     * @param bool $isRender
     * @return Response
     */
    public function showListAction( Request $request, $isRender = true ){
        $data =  $this->_getsCartsData($request);
        if ( $isRender == true ){
            $response = $this->render('@EshopSample/Cart/cart.html.twig', ["data" => $data['dataCart'],"currency" => $data['currency']->getCurCode(),"total" => $data['total']] );
        }else{
            $response = new Response( json_encode([
                "total" => round($data['total'],2),
                "currency" => $data['currency']->getCurCode(),
                "countItem" => $data['countItem']
            ]));
        }
        return $response;
    }

    /**
     * Gets carts data
     *
     */
    private function _getsCartsData( Request $request ){
        $user  = $this->getUser( );
        $role = ($user)?$user->getRoles()[0]:null;

        if ( $user ){
            $carts = $this->getDoctrine( )->getRepository(Cart::class)->findBy(["users" => $user]);
        }else{
            $cookies = $request->cookies;
            $isLoggout = true;
            if ( $cookies->has("cart_user_id") ){
                $userLoggedId = $cookies->get("cart_user_id");
            }else{
                $isNewCookies = true;
                $userLoggedId = $this->generateRandomString(15);
                $cookies =  new Cookie("cart_user_id", $userLoggedId);
            }
            $carts = $this->getDoctrine( )->getRepository(Cart::class)->findBy(["hash" => $userLoggedId]);
        }

        $dataCart = [];
        $countItem = 0;
        $currency = $user?($user->getDefaultCurrency()):$this->getDoctrine()->getRepository(Currencies::class)->findOneBy(["isDefault"=>1]);
        $nameMethod = "getName".ucfirst($request->getLocale());
        foreach ( $carts AS $item ){
            if ( $role ) {
                $price = ($role == "ROLE_BUYER") ? $item->getGoods()->getPriceType1( ) / $currency->getNationalConvertationKoefficient( ) : $item->getGoods()->getPriceType2() / $currency->getNationalConvertationKoefficient();
            }else{
                $price = $item->getGoods()->getPriceRecommended( );
            }
            $dataCart[$item->getGoods()->getId()] = [
                "productName" => $item->getGoods()->$nameMethod(),
                "productId" => $item->getGoods()->getId(),
                "multiply" => $item->getGoods()->getMultiply(),
                "count" => $item->getCount(),
                "price" =>  $price
            ];
            $countItem += $item->getCount( );
        }

        $total = 0;

        foreach ( $dataCart AS $goods_id => $cartItem ){
            $curPrice =  round($cartItem['price']*$cartItem["count"]*$cartItem["multiply"],2);
            $dataCart[$goods_id]['priceTotal'] = $curPrice;
            $total += $curPrice;
        }
        return [ "dataCart" => $dataCart, "currency" => $currency, "total" => $total, "countItem" => $countItem ];
    }


    /**
     * Change user currencies
     *
     * @param Request $request
     * @return Response
     */
    public function changeUserCurrenciesAction(Request $request){

        $cur_id = $request->request->get("cur_id");//attributes->get('_route_params');
        //print_r(json_encode($cur_id)); die;
        $currencyItem = $this->getDoctrine()->getRepository(Currencies::class)->find($cur_id);//findOneBy(["curCode"=>$cur_id]);
        $user = $this->getUser();
        $user->setDefaultCurrency($currencyItem);
        $em = $this->getDoctrine()->getManager();
        $em->persist($user);
        $em->flush( );

        $response = new Response(json_encode(["message" => $this->get("translator")->trans("CUR_CHANGED")]),
            Response::HTTP_OK,
            array('content-type' => 'application/json'));
        return $response;
    }

    /**
     * Re-checkout action
     *
     * @param Request $request
     * @param $id
     * @return Response
     * @throws \Exception
     */
    public function checkoutOrderCartAction( Request $request, $id ){
        $em = $this->getDoctrine()->getManager();
        $order = $this->getDoctrine()->getRepository( Order::class )->find($id);
        $role = $this->getUser()->getRoles()[0];
        $currency = $this->getUser()->getDefaultCurrency( );

        $orderNew = new Order( );
        $orderNew->setUsers($order->getUsers());
        $orderNew->setProgress("NEW");
        $orderNew->setDate(new \DateTime());
        $orderNew->setTotalPriceOrder(0);
        $orderNew->setCurrency($order->getCurrency());
        $orderNew->setStatus($this->getDoctrine()->getRepository(Statuses::class)->find(CartController::STATUS_NEW));
        $orderNew->setDescription( $order->getDescription() );
        $orderNew->setIsPayed(false);
        $orderNew->setPayedHash(microtime(true).'_'.$this->_generateHash(4));
        $orderNew->setIsOffline($order->getIsOffline());

        $orderNew->setAdditionalOrderData( $order->getAdditionalOrderData() );
        $em->persist($orderNew);
        $em->flush( );



        $orderTotal = 0;
        foreach ( $order->getProducts() AS $cart ){
            $orderProduct = new OrdersProduct();
            $price = ($role == "ROLE_BUYER")?$cart->getGoods()->getPriceType1()/$currency->getNationalConvertationKoefficient():$cart->getGoods()->getPriceType2()/$currency->getNationalConvertationKoefficient();
            $totalPrice = $price*$cart->getCount()*$cart->getGoods()->getMultiply();
            $orderProduct->setGoods( $cart->getGoods());
            $orderProduct->setCount($cart->getCount());
            $orderProduct->setOrder($orderNew);
            $orderProduct->setTotalPrice($totalPrice);
            $orderProduct->setPriceSnap($price);
            $orderProduct->setKoefSnap($currency->getNationalConvertationKoefficient( ));
            $em->persist($orderProduct);
            $em->flush( );
            $orderTotal+=$totalPrice;
        }
        $orderNew->setTotalPriceOrder($orderTotal);
        $em->persist($orderNew);
        $em->flush( );
        $response = new Response(json_encode(["order_id" => $orderNew->getId()]), Response::HTTP_OK,
            array('content-type' => 'application/json'));

        return $response;

    }

    /**
     * Checks orders status (redirected from offline order ). Can be use for
     *
     * @param Request $request
     * @return Response
     */
    public function checkoutOfflineStatusAction(Request $request){
        $order = $this->getDoctrine()->getRepository(Order::class)->find($request->query->get('order_id'));
        if ( $order ){
            if ( $order->getStatus()->getId() ==  Order::STATUS_NEW_RESEVED){
                $status = "SUCCESS_NEW_CREATED";
            }elseif ( $order->getStatus()->getId() == Order::STATUS_IN_PROGRESS ){
                $status = "ORDER_IN_PROGRESS";
            }
        }
        return $this->render('@EshopSample/Cart/checkout_offline_status.html.twig', ["status" => $status] );
    }

    /**
     * Checkouts the cart
     *
     */
    public function checkoutCartAction(Request $request, \Swift_Mailer $mailer){
        $user  = $this->getUser( );
        $role = ($user)?$user->getRoles()[0]:null;
        if ( $user ){
            $carts = $this->getDoctrine( )->getRepository(Cart::class)->findBy(["users" => $user]);
        }else{
            $cookies = $request->cookies;
            $userLoggedId = $cookies->get("cart_user_id");
            $carts = $this->getDoctrine( )->getRepository(Cart::class)->findBy(["hash" => $userLoggedId]);
        }
        $em = $this->getDoctrine()->getManager();
        if ( $this->getUser() ){
            $currency = $this->getUser()->getDefaultCurrency( );
        }else{
            $currency = $this->getDoctrine()->getRepository(Currencies::class)->findOneBy(["isDefault" => 1]);
        }

        $order = new Order( );
        if ( $user ){
            $order->setUsers($user);
        }else{
            $order->setHash($userLoggedId);
        }
        $order->setProgress("NEW");
        $order->setDate(new \DateTime());
        $order->setTotalPriceOrder(0);
        $order->setCurrency($currency);
        $order->setStatus($this->getDoctrine()->getRepository(Statuses::class)->find(CartController::STATUS_NEW));
        $order->setDescription( "Test description" );
        $order->setIsPayed(false);
        $order->setPayedHash(microtime(true).'_'.$this->_generateHash(4));
        $order->setIsOffline($request->request->get("is_offline"));
        $dataOrderInfo = json_encode
        (
            [
                   'name'=> $request->request->get("name"),
                   'surname' => $request->request->get("second_name"),
                   'city' => $request->request->get("second_name"),
                   'address' => $request->request->get('address'),
                   'phone' => $request->request->get('phone'),
                   'email' => $request->request->get('email'),
                    'description' => $request->request->get('description')
            ]
        );
        $order->setAdditionalOrderData( $dataOrderInfo );
        $em->persist($order);
        $em->flush( );

        $orderTotal = 0;
        foreach ( $carts AS $cart ){
            $orderProduct = new OrdersProduct();
            if ( $user ){
                $price = ($role == "ROLE_BUYER")?$cart->getGoods()->getPriceType1()/$currency->getNationalConvertationKoefficient():$cart->getGoods()->getPriceType2()/$currency->getNationalConvertationKoefficient();
            }else{
                $price = $cart->getGoods()->getPriceRecommended()/$currency->getNationalConvertationKoefficient();
            }
            $totalPrice = $price*$cart->getCount()*$cart->getGoods()->getMultiply();
            $orderProduct->setGoods( $cart->getGoods());
            $orderProduct->setCount($cart->getCount());
            $orderProduct->setOrder($order);
            $orderProduct->setTotalPrice($totalPrice);
            $orderProduct->setPriceSnap($price);
            $orderProduct->setKoefSnap($currency->getNationalConvertationKoefficient( ));
            $em->persist($orderProduct);
            $em->flush( );
            $order->addProducts($orderProduct);
            $orderTotal+=$totalPrice;
        }
        $order->setTotalPriceOrder($orderTotal);
        $em->persist($order);
        $em->flush( );

        if ( $user ){
           $this->getDoctrine()->getRepository(Cart::class)->clearByUser($user);
        }else{
            $this->getDoctrine()->getRepository(Cart::class)->clearCartForNonLogged($userLoggedId);
        }
       // print_R($isSend); die;


        $this->_sendInfoToEmailByOrder($request, $order->getId(), $mailer);

        $response =  new Response(json_encode(["order_id" => $order->getId() ]),
            Response::HTTP_OK,
            array('content-type' => 'application/json'));

        return $response;
    }

    /**
     * Send information to email with order detail
     *
     * @param Request $request
     * @param $orderId
     * @param \Swift_Mailer $mailer
     * @return int
     */
    private function _sendInfoToEmailByOrder( Request $request ,$orderId, \Swift_Mailer $mailer){
        $locale = $request->getLocale();

        $orderItem = $this->getDoctrine()->getRepository(Order::class)->find($orderId);
        $dataOrder = json_decode($orderItem->getAdditionalOrderData());
        $orderProducts = $orderItem->getProducts();
        $dataContent = $this->renderView(
            '@EshopSample/Orders/order-email.html.twig',
            ["item" => $orderItem, "locale" => $locale, "id" => $orderId, 'dataOrder' => $dataOrder, "isEmail" => true]
        );

        $message = (new \Swift_Message('Order detail'))
            ->setFrom('send@example.com')
            ->setTo($dataOrder->email)
            ->setBody(
                $dataContent,
                'text/html'
        );
        $mailer->send($message);
    }

    /**
     * Checkouts choose action
     *
     * @param Request $request
     * @return Response
     */
    public function checkoutChooseAction( Request $request ){

        $liqpay = new \LiqPay( $this->getParameter('public_key'), $this->getParameter('private_key') );
        $order_id = $request->query->get('order_id');

        if ( $this->getUser() ){
            $currency = $this->getUser()->getDefaultCurrency( );
        }else{
            $currency = $this->getDoctrine()->getRepository(Currencies::class)->findOneBy(["isDefault" => 1]);
        }
        $order = $this->getDoctrine()->getRepository(Order::class)->find($order_id);

        $html = $liqpay->cnb_form(array(
            'action'         => 'pay',
            'amount'         => '1',
            'currency'       => $currency->getCurCode(),
            'description'    => 'description text',
            'order_id'       => $order->getId()."-".$order->getPayedHash( ),
            'version'        => '3',
            'sandbox'        => '1',
            'result_url'     => "http://194.146.230.251:15383/web/app_dev.php/result/order/".$order_id,
            'server_url'     => "http://194.146.230.251:15383/web/app_dev.php/callback/liqpay" //$this->generateUrl("callback_result")
        ));

        $response = $this->render('@EshopSample/Cart/checkout_choose.html.twig', [ 'order_id' => $request->query->get('order_id'), "html" => $html ] );
        return $response;
    }

    /**
     * Callback for create order
     *
     * @param Request $request
     */
    public function callbackPaymentAction( Request $request ){
        $signature = $request->request->get("signature");
        $data = $request->request->get("data");
        //dump($request->request);
        $sign = base64_encode( sha1(
            $this->getParameter("private_key") .
            $data .
            $this->getParameter("private_key")
            , 1 ));

        $f = fopen("log.txt",'a');
        fwrite($f, "sign = ". $sign );
        fwrite($f, "\n signature  = ". $signature );
        fwrite($f, "\n\n");
        fwrite($f, base64_decode($data));
        fwrite($f, "\n \n \nEND\n\n");
        fclose($f);
        die;
        if ( $sign == $signature ){
            $this->_clearCartIfNotLogged( $orderId );
        }
    }

    /**
     * @param $orderId
     * @return bool
     */
    private function _clearCartIfNotLogged( $orderId ){
        $order = $this->getDoctrine()->getRepository(Order::class)->find($orderId);
        $this->getDoctrine()->getRepository(Cart::class)->clearCartForNonLogged($order->getHash());
        return true;
    }

    /**
     * Callback redirect action
     *
     * @param Request $request
     * @param $orderId
     * @param \Swift_Mailer $mailer
     * @return Response
     */
    public function callbackRedirectAction( Request $request, $orderId, \Swift_Mailer $mailer ){

        $locale = $request->getLocale();
        $em = $this->getDoctrine()->getManager();
        if ( $request->request->get("signature") ){
             $data = $request->request->get("data");
             $sign = base64_encode( sha1(
                 $this->getParameter("private_key") .
                 $data .
                 $this->getParameter("private_key")
                 , 1 ));

             if ( $request->request->get("signature") == $sign ){
                 $dataFromRequest = json_decode(base64_decode($data));

                 $orderId =  explode('-',$dataFromRequest->order_id)[0];
                 $order = $this->getDoctrine()->getRepository(Order::class)->find($orderId);
                 $em = $this->getDoctrine()->getManager();
                 if ( $dataFromRequest->status == "success" ){
                     $order->setIsPayed(true);
                     $status = $this->getDoctrine()->getRepository(Statuses::class)->find(self::STATUS_PAYED);
                     $order->setStatus($status);
                     $order->setPayedError(0);
                     $em->persist($order);
                     $em->flush();
                     $response = $this->render('@EshopSample/Cart/checkout_result.html.twig',
                         [
                             "order" => $order,
                             "status" => $dataFromRequest->status,
                             "locale" => $locale,
                             'error_description' => false
                         ]
                     );
                     $this->_sendInfoToEmailByOrder($request,$orderId, $mailer);
                 }else{
                     $order->setIsPayed(false);
                     $status = $this->getDoctrine()->getRepository(Statuses::class)->find(self::PAYED_FAIL);
                     $order->setPayedError($dataFromRequest->err_description);
                     $order->setStatus($status);
                     $em->persist($order);
                     $em->flush();
                     $response =  $this->render('@EshopSample/Cart/checkout_result.html.twig',
                         [
                         "order" => $order,
                         "status" => $dataFromRequest->status,
                         "locale" => $locale,
                         "error_description" => $dataFromRequest->err_description
                         ]
                     );
                 }
             }
        }else{
            $order = $this->getDoctrine()->getRepository(Order::class)->find($orderId);
            $liqpay = new \LiqPay($this->getParameter("public_key"), $this->getParameter("private_key"));
            $result = $liqpay->api('request', array(
                'action' => 'status',
                'version' => '3',
                'order_id' => $orderId
            ));

            $orderPaymentStatus = '';
            if ( $result->status == 'success' || $result->status == 'sandbox') {
                $order->setIsPayed(true);
                $status = $this->getDoctrine()->getRepository(Statuses::class)->find(self::STATUS_PAYED);
                $order->setStatus($status);
                $em->persist($order);
                $em->flush();
                $response = $this->render('@EshopSample/Cart/checkout_result.html.twig',
                    [
                        'order' => $order,
                        'status' => $result->status,
                        "locale" => $locale,
                        'error_description' => false
                    ]
                );
            } else {
                $order->setIsPayed(false);
                $status = $this->getDoctrine()->getRepository(Statuses::class)->find(self::PAYED_FAIL);
                $order->setStatus($status);
                $order->setPayedError($result->err_description);
                $em->persist($order);
                $em->flush();
                $response = $this->render('@EshopSample/Cart/checkout_result.html.twig',
                    [
                        'order' => $this->getDoctrine()->getRepository(Order::class)->find($orderId),
                        'status' => $result->status,
                        "locale" => $locale,
                        "error_description" => $result->err_description
                    ]
                );
            }
        }
        return $response;

    }

}