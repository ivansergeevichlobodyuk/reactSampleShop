<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OrdersLogger
 *
 * @ORM\Table(name="orders", indexes={ @ORM\Index(name="orders_ibfk_1", columns={"users_id"} ), @ORM\Index(name="fk_orders_st_fk_1", columns={"status"}) })
 * @ORM\Entity(repositoryClass="Eshop\SampleBundle\Repository\OrderRepository")
 */
class Order
{

    const STATUS_NEW_RESEVED = 1;

    const STATUS_IN_PROGRESS = 2;


    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    public $id;

    /**
     * @var \Eshop\SampleBundle\Entity\Users
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="users_id", referencedColumnName="id")
     * })
     */
    private $users;


    /**
     *
     * @ORM\OneToMany(targetEntity="Eshop\SampleBundle\Entity\OrdersProduct", mappedBy="order")
     */
    protected $products;


    /**
     * @var string
     *
     * @ORM\Column(name="progress", type="text", length=65535, nullable=true)
     */
    private $progress;

    /**
     * @var datetime $date
     *
     * @ORM\Column(name="date", type="datetime", nullable=true)
     */
    private $date;

    /**
     * @var float
     *
     * @ORM\Column(name="total_price_orders", type="float", precision=10, scale=0, nullable=true)
     */
    private $totalPriceOrder;

    /**
     * @var \Eshop\SampleBundle\Entity\Statuses
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Statuses")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="status", referencedColumnName="id")
     * })
     */
    private $status;


    /**
     * @var \Eshop\SampleBundle\Entity\Users
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Currencies")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="currency", referencedColumnName="id")
     * })
     */
    private $currency;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", length=65535, nullable=true)
     */
    private $description;


    /**
     * @var string
     *
     * @ORM\Column(name="hash", type="text", length=65535, nullable=true)
     */
    private $hash;

    /**
     * @var integer
     *
     * @ORM\Column(name="is_payed", type="integer", length=11, nullable=true)
     */
    private $isPayed;

    /**
     * @var string
     *
     * @ORM\Column(name="additional_order_data", type="text", length=65535, nullable=true)
     */
    private $additionalOrderData;

    /**
     * @var string
     *
     * @ORM\Column(name="payed_error", type="text", length=65535, nullable=true)
     */
    private $payedError;

    /**
     * @var string
     *
     * @ORM\Column(name="payed_hash", type="text", length=65535, nullable=true)
     */
    private $payedHash;


    /**
     * @var string
     *
     * @ORM\Column(name="is_offline", type="integer", length=1, nullable=true)
     */
    private $isOffline;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->products = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set date
     *
     * @param date $date
     * @return Orders
     */
    public function setDate($date)
    {
        $this->date = $date;
        return $this;
    }

    /**
     * Get date
     *
     * @return date
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set users
     *
     * @param \Eshop\SampleBundle\Entity\Statuses $status
     *
     * @return Orders
     */
    public function setStatus(\Eshop\SampleBundle\Entity\Statuses $status = null)
    {
        $this->status = $status;
        return $this;
    }

    /**
     * Get users
     *
     * @return \Eshop\SampleBundle\Entity\Statuses
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set progress
     *
     * @param string $progress
     *
     * @return Orders
     */
    public function setProgress($progress)
    {
        $this->progress = $progress;

        return $this;
    }

    /**
     * Get progress
     *
     * @return string
     */
    public function getProgress()
    {
        return $this->progress;
    }

    /**
     * Set progress
     *
     * @param string $description
     *
     * @return Orders
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set hash
     *
     * @param string $hash
     *
     * @return Orders
     */
    public function setHash($hash)
    {
        $this->hash = $hash;

        return $this;
    }

    /**
     * Get hash
     *
     * @return string
     */
    public function getHash()
    {
        return $this->hash;
    }

    /**
     * Set isPayed
     *
     * @param integer $isPayed
     *
     * @return Orders
     */
    public function setIsPayed($isPayed)
    {
        $this->isPayed = $isPayed;

        return $this;
    }

    /**
     * Get isPayed
     *
     * @return integer
     */
    public function getIsPayed()
    {
        return $this->isPayed;
    }



    /**
     * Set users
     *
     * @param \Eshop\SampleBundle\Entity\Users $users
     *
     * @return Orders
     */
    public function setUsers(\Eshop\SampleBundle\Entity\Users $users = null)
    {
        $this->users = $users;
        return $this;
    }

    /**
     * Get users
     *
     * @return \Eshop\SampleBundle\Entity\Users
     */
    public function getUsers()
    {
        return $this->users;
    }

    /**
     * Add currency
     *
     * @param \Eshop\SampleBundle\Entity\OrdersProduct $products
     *
     * @return Order
     */
    public function addProducts(\Eshop\SampleBundle\Entity\OrdersProduct $products)
    {
        $this->products[] = $products;

        return $this;
    }

    /**
     * Remove products
     *
     * @param \Eshop\SampleBundle\Entity\OrdersProduct $products
     */
    public function removeProducts(\Eshop\SampleBundle\Entity\OrdersProduct $products)
    {
        $this->products->removeElement($products);
    }

    /**
     * Get currencies
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProducts()
    {
        return $this->products;
    }


    /**
     * Set totalPriceOrder
     *
     * @param float $totalPriceOrder
     *
     * @return Orders
     */
    public function setTotalPriceOrder($totalPriceOrder)
    {
        $this->totalPriceOrder = $totalPriceOrder;

        return $this;
    }

    /**
     * Get totalPriceOrder
     *
     * @return float
     */
    public function getTotalPriceOrder()
    {
        return $this->totalPriceOrder;
    }



    /**
     * Set default current currency
     *
     * @param string $currency
     * @return Order
     */
    public function setCurrency(\Eshop\SampleBundle\Entity\Currencies $currency = null)
    {
        $this->currency = $currency;
        return $this;
    }

    /**
     * Get currency
     *
     * @return \Eshop\SampleBundle\Entity\Order
     */
    public function getCurrency()
    {
        return $this->currency;
    }

    /**
     * Set hash
     *
     * @param string $additionalOrderData
     *
     * @return Orders
     */
    public function setAdditionalOrderData($additionalOrderData)
    {
        $this->additionalOrderData = $additionalOrderData;

        return $this;
    }

    /**
     * Get additionalOrderData
     *
     * @return string
     */
    public function getAdditionalOrderData()
    {
        return $this->additionalOrderData;
    }

    /**
     * Set payedError
     *
     * @param string $payedError
     *
     * @return Orders
     */
    public function setPayedError($payedError)
    {
        $this->payedError = $payedError;

        return $this;
    }

    /**
     * Get payedError
     *
     * @return string
     */
    public function getPayedError()
    {
        return $this->payedError;
    }

    /**
     * Set hash
     *
     * @param string $payedHash
     *
     * @return Orders
     */
    public function setPayedHash($payedHash)
    {
        $this->payedHash = $payedHash;

        return $this;
    }

    /**
     * Get $payedHash
     *
     * @return string
     */
    public function getPayedHash()
    {
        return $this->payedHash;
    }

    /**
     * Set is offline
     *
     * @param string $isOffline
     *
     * @return Orders
     */
    public function setIsOffline($isOffline)
    {
        $this->isOffline = $isOffline;

        return $this;
    }

    /**
     * Get $isOffline
     *
     * @return string
     */
    public function getIsOffline()
    {
        return $this->isOffline;
    }


}
