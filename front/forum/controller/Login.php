<?php
namespace app\forum\controller;
use think\facade\Cache;
use think\Db;

class Login extends Base
{
	protected $yzmarr;
	public function initialize()
	{
		parent::initialize();
		$this->yzmarr=explode(',', $this->site_config['site_yzm']);
		
		if(in_array(1, $this->yzmarr)){
			$regyzm=1;
		}else{
			$regyzm=0;
		}
		if(in_array(2, $this->yzmarr)){
			$loginyzm=1;
		}else{
			$loginyzm=0;
		}
		if(in_array(3, $this->yzmarr)){
			$forgetyzm=1;
		}else{
			$forgetyzm=0;
		}
		$this->assign('regyzm',$regyzm);
		$this->assign('loginyzm',$loginyzm);
		$this->assign('forgetyzm',$forgetyzm);
		
		
	}

    public function reg()
    {
    	$regswitch=$this->site_config;
    	if(!$regswitch['user_reg']){
    		$this->error('网站已关闭会员注册功能',url('index/index'));
    	}
        $member = Db::name('dusy_user');
        if (request()->isPost()) {
        	
        	if(!$regswitch['user_reg']){
        		
        		return json(array('code' => 0, 'msg' => '网站已关闭会员注册功能'));
        	}
        	

        	$da            = $this->request->post();
        	$password = input('password');
        	$passwords = input('confirm_password');

            if(in_array(1, $this->yzmarr)){
				if(!captcha_check(input('code'))){
					return json(array('code' => 0, 'msg' => '验证码错误'));
				}
				 
			}

            if($password != $passwords){
                return json(array('code' => 0, 'msg' => '两次密码输入不一致'));
            }
            unset($da['repassword']);
            if(strlen($da['account'])<4){
                $this->error('用户账号长度不少于4位');
                return json(array('code' => 0, 'msg' => '用户账号长度不少于4位'));
            }
            if(strlen($da['password'])<4){
                $this->error('密码长度不少于6位');
                return json(array('code' => 0, 'msg' => '注册失败'));
            }
            $da['password']=md5('EasyAdmin*'.$da['password']);
            if(Db::name('dusy_user')->where(['account'=>$da['account']])->find()){
                $this->error('用户账号已存在');
                return json(array('code' => 0, 'msg' => '注册失败'));
            }
            $da['register_time']=time();
            $da['register_ip']=$this->request->ip();

            	unset($da['code']);
            	unset($da['confirm_password']);

            	if ($id = $member->insertGetId($da)) {
            		
            		point_note($regswitch['jifen_reg'],$id,'reg');
            		
            		return json(array('code' => 200, 'msg' => '注册成功'));
            	} else {
            		
            		return json(array('code' => 0, 'msg' => '注册失败'));
            	}

        }
        return $this->fetch('forum/login_reg');
    }

    
    public function resetpass(){
    	
    	$data=$this->request->param();
            if(in_array(3, $this->yzmarr)){
				if(!captcha_check(input('code'))){
				
					return json(array('code' => 0, 'msg' => '验证码错误'));
				
					 
				}
				 
			}
   
    		
    		if($data['pass']!=$data['repass']){
    			return json(array('code' => 0, 'msg' => '两次密码输入不一致'));
    		}else{
    			$n=Db::name('user')->where('id',$data['id'])->find();
    			Db::name('user')->where('id',$data['id'])->setField('password',md5($data['pass'].$n['salt']));
    			return json(array('code' => 200, 'msg' => '密码修改成功，请重新登录'));
    			
    			
    		}
    		
    		
    	
    	
    }
    
    
    public function resetmima(){
    	$data=$this->request->param();
    	$n=Db::name('user')->where('id',$data['mod'])->find();
    	if(md5($n['salt'].$n['id'].$n['usermail'])==$data['id']){
    		
    		$this->assign('userid',$n['id']);
    		$this->assign('username',$n['username']);
    		return view();
    	}else{
    		$this->error('非法操作',url('login/forget'));
    	}
    	
    }
    
    
    public function forget()
    {
    	if (request()->isPost()) {
    		
    		
    		$datan=$this->request->param();
    		
    	if(in_array(3, $this->yzmarr)){
				if(!captcha_check(input('code'))){
					return json(array('code' => 0, 'msg' => '验证码错误'));
				}
				 
			}
    			$n=Db::name('user')->where('email',$datan['usermail'])->find();
    			
    			if(empty($n)||($n['status']!=2&&$n['status']!=5)){
    				return json(array('code' => 0, 'msg' => '邮箱未激活或邮箱未注册'));
    			}else{
    				
    				$data['email']=$n['usermail'];
    				
    				$data['title']='找回密码';
    				$str=md5($n['salt'].$n['id'].$n['usermail']);
    				
    				$data['body']='http://'.$_SERVER['HTTP_HOST'].url('login/resetmima').'?mod='.$n['id'].'&id='.$str;
    				
    				
    				asyn_sendmail($data);
    				return json(array('code'=>200,'msg'=>'邮件已发送，请到邮箱进行查收'));
    				 
    			}
    		
    	}else{
    		
    	
    	}
    	return view();
  
    }
    public function logout()
    {
    	session("userstatus", NULL);
        session("userid", NULL);
        session("username", NULL);
		session("usermail", NULL);
        session("kouling", NULL);
        return json(array('code' => 200, 'msg' => '退出成功'));
      //  return NULL;
    }
}