<?php
//
//namespace Eshop\SampleBundle\EventListener;
//
//use Doctrine\DBAL\Exception\ReadOnlyException;
//use Symfony\Bundle\FrameworkBundle\Routing\Router;
//use Symfony\Component\DependencyInjection\ContainerInterface;
//use Symfony\Component\HttpFoundation\RedirectResponse;
//use Symfony\Component\HttpFoundation\Session\Session;
//use Symfony\Component\HttpKernel\Event\GetResponseEvent;
//use Symfony\Component\HttpKernel\KernelEvents;
//use Symfony\Component\EventDispatcher\EventSubscriberInterface;
//use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
//use Doctrine\ORM\EntityManager;
//
//class LocaleListener implements EventSubscriberInterface
//{
//    /**
//     * @var string
//     */
//    private $defaultLocale;
//
//    /**
//     * @var ContainerInterface
//     */
//    protected $container;
//
//    /**
//     * @var Session
//     */
//    protected $session;
//
//    /**
//     * @var Router
//     */
//    protected $router;
//
//    /**
//     * LocaleListener constructor.
//     * @param ContainerInterface $container
//     * @param Session $session
//     * @param EntityManager $em
//     * @param TokenStorage $tokenStorage
//     */
//    public function __construct(ContainerInterface $container, Session $session, EntityManager $em,TokenStorage $tokenStorage)
//    {
//        $this->container = $container;
//        $this->session = $session;
//        $this->ts = $tokenStorage;
//        $this->em = $em;
//    }
//
//
//    /**
//     * On kernel request
//     *
//     * @param GetResponseEvent $event
//     */
//    public function onKernelRequest(GetResponseEvent $event)
//    {
//        $user = $this->ts->getToken()->getUser( );
//        echo "<br /> user ".$user->getId( );
//        $request = $event->getRequest( );
//        $request->setLocale("ua");
//        return;
//    }
//
//    /**
//     * Gets subscribed events
//     *
//     * @return array
//     */
//    public static function getSubscribedEvents()
//    {
//        return array(
//            // must be registered after the default Locale listener
//            KernelEvents::REQUEST => array(array('onKernelRequest', 7)),
//        );
//    }
//}