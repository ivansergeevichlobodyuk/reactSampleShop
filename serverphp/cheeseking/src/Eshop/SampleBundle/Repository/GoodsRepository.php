<?php
namespace Eshop\SampleBundle\Repository;
use Doctrine\ORM\Mapping as ORM;
use Eshop\SampleBundle\Entity\Categories;
use Eshop\SampleBundle\DQL;

/**
 * Class GoodsRepository
 *
 * @package Eshop\SampleBundle\Repository
 */
class GoodsRepository extends \Doctrine\ORM\EntityRepository
{

    /**
     * Gets data goods
     *
     * @param $data
     * @param $search
     * @param $sorting
     * @param $userRole
     * @param $locale
     * @param $filter
     *
     * @return \Doctrine\ORM\QueryBuilder
     */
    public function getDataGoods($data, $search, $sorting, $userRole, $locale, $filters)
    {
        $ids = [];
        if ( !empty($data) ){
            $categories = explode("-",$data);
            $ids = $this->getIdsByAliases($categories);
            $db = $this->createQueryBuilder('g');
            $dql = $db
                ->where("LOWER(replace(g.name".ucfirst($locale).", ' ', '%')) LIKE replace(:name, ' ', '%')")
                ->andWhere('g.categories IN (:categories_id)')
                ->andWhere('g.isRemoved = false');
            $dql = $this->addOrderByParam( $dql , $sorting, $userRole, $locale );
            $dql = $this->addFilters($dql,$filters);
            $dql->setParameter(':categories_id', $ids)
                ->setParameter('name', "%".strtolower($search)."%");
        }else{
            $categories = explode("-",$data);
            $db = $this->createQueryBuilder('g');
            $dql = $db
                ->where("LOWER(replace(g.name".ucfirst($locale).", ' ', '%')) LIKE replace(:name, ' ', '%')")
                ->andWhere('g.isRemoved = false');
            $dql = $this->addOrderByParam( $dql , $sorting, $userRole, $locale );
            $dql = $this->addFilters($dql,$filters)
                ->setParameter('name', "%".strtolower($search)."%");
        }

        return $dql;
    }

    /**
     * Gets slider for index
     *
     * @return mixed
     */
    public function getSliderForIndex(){
        $db = $this->createQueryBuilder('g');
        $query = $db->andWhere('g.isIndexSlider > 0')
                ->orderBy('g.isIndexSlider')->getQuery();
        $result = $query->execute();
        return $result;
    }

    /**
     * Gets slider for index
     *
     * @return mixed
     */
    public function getBottomForIndex(){
        $db = $this->createQueryBuilder('g');
        $query = $db->andWhere('g.isBottom > 0')
            ->orderBy('g.isBottom')
            ->getQuery();
        $result = $query->execute();
        return $result;
    }

    /**
     * Adds filters
     *
     * @param $dql
     * @param $filters
     * @return mixed
     */
    private function addFilters( $dql, $filters ){
        //return $dql;
        $groupped = [];
        $between = [];
        $filters = explode(" ", $filters);
        foreach ( $filters AS $filter ){
            $tmp_ = explode("-", $filter);
            if ( count($tmp_) == 2){
                $groupped[$tmp_[0]][] = $tmp_[1];
            }elseif ( count($tmp_) == 3 ){
                $between[$tmp_[0]][$tmp_[1]] = $tmp_[2];
            }
        }

        foreach ( $groupped AS $filterId => $searchedValues ){
            $dql->leftJoin("g.filters",'f'.$filterId);
            $orStatement = $dql->expr( )->orX( );
            //$searchedValues  = explode("-",$searchedValues);
            foreach ( $searchedValues AS $value ){
                $andx = $dql->expr()->andX();
                $andx->add(
                    $dql->expr()->eq("f$filterId.filter",$filterId)
                );
                $andx->add(
                    $dql->expr()->eq("f$filterId.value",$value)
                );
                $orStatement->add($andx);
            }
            $dql->andWhere($orStatement);
        }

        foreach ( $between AS $filterId => $allowedValues ){
            $dql->leftJoin("g.filters",'f'.$filterId);
            $andx = $dql->expr()->andX();
            $andx->add(
                $dql->expr()->eq("f$filterId.filter", $filterId)
            );
            $andx->add(
                $dql->expr()->between("f$filterId.rawValue", $allowedValues['min']-1, $allowedValues["max"]+1)
            );
            $dql->andWhere($andx);
        }
       // \Doctrine\Common\Util\Debug::dump($dql->getDQL());
        //die;
        return $dql;
    }

    /**
     * Add order by url or use default order by id. If order by price
     *  use different price column based in user role
     *
     * @param $qb
     * @param $sorting
     * @param $userRole
     * @return mixed
     */
    private function addOrderByParam( $qb, $sorting, $userRole, $locale ){
        if ( $sorting ){
            $sorting = explode(" ",$sorting);
            if ( $sorting[0] == 'price' ){
                if ( $userRole != '' ){
                       if ( $userRole == "ROLE_BUYER" ){
                           $sorting[0] = 'priceType1';
                       }else{
                           $sorting[0] = 'priceType2';
                       }
                }else{
                    $sorting[0] = 'priceRecommended';
                }
                $qb->addOrderBy("g.".$sorting[0], $sorting[1]);
            }else{
                $qb->addOrderBy("g.".$sorting[0].ucfirst($locale), $sorting[1]);
            }
        }else{
            $qb->addOrderBy("g.id", "asc");
        }
        return $qb;
    }

    /**
     * Add multiple order by
     *
     * @param $qb
     * @return mixed
     */
    private function addMultipleOrder( $qb, $sorting ){
        $mapColumnToRequest = ['price' => 'priceType1'];
        foreach( $sorting AS $key => $value ){
            $column = isset($mapColumnToRequest[$key])?$mapColumnToRequest[$key]:$key;
            $qb->addOrderBy("g.".$column, strtoupper($value));
        }
        return $qb;
    }

    /**
     * Gets ids by aliases
     *
     * @param $categories
     * @return array
     */
    private function getIdsByAliases( $categories ){
        $alias = $categories[count($categories)-1];
        //print_r($alias); die;
        $repository = $this->getEntityManager()->getRepository(Categories::class);
        $id = $repository->findBy(["alias" => $alias ])[0]->getId();

        $menuResult = [];
        $this->getsIterMenu( $id, $menuResult );
        $menuResult[] = $id;
        return $menuResult;
    }

    /**
     * Gets iteration menu
     *
     * @param $parentId
     * @param $menuResult
     */
    private function getsIterMenu( $parentId, &$menuResult ){

        $scheme = $this->getEntityManager()->getRepository(Categories::class);
        $menu = $scheme->findBy(["parenId"=>$parentId]);
        foreach ( $menu as $item ){
            $data = $this->getsIterMenu($item->getId(),$menuResult);
            $menuResult[] = $item->getId();
        }
    }

}