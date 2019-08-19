<?php

namespace Eshop\SampleBundle\Repository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Query;
use Eshop\SampleBundle\Entity\Categories;

/**
 * Class UsersRepository
 * @package Eshop\SampleBundle\Repository
 */
class CartRepository extends \Doctrine\ORM\EntityRepository
{
    /**
     * Merge cart
     *
     * @param $user
     * @param $hash
     */
    public function mergerCart( $user, $hash ){
        $qb = $this->createQueryBuilder('c');
        $query = $qb->update( )
            ->set('c.users', '?1')
            ->where('c.hash = ?2')
            ->setParameter(1,$user)
            ->setParameter(2,$hash)
            ->getQuery( );
        $result = $query->execute();
    }

    /**
     * Clear cart by user when order was created
     *
     * @param $user
     */
    public function clearByUser($user){
        $query = $this->_em->createQuery("DELETE from Eshop\SampleBundle\Entity\Cart c WHERE c.users = ".$user->getId());
        $query->execute();
    }

    /**
     * Clear cart by hash that in cookies when order was payed successfully
     *
     * @param $hash
     */
    public function clearCartForNonLogged( $hash ){
       $query = $this->_em->createQuery("DELETE from Eshop\SampleBundle\Entity\Cart c WHERE c.hash = '". $hash."'");
       $query->execute();
    }

}


