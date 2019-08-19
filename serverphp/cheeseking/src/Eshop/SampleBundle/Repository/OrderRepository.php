<?php

namespace Eshop\SampleBundle\Repository;
use Doctrine\ORM\Mapping as ORM;
use Eshop\SampleBundle\Entity\Categories;
/**
 **/
class OrderRepository extends \Doctrine\ORM\EntityRepository
{
    /**
     * Find orders
     *
     * @param $user
     * @return \Doctrine\ORM\QueryBuilder
     */
    public function findOrders( $user, $sorting ){
        $db = $this->createQueryBuilder('o');
        $dql = $db
            ->select(["o","p"])
            ->innerJoin('o.products','p')
            ->andWhere("o.users = :users")
          //  ->andWhere("p.totalPrice > :price")
            ->setParameter(":users", $user)
          //  ->setParameter(":price", 23.29)
        ;
        $dql = $this->addOrderByParam( $dql , $sorting );
        return $dql;
    }

    /**
     * @param $qb
     * @param $sorting
     * @return mixed
     */
    private function addOrderByParam( $qb, $sorting ){
        if ( $sorting ){
            $sorting = explode(" ",$sorting);
            $qb->addOrderBy("o.".$sorting[0], $sorting[1]);
        }else{
            $qb->addOrderBy("o.id", "asc");
        }
        return $qb;

    }


}