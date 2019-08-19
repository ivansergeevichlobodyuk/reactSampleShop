<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Statuses
 *
 * @ORM\Table(name="statuses")
 * @ORM\Entity
 */
class Statuses
{


    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    public $id;


    /**
     * @var string
     *
     * @ORM\Column(name="name_ua", type="string")
     */
    private $nameUa;

    /**
     * @var string
     *
     * @ORM\Column(name="name_ru", type="string")
     */
    private $nameRu;


    /**
     * @var string
     *
     * @ORM\Column(name="name_by", type="string")
     */
    private $nameBy;

    /**
     * @var string
     *
     * @ORM\Column(name="name_en", type="string")
     */
    private $nameEn;


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
     * Set name
     *
     * @param string $nameUa
     *
     * @return Statuses
     */
    public function setNameUa($nameUa)
    {
        $this->nameUa = $nameUa;
        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getNameUa()
    {
        return $this->nameUa;
    }

    /**
     * Set name
     *
     * @param string $nameBy
     *
     * @return Statuses
     */
    public function setNameBy($nameBy)
    {
        $this->nameBy = $nameBy;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getNameBy()
    {
        return $this->nameBy;
    }

    /**
     * Set name
     *
     * @param string $nameRu
     *
     * @return Statuses
     */
    public function setNameRu($nameRu)
    {
        $this->nameRu = $nameRu;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getNameRu()
    {
        return $this->nameRu;
    }


    /**
     * Set name
     *
     * @param string $nameEn
     *
     * @return Statuses
     */
    public function setNameEn($nameEn)
    {
        $this->nameEn = $nameEn;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getNameEn()
    {
        return $this->nameEn;
    }



}