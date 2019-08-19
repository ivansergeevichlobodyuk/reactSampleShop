<?php
/**
 * Created by PhpStorm.
 * User: ivanlobodyuk
 * Date: 07.12.18
 * Time: 19:29
 */

namespace Eshop\SampleBundle\DataFixtures;

use Eshop\SampleBundle\Entity\Categories;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Eshop\SampleBundle\Entity\Filters;
use Eshop\SampleBundle\Entity\FiltersToCategories;
use Eshop\SampleBundle\Entity\Valueses;


class CategoriesFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {

        $filters = [];

        //********generate filters**************************
        $idValue = 0;
        for ( $i = 0; $i < 50; $i++ ){
            $filter = new Filters();
            $name = $this->generateRandomString(4);

            $filter->setNameEn($name. " EN");
            $filter->setNameUa($name. " UA");
            $filter->setNameRu($name. " RU");
            $filter->setNameBy($name. " BY");

            $filterType = rand(1,2);
            if ( $filterType == 1 ){
                $filter->setAllowed(json_encode(["min"=>rand(10,15),"max"=>rand(100,150)]));
            }else{
                $valuesFilter = [];
                for ( $inc = 0; $inc < rand(3,8); $inc++ ){
                    $valuesFilter[$inc] = $this->generateRandomString(4);
                }
                $translated = [];
                    foreach ( $valuesFilter AS $keyValue => $filterValue ){
                        $translated[$keyValue]['id'] = $idValue;
                        foreach ( ["RU","EN","UA","BY"] AS $lang ) {
                            $translated[$keyValue][$lang] = $filterValue." $lang";
                        }
                        $idValue++;
                    }
                $filter->setAllowed(json_encode($translated));
            }


            $filter->setFilterType($filterType);
            $manager->persist($filter);
            $manager->flush();
            $filters[] = $filter;
        }
        //********************************************************

        //***************generate categories**************
        $parents = [];
        $categories = [];
        // create 20 products! Bam!
        for ($i = 1; $i < 30; $i++) {
            $category = new Categories( );
            $category->setCategoryNameEn($i.$i.$i."En");
            $category->setCategoryNameUa($i.$i.$i."UAUAUAU");
            $category->setCategoryNameRu($i.$i.$i."RURUR");
            $category->setCategoryNameBy($i.$i.$i."BYBYBY");
            $category->setAlias($this->generateRandomString(6));
            $category->setOrdering($i);
            $category->setIcon("icon");
            if ( $i > 3 && $i < 6  or $i > 8 && $i < 12 ){
                $category->setParenId($i-1);
                $parents[] = $i-1;
            }else{
                $category->setParenId(0);
            }
            $fakeProperties = ["property1","property2"];

            $manager->persist($category);
            $manager->flush();
            $categories[] = $category;
        }
        //************************************************************


        //*********************CategoriestoFilters********************************
        foreach ( $categories As $category ){
            $filtersForCurrentCategory = array_rand($filters,rand(2,4));
            foreach ( $filtersForCurrentCategory AS $filterItem ){
                $f2cat = new FiltersToCategories();
                $f2cat->setCategory($category);
                $f2cat->setFilter($filters[$filterItem]);
                $f2cat->setExclude(json_encode([]));
                $manager->persist($f2cat);
                $manager->flush();
            }
        }
        //****************************************************************


        //******************Create values from filters***************
        foreach ( $filters AS $filterItem ){
            if ( $filterItem->getFilterType() == 2 ){
                $filtersValuesAllowed = json_decode($filterItem->getAllowed());
                foreach ( $filtersValuesAllowed AS $key => $valuesAllowed ){
                    $values = new Valueses();
                    $values->setNameRu($valuesAllowed->RU);
                    $values->setNameUa($valuesAllowed->EN);
                    $values->setNameEn($valuesAllowed->UA);
                    $values->setNameBy($valuesAllowed->BY);
                    $manager->persist($values);
                    $manager->flush( );
                    \Doctrine\Common\Util\Debug::dump($values);
                    //die;
                }
            }
        }

        //******************************************************************

    }

    private function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }


}