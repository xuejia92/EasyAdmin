<?php
return [
    // 是否自动读取取插件钩子配置信息（默认是关闭）
    'autoload' => true,
    'type'=>'file',
    'hooks'=>[
        'test'=>'testhook'
    ],
    'remote_plug'=>'http://39.107.66.212:8002/',
    'remote_plug_url'=>'http://39.107.66.212:8002/static/download_plug/',
];