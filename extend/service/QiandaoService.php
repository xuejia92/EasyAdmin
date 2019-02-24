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

use think\Db;

/**
 * 阿里云短信服务
 * Class AlismsService
 * @package service
 *
 * @config 需要在config目录定义aliyun.php配置文件
 * @configParam aliyun.SmsAppid 阿里云短信APPID
 * @configParam aliyun.SmsAppkey 阿里云短信APPKEY
 */
class QiandaoService {
    public static function getSign($row) {
        $t = $row + 1;
        if ($t > date('d')) {
            $td = "<td style='background-color:lemonchiffon' valign='top'>
<div align='right' valign='top'><span style='position:relative;right:20px;'>" . $t . "</span>
</div><div align='left'> </div><div align='left'> </div></td>";
        } else {
            if (strlen($t) == 1) {
                $day = "0" . $t;
            } else {
                $day = $t;
            }
            $uid = session('account')?session('account')['id']:0;
            $curr = date("Y-m-" . $day . "");
            list($start, $end) = [strtotime("{$curr} 00:00:00"),strtotime("{$curr} 23:59:59")];
            $info = Db::name("dusy_leesign")
                ->whereBetween('addtime', [$start, $end])
                ->where('uid',$uid)
                ->where('status',1)
                ->find();
            if ($info) {
                $td = "<td style='background-color:navajowhite;navajowhite ;'>
<div align='right' valign='top'><span style='position:relative;right:20px;'>" . $t . "</span>
</div><div align='left'>
<img width='35px' height='35px' src='/static/public/image/cart_3.gif' style='position:relative;left:5px;'> 已签到
</div></td>";
            } else {
                if ($t == date('d')) {
                    $td = "<td  class='today' onclick='signDay($(this))'>
<div align='right' valign='top'><span style='position:relative;right:20px;'>" . $t . "</span></div>
<div align='center'><a style='cursor:pointer;color:#ffffff;' >签到</a></div></td>";
                } else {
                    $td = "<td style='background-color:#DCDCDC;'>
<div align='right' valign='top'><span style='position:relative;right:20px;'>" . $t . "</span>
</div><div align='left'style='height:47px'>
</div></td>";
                }
            }
        }
        return $td;
    }
}