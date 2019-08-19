<?php

// src/AppBundle/EventSubscriber/LocaleSubscriber.php
namespace Eshop\SampleBundle\EventSubscriber;

use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
use Symfony\Component\DependencyInjection\ContainerInterface;

class LocaleSubscriber implements EventSubscriberInterface
{
    private $defaultLocale;

    private $ts;

    private $container;

    public function __construct($defaultLocale = 'ua',  TokenStorage $tokenStorage, ContainerInterface $container )
    {
        $this->defaultLocale = $defaultLocale;
        $this->ts = $tokenStorage;
        $this->container = $container;
    }

    /**
     *
     * @param GetResponseEvent $event
     */
    public function onKernelRequest(GetResponseEvent $event)
    {
        $request = $event->getRequest( );
        $cookies = $request->cookies;
        //$user = $this->ts->getToken()->getUser();
        if ( $cookies->has("languageSite") ){
            if ( $cookies->get("languageSite") != $request->getLocale( ) ){
                $request->setLocale($cookies->get("languageSite"));
            }
        }
    }

    /**
     * @return array
     */
    public static function getSubscribedEvents()
    {
        return array(
            // must be registered before (i.e. with a higher priority than) the default Locale listener
            KernelEvents::REQUEST => array(array('onKernelRequest', 20)),
        );
    }
}
