<?php

namespace Eshop\SampleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;
/**
 * Users
 *
 * @ORM\Table(name="users")
 * @ORM\Entity
 * @UniqueEntity("phone")
 * @UniqueEntity("email")
 */
class Users implements UserInterface
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
     * @ORM\Column(name="roles", type="string", length=128, nullable=true)
     */
    private $roles;

    /**
     * @var string
     *
     * @ORM\Column(name="username", type="string", length=45, nullable=true)
     */
    private $username;

    /**
     * @var string
     *
     *
     *
     * @ORM\Column(name="name", type="string", length=45, nullable=true)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="surname", type="string", length=45, nullable=true)
     */
    private $surname;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=45, nullable=true)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="address", type="string", length=45, nullable=true)
     */
    private $address;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Eshop\SampleBundle\Entity\Currencies", mappedBy="users")
     */
    private $currencies;

    /**
     * @ORM\Column(name="password", type="string", length=128)
     */
    private $password;

    /**
     * @ORM\Column(name="company", type="string", length=128, nullable=true)
     */
    private $company;

    /**
     * @Assert\Regex(
     *     pattern="/^(?=.*[0-9])(?=.*[a-z])([a-zA-Z0-9]{5,})$/",
     *     match=true,
     *     message="BAD_PASSWORD"
     * )
     * @Assert\NotBlank
     */
    private $plainPassword;

    /**
     * @ORM\Column(name="locale", type="string", length=128)
     */
    private $locale;

    /**
     * @ORM\Column(name="promocode", type="string", length=128,nullable=true)
     */
    private $promocode;

    /**
     * @ORM\Column(name="hash", type="string", length=128, nullable=true)
     */
    private $hash;

    /**
     * @var \Eshop\SampleBundle\Entity\Users
     *
     * @ORM\ManyToOne(targetEntity="Eshop\SampleBundle\Entity\Currencies")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="default_currency", referencedColumnName="id")
     * })
     */
    private $defaultCurrency;

    /**
     * @ORM\Column(name="phone", type="string", length=128)
     *
     * @Assert\NotBlank(message="USERNAME_IS_BLANK")
     * @Assert\Regex(
     *     pattern="/\++\d{12,16}/",
     *     match=true,
     *     message="BAD_PHONE_NUMBER"
     * )
     */
    private $phone;

    /**
     * @ORM\Column(name="city", type="string", length=128, nullable=true)
     */
    private $city;

    /**
     *
     * @ORM\OneToMany(targetEntity="Eshop\SampleBundle\Entity\Order", mappedBy="users")
     */
    protected $orders;

    /**
     * Is verified
     *
     * @ORM\Column(name="verify", type="integer", nullable=true)
     */
    private $verify;

    /**
     * @ORM\Column(name="activateCode", type="string", length=8, nullable=true)
     */
    private $activationCode;

    /**
     *  @ORM\Column(name="count_sms_send", type="integer", nullable=true)
     */
    private $countSMSSend;


    /**
     * @var lastDateSendSMS $date
     *
     * @ORM\Column(name="lastDateSendSMS", type="datetime", nullable=true)
     */
    private $lastDateSendSMS;


    /**
     * @var $lastDateCreateCode
     *
     * @ORM\Column(name="lastDateCreateCode", type="datetime", nullable=true)
     */
    private $lastDateCreateCode;

    /**
     * @var $countCheckCode
     *
     *  @ORM\Column(name="count_check_code", type="integer", nullable=true)
     */
    private $countCheckCode;

    /**
     * @var $lastDateCreateCode
     *
     * @ORM\Column(name="lastDateCheckCode", type="datetime", nullable=true)
     */
    private $lastDateCheckCode;

    /**
     * @var $countResetSms
     *
     *  @ORM\Column(name="count_reset_sms", type="integer", nullable=true)
     */
    private $countResetSms;

    /**
     * @var $lastDateCreateCode
     *
     * @ORM\Column(name="last_date_reset_send_sms", type="datetime", nullable=true)
     */
    private $lastDateResetSendSMS;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->currencies = new \Doctrine\Common\Collections\ArrayCollection();
    }


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
     * Set roles
     *
     * @param string $roles
     *
     * @return Users
     */
    public function setRoles($roles)
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * Add currency
     *
     * @param \Eshop\SampleBundle\Entity\Order $order
     *
     * @return Order
     */
    public function addOrders(\Eshop\SampleBundle\Entity\Order $order)
    {
        $this->orders[] = $order;

        return $this;
    }

    /**
     * Remove orders
     *
     * @param \Eshop\SampleBundle\Entity\Order $order
     */
    public function removeOrders(\Eshop\SampleBundle\Entity\Order $order)
    {
        $this->orders->removeElement($order);
    }

    /**
     * Get orders
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getOrders()
    {
        return $this->orders;
    }

    /**
     * Get roles
     *
     * @return string
     */
    public function getRoles()
    {
        return json_decode($this->roles);
    }

    /**
     * Set name
     *
     * @param string $username
     *
     * @return Users
     */
    public function setUsername($username)
    {
        $this->username = $username;
        return $this;
    }

    /**
     * Get username
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set name
     *
     * @param string $username
     *
     * @return Users
     */
    public function setName($username)
    {
        $this->name = $username;
        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getCompany()
    {
        return $this->company;
    }

    /**
     * Set name
     *
     * @param string $company
     *
     * @return Users
     */
    public function setCompany($company)
    {
        $this->company = $company;
        return $this;
    }

    /**
     * Sets promocode
     *
     * @param $promocode
     * @return $this
     */
    public function setPromocode( $promocode ){
        $this->promocode = $promocode;
        return $this;
    }

    /**
     * Get promocode
     *
     * @return string
     */
    public function getPromocode()
    {
        return $this->promocode;
    }


    /**
     * Sets hash
     *
     * @param $hash
     * @return $this
     */
    public function setHash( $hash ){
        $this->hash = $hash;
        return $this;
    }

    /**
     * Get hash
     *
     * @return string
     */
    public function getHash()
    {
        return $this->hash;
    }


    /**
     * Sets hash
     *
     * @param $activateCode
     * @return $this
     */
    public function setActivationCode( $activateCode ){
        $this->activationCode = $activateCode;
        return $this;
    }

    /**
     * Get activateCode
     *
     * @return string
     */
    public function getActivationCode()
    {
        return $this->activationCode;
    }



    /**
     * Sets phone
     *
     * @param $phone
     * @return $this
     */
    public function setPhone( $phone ){
        $this->phone = $phone;
        return $this;
    }

    /**
     * Get phone
     *
     * @return string
     */
    public function getPhone()
    {
        return $this->phone;
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
     * Set surname
     *
     * @param string $surname
     *
     * @return Users
     */
    public function setSurname($surname)
    {
        $this->surname = $surname;

        return $this;
    }

    /**
     * Get surname
     *
     * @return string
     */
    public function getSurname()
    {
        return $this->surname;
    }

    /**
     * Set email
     *
     * @param string $email
     *
     * @return Users
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set address
     *
     * @param string $address
     *
     * @return Users
     */
    public function setAddress($address)
    {
        $this->address = $address;

        return $this;
    }

    /**
     * Get address
     *
     * @return string
     */
    public function getAddress()
    {
        return $this->address;
    }


    /**
     * Set city
     *
     * @param string $city
     *
     * @return Users
     */
    public function setCity($city)
    {
        $this->city = $city;
        return $this;
    }

    /**
     * Get city
     *
     * @return string
     */
    public function getCity()
    {
        return $this->city;
    }


    /**
     * Add currency
     *
     * @param \Eshop\SampleBundle\Entity\Currencies $currency
     *
     * @return Users
     */
    public function addCurrency(\Eshop\SampleBundle\Entity\Currencies $currency)
    {
        $this->currencies[] = $currency;

        return $this;
    }

    /**
     * Remove currency
     *
     * @param \Eshop\SampleBundle\Entity\Currencies $currency
     */
    public function removeCurrency(\Eshop\SampleBundle\Entity\Currencies $currency)
    {
        $this->currencies->removeElement($currency);
    }

    /**
     * Sets password
     *
     * @param $password
     *
     * @return Users
     */
    public function setPassword($password)
    {
        $this->password = $password;
        return $this;
    }

    /**
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }


    /**
     * Sets locale
     *
     * @param $locale
     *
     * @return Users
     */
    public function setLocale($locale)
    {
        $this->locale = $locale;
        return $this;
    }

    /**
     * @return string
     */
    public function getLocale()
    {
        return $this->locale;
    }


    /**
     * @return mixed
     */
    public function getPlainPassword()
    {
        return $this->plainPassword;
    }

    public function setPlainPassword($password)
    {
        $this->plainPassword = $password;
    }

    public function eraseCredentials()
    {

    }

    /**
     * Set default current currency
     *
     * @param string $defaultCurrency
     *
     * @return Users
     */
    public function setDefaultCurrency(\Eshop\SampleBundle\Entity\Currencies $defaultCurrency = null)
    {
        $this->defaultCurrency = $defaultCurrency;
        return $this;
    }

    /**
     * Get currency
     *
     * @return \Eshop\SampleBundle\Entity\Currencies
     */
    public function getDefaultCurrency()
    {
        return $this->defaultCurrency;
    }

    /**
     * Get currencies
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCurrencies()
    {
        return $this->currencies;
    }

    public function isAccountNonExpired()
    {
        return true;
    }

    public function isAccountNonLocked()
    {
        return true;
    }

    public function isCredentialsNonExpired()
    {
        return true;
    }

    public function isEnabled()
    {
        return $this->isActive;
    }

    /**
     * Gets verify
     *
     * @return integer
     */
    public function getVerify(){
        return $this->verify;
    }

    /**
     * Sets verify
     *
     * @param $verify
     * @return $this
     */
    public function setVerify($verify){
        $this->verify = $verify;
        return $this;
    }

    /**
     * Gets $countSMSSend
     *
     * @return integer
     */
    public function getCountSMSSend(){
        return $this->countSMSSend;
    }

    /**
     * Sets $countSMSSend
     *
     * @param $countSMSSend
     * @return $this
     */
    public function setCountSMSSend($countSMSSend){
        $this->countSMSSend = $countSMSSend;
        return $this;
    }

    /**
     * Gets $countCheckCode
     *
     * @return integer
     */
    public function getCountCheckCode(){
        return $this->countCheckCode;
    }


    /**
     * Sets $countResetSms
     *
     * @param $countResetSms
     * @return $this
     */
    public function setCountResetSms($countResetSms){
        $this->countResetSms = $countResetSms;
        return $this;
    }

    /**
     * Gets $countResetSms
     *
     * @return integer
     */
    public function getCountResetSms(){
        return $this->countResetSms;
    }


    /**
     * Sets $countSMSSend
     *
     * @param $countCheckCode
     * @return $this
     */
    public function setCountCheckCode($countCheckCode){
        $this->countCheckCode = $countCheckCode;
        return $this;
    }



    /**
     * Set date
     *
     * @param date lastDateSendSMS
     * @return Users
     */
    public function setLastDateSendSMS($lastDateSendSMS)
    {
        $this->lastDateSendSMS = $lastDateSendSMS;
        return $this;
    }

    /**
     * Get date
     *
     * @return lastDateSendSMS
     */
    public function getLastDateSendSMS()
    {
        return $this->lastDateSendSMS;
    }

    /**
     * Get date
     *
     * @return lastDateSendSMS
     */
    public function getLastDateCreateCode()
    {
        return $this->lastDateCreateCode;
    }

    /**
     * Set date
     *
     * @param date $lastDateCreateCode
     * @return Users
     */
    public function setLastDateCreateCode($lastDateCreateCode)
    {
        $this->lastDateCreateCode = $lastDateCreateCode;
        return $this;
    }


    /**
     * Get date
     *
     * @return lastDateCheckCode
     */
    public function getLastDateCheckCode()
    {
        return $this->lastDateCheckCode;
    }

    /**
     * Set date
     *
     * @param date $lastDateCheckCode
     * @return Users
     */
    public function setLastDateCheckCode($lastDateCheckCode)
    {
        $this->lastDateCheckCode = $lastDateCheckCode;
        return $this;
    }


    /**
     * Get date
     *
     * @return lastDateResetSendSMS
     */
    public function getLastDateResetSendSMS()
    {
        return $this->lastDateResetSendSMS;
    }

    /**
     * Set date
     *
     * @param date $lastDateResetSendSMS
     * @return Users
     */
    public function setLastDateResetSendSMS($lastDateResetSendSMS)
    {
        $this->lastDateResetSendSMS = $lastDateResetSendSMS;
        return $this;
    }



    /**
     * @return string|null
     */
    public function getSalt()
    {
        // The bcrypt and argon2i algorithms don't require a separate salt.
        // You *may* need a real salt if you choose a different encoder.
        return null;
    }


}
