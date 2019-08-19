<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GoodsToWarehouses
 *
 * @ORM\Table(name="goods_to_warehouses", indexes={@ORM\Index(name="fk_goods_to_warehouses_goods1_idx", columns={"goods_id"}), @ORM\Index(name="fk_goods_to_warehouses_warehouses1_idx", columns={"warehouses_id"})})
 * @ORM\Entity(repositoryClass="Eshop\SampleBundle\Repository\GoodsToWarehousesRepository")
 */
class GoodsToWarehouses
{
    /**
     * @var integer
     *
     * @ORM\Column(name="idgoods_to_warehouses", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idgoodsToWarehouses;

    /**
     * @var string
     *
     * @ORM\Column(name="goods_to_warehousescol", type="string", length=45, nullable=true)
     */
    private $goodsToWarehousescol;

    /**
     * @var integer
     *
     * @ORM\Column(name="count_remains", type="integer", nullable=true)
     */
    private $countRemains;

    /**
     * @var integer
     *
     * @ORM\Column(name="count_reserved_by_cart", type="integer", nullable=true)
     */
    private $countReservedByCart;

    /**
     * @var \Eshop\SampleBundle\Entity\Goods
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Goods")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="goods_id", referencedColumnName="id")
     * })
     */
    private $goods;

    /**
     * @var \Eshop\SampleBundle\Entity\Warehouses
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Warehouses")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="warehouses_id", referencedColumnName="id")
     * })
     */
    private $warehouses;



    /**
     * Set idgoodsToWarehouses
     *
     * @param integer $idgoodsToWarehouses
     *
     * @return GoodsToWarehouses
     */
    public function setIdgoodsToWarehouses($idgoodsToWarehouses)
    {
        $this->idgoodsToWarehouses = $idgoodsToWarehouses;

        return $this;
    }

    /**
     * Get idgoodsToWarehouses
     *
     * @return integer
     */
    public function getIdgoodsToWarehouses()
    {
        return $this->idgoodsToWarehouses;
    }

    /**
     * Set goodsToWarehousescol
     *
     * @param string $goodsToWarehousescol
     *
     * @return GoodsToWarehouses
     */
    public function setGoodsToWarehousescol($goodsToWarehousescol)
    {
        $this->goodsToWarehousescol = $goodsToWarehousescol;

        return $this;
    }

    /**
     * Get goodsToWarehousescol
     *
     * @return string
     */
    public function getGoodsToWarehousescol()
    {
        return $this->goodsToWarehousescol;
    }

    /**
     * Set countRemains
     *
     * @param integer $countRemains
     *
     * @return GoodsToWarehouses
     */
    public function setCountRemains($countRemains)
    {
        $this->countRemains = $countRemains;

        return $this;
    }

    /**
     * Get countRemains
     *
     * @return integer
     */
    public function getCountRemains()
    {
        return $this->countRemains;
    }

    /**
     * Set countReservedByCart
     *
     * @param integer $countReservedByCart
     *
     * @return GoodsToWarehouses
     */
    public function setCountReservedByCart($countReservedByCart)
    {
        $this->countReservedByCart = $countReservedByCart;

        return $this;
    }

    /**
     * Get countReservedByCart
     *
     * @return integer
     */
    public function getCountReservedByCart()
    {
        return $this->countReservedByCart;
    }

    /**
     * Set goods
     *
     * @param \Eshop\SampleBundle\Entity\Goods $goods
     *
     * @return GoodsToWarehouses
     */
    public function setGoods(\Eshop\SampleBundle\Entity\Goods $goods = null)
    {
        $this->goods = $goods;
        return $this;
    }

    /**
     * Get goods
     *
     * @return \Eshop\SampleBundle\Entity\Goods
     */
    public function getGoods()
    {
        return $this->goods;
    }

    /**
     * Set warehouses
     *
     * @param \Eshop\SampleBundle\Entity\Warehouses $warehouses
     *
     * @return GoodsToWarehouses
     */
    public function setWarehouses(\Eshop\SampleBundle\Entity\Warehouses $warehouses = null)
    {
        $this->warehouses = $warehouses;

        return $this;
    }

    /**
     * Get warehouses
     *
     * @return \Eshop\SampleBundle\Entity\Warehouses
     */
    public function getWarehouses()
    {
        return $this->warehouses;
    }
}
