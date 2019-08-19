<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Goods
 *
 * @ORM\Table(name="goods", indexes={@ORM\Index(name="fk_goods_categories1_idx", columns={"categories_id"})})
 * @ORM\Entity(repositoryClass="Eshop\SampleBundle\Repository\GoodsRepository")
 */
class Goods
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
     * @ORM\Column(name="name_ru", type="string", length=45, nullable=true)
     */
    private $nameRu;

    /**
     * @var string
     *
     * @ORM\Column(name="name_ua", type="string", length=45, nullable=true)
     */
    private $nameUa;

    /**
     * @var string
     *
     * @ORM\Column(name="name_by", type="string", length=45, nullable=true)
     */
    private $nameBy;

    /**
     * @var string
     *
     * @ORM\Column(name="name_en", type="string", length=45, nullable=true)
     */
    private $nameEn;

    /**
     * @var float
     *
     * @ORM\Column(name="price_type_1", type="float", precision=10, scale=0, nullable=true)
     */
    private $priceType1;

    /**
     * @var string
     *
     * @ORM\Column(name="images", type="string", length=100, nullable=true)
     */
    private $images;

    /**
     * @var string
     *
     * @ORM\Column(name="main_image", type="string", length=100, nullable=true)
     */
    private $mainImage;

    /**
     * @var float
     *
     * @ORM\Column(name="price_type_2", type="float", precision=10, scale=0, nullable=true)
     */
    private $priceType2;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=200, nullable=true)
     */
    private $description;

    /**
     * @var \Eshop\SampleBundle\Entity\Categories
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Categories")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="categories_id", referencedColumnName="id")
     * })
     */
    private $categories;

    /**
     *
     * @ORM\OneToMany(targetEntity="Eshop\SampleBundle\Entity\GoodsToFilters", mappedBy="goods")
     */
    protected $filters;

    /**
     * @var float
     *
     * @ORM\Column(name="price_recommended", type="float", precision=10, scale=0, nullable=true)
     */
    private $priceRecommended;

    /**
     * @var integer
     *
     * @ORM\Column(name="multiply", type="integer")
     */
    private $multiply;

    /**
     * @var string
     *
     * @ORM\Column(name="article", type="string", length=45, nullable=true )
     */
    private $article;

    /**
     * @var integer
     *
     * @ORM\Column(name="is_removed", type="integer")
     */
    private $isRemoved = false;

    /**
     * @var integer
     *
     * @ORM\Column(name="is_index_slider", type="integer")
     */
    private $isIndexSlider = false;

    /**
     * @var string
     *
     * @ORM\Column(name="img_for_slider", type="string", length=45, nullable=true)
     */
    private $imgForSlider;


    /**
     * @var integer
     *
     * @ORM\Column(name="is_bottom", type="integer")
     */
    private $isBottom;

    /**
     * @var string
     *
     * @ORM\Column(name="img_bottom", type="string", length=45, nullable=true)
     */
    private $imgForBottom;

    /**
     * @var string
     *
     * @ORM\Column(name="brand", type="string", length=100, nullable=true)
     */
    private $brand;

    /**
     * @var string
     *
     * @ORM\Column(name="made", type="string", length=100, nullable=true)
     */
    private $made;

    /**
     * @var string
     *
     * @ORM\Column(name="seo", type="text", nullable=true)
     */
    private $seo;

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
     * @return Goods
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
     * @return Goods
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
     * @return Goods
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
     * @return Goods
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



    /**
     * Set multiply
     *
     * @param string $multiply
     *
     * @return Goods
     */
    public function setMultiply($multiply)
    {
        $this->multiply = $multiply;

        return $this;
    }

    /**
     * Get multiply
     *
     * @return string
     */
    public function getMultiply()
    {
        return $this->multiply;
    }


    /**
     * Set priceType1
     *
     * @param float $priceType1
     *
     * @return Goods
     */
    public function setPriceType1($priceType1)
    {
        $this->priceType1 = $priceType1;

        return $this;
    }

    /**
     * Get priceType1
     *
     * @return float
     */
    public function getPriceType1()
    {
        return $this->priceType1;
    }

    /**
     * Set images
     *
     * @param string $images
     *
     * @return Goods
     */
    public function setImages($images)
    {
        $this->images = $images;

        return $this;
    }

    /**
     * Get images
     *
     * @return string
     */
    public function getImages()
    {
        return $this->images;
    }


    /**
     * Set images
     *
     * @param string $mainImage
     *
     * @return Goods
     */
    public function setMainImage($mainImage)
    {
        $this->mainImage = $mainImage;

        return $this;
    }

    /**
     * Get mainImage
     *
     * @return string
     */
    public function getMainImage()
    {
        return $this->mainImage;
    }

    /**
     * Set is removed flag
     *
     * @param integer $isRemoved
     *
     * @return Goods
     */
    public function setIsRemoved($isRemoved)
    {
        $this->isRemoved = $isRemoved;

        return $this;
    }

    /**
     * Get isRemoved
     *
     * @return integer
     */
    public function getIsRemoved()
    {
        return $this->isRemoved;
    }


    /**
     * Set priceType2
     *
     * @param float $priceType2
     *
     * @return Goods
     */
    public function setPriceType2($priceType2)
    {
        $this->priceType2 = $priceType2;

        return $this;
    }

    /**
     * Get priceType2
     *
     * @return float
     */
    public function getPriceType2()
    {
        return $this->priceType2;
    }


    /**
     * Set priceType2
     *
     * @param float $priceRecommended
     *
     * @return Goods
     */
    public function setPriceRecommended($priceRecommended)
    {
        $this->priceRecommended = $priceRecommended;

        return $this;
    }

    /**
     * Get priceType2
     *
     * @return float
     */
    public function getPriceRecommended()
    {
        return $this->priceRecommended;
    }

    /**
     * Set goodscol
     *
     * @param string $description
     *
     * @return Goods
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get goodscol
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set article
     *
     * @param string $article
     *
     * @return Goods
     */
    public function setArticle($article)
    {
        $this->article = $article;

        return $this;
    }

    /**
     * Get article
     *
     * @return string
     */
    public function getArticle()
    {
        return $this->article;
    }

    /**
     * Set made
     *
     * @param string $made
     *
     * @return Goods
     */
    public function setMade($made)
    {
        $this->made = $made;

        return $this;
    }

    /**
     * Get mades
     *
     * @return string
     */
    public function getMade()
    {
        return $this->made;
    }



    /**
     * Set brand
     *
     * @param string $brand
     *
     * @return Goods
     */
    public function setBrand($brand)
    {
        $this->brand = $brand;
        return $this;
    }

    /**
     * Get brand
     *
     * @return string
     */
    public function getBrand()
    {
        return $this->brand;
    }

    /**
     * Set categories
     *
     * @param \Eshop\SampleBundle\Entity\Categories $categories
     *
     * @return Goods
     */
    public function setCategories(\Eshop\SampleBundle\Entity\Categories $categories = null)
    {
        $this->categories = $categories;

        return $this;
    }

    /**
     * Get categories
     *
     * @return \Eshop\SampleBundle\Entity\Categories
     */
    public function getCategories()
    {
        return $this->categories;
    }

    /**
     * Add currency
     *
     * @param \Eshop\SampleBundle\Entity\GoodsToFilters $filter
     *
     * @return Goods
     */
    public function addFilters(\Eshop\SampleBundle\Entity\GoodsToFilters $filter)
    {
        $this->filters[] = $filter;
        return $this;
    }

    /**
     * Remove products
     *
     * @param \Eshop\SampleBundle\Entity\GoodsToFilters $filter
     */
    public function removeFilters(\Eshop\SampleBundle\Entity\GoodsToFilters $filter)
    {
        $this->filters->removeElement($filter);
    }

    /**
     * Get currencies
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getFilters()
    {
        return $this->filters;
    }

    /**
     * Set is index slider
     *
     * @param integer $isIndexSlider
     *
     * @return Goods
     */
    public function setIsIndexSlider($isIndexSlider)
    {
        $this->isIndexSlider = $isIndexSlider;
        return $this;
    }

    /**
     * Get isIndexSlider
     *
     * @return integer
     */
    public function getIsIndexSlider()
    {
        return $this->isIndexSlider;
    }

    /**
     * Set is index slider
     *
     * @param string $imgForSlider
     *
     * @return Goods
     */
    public function setImgForSlider($imgForSlider)
    {
        $this->imgForSlider = $imgForSlider;
        return $this;
    }

    /**
     * Get imgForSlider
     *
     * @return integer
     */
    public function getImgForSlider()
    {
        return $this->imgForSlider;
    }

    /**
     * Sets is bottom
     *
     * @param $isBottom
     * @return $this
     */
    public function setIsBottom($isBottom){
        $this->isBottom = $isBottom;
        return $this;
    }

    /**
     * Gets is bottom
     *
     * @return int
     */
    public function getIsBottom(){
        return $this->isBottom;
    }

    /**
     * Sets image for bottom
     *
     * @param $imgForBottom
     * @return $this
     */
    public function setImgForBottom( $imgForBottom ){
        $this->imgForBottom = $imgForBottom;
        return $this;
    }

    /**
     * Gets image for bottom
     *
     * @return string
     */
    public function getImgForBottom(){
        return $this->imgForBottom;
    }

    /**
     * Set seo
     *
     * @param string $seo
     *
     * @return Goods
     */
    public function setSeo($seo)
    {
        $this->seo = $seo;

        return $this;
    }

    /**
     * Get seo
     *
     * @return string
     */
    public function getSeo()
    {
        return $this->seo;
    }


}
