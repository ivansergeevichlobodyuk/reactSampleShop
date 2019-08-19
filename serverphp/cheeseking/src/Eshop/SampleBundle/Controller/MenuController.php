<?php

namespace Eshop\SampleBundle\Controller;

use Eshop\SampleBundle\Entity\Categories;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;

class MenuController extends Controller
{
    /**
     * @Route("/")
     */
    public function indexAction()
    {
        return $this->render('@EshopSample/Main/index.html.twig');
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function getMenuAction( Request $request ){
        $categories = $this->getDoctrine()->getRepository(Categories::class);
        $menu = $categories->findBy(array("priority" => 1));
        $leftMenu = array();
        $locale = $request->getLocale();
        foreach ($menu AS $item ){
            $leftMenu[$item->getCategories()->getId()] = ['id' => $item->getCategories()->getId(), 'name' => $item->getCategories()->getCategoryName()];
        }
        return $this->render('@EshopSample/Main/menu.html.twig', array("menu" => $leftMenu));
    }

}