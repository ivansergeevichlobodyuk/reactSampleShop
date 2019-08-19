<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * News
 *
 * @ORM\Table(name="news")
 * @ORM\Entity
 */
class News
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
     * @ORM\Column(name="file_name", type="string")
     */
    private $fileName;

    /**
     * @var string
     *
     * @ORM\Column(name="physic_file_name", type="string")
     */
    private $physicFileName;

    /**
     * @var integer
     *
     * @ORM\Column(name="category", type="integer")
     */
    private $category;


    /**
     * @var text
     *
     * @ORM\Column(name="article_ru", type="text", nullable=true)
     */
    private $articleRu;

    /**
     * @var text
     *
     * @ORM\Column(name="article_ua", type="text", nullable=true)
     */
    private $articleUa;

    /**
     * @var integer
     *
     * @ORM\Column(name="is_active", type="integer")
     */
    private $isActive;

    /**
     * @var integer
     *
     * @ORM\Column(name="is_archive", type="integer")
     */
    private $isArchive;

    /**
     * @var integer
     *
     * @ORM\Column(name="ordering", type="integer")
     */
    private $ordering;

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
     * Set fileName
     *
     * @param text $fileName
     *
     * @return Images
     */
    public function setFileName($fileName)
    {
        $this->fileName = $fileName;

        return $this;
    }

    /**
     * Get fileName
     *
     * @return string
     */
    public function getFileName()
    {
        return $this->fileName;
    }

    /**
     * Set physicFileName
     *
     * @param text $physicFileName
     *
     * @return Images
     */
    public function setPhysicFileName($physicFileName)
    {
        $this->physicFileName = $physicFileName;

        return $this;
    }

    /**
     * Get physicFileName
     *
     * @return string
     */
    public function getPhysicFileName()
    {
        return $this->physicFileName;
    }

    /**
     * Set articleRu
     *
     * @param text $articleRu
     *
     * @return Images
     */
    public function setArticleRu($articleRu)
    {
        $this->articleRu = $articleRu;

        return $this;
    }

    /**
     * Get articleRu
     *
     * @return string
     */
    public function getArticleRu()
    {
        return $this->articleRu;
    }

    /**
     * Set articleRu
     *
     * @param text $articleRu
     *
     * @return Images
     */
    public function setArticleUa($articleUa)
    {
        $this->articleUa = $articleUa;

        return $this;
    }

    /**
     * Get articleRu
     *
     * @return string
     */
    public function getArticleUa()
    {
        return $this->articleUa;
    }


    /**
     * Sets isActive
     *
     * @param $isActive
     * @return $this
     */
    public function setIsActive( $isActive ){
        $this->isActive = $isActive;
        return $this;
    }

    /**
     * Gets is active
     *
     * @return int
     */
    public function getIsActive(){
        return $this->isActive;
    }

    /**
     * Sets isArchive
     *
     * @param $isArchive
     *
     * @return $this
     */
    public function setIsArchive( $isArchive ){
        $this->isArchive = $isArchive;
        return $this;
    }

    /**
     * Gets is archive
     *
     * @return int
     */
    public function getIsArchive(){
        return $this->isArchive;
    }

    /**
     * Sets ordering
     *
     * @param $ordering
     *
     * @return $this
     */
    public function setOrdering( $ordering ){
        $this->ordering = $ordering;
        return $this;
    }

    /**
     * Gets ordering
     *
     * @return int
     */
    public function getOrdering(){
        return $this->ordering;
    }

    /**
     * Sets $category
     *
     * @param $category
     *
     * @return $this
     */
    public function setCategory( $category ){
        $this->category = $category;
        return $this;
    }

    /**
     * Gets is category
     *
     * @return int
     */
    public function getCategory(){
        return $this->category;
    }



}