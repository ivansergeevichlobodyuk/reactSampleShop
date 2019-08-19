<?php
/**
 * Created by PhpStorm.
 * User: ivanlobodyuk
 * Date: 07.12.18
 * Time: 19:29
 */

namespace Eshop\SampleBundle\DataFixtures;

use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\Filters;
use Eshop\SampleBundle\Entity\FiltersToCategories;
use Eshop\SampleBundle\Entity\Goods;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Eshop\SampleBundle\Entity\GoodsToFilters;
use Eshop\SampleBundle\Entity\Valueses;
use Eshop\SampleBundle\Entity\Warehouses;

class GoodsFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // create 20 products! Bam!
        for ($i = 1; $i < 100; $i++) {
            $goods = new Goods();
            //$goods->setId(rand(10,200000000));
            $goods->setNameBy(' Good  BY'. $i);
            $goods->setNameEn(' Good  EN'. $i);
            $goods->setNameUa(' Good  UA'. $i);
            $goods->setNameRu(' Good  RY'. $i);
            $goods->setMultiply(rand(1,20));
            $goods->setIsBottom(false);
            $price = $this->priceGenerations( );

            $repositoryCategories = $manager->getRepository(Categories::class);
            $categories = $repositoryCategories->findAll();

            $categoriesIds = [];
            foreach($categories AS $catItem){
                $categoriesIds[] = $catItem->getId();
            }
            $categoryItemId = rand(min($categoriesIds),max($categoriesIds));
            $category = $repositoryCategories->find($categoryItemId);
            $goods->setCategories($category);
            $goods->setPriceType1($price);
            $goods->setPriceType2($price*3);
            $manager->persist($goods);
            $manager->flush();

            $g2cat = $manager->getRepository(FiltersToCategories::class)->findBy(["category" => $category]);
            foreach ( $g2cat AS $oneConditionItem ){
                $goodsToFilters = new GoodsToFilters();
                $goodsToFilters->setGoods($goods);
                $goodsToFilters->setFilter($oneConditionItem->getFilter());

                if ( $oneConditionItem->getFilter()->getFilterType() == 1 ){
                    $allowedValues = json_decode($oneConditionItem->getFilter()->getAllowed(),1);
                    $checkedAllowed = array_rand($allowedValues,1);
                    $value = $allowedValues[$checkedAllowed];
                    $goodsToFilters->setValues();
                    $goodsToFilters->setRawValue($value);
                }else{
                    $allowedValues = json_decode($oneConditionItem->getFilter()->getAllowed(),1);
                    $checkedAllowed = array_rand($allowedValues,1);
                    $itemId = $allowedValues[$checkedAllowed]['id'];
//                    print_r("--------");
//                    print_r($allowedValues);
//                    print_r("--------");
//                    print_r($checkedAllowed); print_r("--------");
                    //print_r($itemId); print_r("--------"); //die;
                    $filterValueEntity = $manager->getRepository(Valueses::class)->find($itemId);
                    //\Doctrine\Common\Util\Debug::dump($filterValueEntity);die;
                    $goodsToFilters->setValues($filterValueEntity);
                }
                $manager->persist($goodsToFilters);
                $manager->flush( );
//                \Doctrine\Common\Util\Debug::dump($goodsToFilters);
            }
        }

        // create 20 products! Bam!
        for ($i = 0; $i < 20; $i++) {
            $warehouse = new Warehouses();
            $warehouse->setName('Warehouse '. $i);
            $warehouse->setLocations("Location ".rand(1,40));
            $manager->persist($warehouse);
            $manager->flush();
        }

    }

    private function priceGenerations(){
        return rand(300,123000);
    }

}