<?php
/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2019/2/14
 * Time: 13:09
 */
namespace App\Utility;
use App\Utility\Pool\RedisObject;

class Queue
{
    private $redis;
    static public $queue = 'queue';
    function __construct(RedisObject $redis)
    {
        $this->redis = $redis;
    }
    function rPop()
    {
        $rs = $this->redis->rPop(self::$queue);
        return $rs;
    }
    function lPush($data)
    {
        $rs = $this->redis->lPush(self::$queue, $data);
        return $rs;
    }
}