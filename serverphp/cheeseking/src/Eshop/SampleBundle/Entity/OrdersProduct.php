<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Orders
 *
 * @ORM\Table(name="orders_product", indexes={@ORM\Index(name="fk_orders_goods1", columns={"goods_id"}), @ORM\Index(name="fk_orders_product_ibfk_1", columns={"orders_id"})})
 * @ORM\Entity
 */
class OrdersProduct
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
     * @var integer
     *
     * @ORM\Column(name="count", type="integer", nullable=true)
     */
    private $count;

    /**
     * @var float
     *
     * @ORM\Column(name="total_price", type="float", precision=10, scale=0, nullable=true)
     */
    private $totalPrice;


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
     * @var \Eshop\SampleBundle\Entity\OrdersProduct
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Order", inversedBy="ordersproduct")
     * @ORM\JoinColumn(name="orders_id", referencedColumnName="id")
     */
    private $order;

    /**
     * @var float
     *
     * @ORM\Column(name="price_snap", type="float", precision=10, scale=0, nullable=true)
     */
    private $priceSnap;


    /**
     * @var float
     *
     * @ORM\Column(name="koef_snap", type="float", precision=10, scale=0, nullable=true)
     */
    private $koefSnap;


    /**
     * Set id
     *
     * @param integer $id
     *
     * @return Orders
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

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
     * Set time
     *
     * @param \DateTime $time
     *
     * @return Orders
     */
    public function setTime($time)
    {
        $this->time = $time;

        return $this;
    }

    /**
     * Get time
     *
     * @return \DateTime
     */
    public function getTime()
    {
        return $this->time;
    }

    /**
     * Set count
     *
     * @param integer $count
     *
     * @return Orders
     */
    public function setCount($count)
    {
        $this->count = $count;

        return $this;
    }

    /**
     * Get count
     *
     * @return integer
     */
    public function getCount()
    {
        return $this->count;
    }

    /**
     * Set totalPrice
     *
     * @param float $totalPrice
     *
     * @return Orders
     */
    public function setTotalPrice($totalPrice)
    {
        $this->totalPrice = $totalPrice;

        return $this;
    }

    /**
     * Get totalPrice
     *
     * @return float
     */
    public function getTotalPrice()
    {
        return $this->totalPrice;
    }


    /**
     * Set goods
     *
     * @param \Eshop\SampleBundle\Entity\Goods $goods
     *
     * @return Orders
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
     * Set orders
     *
     * @param \Eshop\SampleBundle\Entity\Order $orders
     *
     * @return OrdersProduct
     */
    public function setOrder(\Eshop\SampleBundle\Entity\Order $order = null)
    {
        $this->order = $order;

        return $this;
    }

    /**
     * Get order
     *
     * @return \Eshop\SampleBundle\Entity\Order
     */
    public function getOrder()
    {
        return $this->order;
    }


    /**
     * Set totalPriceOrder
     *
     * @param float $priceSnap
     *
     * @return Orders
     */
    public function setPriceSnap($priceSnap)
    {
        $this->priceSnap = $priceSnap;
        return $this;
    }

    /**
     * Get priceSnap
     *
     * @return float
     */
    public function getPriceSnap()
    {
        return $this->priceSnap;
    }

    /**
     * Set  koefSnap
     *
     * @param float $koefSnap
     *
     * @return Orders
     */
    public function setKoefSnap($koefSnap)
    {
        $this->koefSnap = $koefSnap;
        return $this;
    }

    /**
     * Get koefSnap
     *
     * @return float
     */
    public function getKoefSnap()
    {
        return $this->koefSnap;
    }


}
