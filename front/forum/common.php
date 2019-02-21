<?php

use think\Db;

function remove_xss($val)
{
    $val = htmlspecialchars_decode($val);
    $val = strip_tags($val, '<img><attach><u><p><b><i><a><strike><pre><code><font><blockquote><span><ul><li><table><tbody><tr><td><ol><iframe><embed>');
    $val = preg_replace('/([\x00-\x08,\x0b-\x0c,\x0e-\x19])/', '', $val);
    $search = 'abcdefghijklmnopqrstuvwxyz';
    $search .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $search .= '1234567890!@#$%^&*()';
    $search .= '~`";:?+/={}[]-_|\'\\';
    for ($i = 0; $i < strlen($search); $i++) {
        $val = preg_replace('/(&#[xX]0{0,8}'.dechex(ord($search[$i])).';?)/i', $search[$i], $val);
        $val = preg_replace('/(�{0,8}'.ord($search[$i]).';?)/', $search[$i], $val);
    }

    $ra1 = array('embed', 'iframe', 'frame', 'ilayer', 'layer', 'javascript', 'vbscript', 'expression', 'applet', 'meta', 'xml', 'blink', 'link', 'script', 'object', 'frameset', 'bgsound', 'title', 'base');
    $ra2 = array('onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');
    $ra = array_merge($ra1, $ra2);

    $found = true;
    while ($found == true) {
        $val_before = $val;
        for ($i = 0; $i < sizeof($ra); $i++) {
            $pattern = '/';
            for ($j = 0; $j < strlen($ra[$i]); $j++) {
                if ($j > 0) {
                    $pattern .= '(';
                    $pattern .= '(&#[xX]0{0,8}([9ab]);)';
                    $pattern .= '|';
                    $pattern .= '|(�{0,8}([9|10|13]);)';
                    $pattern .= ')*';
                }
                $pattern .= $ra[$i][$j];
            }
            $pattern .= '/i';
            $replacement = substr($ra[$i], 0, 2).'<x>'.substr($ra[$i], 2);
            $val = preg_replace($pattern, $replacement, $val);
            if ($val_before == $val) {
                $found = false;
            }
        }
    }
    $val=htmlspecialchars($val);
    return $val;
}

function point_note($score,$uid,$controller,$pointid=0){
    if($score!=0){
        if($controller=='login'){
            $time=time();
            $maptime['uid']=$uid;
            $maptime['controller']='login';

            $count=Db::name('ForumPointNote')->where('add_time','gt',$time-24*60*60)
                ->where($maptime)->count();
            if(!$data=Db::name('ForumUser')->where('uid',$uid)->find()){
                Db::name('ForumUser')->insert([
                    'uid'=>$uid,
                    'point'=>0,
                    'money'=>0,
                ]);
            }
            if($count>0){
                $res=Db::name('ForumUsergrade')->where('score','<=',$data['point'])
                    ->order('score desc')->limit(1)->value('name');
                if(!empty($res)&&$res!=$data['gradename']){
                    Db::name('ForumUser')->where('id',$uid)->setField('gradename',$res);
                }
                session('grades', $res);
                session('point', $data['point']);
            }else{
                //根据用户积分提升或降低用户等级
                Db::name('ForumUser')->where('uid',$uid)->setInc('point',$score);
                $da['uid']=$uid;
                $da['add_time']=time();
                $da['controller']=$controller;
                $da['score']=$score;
                $da['pointid']=$pointid;
                Db::name('forum_point_note')->insert($da);

                $map['score']=array('elt',$data['point']+$score);
                $res=Db::name('ForumUsergrade')->where($map)->order('score desc')->limit(1)->value('name');

                if(!empty($res)&&$res!=$data['gradename']){
                    Db::name('ForumUser')->where('id',$uid)->setField('gradename',$res);
                }

                session('grades', $res);
                session('point', $data['point']+$score);
            }
        }else{
            if(!$data=Db::name('ForumUser')->where('uid',$uid)->find()){
                Db::name('ForumUser')->insert([
                    'uid'=>$uid,
                    'point'=>0,
                    'money'=>0,
                ]);
            }

            Db::name('ForumUser')->where('uid',$uid)->setInc('point',$score);
            $da['uid']=$uid;
            $da['add_time']=time();
            $da['controller']=$controller;
            $da['score']=$score;
            $da['pointid']=$pointid;
            Db::name('forum_point_note')->insert($da);

            $map['score']=array('elt',$data['point']+$score);
            $res=Db::name('ForumUsergrade')->where($map)->order('score desc')->limit(1)->value('name');

            if(!empty($res)&&$res!=$data['gradename']){
                Db::name('ForumUser')->where('id',$uid)->setField('gradename',$res);
            }

            session('grades', $res);
            session('point', $data['point']+$score);
        }
    }
    return;
}


function getpoint($uid,$controller,$pointid){
    $map['uid']=$uid;
    $map['pointid']=$pointid;
    $map['controller']=$controller;
    $res=Db::name('Point_note')->where($map)->value('score');
    return $res;
}

