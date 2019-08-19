<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Warehouses
 *
 * @ORM\Table(name="warehouses")
 * @ORM\Entity
 */
class Warehouses
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
     * @ORM\Column(name="name", type="string", length=45, nullable=true)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="locations", type="string", length=45, nullable=true)
     */
    private $locations;


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
     * @param string $name
     *
     * @return Warehouses
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set locations
     *
     * @param string $locations
     *
     * @return Warehouses
     */
    public function setLocations($locations)
    {
        $this->locations = $locations;

        return $this;
    }

    /**
     * Get locations
     *
     * @return string
     */
    public function getLocations()
    {
        return $this->locations;
    }
}