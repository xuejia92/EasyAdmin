<?php
/**
 * Created by PhpStorm.
 * User: evalor
 * Date: 2018-11-28
 * Time: 18:59
 */

namespace App\Utility\Pool;

use EasySwoole\Component\Pool\AbstractPool;
use EasySwoole\EasySwoole\Config;

class RedisPool extends AbstractPool
{
    protected function createObject()
    {
        $redis = new RedisObject;
        $conf = Config::getInstance()->getConf('REDIS');
        $redis->connect($conf['host'], $conf['port']);
        $redis->setOption(\Redis::OPT_SERIALIZER, \Redis::SERIALIZER_PHP);
        if (!empty($conf['auth'])) {
            $redis->auth($conf['auth']);
        }
        return $redis;
    }
}