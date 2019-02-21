<?php

// +----------------------------------------------------------------------
// | ThinkApiAdmin
// +----------------------------------------------------------------------

namespace app\api\behavior;

use util\ReturnCode;
use think\Request;

/**
 * 处理app_id接入接口权限
 * Class ApiPermission
 * @package app\api\behavior
 */
class ApiPermission
{

    /**
     * 默认行为函数 接口鉴权
     * @return \think\response\Json
     */
    public function run()
    {
        $request = \request();
        $hash = $request->routeInfo();
        $rule = explode('/',$hash['rule']);
        if (isset($rule[1])) {
            $hash = $rule[1];
            $access_token = $request->header('access-token');
            if ($access_token) {
                $appInfo = cache('AccessToken:' . $access_token);
                $allRules = explode(',', $appInfo['app_api']);
                if (!in_array($hash, $allRules)) {
                    $data = ['code' => ReturnCode::INVALID, 'msg' => '非常抱歉，您没有权限怎么做！', 'data' => []];
                    return json($data);
                }
            }
        }
    }

}
