<?php
namespace app\forum\controller;

use think\Db;


class User extends Base
{
	public function _initialize()
	{
		parent::_initialize();
	}
    public function topic()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $forum = Db::name('forum_forum');
            $uid = session('userid');
            $count=$forum->where("uid = {$uid}")->count();
            $tptc = $forum->where("uid = {$uid}")->order('id desc')->paginate(10);
            $this->assign('tptc', $tptc);
            $this->assign('uid', $uid);
            $this->assign('count', $count);
            return $this->fetch('forum/user_topic');
        }
    }
    public function message()
    {
    	if (!session('userid') || !session('username')) {
    		$this->error('亲！请登录',url('index/login'));
    	} else {
            $uid = session('userid');
           $arr= Db::name('forum_readmessage')->alias('rm')
               ->where(array('uid'=>$uid))->column('mid');
          if(!empty($arr)){
          	$tptc = Db::name('forum_message')->alias('me')
                ->join('dusy_user u', 'me.uid=u.id','LEFT')
                ->field('me.*,u.id as userid,u.nickname username')
          	->where('me.touid',['=',0],['=',$uid],'or')
          	->where('me.id','not in',$arr)
          	->order('me.time desc')->paginate(5);
          }else{

          	 $tptc =Db::name('forum_message')->alias('me')
                 ->join('dusy_user u', 'me.uid=u.id','LEFT')
                 ->field('me.*,u.id as userid,u.nickname username')
                 ->where('me.touid',$uid)
                 ->whereOr('me.touid',0)
                 ->order('me.time desc')->paginate(5);
          }

            $this->assign('tptc', $tptc);
            $this->assign('uid', $uid);

            return $this->fetch('forum/user_message');
    	}
    }
    
    public function delallmessage()
    {
    	
    	$uid = session('userid');
    	$tptc = Db::name('forum_message')->where(array('touid'=>0))->column('id');
    	$tptc1 =array();
    	$tptc1 = Db::name('forum_readmessage')->where(array('uid'=>$uid))->column('mid');
    	
    	
    	
    	if(Db::name('forum_message')->where(array('touid'=>$uid))->count()>0){
    		if (Db::name('forum_message')->where(array('touid'=>$uid))->delete()) {
    			if(!empty($tptc)){
    				foreach ($tptc as $k =>$v){
    					if(!in_array($v, $tptc1)){
    						$messdata['uid']=$uid;
    						$messdata['mid']=$v;
    						Db::name('forum_readmessage')->insert($messdata);
    					}
    				}
    			}
    		
    			//$this->success('删除成功');
    			return json(array('code' => 200, 'msg' => '删除成功'));
    		} else {
    			// $this->error('删除失败');
    			return json(array('code' => 0, 'msg' => '删除失败'));
    		}
    	}else{
    		

    		if(!empty($tptc)){
    			
    			if(count($tptc)!=count($tptc1)){
    			
    			foreach ($tptc as $k =>$v){
    				if(!in_array($v, $tptc1)){
    					$messdata['uid']=$uid;
    					$messdata['mid']=$v;
    					Db::name('forum_readmessage')->insert($messdata);
    				}
    		
    		
    			}
    			return json(array('code' => 200, 'msg' => '删除成功'));
    			}else{
    				return json(array('code' => 0, 'msg' => '您无任何消息可删除'));
    			}
    		}else{
    			return json(array('code' => 0, 'msg' => '您无任何消息可删除'));
    			
    		}
    	}
    	

    }
    
    public function delsysmessage()
    {
        $id = input('id');
        if (empty($id)) {
            return $this->error('亲！你迷路了');
        }

    	$uid = session('userid');
    	$messdata['uid']=$uid;
    	$messdata['mid']=$id;
    	
    	if (Db::name('forum_readmessage')->insert($messdata)) {
    		return json(array('code' => 200, 'msg' => '删除成功'));
    	} else {
    		return json(array('code' => 0, 'msg' => '删除失败'));
    	}

    }
    public function delmessage()
    {
        $id = input('id');
        if (empty($id)) {
            return $this->error('亲！你迷路了');
        }
    	if (Db::name('forum_message')->delete($id)) {
    		//$this->success('删除成功');
    		return json(array('code' => 200, 'msg' => '删除成功'));
    	} else {
    		// $this->error('删除失败');
    		return json(array('code' => 0, 'msg' => '删除失败'));
    	}
    }
	public function comment()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $comment = Db::name('forum_comment');
            $uid = session('userid');
            $tptc = $comment->alias('c')
                ->join('forum_forum f', 'f.id=c.fid')
                ->field('c.*,f.title')->where("c.uid = {$uid}")
                ->order('c.id desc')->paginate(5);

            $this->assign('tptc', $tptc);
            $this->assign('uid', $uid);
            return $this->fetch('forum/user_comment');
        }
    }
    public function home()
    {
        $id = input('id');
        if (empty($id)) {
            return $this->error('亲！你迷路了');
        } else {
            $member = Db::name('dusy_user');
            $m = $member->alias('m')
                ->where("m.id = {$id}")
                ->join('forum_user f', 'f.uid=m.id')
                ->find();
            if ($m) {
                $this->assign('m', $m);
				$forum = Db::name('forum_forum');
				$map['open']=1;
				$map['uid']=$id;
                $tptc = $forum->where($map)->order('id desc')->limit(10)->select();
              
                $this->assign('tptc', $tptc);
				$comment = Db::name('forum_comment');
                $tpte = $comment->alias('c')
                    ->join('forum_forum f', 'f.id=c.fid')
                    ->field('c.*,f.title')->where("c.uid = {$id}")
                    ->order('c.id desc')->limit(5)->select();
                $this->assign('tpte', $tpte);
                return $this->fetch('forum/user_home');
            } else {
                return $this->error('亲！你迷路了');
            }
        }
    }
    public function set()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
            //return json(array('code' => 0, 'msg' => '亲！请登录','url'=>url('login/index')));
        } else {
            $member = Db::name('DusyUser');
            $uid = session('userid');
            $tptc = $member->where(array('id'=>$uid))->find();
            
            if (request()->isPost()) {
                $data =  $this->request->post();
                $data['id']=$uid;
                unset($data['account']);
                if ($member->update($data)) {
                    return json(array('code' => 200, 'msg' => '修改成功'));
                } else {
                    return json(array('code' => 0, 'msg' => '修改失败'));
                }
            }
           
            $this->assign('tptc', $tptc);
            $this->assign('uid', $uid);
            return $this->fetch('forum/user_set');
        }
    }
    public function setedit()
    {
        if (!session('userid') || !session('username')) {
        	
            $this->error('亲！请登录',url('index/login'));
        } else {
            $member = Db::name('DusyUser');
            $uid = session('userid');
            $tptc = $member->find($uid);
           
            if (request()->isPost()) {
                $data =  $this->request->post();
                if($data['password']==$data['nowpass']){
                    return json(array('code' => 0, 'msg' =>'密码未修改'));
                }
                if($tptc['password']!=md5('EasyAdmin*'.$data['nowpass']))
                {
                    return json(array('code' => 0, 'msg' =>'原始密码错误'));
                }else{
                    $datam['password'] = md5('EasyAdmin*'.$data['password']);
                    $datam['id'] = $uid;
                    if (Db::name('DusyUser')->update($datam)!=false) {
                        return json(array('code' => 200, 'msg' => '修改成功'));
                    } else {
                        return json(array('code' => 0, 'msg' => '修改失败'));
                    }
                }
            
            }
          
            $this->assign('tptc', $tptc);
            return view();
        }
    }
	public function headedit()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $member = Db::name('DusyUser');
            $uid = session('userid');
            if (request()->isPost()) {
                   $data =  $this->request->post();
                  $data['id'] = $uid;
                  unset($data['file']);
                if ($member->update($data)) {
                	
                	session('userhead', $data['avator']);
                	
                    return json(array('code' => 200, 'msg' => '修改成功'));
                } else {
                    return json(array('code' => 0, 'msg' => '修改失败'));
                }
            }
            $tptc = $member->find($uid);
            $this->assign('tptc', $tptc);
            return view();
        }
    }
}