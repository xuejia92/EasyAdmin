<?php
namespace app\blog\controller;

use think\Cookie;
use think\Db;

class Article extends Base {
    public function blog(){
        $id = $this->request->get('id','');
        if($id=='' || !is_numeric($id)){
            $this->redirect('/blog');
        }
        $article=Db::name('BlogArticle')->where(['isfabu'=>1,'id'=>$id])->find();

        if(!$article){
            $this->redirect('/blog');
        }else{
            $article['categroyname']=Db::name('BlogCategory')->where(['id'=>$article['category']])->value('name');
        }
        $tagslist=Db::name('BlogArticleLabel')->where(['article_id'=>$id])->select();
        if($tagslist){
            $this->tagslist=$tagslist;
        }
        Db::name('BlogArticle')->where(['id'=>$id])->setInc('view_count');
        //上一篇
        $front=Db::name('BlogArticle')->where(" id<".$id)->where(['isfabu'=>1])->order('id desc')->limit('1')->find();
        $after=Db::name('BlogArticle')->where(" id>".$id)->where(['isfabu'=>1])->order('id asc')->limit('1')->find();

        //评论
        $comment=Db::name('BlogCommit')->where(['articleid'=>$id,'isshow'=>1,'parentid'=>0])->order('addtime desc')->select();
        foreach($comment as &$vp){
            $vp['user']=Db::name('dusy_user')->where(['id'=>$vp['uid']])->find();
            $vp['type']="";
            $secondcom=Db::name('BlogCommit')->where(['articleid'=>$id,'isshow'=>1,'parentid'=>$vp['id']])->select();
            if($secondcom){
                $vp['secondcom']=$secondcom;
                foreach($vp['secondcom'] as &$vm){
                    $vm['user']=Db::name('dusy_user')->where(['id'=>$vm['uid']])->find();
                    $vm['type']="";
                }
            }else{
                $vp['secondcom']='';
            }
        }
        $countcomment=Db::name('BlogCommit')->where(['isshow'=>1,'articleid'=>$id])->count();
        $article_front=$front;
        $article_after=$after;
        $zannum=Db::name('BlogArticleZan')->where(['articleid'=>$id])->count();
        $taglist=Db::name("BlogArticleLabel")->where(['article_id'=>$id])->select();
        return $this->fetch('',[
            'article'=>$article,
            'countcomment'=>$countcomment,
            'article_front'=>$article_front,
            'article_after'=>$article_after,
            'zannum'=>$zannum,
            'comment'=>$comment,
            'taglist'=>$taglist,
        ]);
    }

    public function addCommit(){
        $da=$this->request->post('');
        $data['articleid']=$da['articleid'];
        $data['content']=trim($da['content']);
        if($data['articleid'] && $data['content']){
            $data['uid']=session('account')['id'];
            $data['addtime']=time();
            $data['isshow']=1;
            $data['parentid']=$da['parentid'];
            if(Db::name('blog_commit')->insert($data)){
                exit(json_encode(['state'=>1,'msg'=>'提交成功']));
            }else{
                exit(json_encode(['state'=>0,'msg'=>'提交失败']));
            }
        }else{
            exit(json_encode(['state'=>0,'msg'=>'提交失败']));
        }
    }

    public function addZan(){
        $da=$this->request->post('');
        $data['articleid']=$da['articleid'];
        $data['clientip']=$this->request->ip();
        if($data['articleid']){
            if($zan=Db::name('blog_article_zan')->where($data)->find()){
                exit(json_encode(['state'=>0,'msg'=>'当前已经赞过啦！']));
            }else{
                $res=Db::name('blog_article_zan')->insert($data);
                if($res){

                    exit(json_encode(['state'=>1,'msg'=>'已赞！']));
                }else{
                    exit(json_encode(['state'=>0,'msg'=>'提交失败！']));
                }
            }
        }else{
            exit(json_encode(['state'=>0,'msg'=>'提交失败']));
        }
    }

}