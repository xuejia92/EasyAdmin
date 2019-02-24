<?php

// +----------------------------------------------------------------------
// | ThinkApiAdmin
// +----------------------------------------------------------------------

namespace app\api\controller\user;

use controller\BasicApi;
use think\Db;
use think\facade\App;
use util\ReturnCode;

/**
 * API index类
 * Class Index
 * @package app\api\controller
 */
class Register extends BasicApi
{
    /**
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function register()
    {
        $account = $this->request->post('account');
        $password = $this->request->post('password');
        if (empty($account) || empty($password)) {
            return $this->buildFailed(ReturnCode::LOGIN_ERROR, '用户名或密码不能为空');
        }
        if(!$res=Db::name('dusy_user')->where(['account'=>$account])->find()){
            return $this->buildFailed(ReturnCode::LOGIN_ERROR, '账号不存在哦');
        }

        if($res['password']!=md5('EasyAdmin*'.$password)){
            return $this->buildFailed(ReturnCode::LOGIN_ERROR, '用户账号或密码错误');
        }

        if($res){
            $userToken = md5(uniqid(microtime(true),true));
            cache('userId:' . $userToken,$res);
            return $this->buildSuccess([
                'userInfo' => $res,
                'userToken' => $userToken,
            ]);
        }else{
            return $this->buildFailed(ReturnCode::LOGIN_ERROR, '登录失败');
        }
    }
}
