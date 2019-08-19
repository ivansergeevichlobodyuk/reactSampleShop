<?php

// src/AppBundle/EventSubscriber/UserLocaleSubscriber.php
namespace Eshop\SampleBundle\EventSubscriber;

use Doctrine\Bundle\DoctrineBundle\DoctrineBundle;
use Doctrine\ORM\EntityManager;
use Eshop\SampleBundle\Entity\Cart;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Http\Event\InteractiveLoginEvent;
use Symfony\Component\Security\Http\SecurityEvents;

/**
 * Stores the locale of the user in the session after the
 * login. This can be used by the LocaleSubscriber afterwards.
 */
class UserLocaleSubscriber implements EventSubscriberInterface
{
    private $session;

    /**
     * @var $doctrine
     */
    private $doctrine;

    /**
     * UserLocaleSubscriber constructor.
     * @param SessionInterface $session
     */
    public function __construct(SessionInterface $session, $defaultLocale, $doctrine)
    {
        $this->session = $session;
        $this->doctrine = $doctrine;
    }

    /**
     * @param InteractiveLoginEvent $event
     */
    public function onInteractiveLogin(InteractiveLoginEvent $event)
    {
        $user = $event->getAuthenticationToken()->getUser();
        $cookies = $event->getRequest()->cookies;
        $this->_mergeCartData($cookies, $user);
    }

    /**
     *
     */
    private function _mergeCartData($cookies, $user){
        if ( $cookies->has("cart_user_id") ){
            $userLoggedId = $cookies->get("cart_user_id");
            $this->doctrine->getRepository(Cart::class)->mergerCart($user,$userLoggedId);
        }
    }


    /**
     * @return array
     */
    public static function getSubscribedEvents()
    {
        return array(
            SecurityEvents::INTERACTIVE_LOGIN => 'onInteractiveLogin',
        );
    }
}