<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eshop\SampleBundle\Entity\Filters;

/**
 * FiltersToCategories
 *
 * @ORM\Table(name="goods_to_filters", indexes={@ORM\Index(name="fk_good1_idx", columns={"good_id"}), @ORM\Index(name="fk_filter_id", columns={"filter_id"}), @ORM\Index(name="fk_value_id", columns={"value_id"}) })
 * @ORM\Entity
 */
class GoodsToFilters
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
     * @var \Eshop\SampleBundle\Entity\Filters
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Filters")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="filter_id", referencedColumnName="id")
     * })
     */
    private $filter;

    /**
     * @var \Eshop\SampleBundle\Entity\Goods
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Goods")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="good_id", referencedColumnName="id")
     * })
     */
    private $goods;

    /**
     * @var \Eshop\SampleBundle\Entity\Valueses
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Valueses")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="value_id", referencedColumnName="id")
     * })
     */
    private $value;



    /**
     * @var float
     *
     * @ORM\Column(name="raw_value", type="float", nullable=true)
     */
    private $rawValue;

    /**
     * @var int
     *
     * @ORM\Column(name="id_ext", type="text", nullable=true)
     */
    private $idExt;


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
     * Set idExt
     *
     * @param text $idExt
     *
     * @return Filters
     */
    public function setIdExt($idExt)
    {
        $this->idExt = $idExt;

        return $this;
    }

    /**
     * Get idExt
     *
     * @return string
     */
    public function getIdExt()
    {
        return $this->idExt;
    }

    /**
     * Set orders
     *
     * @param \Eshop\SampleBundle\Entity\Filters $filter
     *
     * @return FiltersToCategories
     */
    public function setFilter(\Eshop\SampleBundle\Entity\Filters $filter = null)
    {
        $this->filter = $filter;

        return $this;
    }

    /**
     * Get order
     *
     * @return \Eshop\SampleBundle\Entity\Filter
     */
    public function getFilter()
    {
        return $this->filter;
    }

    /**
     * Set orders
     *
     * @param \Eshop\SampleBundle\Entity\Goods $goods
     *
     * @return GoodsToFilters
     */
    public function setGoods(\Eshop\SampleBundle\Entity\Goods $goods = null)
    {
        $this->goods = $goods;
        return $this;
    }

    /**
     * Get order
     *
     * @return \Eshop\SampleBundle\Entity\Goods
     */
    public function getGoods()
    {
        return $this->goods;
    }

    /**
     * Set orders
     *
     * @param \Eshop\SampleBundle\Entity\Valueses $values
     *
     * @return GoodsToFilters
     */
    public function setValues(\Eshop\SampleBundle\Entity\Valueses $values = null)
    {
        $this->value = $values;
        return $this;
    }

    /**
     * Get order
     *
     * @return \Eshop\SampleBundle\Entity\Valueses
     */
    public function getValues()
    {
        return $this->value;
    }

    /**
     * @param $rawValue float
     * @return $this
     */
    public function setRawValue($rawValue){
        $this->rawValue = $rawValue;
        return $this;
    }

    /**
     * Get values
     *
     * @return GoodsToFilters
     */
    public function getRawValue()
    {
        return $this->rawValue;
    }


}