<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Categories
 *
 * @ORM\Table(name="categories")
 * @ORM\Entity(repositoryClass="Eshop\SampleBundle\Repository\CategoryRepository")
 */
class Categories
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="category_name_ua", type="string", length=45, nullable=true)
     */
    private $categoryNameUa;

    /**
     * @var string
     *
     * @ORM\Column(name="category_name_ru", type="string", length=45, nullable=true)
     */
    private $categoryNameRu;

    /**
     * @var string
     *
     * @ORM\Column(name="category_name_by", type="string", length=45, nullable=true)
     */
    private $categoryNameBy;

    /**
     * @var string
     *
     * @ORM\Column(name="category_name_en", type="string", length=45, nullable=true)
     */
    private $categoryNameEn;


    /**
     * @var integer
     *
     * @ORM\Column(name="paren_id", type="integer", nullable=true)
     */
    private $parenId;


    /**
     * @var string
     *
     * @ORM\Column(name="alias", type="string", length=45, nullable=true)
     */
    private $alias;

    /**
     * @var integer
     *
     * @ORM\Column(name="ordering",type="integer",nullable=false)
     */
    private $ordering;

    /**
     * @var string
     *
     * @ORM\Column(name="icon", type="string")
     */
    private $icon;

    /**
     * @var string
     *
     * ORM\Column(name="filters", type="json_array", nullable=true )
     */
    private $filters;


    /**
     * @var string
     *
     * @ORM\Column(name="seo", type="text", nullable=true)
     */
    private $seo;


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set categoryNameUa
     *
     * @param string $categoryNameUa
     *
     * @return Categories
     */
    public function setCategoryNameUa($categoryNameUa)
    {
        $this->categoryNameUa = $categoryNameUa;

        return $this;
    }

    /**
     * Get categoryNameUa
     *
     * @return string
     */
    public function getCategoryNameUa()
    {
        return $this->categoryNameUa;
    }

    /**
     * Set categoryNameUa
     *
     * @param string $categoryNameRu
     *
     * @return Categories
     */
    public function setCategoryNameRu($categoryNameRu)
    {
        $this->categoryNameRu = $categoryNameRu;

        return $this;
    }

    /**
     * Get categoryNameRu
     *
     * @return string
     */
    public function getCategoryNameRu()
    {
        return $this->categoryNameRu;
    }

    /**
     * Set categoryNameUa
     *
     * @param string $categoryNameBy
     *
     * @return Categories
     */
    public function setCategoryNameBy($categoryNameBy)
    {
        $this->categoryNameBy = $categoryNameBy;
        return $this;
    }

    /**
     * Get categoryNameBy
     *
     * @return string
     */
    public function getCategoryNameBy()
    {
        return $this->categoryNameBy;
    }

    /**
     * Set categoryNameEn
     *
     * @param string $categoryNameEn
     *
     * @return Categories
     */
    public function setCategoryNameEn($categoryNameEn)
    {
        $this->categoryNameEn = $categoryNameEn;
        return $this;
    }

    /**
     * Get categoryNameBy
     *
     * @return string
     */
    public function getCategoryNameEn()
    {
        return $this->categoryNameEn;
    }

    /**
     * Set $alias
     *
     * @param string $alias
     *
     * @return Categories
     */
    public function setAlias($alias)
    {
        $this->alias = $alias;

        return $this;
    }

    /**
     * Get alias
     *
     * @return string
     */
    public function getAlias()
    {
        return $this->alias;
    }


    /**
     * Set parenId
     *
     * @param integer $parenId
     *
     * @return Categories
     */
    public function setParenId($parenId)
    {
        $this->parenId = $parenId;

        return $this;
    }

    /**
     * Get parenId
     *
     * @return integer
     */
    public function getParenId()
    {
        return $this->parenId;
    }

    /**
     * Set ordering
     *
     * @param integer $ordering
     *
     * @return Categories
     */
    public function setOrdering($ordering)
    {
        $this->ordering = $ordering;

        return $this;
    }

    /**
     * Get ordering
     *
     * @return integer
     */
    public function getOrdering()
    {
        return $this->ordering;
    }

    /**
     * Set ordering
     *
     * @param string $icon
     *
     * @return Categories
     */
    public function setIcon($icon)
    {
        $this->icon = $icon;

        return $this;
    }

    /**
     * Get ordering
     *
     * @return string
     */
    public function getIcon()
    {
        return $this->icon;
    }

    /**
     * Set filters
     *
     * @param string $filters
     *
     * @return Categories
     */
    public function setFilters($filters)
    {
        $this->filters = $filters;

        return $this;
    }

    /**
     * Get filters
     *
     * @return string
     */
    public function getFilters()
    {
        return $this->filters;
    }

    /**
     * Set seo
     *
     * @param string $seo
     *
     * @return Goods
     */
    public function setSeo($seo)
    {
        $this->seo = $seo;

        return $this;
    }

    /**
     * Get seo
     *
     * @return string
     */
    public function getSeo()
    {
        return $this->seo;
    }


}
