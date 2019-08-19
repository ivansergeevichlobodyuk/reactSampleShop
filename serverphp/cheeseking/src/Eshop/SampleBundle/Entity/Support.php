<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Services
 *
 * @ORM\Table(name="support")
 * @ORM\Entity
 */
class Support
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
     * @ORM\Column(name="description", type="text", nullable=false)
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(name="phone", type="text", nullable=false)
     */
    private $phone;


    /**
     * @var datetime $date
     *
     * @ORM\Column(name="date", type="date", nullable=true)
     */
    private $date;

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
     * Set phone
     *
     * @param text $phone
     *
     * @return Support
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;
        return $this;
    }

    /**
     * Get phone
     *
     * @return text
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set phone
     *
     * @param text $description
     *
     * @return Support
     */
    public function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    /**
     * Get phone
     *
     * @return text
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set date
     *
     * @param date $date
     * @return Support
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

}