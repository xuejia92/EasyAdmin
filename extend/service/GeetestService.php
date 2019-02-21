<?php

// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2017 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

namespace service;

/**
 * 阿里云短信服务
 * Class AlismsService
 * @package service
 *
 * @config 需要在config目录定义aliyun.php配置文件
 * @configParam aliyun.SmsAppid 阿里云短信APPID
 * @configParam aliyun.SmsAppkey 阿里云短信APPKEY
 */
use GeetestLib;

require_once env('root_path'). '/extend/vendor/geetest/lib/class.geetestlib.php';
class GeetestService{
    public static function geetest_show_verify() {
        $GtSdk = new GeetestLib(sysconf('geetest_captcha_id'), sysconf('geetest_private_key'));
        $data = array(
            "user_id" => "test", # 网站用户id
            "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            "ip_address" => "127.0.0.1" # 请在此处传输用户请求验证时所携带的IP
        );
        $status = $GtSdk->pre_process($data, 1);
        session('gtserver',$status);
        session('user_id',$data);
        echo $GtSdk->get_response_str();
    }

    /**
     * geetest检测验证码
     */
    public static function geetest_chcek_verify($data){
        $geetest = new GeetestLib(sysconf('geetest_captcha_id'), sysconf('geetest_private_key'));
        $user_id=session('user_id');
        if (session('gtserver')==1) {
            $result=$geetest->success_validate($data['geetest_challenge'], $data['geetest_validate'], $data['geetest_seccode'], $user_id);
            if ($result) {
                return true;
            } else{
                return false;
            }
        }else{
            if ($geetest->fail_validate($data['geetest_challenge'],$data['geetest_validate'],$data['geetest_seccode'])) {
                return true;
            }else{
                return false;
            }
        }
    }

}