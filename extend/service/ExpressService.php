<?php
namespace service;
use PHPMailer\PHPMailer\PHPMailer;
use think\facade\App;

/**
 * Created by PhpStorm.
 * User: dusy
 * Date: 2018/6/12
 * Time: 3:05
 */

class ExpressService{
    public static function getExpressLiu($postid){
        $autoGetNameUrl = "http://www.kuaidi100.com/autonumber/autoComNum?resultv2=1&text=".$postid;
        $autoName = HttpService::post($autoGetNameUrl,[
            'resultv2'=>1,
            'text'=>$postid]);
        $autoName = json_decode($autoName,true);
        if(!empty($autoName['auto'])){
            $autoName = $autoName['auto'][0];
            $comCode = $autoName['comCode'];
            $infoUrl = 'http://www.kuaidi100.com/query?type='.$comCode.'&postid='.$postid;
            $info = HttpService::get($infoUrl);
            $info = json_decode($info,true);
            if(isset($info['message']) && $info['message']=='ok'){
                return $info;
            }else{
                return false;
            }
        }else{
            return false;
        }

    }
}