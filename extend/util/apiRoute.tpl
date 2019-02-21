<?php

// +----------------------------------------------------------------------
// | ThinkApiAdmin
// +----------------------------------------------------------------------

/**
 * Api接口路由
 */

// 命令行生成路由缓存 optimize:route
// php think optimize:route

use think\facade\Route;

// 方法前置
$afterBehavior = ['\app\api\behavior\ApiAuth', '\app\api\behavior\RequestFilter',];

Route::group('api',function () use($afterBehavior){
Route::rules([