<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Favourites
 *
 * @ORM\Table(name="favourites")
 * @ORM\Entity
 */
class Favourites
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
     * @var \Eshop\SampleBundle\Entity\Goods
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Goods")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="goods_id", referencedColumnName="id")
     * })
     */
    private $goods;


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
     * @var string
     *
     * @ORM\Column(name="hash", type="text", nullable=true)
     */
    private $hash;

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
     * Set goods
     *
     * @param \Eshop\SampleBundle\Entity\Goods $goods
     *
     * @return Cart
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
     * Set count
     *
     * @param text $hash
     *
     * @return Cart
     */
    public function setHash($hash)
    {
        $this->hash = $hash;

        return $this;
    }

    /**
     * Get count
     *
     * @return integer
     */
    public function getHash()
    {
        return $this->hash;
    }


}