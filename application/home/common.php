<?php
/*
* 来判断导航链接内部外部从而生成新链接
*
 *
 * */

use think\Db;

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
        $str=url($url,$arr);
    }
    $str=str_replace('admin.php', 'index.php', $str);

    return $str;
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
                $map['score']=array('elt',$data['point']);
                $res=Db::name('ForumUsergrade')->where($map)->order('score desc')->limit(1)->value('name');

                if(!empty($res)&&$res!=$data['gradename']){
                    Db::name('ForumUser')->where('id',$uid)->setField('gradename',$res);
                }
                session('grades', $res);
                session('point', $data['point']);
            }else{
                //根据用户积分提升或降低用户等级
                Db::name('ForumUser')->where('uid',$uid)->setInc('point',$score);
                $data['uid']=$uid;
                $data['add_time']=time();
                $data['controller']=$controller;
                $data['score']=$score;
                $data['pointid']=$pointid;
                Db::name('forum_point_note')->insert($data);

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
            $data['uid']=$uid;
            $data['add_time']=time();
            $data['controller']=$controller;
            $data['score']=$score;
            $data['pointid']=$pointid;
            Db::name('forum_point_note')->insert($data);

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
