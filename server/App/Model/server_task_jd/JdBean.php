<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2019/2/14
 * Time: 13:44
 */

namespace App\Model\server_task_jd;
use EasySwoole\Spl\SplBean;
class JdBean extends SplBean
{
    protected $sku;
    protected $name;
    protected $price;
    protected $shop;
    /**
     * @return mixed
     */
    public function getSku()
    {
        return $this->sku;
    }
    /**
     * @param mixed $sku
     */
    public function setSku($sku): void
    {
        $this->sku = $sku;
    }
    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }
    /**
     * @param mixed $name
     */
    public function setName($name): void
    {
        $this->name = $name;
    }
    /**
     * @return mixed
     */
    public function getPrice()
    {
        return $this->price;
    }
    /**
     * @param mixed $price
     */
    public function setPrice($price): void
    {
        $this->price = $price;
    }
    /**
     * @return mixed
     */
    public function getShop()
    {
        return $this->shop;
    }
    /**
     * @param mixed $shop
     */
    public function setShop($shop): void
    {
        $this->shop = $shop;
    }
}