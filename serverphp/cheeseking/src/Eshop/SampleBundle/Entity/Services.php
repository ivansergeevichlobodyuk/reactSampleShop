<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Services
 *
 * @ORM\Table(name="services")
 * @ORM\Entity
 */
class Services
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
     * @ORM\Column(name="name", type="text", nullable=false)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="img", type="text", nullable=false)
     */
    private $img;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", nullable=false)
     */
    private $description;

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
     * @param text $name
     *
     * @return Services
     */
    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    /**
     * Get name
     *
     * @return text
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set img
     *
     * @param text $img
     *
     * @return Services
     */
    public function setImg($img)
    {
        $this->img = $img;
        return $this;
    }

    /**
     * Get name
     *
     * @return text
     */
    public function getImg()
    {
        return $this->img;
    }

    /**
     * Set description
     *
     * @param text $description
     *
     * @return Services
     */
    public function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    /**
     * Get description
     *
     * @return text
     */
    public function getDescription()
    {
        return $this->description;
    }
}