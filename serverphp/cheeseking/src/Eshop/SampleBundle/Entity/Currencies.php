<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Currencies
 *
 * @ORM\Table(name="currencies")
 * @ORM\Entity
 */
class Currencies
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
     * @ORM\Column(name="cur_code", type="string", length=4, nullable=true)
     */
    private $curCode;

    /**
     * @var integer
     *
     * @ORM\Column(name="is_default", type="integer", nullable=true)
     */
    private $isDefault;

    /**
     * @var float
     *
     * @ORM\Column(name="national_convertation_koefficient", type="float", precision=10, scale=0, nullable=true)
     */
    private $nationalConvertationKoefficient;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Eshop\SampleBundle\Entity\Users", inversedBy="currencies")
     * @ORM\JoinTable(name="user_to_currencies",
     *   joinColumns={
     *     @ORM\JoinColumn(name="currencies_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="users_id", referencedColumnName="id")
     *   }
     * )
     */
    private $users;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->users = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set curCode
     *
     * @param string $curCode
     *
     * @return Currencies
     */
    public function setCurCode($curCode)
    {
        $this->curCode = $curCode;

        return $this;
    }

    /**
     * Get curCode
     *
     * @return string
     */
    public function getCurCode()
    {
        return $this->curCode;
    }

    /**
     * Set isDefault
     *
     * @param integer $isDefault
     *
     * @return Currencies
     */
    public function setIsDefault($isDefault)
    {
        $this->isDefault = $isDefault;

        return $this;
    }

    /**
     * Get isDefault
     *
     * @return integer
     */
    public function getIsDefault()
    {
        return $this->isDefault;
    }

    /**
     * Set nationalConvertationKoefficient
     *
     * @param float $nationalConvertationKoefficient
     *
     * @return Currencies
     */
    public function setNationalConvertationKoefficient($nationalConvertationKoefficient)
    {
        $this->nationalConvertationKoefficient = $nationalConvertationKoefficient;

        return $this;
    }

    /**
     * Get nationalConvertationKoefficient
     *
     * @return float
     */
    public function getNationalConvertationKoefficient()
    {
        return $this->nationalConvertationKoefficient;
    }

    /**
     * Add user
     *
     * @param \Eshop\SampleBundle\Entity\Users $user
     *
     * @return Currencies
     */
    public function addUser(\Eshop\SampleBundle\Entity\Users $user)
    {
        $this->users[] = $user;

        return $this;
    }

    /**
     * Remove user
     *
     * @param \Eshop\SampleBundle\Entity\Users $user
     */
    public function removeUser(\Eshop\SampleBundle\Entity\Users $user)
    {
        $this->users->removeElement($user);
    }

    /**
     * Get users
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getUsers()
    {
        return $this->users;
    }
}
