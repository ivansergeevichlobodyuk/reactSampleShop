<?php
/**
 * Created by PhpStorm.
 * User: ivanlobodyuk
 * Date: 07.12.18
 * Time: 19:29
 */

namespace Eshop\SampleBundle\DataFixtures;

use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\Entity\Goods;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Eshop\SampleBundle\Entity\GoodsToCategory;
use Eshop\SampleBundle\Entity\GoodsToWarehouses;
use Eshop\SampleBundle\Entity\Warehouses;
use Eshop\SampleBundle\Entity\Currencies;

class GoodsToWarehousesFixtures extends Fixture
{
    /**
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {

        $goods = $manager->getRepository(Goods::class)->findAll();
        $repositoryWarehouses = $manager->getRepository(Warehouses::class);
        $warehouses = $repositoryWarehouses->findAll();
        $warehousesIds = [];
        foreach($warehouses AS $warItem){
            $warehousesIds[] = $warItem->getId();
        }
        $count_relation = 1;
        foreach( $goods AS $good ){
            //gets random count categories
            $countWarehouses = rand(1,4);
            $idsWarehouses = [];
            $counter = 0;

            //gets random array with categories id
            while( $counter < $countWarehouses ){
                $idsWarehouses[] = rand(min($warehousesIds),max($warehousesIds));
                array_unique($idsWarehouses);
                $counter = count($idsWarehouses);
            }
            // get each of 2000 goods and for each create rows with different categories
            foreach($idsWarehouses AS $id){
                $goodsToWarehouses = new GoodsToWarehouses();
                $goodsToWarehouses->setIdgoodsToWarehouses($count_relation);
                $goodsToWarehouses->setGoods($good);
                $warehouse = $repositoryWarehouses->find($id);
                $goodsToWarehouses->setWarehouses($warehouse);
                $goodsToWarehouses->setCountRemains(rand(1,10000));
                $goodsToWarehouses->setCountReservedByCart(2);

                $manager->persist($goodsToWarehouses);
                $manager->flush();
                $count_relation++;
            }
        }

        $currencies = new Currencies();
        $currencies->setCurCode("UAH");
        $currencies->setIsDefault(1);
        $currencies->setNationalConvertationKoefficient("1");
        $manager->persist($currencies);
        $manager->flush();

        $currencies = new Currencies();
        $currencies->setCurCode("USD");
        $currencies->setIsDefault(0);
        $currencies->setNationalConvertationKoefficient("28");
        $manager->persist($currencies);
        $manager->flush();

    }


}