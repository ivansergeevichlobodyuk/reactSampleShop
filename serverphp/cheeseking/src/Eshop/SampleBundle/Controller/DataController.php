<?php

namespace Eshop\SampleBundle\Controller;

use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\Currencies;
use Eshop\SampleBundle\Entity\Goods;
use Eshop\SampleBundle\Entity\GoodsToWarehouses;
use Symfony\Component\HttpFoundation\Cookie;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Eshop\SampleBundle\Entity\Favourites;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\Encoder\JsonEncoder;

class DataController extends Controller
{

    /**
     * Gets view name
     *
     */
    private function _getViewName( $viewType ){
        if ( $viewType == 3 ){
            $viewName =  '@EshopSample/Main/list.html.twig';
        }elseif ( $viewType == 1 ){
            $viewName = '@EshopSample/Main/view-list.html.twig';
        }else{
            $viewName = '@EshopSample/Main/view-list-with-img.html.twig';
        }
        //print_r($viewName); die;
        return $viewName;
    }

    /**
     * Gets data for menu item (proxy for rest required)
     *
     * @param SerializerInterface $serializer
     * @param Request $request
     * @return Response
     */
    public function getMenuDataAction(  SerializerInterface $serializer,Request $request ){
        $securityContext = $this->container->get('security.authorization_checker');
        $cookies = $request->cookies;

        $categories = $request->get("category");
        $search = $request->query->get("search","");
        $sorting = $request->query->get("sorting","");

        if ( $request->query->get("view_type") ){
            $viewType = $request->query->get("view_type",1);
            setcookie("view_type", "", time()-3600);
            setcookie("view_type",$viewType,365,'/catalog');
        }elseif( !$cookies->has("view_type") ){
            $viewType = 1;
            setcookie("view_type", "", time()-3600);
            setcookie("view_type",$viewType,365,'/catalog');
        }else{
            $viewType = $cookies->get("view_type");
        }
        if ( $securityContext->isGranted("IS_AUTHENTICATED_FULLY") ){
            $userRole = $this->getUser()->getRoles()[0];
            $currency = $this->getUser()->getDefaultCurrency( );
        }else{
            $userRole =null;
            $currency = $this->getDoctrine()->getRepository(Currencies::class)->findOneBy(["isDefault"=>1]);
        }
        $locale = $request->getLocale();
        $filters = $request->query->get("filter");

        $dataDQL = $this->getDoctrine()->getRepository(Goods::class)->getDataGoods($categories, $search, $sorting, $userRole, $locale, $filters);
        $paginator = $this->get('knp_paginator');

            $limit = $request->query->getInt('limit', 20);
            $filteredLimit = $limit?$limit:20;
            //echo "<br /> limit ".$filteredLimit;
            $offset = $request->query->getInt('page', 1);
            $pagination = $paginator->paginate(
                $dataDQL,
                $offset,
                $filteredLimit
            );

            $dataPriceConvertedList = [];
            $counter = 0;
            $ceoData = [];
            foreach ( $pagination AS $item ){
                if ( !isset( $ceoData[$item->getCategories()->getId()] ) ){
                    $ceoData[$item->getCategories()->getId()] = json_decode($item->getCategories()->getSeo( ), true);
                }
                if( $securityContext->isGranted("IS_AUTHENTICATED_FULLY") ){
                    $price = ($userRole == "ROLE_BUYER")?$item->getPriceType1():$item->getPriceType2();
                }else{
                    $price = $item->getPriceRecommended();
                }
                $dataPriceConvertedList[$item->getId()]["opt"] = $price/$currency->getNationalConvertationKoefficient();
                $dataPriceConvertedList[$item->getId()]["recomended"] = $item->getPriceRecommended()/$currency->getNationalConvertationKoefficient();
            }
            //print_r($ceoData);die;
            $dataCeoGroupped = [];
            foreach ( $ceoData as $categoryIdKey => $itemCeo ){
                if ( is_array( $itemCeo ) ){
                    foreach ( array_keys($itemCeo) AS $keyProp ){
                        if ( isset($dataCeoGroupped[$keyProp]) ){
                            $dataCeoGroupped[$keyProp] .= ", ".$itemCeo[$keyProp];
                        }else{
                            $dataCeoGroupped[$keyProp] = $itemCeo[$keyProp];
                        }
                    }
                }

            }

            $categoriesBredcrumb = $this->getDoctrine( )->getRepository( Categories::class )->getCategoriesForBreadCrumbs($categories);
            $breadcrumbsData = $this->prepareLinksForBreadcrumbs(explode("-",$categories),$categoriesBredcrumb);
            $viewName = $this->_getViewName($viewType);

            $wishList = $this->_getsWishList($request, $this->getUser());
            //die;

        $normalizer = new ObjectNormalizer();
        $normalizer->setCircularReferenceLimit(2);
        // Add Circular reference handler
        $normalizer->setCircularReferenceHandler(function ($object) {
            return $object->getId();
        });
        $normalizers = array($normalizer);
        $serializer = new Serializer($normalizers,array('json' => new JsonEncoder()));


            if ( true ){
                $menu = $serializer->serialize(array(
                    "pagination" => $pagination,
                    "currency" => $currency,
                    "categories" => $categories,
                    "categoriesBredcrubs" => $breadcrumbsData,
                    "dataPriceConvertedList" => $dataPriceConvertedList,
                    "currencyName" => $currency->getCurCode(),
                    "locale" => $locale,
                    "wishList" => $wishList,
                    "metaTags" => $dataCeoGroupped,
                    "sortingData" => explode(" ",$sorting)?explode(" ",$sorting):[" "," "]
                ),'json');
                return new Response($menu,Response::HTTP_OK);

                $response = $this->render($viewName, array(
                    "pagination" => $pagination,
                    "currency" => $currency,
                    "categories" => $categories,
                    "categoriesBredcrubs" => $breadcrumbsData,
                    "dataPriceConvertedList" => $dataPriceConvertedList,
                    "currencyName" => $currency->getCurCode(),
                    "locale" => $locale,
                    "wishList" => $wishList,
                    "metaTags" => $dataCeoGroupped,
                    "sortingData" => explode(" ",$sorting)?explode(" ",$sorting):[" "," "]
                ));
            }else {
                $response = $this->render($viewName, array(
                    "pagination" => $pagination,
                    "currency" => $currency,
                    "categories" => $categories,
                    "categoriesBredcrubs" => $breadcrumbsData,
                    "dataPriceConvertedList" => $dataPriceConvertedList,
                    "currencyName" => $currency->getCurCode(),
                    "locale" => $locale,
                    "wishList" => $wishList,
                    "metaTags" => $dataCeoGroupped,
                    "sortingData" => explode(" ",$sorting)?explode(" ",$sorting):[" "," "]
                ));
            }
        return $response;
    }

