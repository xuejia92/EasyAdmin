<?php
return [
    //Redis 配置
    'DATA_CACHE_PREFIX' => 'Redis_',    //缓存前缀
    'DATA_CACHE_TYPE'=>'Redis',         //默认动态缓存为Redis
    'REDIS_RW_SEPARATE' => true,        //Redis读写分离 true 开启
    'REDIS_HOST'=>'192.168.1.106',          //redis服务器ip，多台用逗号隔开；读写分离开启时，第一台负责写，其它[随机]负责读；
    'REDIS_PORT'=>'6379',               //端口号
    'REDIS_TIMEOUT'=>'300',             //超时时间
    'REDIS_EXPIRE'=>'1800',             //失效时间
    'REDIS_PERSISTENT'=>false,          //是否长连接 false=短连接
    'REDIS_AUTH'=>'',
];