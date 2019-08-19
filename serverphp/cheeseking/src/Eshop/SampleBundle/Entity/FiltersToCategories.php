<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eshop\SampleBundle\Entity\Filters;

/**
 * FiltersToCategories
 *
 * @ORM\Table(name="filters_to_categories", indexes={@ORM\Index(name="fk_filter1_idx", columns={"filter_id"}), @ORM\Index(name="fk_category_id", columns={"category_id"})})
 * @ORM\Entity
 */
class FiltersToCategories
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
     * @var \Eshop\SampleBundle\Entity\Filters
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Filters")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="filter_id", referencedColumnName="id")
     * })
     */
    private $filter;

    /**
     * @var \Eshop\SampleBundle\Entity\Categories
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Categories")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="category_id", referencedColumnName="id")
     * })
     */
    private $category;

    /**
     * @var string
     *
     * ORM\Column(name="excludes", type="json_array", nullable=true )
     */
    private $excludes;

    /**
     * Set orders
     *
     * @param \Eshop\SampleBundle\Entity\Filters $filter
     *
     * @return FiltersToCategories
     */
    public function setFilter(\Eshop\SampleBundle\Entity\Filters $filter = null)
    {
        $this->filter = $filter;
        return $this;
    }

    /**
     * Get order
     *
     * @return \Eshop\SampleBundle\Entity\Filter
     */
    public function getFilter()
    {
        return $this->filter;
    }

    /**
     * Set orders
     *
     * @param \Eshop\SampleBundle\Entity\Categories $category
     *
     * @return FiltersToCategories
     */
    public function setCategory(\Eshop\SampleBundle\Entity\Categories $category = null)
    {
        $this->category = $category;
        return $this;
    }

    /**
     * Get order
     *
     * @return \Eshop\SampleBundle\Entity\Categories
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * Set orders
     *
     * @param string $excludes
     *
     * @return FiltersToCategories
     */
    public function setExclude( $excludes )
    {
        $this->excludes = $excludes;
        return $this;
    }

    /**
     * Set orders
     *
     * @param string $excludes
     *
     * @return string
     */
    public function getExclude( )
    {
        return $this->excludes;
    }



}