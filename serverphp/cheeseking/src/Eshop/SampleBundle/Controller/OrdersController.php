<?php

namespace Eshop\SampleBundle\Controller;

use Eshop\SampleBundle\Entity\Goods;
use Eshop\SampleBundle\Entity\GoodsToWarehouses;
use Eshop\SampleBundle\Entity\Order;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;


class OrdersController extends Controller
{

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function ordersListAction( Request $request ){
        $sorting = $request->query->get("sorting","");
        $dataDQL = $this->getDoctrine()->getRepository(Order::class)->findOrders( $this->getUser( ), $sorting );
        $paginator = $this->get('knp_paginator');
        $limit = $request->query->getInt('limit', 10);
        $filteredLimit = $limit?$limit:20;
        $offset = $request->query->getInt('page', 1);
        $limits = [10,20,30,50,70,100];
        $pagination = $paginator->paginate(
            $dataDQL,
            $offset,
            $filteredLimit
        );
        $locale = $request->getLocale();
        if ( $request->isXmlHttpRequest() ){
            $response =  $this->render('@EshopSample/Orders/orders-ajax.html.twig',
                ["list" => $pagination,"limit" => $limit,"locale"=>$locale,"limits"=> $limits, "sorting" => explode(" ",$sorting)]);
        }else{
            $response =  $this->render('@EshopSample/Orders/orders.html.twig',
                ["list" => $pagination,"limit" => $limit,"locale"=>$locale,"limits"=> $limits, "sorting" => explode(" ",$sorting)]);
        }

        return $response;
    }

    /**
     * Orders detail action
     *
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function orderDetailAction( Request $request, $id ){
        //die;
        $orderItem = $this->getDoctrine()->getRepository(Order::class)->find($id);
        $em = $this->getDoctrine()->getManager();
        $locale = $request->getLocale();
        $paybtn = null;
        $orderItem->setPayedHash(microtime(true).'_'.$this->_generateHash(4));

        $em->persist($orderItem);
        $em->flush();

        if ( !$orderItem->getIsPayed() && !$orderItem->getIsOffline() ){
            $liqpay = new \LiqPay( $this->getParameter('public_key'), $this->getParameter('private_key') );
            $currency = $this->getUser()->getDefaultCurrency( );
            $paybtn = $liqpay->cnb_form(array(
                'action'         => 'pay',
                'amount'         => '1',
                'currency'       => $currency->getCurCode(),
                'description'    => 'description text',
                'order_id'       => $orderItem->getId()."-".$orderItem->getPayedHash( ),
                'version'        => '3',
                'sandbox'        => '1',
                'result_url'     => "http://194.146.230.251:15383/web/app_dev.php/result/order/".$orderItem->getId(),
                'server_url'     => "http://194.146.230.251:15383/web/app_dev.php/callback/liqpay" //$this->generateUrl("callback_result")
            ));
        }
        $dataOrder = json_decode($orderItem->getAdditionalOrderData());

        if ( $orderItem === null ){
           $response = new Response("",Response::HTTP_NOT_FOUND, array("content-type" => 'application/json'));
        }else{
            $response = $this->render('@EshopSample/Orders/order-detail.html.twig', [
                "item" => $orderItem,
                'locale' => $locale,
                'dataOrder' => $dataOrder ,
                'paybtn'=>$paybtn,
                "id" => $id] );
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