<?php
/**
 * Created by PhpStorm.
 * User: ivanlobodyuk
 * Date: 26.12.18
 * Time: 14:21
 */

namespace Eshop\SampleBundle\Form;

use Eshop\SampleBundle\Entity\Users;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormError;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;

/**
 * Class UserType
 * @package Eshop\SampleBundle\Form
 */
class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('email', EmailType::class, array('attr' => ["autocomplite" => 'off'], 'required' => false, 'label' => 'EMAIL', 'translation_domain' => 'translations'))
            ->add('name', TextType::class, array('attr' => ["error_bubbling" => true], 'label' => 'NAME', 'translation_domain' => 'translations'))
            ->add('surname', TextType::class, array('attr' => ["error_bubbling" => true],'label' => 'SURNAME', 'translation_domain' => 'translations'))
            ->add('phone', TextType::class, array('attr' => ["error_bubbling" => true], 'label' => 'PHONE', 'translation_domain' => 'translations'))
            ->add('plainPassword', RepeatedType::class, array(
                'type' => PasswordType::class,
                'first_options'  => array('label' => 'PASSWORD', 'translation_domain' => 'translations'),
                'second_options' => array('label' =>  'REPEAT_PASSWORD','translation_domain' => 'translations'),
            ));
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => Users::class,
        ));
    }
}