<?php
namespace app\forum\controller;
use app\forum\model\UploadModel;
use think\Db;
use think\facade\Cache;

class Forum extends Base
{
    public function add()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $forum = Db::name('ForumForum');
            if (request()->isPost()) {
            	
            	if(session('userstatus')!=2&&session('userstatus')!=5&&$this->site_config['email_sh'] ==1){
            		return json(array('code' => 0, 'msg' => '您的邮箱还未激活'));
            	}
            	
                $data = input('post.');
              
                if($data['tid']==0){
                	return json(array('code' => 0, 'msg' => '版块为空'));
                }
                if($data['content']==''){
                	return json(array('code' => 0, 'msg' => '内容为空'));
                }
                $data['time'] = time();
                $data['open'] =$this->site_config['sh'];
                $data['view'] = 1;
                $data['uid'] = session('userid');
                $data['description'] = mb_substr(remove_xss($data['content']), 0, 200, 'utf-8');
                $data['content']= remove_xss($data['content']);
                
                
//                $member = Db::name('user');
               // $member->where('id', session('userid'))->setInc('point', $site_config['jifen_add']);
                
                if ($id=$forum->insertGetId($data)) {
                	
                	point_note($this->site_config['jifen_add'],session('userid'),'forumadd',$id);

                    return json(array('code' => 200, 'msg' => '添加成功'));
                } else {
                    return json(array('code' => 0, 'msg' => '添加失败'));
                }
            }

			$tags = $this->site_config['seo_keyword'];
            $tagss = explode(',', $tags);
		    $this->assign('tagss', $tagss);
		    $this->assign('title', '发布帖子');
		    
            return $this->fetch('forum/forum_add');
        }
    }
    public function edit()
    {
    	$site_config = Cache::get('site_config');
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
            $id = input('id');
            session('editid',$id);
            $uid = session('userid');
            $forum = Db::name('ForumForum');;
            $a = $forum->find($id);
            if (empty($id) || $a == null || $a['uid'] != $uid) {
                $this->error('亲！您迷路了');
            } else {
                if (request()->isPost()) {
                    $data = input('post.');
                    $data['id']=session('editid');
                    session('editid', null);
                    if($data['content']==''){
                    	return json(array('code' => 0, 'msg' => '内容为空'));
                    }
                    $data['description'] = mb_substr(remove_xss($data['content']), 0, 200, 'utf-8');
                  
                    $data['content']= remove_xss($data['content']);
                 
                    if ($forum->update($data)) {
                        return json(array('code' => 200, 'msg' => '修改成功'));
                    } else {
                        return json(array('code' => 0, 'msg' => '修改失败'));
                    }
                }
                
                $category = Db::name('forum_forumcate');
                $tptc = $forum->find($id);
                $tptcs = $category->where(array('show'=>1))->select();
                $this->assign(array('tptcs' => $tptcs, 'tptc' => $tptc));
		        $this->assign('title', '编辑帖子');
                return $this->fetch('forum/forum_edit');
            }
        }
    }
    public function thread()
    {
        $id = $this->request->get('id','');
        if (empty($id)) {
            return $this->error('亲！你迷路了');
        } else {
            $forum = Db::name('ForumForum');
            $a = $forum->where("id = {$id}")->find();
            if ($a) {
                Db::name('ForumForum')->where('id',$id)->setInc('view', 1);
                $t = Db::name('ForumForum')->alias('f')
                    ->where('f.id',$id)
                    ->join('forum_forumcate c', 'c.id=f.tid')
                    ->join('dusy_user m', 'm.id=f.uid')
                    ->join('forum_user fm', 'fm.uid=f.uid')
                    ->field('f.*,c.id as cid,c.name,m.id as userid,fm.gradename,fm.point,m.avator as userhead,m.nickname as username')
                    ->find();
                $this->assign('t', $t);
                $content = $t['content'];

                // $content = htmlspecialchars_decode($content);
                $this->assign('content', $content);
                $tptc = Db::name('ForumComment')->alias('c')
                    ->join('dusy_user m', 'm.id=c.uid')
                    ->where("fid = {$id}")
                    ->order('c.id asc')
                    ->join('forum_user fm', 'fm.uid=c.uid')
                    ->field('c.*,m.id as userid,fm.gradename,fm.point,m.avator userhead,m.nickname username')
                    ->paginate(15);

                $this->assign('tptc', $tptc);
                return $this->fetch('forum/index_thread');
            } else {
                return $this->error('亲！你迷路了');
            }
        }
    }
    public function doUploadPic()
    {
        if (!session('userid') || !session('username')) {
            $this->error('亲！请登录',url('index/login'));
        } else {
        	$uploadmodel =new UploadModel();
        	$info=$uploadmodel->upfile('images','FileName');
        	echo $info['headpath'];
		}
    }
}