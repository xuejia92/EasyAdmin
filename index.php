<?php

// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2017 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------
 
namespace think;
//ini_set("display_errors","On");
//error_reporting(E_ALL);

// 加载基础文件
require __DIR__ . '/thinkphp/base.php';

define('DS','/');
// 定义URL
if (!defined('WEB_URL')) {
    $url = rtrim(dirname(rtrim($_SERVER['SCRIPT_NAME'], '/')), '/');
    define('WEB_URL', (('/' == $url || '\\' == $url) ? '' : $url));
}
// think文件检查，防止TP目录计算异常
file_exists('think') || touch('think');

// 执行应用并响应
Container::get('app', [__DIR__ . '/front/'])->run()->send();
