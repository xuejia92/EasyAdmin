<?php
return [
    'qq' =>[
        'app_id'        => '101452905',
        'app_secret'    => 'bcfa50c72032d6716d84e0b9ed6cb8de',
        'scope'         => 'get_user_info',
        'callback'      => ''
    ],
    'weixin'=>[
        'app_id'     => 'wxbc4113c******',
        'app_secret' => '4749970d284217d0a**********',
        'scope'      => 'snsapi_userinfo',
        'callback'      => ''
    ],
    'weibo'=>[
        'app_id'     => 'wxbc4113c******',
        'app_secret' => '4749970d284217d0a**********',
        'scope'      => 'snsapi_userinfo',
        'callback'      => ''
    ],
    'alipay'=>[
        'app_id'     => 'wxbc4113c******',
        'scope'      => 'snsapi_userinfo',
        'pem_private' => Env::get('ROOT_PATH') . 'pem/private.pem', // 你的私钥
        'pem_public'  => Env::get('ROOT_PATH') . 'pem/public.pem', // 支付宝公钥
        'callback'      => ''
    ]
];