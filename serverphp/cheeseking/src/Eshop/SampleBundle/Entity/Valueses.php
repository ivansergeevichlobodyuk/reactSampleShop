<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Categories
 *
 * @ORM\Table(name="valueses")
 * @ORM\Entity
 */
class Valueses
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
     * Set nameEn
     *
     * @param string $nameEn
     *
     * @return Filters
     */
    public function setNameEn($nameEn)
    {
        $this->nameEn = $nameEn;
        return $this;
    }

    /**
     * Get nameEn
     *
     * @return string
     */
    public function getNameEn()
    {
        return $this->nameEn;
    }

    /**
     * Set nameEn
     *
     * @param string $nameRu
     *
     * @return Filters
     */
    public function setNameRu($nameRu)
    {
        $this->nameRu = $nameRu;
        return $this;
    }

    /**
     * Get nameRu
     *
     * @return string
     */
    public function getNameRu()
    {
        return $this->nameRu;
    }


    /**
     * Set nameUa
     *
     * @param string $nameUa
     *
     * @return Filters
     */
    public function setNameUa($nameUa)
    {
        $this->nameUa = $nameUa;
        return $this;
    }

    /**
     * Get nameUa
     *
     * @return string
     */
    public function getNameUa()
    {
        return $this->nameUa;
    }

    /**
     * Set nameUa
     *
     * @param string $nameBy
     *
     * @return Filters
     */
    public function setNameBy($nameBy)
    {
        $this->nameBy = $nameBy;
        return $this;
    }

    /**
     * Get nameBy
     *
     * @return string
     */
    public function getNameBy()
    {
        return $this->nameBy;
    }

}