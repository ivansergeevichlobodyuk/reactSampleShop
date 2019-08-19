<?php

namespace Eshop\SampleBundle\Controller;

use Doctrine\ORM\EntityNotFoundException;
use Eshop\SampleBundle\Entity\Cart;
use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\Currencies;
use Eshop\SampleBundle\Entity\Favourites;
use Eshop\SampleBundle\Entity\FiltersToCategories;
use Eshop\SampleBundle\Entity\Goods;

use Eshop\SampleBundle\Entity\GoodsToFilters;
use Eshop\SampleBundle\Entity\Order;
use Eshop\SampleBundle\Entity\Filters;
use Eshop\SampleBundle\Entity\OrdersProduct;
use Eshop\SampleBundle\Entity\Statuses;
use Eshop\SampleBundle\Entity\Valueses;
use mysql_xdevapi\Exception;
use Symfony\Component\HttpFoundation\Cookie;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


class ApiFilterExchangeController extends Controller
{

    /**
     * @param Request $request
     * @return Response
     */
    public function loadFiltersEntityAction(Request $request)
    {
        $responseArray = [];
        foreach (json_decode($request->getContent())->filters AS $item) {
            $finded = $this->getDoctrine()->getRepository(Filters::class)->findOneBy(["idExt" => $item->idExt]);
            if (!empty($finded)) {
                $answer = $this->_updateEntityFilters($finded, $item, ["idExt", "nameEn", "nameRu", "nameBy", "nameUa", "allowed", "filterType"]);
                $responseArray[] = $answer;
            } else {
                $answer = $this->_insertEntityFilters($item, ["idExt", "nameEn", "nameRu", "nameBy", "nameUa", "allowed", "filterType"], Filters::class);
                $responseArray[] = $answer;
            }
        }
        $response = new Response(json_encode($responseArray), Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }


    /**
     *  Load values entity action
     *
     * @param Request $request
     * @return Response
     */
    public function loadValuesEntityAction(Request $request)
    {
        $responseArray = [];
        foreach (json_decode($request->getContent())->values AS $item) {
            $finded = $this->getDoctrine()->getRepository(Valueses::class)->findOneBy(["idExt" => $item->idExt]);
            if (!empty($finded)) {
                $answer = $this->_updateEntityFilters($finded, $item, ["nameBy", "nameEn", "idExt", "nameRu", "nameUa"]);
                $responseArray[] = $answer;
            } else {
                $answer = $this->_insertEntityFilters($item, ["nameBy", "nameEn", "idExt", "nameRu", "nameUa"], Valueses::class);
                $responseArray[] = $answer;
            }
        }
        $response = new Response(json_encode($responseArray), Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }

    /**
     * Loads goods To Filters
     *
     * @param Request $request
     * @return Response
     */
    public function loadGoodsToFiltersAction(Request $request)
    {
        $responseArray = [];
        foreach (json_decode($request->getContent())->goodsToFilters AS $item) {

            $item->filter = $this->getDoctrine()->getRepository(Filters::class)->findOneBy(['id' => $item->filter]);
            $item->goods = $this->getDoctrine()->getRepository(Goods::class)->findOneBy(['id' => $item->goods]);
            $item->values = $this->getDoctrine()->getRepository(Valueses::class)->findOneBy(['id' => $item->values]);
            if ( $item->filter && $item->goods && $item->values ){
                $finded = $this->getDoctrine()
                    ->getRepository(GoodsToFilters::class)
                    ->findOneBy(["filter" => $item->filter, "goods" => $item->goods]);

                if (!empty($finded)) {
                    $answer = $this->_updateEntityFilters($finded, $item, ["filter", "goods", "values", "rawValue"]);
                    $responseArray[] = $answer;
                } else {
                    $answer = $this->_insertEntityFilters($item, ["filter", "goods", "values", "rawValue"], GoodsToFilters::class);
                    $responseArray[] = $answer;
                }
            }else{

                $filterId = $item->filter?$item->filter->getId():"";
                $valuesId = $item->values?$item->values->getId():"";
                $goodId = ($item->goods)?$item->goods->getId():"";
                $responseArray[] = [
                    "id_ext" => "",
                    "id" => "filter=".$filterId."value=".$valuesId." good=".$goodId,
                    "id" => json_encode(["filter"=>$filterId, "good"=>$goodId, "value"=>$valuesId]),
                    "result" => "error",
                    "errorMessage" => "some entity was not found. check id"
                ];
            }
        }
        $response = new Response(json_encode($responseArray), Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }

    /**
     * Loading filter to category action
     *
     * @param Request $request
     * @return Response
     */
    public function loadFiltertoCategoryAction(Request $request)
    {
        $responseArray = [];
        foreach (json_decode($request->getContent())->filterToCategory AS $item) {
            $item->filter = $this->getDoctrine()->getRepository(Filters::class)->findOneBy(['id' => $item->filter]);
            $item->category = $this->getDoctrine()->getRepository(Categories::class)->findOneBy(['id' => $item->category]);
            if ( $item->filter && $item->category ){
                $finded = $this->getDoctrine()->getRepository(FiltersToCategories::class)->findOneBy(["filter" => $item->filter, "category" => $item->category]);
                if (!empty($finded)) {
                    $answer = $this->_updateEntityFilters($finded, $item, ["filter", "category"]);
                    $responseArray[] = $answer;
                }else{
                    $answer = $this->_insertEntityFilters($item, ["filter", "category"], FiltersToCategories::class);
                    $responseArray[] = $answer;
                }
            }else{
                $filterId = $item->filter?$item->filter->getId():"";
                $categoryId = $item->category?$item->category->getId():"";
                $responseArray[] = [
                    "id_ext" => "",
                    "id" => json_encode(["filter"=>$filterId, "category"=>$categoryId]),
                    "result" => "error",
                    "errorMessage" => "some entity was not found. check id"
                ];
            }
        }
        $response = new Response(json_encode($responseArray), Response::HTTP_OK, array('content-type' => 'application/json'));
        return $response;
    }


    /**
     * Inserts enitity filters.
     * Return data that was inserted
     *
     * @param $itemFromRequest
     * @return array
     */
    private function _insertEntityFilters($itemFromRequest, $columns, $entityName)
    {
        $_tmpResponse = [];
        $item = new $entityName();
        try {
            $em = $this->getDoctrine()->getManager();
            foreach ($columns AS $column) {
                $methodName = "set" . $column;
                $item->$methodName($itemFromRequest->$column);
            }
            $em->persist($item);
            $em->flush();
            $_tmpResponse = [
                "id_ext" => isset($itemFromRequest->idExt)?$itemFromRequest->idExt:"",
                "id" => $this->_getIdInResponse($itemFromRequest, $item),
                "result" => "success",
                "errorMessage" => ""
            ];
        } catch (\Exception $exception) {
            $_tmpResponse = [
                "id_ext" => isset($itemFromRequest->idExt)?$itemFromRequest->idExt:"",
                "id" => $this->_getIdInResponse($itemFromRequest, $item),
                "result" => "error",
                "errorMessage" => $exception->getMessage()
            ];
        }

        return $_tmpResponse;
    }

    /**
     * Updates entity filter
     *
     * @param $object
     * @param $rowFromapi
     * @return array
     */
    private function _updateEntityFilters($object, $rowFromapi, $columns)
    {
        $_tmpResponse = [];
        try {
            $em = $this->getDoctrine()->getManager();
            foreach ($columns AS $column) {
                $methodName = "set" . $column;
                if ($column == "allowed" && $rowFromapi->id == 0) {
                } else {
                    $object->$methodName($rowFromapi->$column);
                }
            }
            $em->persist($object);
            $em->flush();
            $_tmpResponse = [
                "id_ext" => isset($rowFromapi->idExt) ? $rowFromapi->idExt : "none",
                "id" => $this->_getIdInResponse($rowFromapi, $object),
                "result" => "success",
                "errorMessage" => ""
            ];
        } catch (\Exception $exception) {
            $_tmpResponse = [
                "id_ext" => isset($rowFromapi->idExt) ? $rowFromapi->idExt : "none",
                "id" => $this->_getIdInResponse($rowFromapi, $object),
                "result" => "error",
                "errorMessage" => $exception->getMessage()
            ];
        }
        return $_tmpResponse;
    }

    /**
     *  Gets id for response:
     *
     *  if in api id is present set id; (update)
     *  else check if in object id is present set id (insert)
     *  if condition table filter&&good is present set id to id
     *  if condition table filter&&category is present set it to id
     *
     * @param $api
     * @param $obj
     * @return int|string
     */
    private function _getIdInResponse($api, $obj)
    {
        $id = 0;
        if (isset($api->id)) {
            $id = $api->id;
        } elseif (isset($api->filter) && isset($api->goods)) {
            $id = json_encode(["filter"=>$api->filter->getId(), "good"=>$api->goods->getId()]);
        } elseif (isset($api->filter) && isset($api->category)) {
            $id = json_encode(["filter"=>$api->filter->getId(), "category"=>$api->category->getId()]);
        } elseif ($obj->getId()) {
            $id = $obj->getId();
        }
        return $id;
    }


}