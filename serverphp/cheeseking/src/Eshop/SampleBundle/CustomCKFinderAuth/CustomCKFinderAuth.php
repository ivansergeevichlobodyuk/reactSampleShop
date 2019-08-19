<?php
/**
 * Created by PhpStorm.
 * User: ivanlobodyuk
 * Date: 09.06.19
 * Time: 21:43
 */

namespace Eshop\SampleBundle\CustomCKFinderAuth;

use CKSource\Bundle\CKFinderBundle\Authentication\Authentication as AuthenticationBase;

class CustomCKFinderAuth extends AuthenticationBase
{
    public function authenticate()
    {
        return true;
    }
}