function friendlyDate($sTime,$type = 'normal',$alt = 'false') {
    if (!$sTime)
        return '';
    //sTime=源时间，cTime=当前时间，dTime=时间差
    $cTime      =   time();
    $dTime      =   $cTime - $sTime;
    $dDay       =   intval(date("z",$cTime)) - intval(date("z",$sTime));
    //$dDay     =   intval($dTime/3600/24);
    $dYear      =   intval(date("Y",$cTime)) - intval(date("Y",$sTime));
    //normal：n秒前，n分钟前，n小时前，日期
    if($type=='normal'){
        if( $dTime < 60 ){
            if($dTime < 10){
                return '刚刚';    //by yangjs
            }else{
                return intval(floor($dTime / 10) * 10)."秒前";
            }
        }elseif( $dTime < 3600 ){
            return intval($dTime/60)."分钟前";
            //今天的数据.年份相同.日期相同.
        }elseif( $dYear==0 && $dDay == 0  ){
            //return intval($dTime/3600)."小时前";
            return '今天'.date('H:i',$sTime);
        }elseif($dYear==0){
            return date("m月d日 H:i",$sTime);
        }else{
            return date("Y-m-d",$sTime);
        }
    }elseif($type=='mohu'){
        if( $dTime < 60 ){
            return $dTime."秒前";
        }elseif( $dTime < 3600 ){
            return intval($dTime/60)."分钟前";
        }elseif( $dTime >= 3600 && $dDay == 0  ){
            return intval($dTime/3600)."小时前";
        }elseif( $dDay > 0 && $dDay<=7 ){
            return intval($dDay)."天前";
        }elseif( $dDay > 7 &&  $dDay <= 30 ){
            return intval($dDay/7) . '周前';
        }elseif( $dDay > 30 ){
            return intval($dDay/30) . '个月前';
        }
        //full: Y-m-d , H:i:s
    }elseif($type=='full'){
        return date("Y-m-d , H:i:s",$sTime);
    }elseif($type=='ymd'){
        return date("Y-m-d",$sTime);
    }else{
        if( $dTime < 60 ){
            return $dTime."秒前";
        }elseif( $dTime < 3600 ){
            return intval($dTime/60)."分钟前";
        }elseif( $dTime >= 3600 && $dDay == 0  ){
            return intval($dTime/3600)."小时前";
        }elseif($dYear==0){
            return date("Y-m-d H:i:s",$sTime);
        }else{
            return date("Y-m-d H:i:s",$sTime);
        }
    }
}

function getnavlink($link, $sid){
    if($sid==1){

        $arr=explode(',', $link);

        $url=$arr[0];

        array_shift($arr);
        if(empty($arr)){

            $link=routerurl($url);

        }else{
            $m=1;
            $queue=array();
            foreach ($arr as $k =>$v){

                if($m==1){
                    $n=$v;
                    $m=2;

                }else{
                    $b=$v;
                    $queue[$n]=$b;
                    $m=1;
                }
            }
            if(empty($queue)){
                $link=routerurl($url);
            }else{
                $link=routerurl($url,$queue);
            }
        }
    }

    return $link;
}

function routerurl($url,$arr=array()){
    if(empty($arr)){
        $str=url($url);
    }else{
        $str=$url.'?'.http_build_query($arr);
    }
    return $str;
}

function getgradenamebyid($id){
    $name=Db::name('forum_usergrade')->where('id',$id)->value('name');
    return $name;
}

function iconurl($icon,$type){

    if($icon!=0&&$icon!=''){

        if($type==2){

            return "<i class='iconfont icon-".$icon."'></i>";
        }else {

            return "<img src='".$icon."' />";
        }
    }else{

        return "空";

    }
}
function getcommentbyid($id){

    $children = Db::name('forum_comment')->where(['id' =>$id])->find();
    //此时查询都是前台会员
    $content=getusernamebyid($children['uid']).':'.htmlspecialchars_decode($children['content']);

    return $content;


}
function getuserinfobyid($uid){
    if($uid==0){
        return '所有人';
    }else{
        $children = Db::name('dusy_user')->where(['id' =>$uid])->find();
        //此时查询都是前台会员
        return $children;

    }


}
function getusernamebyid($uid){
    if($uid==0){
        return '所有人';
    }else{
        $children = Db::name('dusy_user')->where(['id' =>$uid])->find();
        if(empty($children)){
            $children = Db::name('system_user')->where(['id' =>$uid])->find();
            return $children['username'];
        }else{
            return $children['nickname'];
        }

    }

}
function getforumbyid($id){
    if($id==0){
        return '无此帖';
    }else{
        $children = Db::name('forum_forum')->where(['id' =>$id])->find();
        if(empty($children)){
            return '无此帖';
        }else{
            return $children['title'];
        }

    }

}

function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {
    if(function_exists("mb_substr"))
        $slice = mb_substr($str, $start, $length, $charset);
    elseif(function_exists('iconv_substr')) {
        $slice = iconv_substr($str,$start,$length,$charset);
        if(false === $slice) {
            $slice = '';
        }
    }else{
        $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        $slice = join("",array_slice($match[0], $start, $length));
    }
    //截取内容时去掉图片，仅保留文字


    return $suffix ? $slice.'...' : $slice;
}
function clearcontent($content){

    $content=htmlspecialchars_decode($content);


    $content=preg_replace("/&lt;/i","<",$content);


    $content=preg_replace("/&gt;/i",">",$content);

    $content=preg_replace("/&amp;/i","&",$content);


    $content=strip_tags($content);
    return $content;
}