    /**
     * Return wish list
     *
     * @param Request $request
     * @param $user
     * @return object[]
     */
    private function _getsWishList(Request $request, $user){
        if ( $user ){
            $favs = $this->getDoctrine( )->getRepository(Favourites::class)->findBy(["users" => $user]);
        }else {
            $cookies = $request->cookies;
            $userLoggedId = $cookies->get("cart_user_id");
            $favs = $this->getDoctrine()->getRepository(Favourites::class)->findBy(['hash' => $userLoggedId]);
        }
        $data = [];
        foreach ( $favs AS $item ){
            $data[] = $item->getGoods()->getId();
        }
        return $data;
    }

    /**
     * Prepare links for breadcrumbs for list and items (see nameData )
     *
     * @param $order
     * @param $categories
     * @param null $nameData
     * @return array
     */
    private function prepareLinksForBreadcrumbs( $orders, $categories, $nameData = null ){
        $previous = array();
        $breadcrumbs = [];
        $br = 0;

        if ($categories){
            foreach ($orders AS $order) {
                $categoriesInLink = $br ? implode("-", $previous) . "-" . $categories[$order]["alias"] : $categories[$order]["alias"];
                $breadcrumbs[$br] = ["name" => $categories[$order]["categoryNameUa"],
                    "path" => $this->generateUrl('menu_load_page', ["category" => $categoriesInLink])];
                $previous[$br] = $categories[$order]["alias"];
                $br++;
            }
            if ($nameData) {
                $breadcrumbs[$br] = ["name" => $nameData["name"],
                    "path" => $this->generateUrl("menu_load_item",
                        [
                            "category" => $categoriesInLink,
                            "id" => $nameData["id"]
                        ]
                    )
                ];
            }
        }
        return $breadcrumbs;
    }




