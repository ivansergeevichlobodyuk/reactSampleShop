<?php
namespace Eshop\SampleBundle\Repository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Query;
use Eshop\SampleBundle\Entity\Categories;

/**
 * Class GoodsRepository
 * @package Eshop\SampleBundle\Repository
 */
class CategoryRepository extends \Doctrine\ORM\EntityRepository
{

    /**
     * Get queries for breadcrumbs
     *
     * @param $categories
     * @return array
     */
    public function getCategoriesForBreadCrumbs( $categories )
    {
        $qb = $this->createQueryBuilder('c');
        $qb->andWhere("c.alias IN (:alias)");
        $qb->setParameter("alias",explode("-",$categories));
        $result = $qb->getQuery()->getResult(Query::HYDRATE_ARRAY);
        $data = [];
        foreach ( $result AS $item ){
            $data[$item["alias"]] = $item;
        }
        return $data;
    }

}