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
Route::rules([        // 获取城市名称和ID通过省份ID 5a6ad3bc9c27e
        '5a6ad3bc9c27e' => [
            'api/Tool/getCityListByPid',
            ['method' => 'get', 'after' => $afterBehavior]
        ],
        // 获取县区名称和ID通过城市ID 5a6ad401210c7
        '5a6ad401210c7' => [
            'api/Tool/getDistrictListByCid',
            ['method' => 'get', 'after' => $afterBehavior]
        ],
        // user hello 5c55912ed6261
        '5c55912ed6261' => [
            'api/user.Index/index',
            ['method' => 'get|post', 'after' => $afterBehavior]
        ],
        // index/index 5c5598517c003
        '5c5598517c003' => [
            'api/Hn/index',
            ['method' => 'get|post', 'after' => $afterBehavior]
        ],
        // 发送邮件验证码 5c665b3659fd4
        '5c665b3659fd4' => [
            'api/Tool/getVcodeByEmail',
            ['method' => 'get', 'after' => $afterBehavior]
        ],
        // 用户登录接口 5c667f2f32c13
        '5c667f2f32c13' => [
            'api/user.Login/login',
            ['method' => 'post', 'after' => $afterBehavior]
        ],

        // 接口Hash异常跳转
        ]);
 Route::miss('api/miss/index'); 
});