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

class MailService{
    public static function sendMail($to, $name, $subject = '', $body = '', $attachment = null){
        $config= array(
            'SMTP_HOST'   => sysconf('mail_smtp_host'),     //SMTP服务器
            'SMTP_PORT'   => sysconf('mail_smtp_port'),     //SMTP服务器端口......端口为465才需要使用ssl协议，如果是25 就不需要加 $mail->SMTPSecure = 'ssl';
            'SMTP_USER'   => sysconf('mail_smtp_username'), //SMTP服务器用户名
            'SMTP_PASS'   => sysconf('mail_smtp_userpass'), //SMTP服务器密码
            'FROM_EMAIL'  => sysconf('mail_smtp_fromemail'), //发件人EMAIL
            'FROM_NAME'   => sysconf('mail_smtp_fromname'),     //发件人名称
            'REPLY_EMAIL' => sysconf('mail_smtp_replymail'),     //回复EMAIL（留空则为发件人EMAIL）
            'REPLY_NAME'  => sysconf('mail_smtp_replyname'),     //回复名称（留空则为发件人名称）
        );
        $mail = new PHPMailer();     //PHPMailer对象
        $mail->CharSet = 'UTF-8';     //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
        $mail->IsSMTP();      // 设定使用SMTP服务
        $mail->SMTPDebug  = 0;                     // 关闭SMTP调试功能
        // 1 = errors and messages
        // 2 = messages only
        $mail->SMTPAuth   = true;                  // 启用 SMTP 验证功能
        if($config['SMTP_PORT'] != 25){
            $mail->SMTPSecure = 'ssl';     // 使用安全协议 ......端口为465才需要使用ssl协议，如果是25 就不需要加 $mail->SMTPSecure = 'ssl';

            $mail->Host       = $config['SMTP_HOST'];  // SMTP 服务器
            $mail->Port       = $config['SMTP_PORT'];  // SMTP服务器的端口号
            $mail->Username   = $config['SMTP_USER'];  // SMTP服务器用户名
            $mail->Password   = $config['SMTP_PASS'];  // SMTP服务器密码
            $mail->SetFrom($config['FROM_EMAIL'], $config['FROM_NAME']);
            $replyEmail       = $config['REPLY_EMAIL']?$config['REPLY_EMAIL']:$config['FROM_EMAIL'];
            $replyName        = $config['REPLY_NAME']?$config['REPLY_NAME']:$config['FROM_NAME'];
            $mail->AddReplyTo($replyEmail, $replyName);
            $mail->Subject    = $subject;
            $mail->MsgHTML($body);
            $mail->AddAddress($to, $name);
            if($attachment!==null){ // 添加附件
                $attachment = explode('|',$attachment);
                foreach ($attachment as $file){
                    $path = parse_url($file);
                    $path = $path['path'];
                    $local_file = App::getRootPath().$path;
                    is_file($local_file) && $mail->AddAttachment($local_file,$file);
                }
            }
            return $mail->Send()? true : false;
        }
    }
}