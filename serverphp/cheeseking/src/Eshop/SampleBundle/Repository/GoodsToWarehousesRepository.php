<?php
namespace Eshop\SampleBundle\Repository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Query;

/**
 **/
class GoodsToWarehousesRepository extends \Doctrine\ORM\EntityRepository
{

    /**
     * Gets data for pagination
     *
     * @param $data
     * @return string
     */
    public function getItemWithWarehouses($id)
    {
        $data = $this->createQueryBuilder('gw')
            ->select(['g','gw','w'])
            ->innerJoin("gw.goods",'g')
            ->innerJoin("gw.warehouses","w")
            ->andWhere('g.id = :category')
            ->setParameter(':category', $id)
            ->getQuery()
            ->getResult(Query::HYDRATE_ARRAY);
        return $data;

    }




}