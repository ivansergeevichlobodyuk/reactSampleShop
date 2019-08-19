<?php

namespace Eshop\SampleBundle\Controller;

use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\FiltersToCategories;
use Eshop\SampleBundle\Entity\Goods;
use Eshop\SampleBundle\Entity\GoodsToWarehouses;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;


class FiltersController extends Controller
{
    /**
     * Renders filters action
     *
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function renderFilterAction( Request $request ){

        $limit = $request->query->getInt('limit', 20);
        $filteredLimit = $limit?$limit:20;
        $search = $request->query->get("search","");
        $sort = $request->query->get("sorting", "");
        $viewType = $request->query->get("view_type", "");
        if ( $sort ){
            $sort = explode(" ", $sort);
        }else{
            $sort = ["",""];
        }

        $data = [
            "isShowFilters" => (in_array($request->get("_route"),["shop_all_products","menu_load_page"]))?true:false,
            "search" => $search,
            "sort"  => $sort,
            "limit" =>  $filteredLimit,
            "viewType" => $viewType,
            "limits" => [10,20,40,80,100]
        ];
       return $this->render('@EshopSample/Main/filters.html.twig', array("dataFilters" => $data));
    }


    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function renderSmartFilterAction( Request $request ){
        $categories = explode("-",$request->get("category"));
        $filtersRequest = explode(" ",$request->get("filter"));
        $checkboxes = [];
        $minmax = [];
        foreach ( $filtersRequest AS $filter ){
            $currentParsed = explode("-",$filter);
            if ( count($currentParsed) == 2 ){
                $checkboxes[$currentParsed[0]][] = $currentParsed[1];
            }elseif( count($currentParsed) == 3 ){
                $minmax[$currentParsed[0]][$currentParsed[1]] = $currentParsed[2];
            }
        }
        //die;
        //print_r( $categories );
        $category = $this->getDoctrine()->getRepository(Categories::class)
            ->findOneBy(["alias"=>$categories[count($categories)-1]]);
        $filters = $this->getDoctrine()->getRepository(FiltersToCategories::class)
            ->findBy(["category" => $category]);
        $locale = $request->getLocale();
        $methodName = "getName".$locale;
        $data = [];


        foreach ($filters AS $filter){
            $data[] = [
                    'filter_id' => $filter->getFilter()->getId(),
                    'type' => $filter->getFilter()->getFilterType(),
                    'name' => $filter->getFilter()->$methodName(),
                    'values' => $this->_getLanguageData($filter,$locale)
                ];
        }

        return $this->render('@EshopSample/Main/smart-filters.html.twig',
            array("dataFilters" => $data,
                "properties" => ["checkboxes" => $checkboxes, "minmax" => $minmax],
                "filterProperty"=>strtoupper($locale))
        );
    }

    /**
     * Gets language data
     *
     * @param $filter
     * @param $locale
     * @return array
     */
    private function _getLanguageData($filter,$locale){
            $filterValues = json_decode($filter->getFilter()->getAllowed(),1);
            $dataReturned = [];
            if ( $filter->getFilter()->getFilterType() == 1 ){
                $dataReturned = ['min' => $filterValues['min'],'max' => $filterValues['max']];
            }else{
                foreach ( $filterValues AS $key => $itemValuesFilter ){
                    $dataReturned[] = ['value' =>$itemValuesFilter[strtoupper($locale)], 'id' => $itemValuesFilter['id']];
                }
            }
            return $dataReturned;
    }

}