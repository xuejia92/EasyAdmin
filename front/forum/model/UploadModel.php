<?php
namespace app\forum\model;
use think\Db;
use think\Model;

class UploadModel extends Model
{
	
	function initialize()
	{
		parent::initialize();
	}

	public function upfile($type,$filename = 'file',$is_water = false){
		$file = request()->file($filename);
		$filemode=Db::name('ForumFile');
		$md5=$file->hash('md5');
		$n=$filemode->where('md5',$md5)->find();
		if(empty($n)){
			$info = $file->validate(['size'=>5000000,'ext'=>'jpg,png,gif'])
                ->move(env('root_path') . DS . 'static/upload/forum');

			if($info){
				$path = DS . 'static/upload/forum' . DS .$info->getSaveName();
				$path=str_replace("\\","/",$path);
				$realpath=$path;
					
				$data['sha1']=$info->sha1();
				$data['md5']=$info->md5();
				$data['create_time']=time();//;
				$data['location']=1;
				$data['ext']=$info->getExtension();
				$data['size']=$info->getSize();
				$data['savepath']=$path;
				$data['savename']=$info->getFilename();
				$data['download']=0;
				$fileinfo=$info->getInfo();
				$data['name']=$fileinfo['name'];
				$data['mime']=$fileinfo['type'];
					
				if($id=$filemode->insertGetId($data)){
					return array('code'=>200,'msg'=>'上传成功','id'=>$id,
                        'path'=>$path,'headpath'=>$realpath,
                        'savename'=>$info->getSaveName(),
                        'filename'=>$info->getFilename(),
                        'info'=>$info->getInfo());
				}else{
					return array('code'=>0,'msg'=>'上传失败');
				}
			}else{
				return array('code'=>0,'msg'=>$file->error());
			}
			
		}else{
			$path = $n['savepath'];
			$realpath=WEB_URL.$path;
			return array('code'=>200,'msg'=>'上传成功','id'=>$n['id'],'path'=>$path,'headpath'=>$realpath,'savename'=>$n['savename'],'filename'=>$n['name'],'info'=>$n);
		}
	}

}