    /**
     * Gets is present products
     *
     */
    private function _isPresentProducts( $warehousesData ){
        //die;
        $present = false;
        foreach ( $warehousesData As $item ){
            if ( $item['countRemains'] ){
                $present = true;
                break;
            }
        }
        return $present;
    }

    /**
     * Gets item data action
     *
     * @param Request $request
     * @param $category
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function getItemDataAction( Request $request, $category = null, $id ){
        $goodItem = $this->getDoctrine()->getRepository(Goods::class)->find($id);

        $metaTags = $goodItem->getSeo()?json_encode($goodItem->getSeo( )):null;

        $goodsWarehouses = $this->getDoctrine()->getRepository(GoodsToWarehouses::class)->getItemWithWarehouses($id);
        $securityContext = $this->container->get('security.authorization_checker');

        if ( $securityContext->isGranted("IS_AUTHENTICATED_FULLY") ){
            $userRole = $this->getUser()->getRoles()[0];
            $currency = $this->getUser()->getDefaultCurrency( );
        }else{
            $userRole =null;
            $currency = $this->getDoctrine()->getRepository(Currencies::class)->findOneBy(["isDefault"=>1]);
        }

        $locale = $request->getLocale();
        $methodName = "getName".ucfirst($locale);

        $categories = $this->getDoctrine( )->getRepository( Categories::class )->getCategoriesForBreadCrumbs($category);

        $breadcrumbs = [];
        if ( $category ){
            $breadcrumbs = $this->prepareLinksForBreadcrumbs(explode("-",$category),$categories, ["name" => $goodItem->$methodName(), "id" => $goodItem->getId()]);
        }
        $priceRecomended = $goodItem->getPriceRecommended()/$currency->getNationalConvertationKoefficient();
        $priceOpt = ($userRole == 'ROLE_BUYER')?$goodItem->getPriceType1()/$currency->getNationalConvertationKoefficient():
            $goodItem->getPriceType2()/$currency->getNationalConvertationKoefficient();

//        \Doctrine\Common\Util\Debug::dump($goodItem->getFilters()[0] ); die;

        if ( !$request->isXmlHttpRequest() ){
            $response = $this->render("@EshopSample/Main/item.html.twig" ,
                [
                    "goodItem" => $goodItem,
                    "methodName" => $methodName,
                    "images" => json_decode($goodItem->getImages( ),true),
                    "goodsWarehouses" => $goodsWarehouses,
                    "priceRecomended" => round($priceRecomended,2),
                    "priceOpt" => round($priceOpt,2),
                    "curName" => $currency->getCurCode(),
                    "categoriesBredcrubs" => $breadcrumbs,
                    "metaTags" => $metaTags,
                    "isPresent" => $this->_isPresentProducts($goodsWarehouses)
                ]
            );
        }else{
            $response = $this->render("@EshopSample/Main/item-cart.html.twig" ,
                [
                    "goodItem" => $goodItem,
                    "methodName" => $methodName,
                    "images" => json_decode($goodItem->getImages( ),true),
                    "goodsWarehouses" => $goodsWarehouses,
                    "priceRecomended" => round($priceRecomended,2),
                    "priceOpt" => round($priceOpt,2),
                    "curName" => $currency->getCurCode(),
                    "metaTags" => $metaTags,
                    "isPresent" => $this->_isPresentProducts($goodsWarehouses)
                ]
            );
        }

        return $response;
    }


}