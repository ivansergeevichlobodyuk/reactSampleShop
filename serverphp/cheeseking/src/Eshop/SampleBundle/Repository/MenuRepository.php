<?php

namespace Eshop\SampleBundle\Repository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Query;
use Eshop\SampleBundle\Entity\Categories;
/**
 **/
class MenuRepository extends \Doctrine\ORM\EntityRepository
{

    /**
     * Current cached scheme
     *
     * @return mixed
     * @throws \Doctrine\ORM\NonUniqueResultException
     */
    public function findCurrentScheme(){
        $query = $this->createQueryBuilder('m');
        $data = $query->select('m')
            ->orderBy('m.id','DESC')
            ->setMaxResults(1)
            ->getQuery()
            ->getOneOrNullResult(Query::HYDRATE_ARRAY);
        return $data;
    }
}