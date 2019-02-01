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

use think\facade\App;
use think\facade\Route;
use think\Request;

require_once dirname(__FILE__).'/common.php';

Route::rule('home/cms', function (Request $request) {
    $params = explode('/',$request->path());
    $controller = isset($params[2]) ?$params[2]: config('app.default_controller');
    $action = isset($params[3]) ?$params[3]: config('app.default_action');
    $controller = $controller==''?'index':$controller;
    $action = $action==''?'index':$action;
    $url = "home/cms/{$controller}/{$action}";
    return App::action($url, $params);
});

Route::rule('home/blog', function (Request $request) {
    $params = explode('/',$request->path());
    $controller = isset($params[2]) ?$params[2]: config('app.default_controller');
    $action = isset($params[3]) ?$params[3]: config('app.default_action');
    $controller = $controller==''?'index':$controller;
    $action = $action==''?'index':$action;
    $url = "home/blog/{$controller}/{$action}";
    return App::action($url, $params);
});

Route::rule('home/forum', function (Request $request) {
    $params = explode('/',$request->path());
    $controller = isset($params[2]) ?$params[2]: config('app.default_controller');
    $action = isset($params[3]) ?$params[3]: config('app.default_action');
    $controller = $controller==''?'index':$controller;
    $action = $action==''?'index':$action;
    $url = "home/forum/{$controller}/{$action}";
    return App::action($url, $params);
});











//以下放在最后 首页
Route::rule('home', function (Request $request) {
    $params = explode('/',$request->path());
    $controller = isset($params[2]) ?$params[2]: config('app.default_controller');
    $action = isset($params[3]) ?$params[3]: config('app.default_action');
    $url = "home/index/{$controller}/{$action}";
    return App::action($url, $params);
});


