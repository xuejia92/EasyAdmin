/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : esadmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-01-31 16:01:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_message`
-- ----------------------------
DROP TABLE IF EXISTS `cms_message`;
CREATE TABLE `cms_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `content` varchar(300) NOT NULL,
  `create_time` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_message
-- ----------------------------
INSERT INTO `cms_message` VALUES ('1', 'jiage', '321321', '4112@wd', 'fsafdsafd', '');
INSERT INTO `cms_message` VALUES ('2', 'jiage', '190878932748', 'fsa@qq.com', '范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德萨发的范德德萨', '2018-06-17 16:48:38');

-- ----------------------------
-- Table structure for `cms_page_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_article`;
CREATE TABLE `cms_page_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(1) NOT NULL DEFAULT '0' COMMENT '节点ID',
  `nid_other` int(1) NOT NULL DEFAULT '0' COMMENT '附属节点ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `title_sub` varchar(255) DEFAULT NULL COMMENT '文章副标题',
  `description` text COMMENT '文章概述',
  `thumb` varchar(255) DEFAULT NULL COMMENT '封面图',
  `url` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `content` text COMMENT '内容',
  `author_id` int(1) NOT NULL DEFAULT '0' COMMENT '发布者ID',
  `author` varchar(32) DEFAULT NULL COMMENT '文章作者',
  `source` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `count` int(1) NOT NULL DEFAULT '0' COMMENT '阅读数/点击数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态,1启用,2禁用',
  `tags` varchar(200) DEFAULT NULL,
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐,1推荐,0不推荐',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='文章库';

-- ----------------------------
-- Records of cms_page_article
-- ----------------------------
INSERT INTO `cms_page_article` VALUES ('2', '5', '0', '测试文章二', '', '', '', '', '&lt;p&gt;测试文章二&lt;/p&gt;', '2', '佚名', '本站', '0', '1', null, '0', '2018-01-01 23:11:38');
INSERT INTO `cms_page_article` VALUES ('4', '5', '0', '测试文章四', '', '', '', '', '&lt;p&gt;测试文章四&lt;/p&gt;', '2', '佚名', '本站', '0', '1', null, '0', '2018-01-01 23:11:59');
INSERT INTO `cms_page_article` VALUES ('6', '5', '0', '测试文章六', '', '', '', '', '&lt;p&gt;测试文章六&lt;/p&gt;', '2', '佚名', '本站', '0', '1', null, '0', '2018-01-01 23:12:27');
INSERT INTO `cms_page_article` VALUES ('8', '5', '0', '测试文章八', '', '', '', '', '&lt;p&gt;测试文章八&lt;/p&gt;', '2', '佚名', '本站', '0', '1', null, '0', '2018-01-01 23:12:47');
INSERT INTO `cms_page_article` VALUES ('9', '5', '0', '测试文章九', '', '', '/static/upload/0eaa697c2e2f5790/b2d5e83019a183d0.jpg', '', '<p>&lt;p&gt;测试文章九&lt;/p&gt;</p>\n', '2', '佚名', '本站', '0', '1', '', '0', '2018-01-01 23:12:56');
INSERT INTO `cms_page_article` VALUES ('10', '5', '0', '测试文章十', '', '', '', '', '&lt;p&gt;测试文章十&lt;/p&gt;', '2', '佚名', '本站', '1', '1', null, '1', '2018-01-01 23:13:05');
INSERT INTO `cms_page_article` VALUES ('11', '5', '0', '测试文章十一', '', '', 'http://192.168.31.47/static/upload/0ad03efc85f3ab5b/dd6fd6e167fe7322.jpg', '', '<p>&lt;p&gt;测试文章十一&lt;/p&gt;</p>\n', '2', '佚名', '本站', '0', '1', null, '1', '2018-01-01 23:13:14');
INSERT INTO `cms_page_article` VALUES ('12', '5', '0', '测试文章十二', '', '', 'http://192.168.31.47/static/upload/0aa8cc37fb3c53f4/e750d42982980cf0.jpg', '', '<p>&lt;p&gt;测试文章十二&lt;/p&gt;</p>\n', '2', '佚名', '本站', '0', '1', 'vr虚拟技术,企业管理,科技', '1', '2018-01-01 23:13:21');
INSERT INTO `cms_page_article` VALUES ('13', '5', '0', '国产手机质量那么好，为什么那么多人都追着iPhone呢？', '', '前两点还是有很大的提升空间的，毕竟人类大脑的开发利用程度科学家表明目前才仅仅百分之四。还有极大空间继续增幅壮大，而且我坚信，在人类的大脑利用率到达一定的比例之后，人类的脑容量会再进化，至于止境在哪里谁也不知道。', 'http://192.168.31.47/static/upload/0d681d132efbc3d2/bf5543985416ac27.jpg', '', '<h1 style=\"margin:15px 0px; padding:0px; -webkit-text-stroke-width:0px; text-align:center\"><span style=\"font-size:14px\"><span style=\"font-weight:400\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#000000\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"6\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">Tpt-Company 企业管理系统</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h1>\n\n<p style=\"margin:15px 0px; padding:0px; -webkit-text-stroke-width:0px; text-align:center\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">多年的行业经验，让我们在各类PC端视觉界面方面拥有独到的眼光，为互联网时代的企业用户量身打造各种高端网站</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\">&nbsp;</p>\n\n<p style=\"margin:15px 0px; padding:0px; -webkit-text-stroke-width:0px; text-align:center\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">7乘以8小时技术客服在线，任何问题都可以联系我们技术人员，我们会在第一时间解决你的问题，运行环境： IIS/Apache + PHP4/PHP5 + MySQL4/5</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p align=\"center\" style=\"margin:15px 0px; padding:0px; -webkit-text-stroke-width:0px; text-align:center\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><img alt=\"Tpt-Company 企业管理系统\" src=\"https://tpt360.com/qiye/company.png\" style=\"display:inline-block; vertical-align:middle; border:none; margin:0px; padding:0px; box-sizing:border-box; line-height:1.8; cursor:pointer; max-width:100%\" /></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h1 style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"font-weight:400\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#000000\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"5\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">安装说明：</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h1>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">首先把安装包解压到根目录，然后在域名后面添加/install直接安装。如：http://www.xxx.com/install&nbsp;</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">按照提示填写你的数据库信息就可以安装成功</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">如果无法安装数据库请直接手动导入数据库：&nbsp;</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">1.把install/shujuku.sql文件导入到你的数据库里面</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">2.把install/databa<x style=\"margin:0px; padding:0px; box-sizing:border-box; line-height:1.8\">se.php文件放入application里面，填好你的数据库信息就行</x></font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">3.安装完成后，可以把install文件删除</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">后台地址/admin.php（可重命名）后台账号：admin，密码：123456，口令：123456</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h1 style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"font-weight:400\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#000000\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"5\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">运行环境：&nbsp;</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h1>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">环境配置：IIS/Apache + PHP5.6以上 + MySQL5.5以上（推荐使用宝塔面板一键安装）</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">PHP函数：file_put_contents()，str_replace()，curl_init()，htmlspecialchars_decode()，strip_tags()，相关扩展必须开启</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">伪静态：Apache需要加载mod_rewrite.so模块，IIS需要安装ISAPI_Rewrite</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">如遇到问题可以联系我们作者QQ：1524790154，我们会在第一时间为你解决</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h1 style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"font-weight:400\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#000000\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"5\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">温馨提醒：</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h1>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">尽管本程序在发布前已经经过严格测试，但我们依然强烈建议各位用户时常备份</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">由于本程序是虚拟产品，无法保证完全没有漏洞和缺陷</font></font><font size=\"2\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">（包括主题模板、定制开发等）</font></font><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">，一经授权，恕不退款</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"3\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">您出于自愿而使用本产品，就必须了解使用本产品的风险，请认真阅读本说明，使用本产品即认同本说明</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h1 style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"font-weight:400\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#000000\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"5\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">Windows IIS系统的服务器或空间在web.config文件添加：</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h1>\n\n<pre style=\"border:0px solid #f8f8f8; margin:10px 0px; padding:20px; border-radius:0px; text-align:left; -webkit-text-stroke-width:0px; max-width:100%\">\n<span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"white-space:pre-wrap\"><span style=\"word-wrap:break-word\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"background-color:#f8f8f8\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"overflow-x:auto\"><code class=\"html hljs xmxl\" codemark=\"1\" style=\"margin:0px; padding:0px 0px 10px; box-sizing:border-box; line-height:1.8; display:block; overflow-x:auto; color:#555555; background:#f8f8f8; text-size-adjust:none\"><span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">rewrite</span></span></span>&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">rules</span></span></span>&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">rule</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">name</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;OrgPage&quot;</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">stopProcessing</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;true&quot;</span></span></span>&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">match</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">url</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;^(.*)$&quot;</span></span></span> /&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">conditions</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">logicalGrouping</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;MatchAll&quot;</span></span></span>&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">add</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">input</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;{HTTP_HOST}&quot;</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">pattern</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;^(.*)$&quot;</span></span></span> /&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">add</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">input</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;{REQUEST_FILENAME}&quot;</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">matchType</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;IsFile&quot;</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">negate</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;true&quot;</span></span></span> /&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">add</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">input</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;{REQUEST_FILENAME}&quot;</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">matchType</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;IsDirectory&quot;</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">negate</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;true&quot;</span></span></span> /&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;/<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">conditions</span></span></span>&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">action</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">type</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;Rewrite&quot;</span></span></span> <span class=\"hljs-attr\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\">url</span></span>=<span class=\"hljs-string\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">&quot;index.php/{R:1}&quot;</span></span></span> /&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;/<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">rule</span></span></span>&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;/<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">rules</span></span></span>&gt;</span></span></span></span>\n<span class=\"hljs-tag\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\"><span style=\"font-weight:400\">&lt;/<span class=\"hljs-name\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">rewrite</span></span></span>&gt;</span></span></span></span></code></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></pre>\n\n<h1 style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"font-weight:400\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#000000\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"5\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">Apache系统的服务器或空间在.htaccess文件添加：</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h1>\n\n<pre style=\"border:0px solid #f8f8f8; margin:10px 0px; padding:20px; border-radius:0px; text-align:left; -webkit-text-stroke-width:0px; max-width:100%\">\n<span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"white-space:pre-wrap\"><span style=\"word-wrap:break-word\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"background-color:#f8f8f8\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"overflow-x:auto\"><code class=\"javascript hljs\" codemark=\"1\" style=\"margin:0px; padding:0px 0px 10px; box-sizing:border-box; line-height:1.8; display:block; overflow-x:auto; color:#555555; background:#f8f8f8; text-size-adjust:none\">&lt;IfModule mod_rewrite.c&gt;\nOptions +FollowSymli<x style=\"margin:0px; padding:0px; box-sizing:border-box; line-height:1\">nks -Multiviews\nRewriteEngine on\n\nRewriteCond %{REQUEST_FILENAME} !-d\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteRule ^(.*)$ index.php?<span class=\"hljs-regexp\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#333333\">/$1 [QSAPTL]\n&lt;/</span></span></span>IfModule&gt;</x></code></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></pre>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\">不行就去掉?号：RewriteRule ^(.*)$ index.php/$1 [QSAPTL]</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\">还不行就替换成：RewriteRule ^(.*)$ index.php [LE=PATH_INFO:$1]</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<h1 style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"font-weight:400\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#000000\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"5\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">Nginx系统的服务器或空间在nginx.conf文件添加：&nbsp;</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h1>\n\n<p style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#333333\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\">Nginx低版本中，是不支持PATHINFO的，但是可以通过在Nginx.conf中配置转发规则实现：</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\n\n<pre style=\"border:0px solid #f8f8f8; margin:10px 0px; padding:20px; border-radius:0px; text-align:left; -webkit-text-stroke-width:0px; max-width:100%\">\n<span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"white-space:pre-wrap\"><span style=\"word-wrap:break-word\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"background-color:#f8f8f8\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"overflow-x:auto\"><code class=\"javascript hljs\" codemark=\"1\" style=\"margin:0px; padding:0px 0px 10px; box-sizing:border-box; line-height:1.8; display:block; overflow-x:auto; color:#555555; background:#f8f8f8; text-size-adjust:none\">location / { <span class=\"hljs-comment\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#999999\"><span style=\"font-style:italic\">// &hellip;..省略部分代码</span></span></span></span>\n   <span class=\"hljs-keyword\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#333333\"><span style=\"font-weight:100\">if</span></span></span></span> (!-e $request_filename) {\n   rewrite  ^(.*)$  /index.php?s=<span class=\"hljs-regexp\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#333333\">/$1  last;\n   break;\n    }\n }</span></span></span></code></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></pre>\n\n<h1 style=\"margin:15px 0px; padding:0px; text-align:left; -webkit-text-stroke-width:0px\"><span style=\"font-size:14px\"><span style=\"font-weight:400\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1.8\"><span style=\"color:#000000\"><span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"white-space:normal\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"background-color:#ffffff\"><font size=\"5\"><font style=\"margin: 0px; padding: 0px; box-sizing: border-box; line-height: 1.8;\">IIS6 WIN2003在.htaccess文件添加：</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></h1>\n\n<pre style=\"border:0px solid #f8f8f8; margin:10px 0px; padding:20px; border-radius:0px; text-align:left; -webkit-text-stroke-width:0px; max-width:100%\">\n<span style=\"font-size:14px\"><span style=\"-webkit-tap-highlight-color:rgba(0, 0, 0, 0)\"><span style=\"white-space:pre-wrap\"><span style=\"word-wrap:break-word\"><span style=\"box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"background-color:#f8f8f8\"><span style=\"color:#000000\"><span style=\"font-style:normal\"><span style=\"font-variant-ligatures:normal\"><span style=\"font-variant-caps:normal\"><span style=\"font-weight:normal\"><span style=\"letter-spacing:normal\"><span style=\"orphans:2\"><span style=\"text-transform:none\"><span style=\"widows:2\"><span style=\"word-spacing:0px\"><span style=\"overflow-x:auto\"><code class=\"javascript hljs\" codemark=\"1\" style=\"margin:0px; padding:0px 0px 10px; box-sizing:border-box; line-height:1.8; display:block; overflow-x:auto; color:#555555; background:#f8f8f8; text-size-adjust:none\">&lt;IfModule mod_rewrite.c&gt;\nOptions +FollowSymli<x style=\"margin:0px; padding:0px; box-sizing:border-box; line-height:1\">nks\nRewriteEngine On\n\nRewriteCond %{REQUEST_FILENAME} !-d\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteRule ^(.*)$ index.php?s=$<span class=\"hljs-number\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#555555\">1</span></span></span> [QSAPTL]\n&lt;<span class=\"hljs-regexp\" style=\"margin:0px; padding:0px; box-sizing:border-box\"><span style=\"line-height:1\"><span style=\"color:#333333\">/IfModule&gt;</span></span></span></x></code></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></pre>\n', '2', '佚名', '本站', '5', '1', '科技,手机,平面设计', '1', '2018-01-01 23:13:29');

-- ----------------------------
-- Table structure for `cms_page_custom`
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_custom`;
CREATE TABLE `cms_page_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` varchar(32) DEFAULT NULL COMMENT '图册唯一匹配id',
  `title` varchar(255) DEFAULT NULL COMMENT '图片标题',
  `image_src` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `description` text COMMENT '图片描述',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序',
  `nid` int(10) NOT NULL,
  `create_tiem` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图册库';

-- ----------------------------
-- Records of cms_page_custom
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_page_product`
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_product`;
CREATE TABLE `cms_page_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(1) NOT NULL DEFAULT '0' COMMENT '节点ID',
  `nid_other` int(1) NOT NULL DEFAULT '0' COMMENT '附属节点ID',
  `gid` varchar(32) DEFAULT NULL COMMENT '图册唯一匹配id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '封面图',
  `dimension` varchar(100) DEFAULT NULL COMMENT '产品规格',
  `code` varchar(32) DEFAULT NULL COMMENT '产品编码|条码',
  `price` varchar(20) NOT NULL DEFAULT '0' COMMENT '价格',
  `unit` varchar(32) DEFAULT NULL COMMENT '产品单位',
  `url` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `description` text COMMENT '描述',
  `tags` varchar(300) DEFAULT NULL,
  `content` text COMMENT '内容',
  `author_id` int(1) NOT NULL DEFAULT '0' COMMENT '发布者ID',
  `count` int(1) NOT NULL DEFAULT '0' COMMENT '阅读数/点击数',
  `is_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态,1启用,2禁用',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐,1推荐,0不推荐',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='产品库';

-- ----------------------------
-- Records of cms_page_product
-- ----------------------------
INSERT INTO `cms_page_product` VALUES ('1', '14', '0', '1514819746', '测试产品一', 'http://192.168.31.47/static/upload/0a38e202a76dd593/8d33526feaa72ef0.jpg', '', '', '', '', '', '', null, '<p>&lt;p&gt;&lt;img src=&quot;/public/uploads/image/20180509/1525837089125157.gif&quot; title=&quot;1525837089125157.gif&quot; alt=&quot;0.gif&quot;/&gt;&lt;/p&gt;</p>\n', '2', '4', '1', '1', '2018-01-01 23:17:06');
INSERT INTO `cms_page_product` VALUES ('3', '14', '0', '1514819849', '测试产品三', 'http://192.168.31.47/static/upload/0abaad33095bf3f1/29035ffba13b9a9b.jpg', '', '', '122', '美元', '', '', null, '<p>&lt;p&gt;测试产品三&lt;/p&gt;</p>\n', '2', '4', '1', '1', '2018-01-01 23:17:53');
INSERT INTO `cms_page_product` VALUES ('8', '15', '0', null, '肯德基', 'http://192.168.31.47/static/upload/0ce22b7fbfb2c6de/5201d482f6d63eec.jpg', '大套餐', '321321321', '78', '元', '', '好吃的坑的几啊', '平面设计,天天酷跑,肯德基,宅急送', '<p>坑打击 以来一桶 好吃不要钱</p>\n', '0', '12', '1', '1', '2018-06-13 20:22:06');

-- ----------------------------
-- Table structure for `cms_page_single`
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_single`;
CREATE TABLE `cms_page_single` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(1) NOT NULL DEFAULT '0' COMMENT '节点ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `title_sub` varchar(255) DEFAULT NULL COMMENT '副标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '描述',
  `content` text COMMENT '内容',
  `create_time` varchar(30) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='单页库';

-- ----------------------------
-- Records of cms_page_single
-- ----------------------------
INSERT INTO `cms_page_single` VALUES ('1', '2', '关于', '', 'http://192.168.31.47/static/upload/0a38e202a76dd593/8d33526feaa72ef0.jpg', '', '<p>在本小节里，我们将学习如何用 XML 创建一个带有文本输入框和按钮的界面。下一节课将学会使 APP 对按钮做出响应&mdash;&mdash;按钮被按下时，文本框里的内容被发送到另外一个 Activity。</p>\n\n<p>Android 的图形用户界面由多个视图（<a href=\"http://developer.android.com/reference/android/view/View.html\">View</a>）和视图组（<a href=\"http://developer.android.com/reference/android/view/ViewGroup.html\">ViewGroup</a>）构建而成。<a href=\"http://developer.android.com/reference/android/view/View.html\">View</a>&nbsp;是通用的 UI 窗体小组件，如：按钮（<a href=\"http://developer.android.com/guide/topics/ui/controls/button.html\">Button</a>）、文本框（<a href=\"http://developer.android.com/guide/topics/ui/controls/text.html\">Text field</a>）；而&nbsp;<a href=\"http://developer.android.com/reference/android/view/ViewGroup.html\">ViewGroup</a>&nbsp;则是用来定义子视图布局的不可见的容器，如：网格部件（grid）、垂直列表部件（vertical list）。</p>\n\n<p>Android 提供了一系列对应于&nbsp;<a href=\"http://developer.android.com/reference/android/view/View.html\">View</a>&nbsp;和&nbsp;<a href=\"http://developer.android.com/reference/android/view/ViewGroup.html\">ViewGroup</a>&nbsp;子类的 XML 标签，以便我们用 XML 创建自己的 UI。</p>\n\n<p>Layouts 是&nbsp;<a href=\"http://developer.android.com/reference/android/view/ViewGroup.html\">ViewGroup</a>&nbsp;的子类。我们将在接下来的教程中练习如何使用&nbsp;<a href=\"http://developer.android.com/reference/android/widget/LinearLayout.html\">LinearLayout</a>。</p>\n\n<p><img alt=\"图 1: ViewGroup\" src=\"http://hukai.me/android-training-course-in-chinese/basics/firstapp/viewgroup.png\" /></p>\n\n<p><strong>图 1</strong>&nbsp;关于&nbsp;<a href=\"http://developer.android.com/reference/android/view/ViewGroup.html\">ViewGroup</a>&nbsp;对象如何组织布局分支和包含其他&nbsp;<a href=\"http://developer.android.com/reference/android/view/View.html\">View</a>&nbsp;对象。</p>\n', null, '', '');
INSERT INTO `cms_page_single` VALUES ('2', '10', '关于我们', '关于我们', 'http://192.168.31.47/static/upload/0ad03efc85f3ab5b/dd6fd6e167fe7322.jpg', '我们是一家专注用户体验设计开发与互联网品牌建设的设计公司，创立至今为200多位客户提供了创新与专业的设计方案。\n\n设计服务范围包括：交互原型设计、产品视觉设计、网站设计与开发建设、移动及软件产品界面设计、图标设计、品牌及平面设计等。\n\n我们的价值与宗旨是为用户和客户打造的设计，用设计提升产品和企业价值。', '<p>我们是一家专注用户体验设计开发与互联网品牌建设的设计公司，创立至今为200多位客户提供了创新与专业的设计方案。</p>\n\n<p>设计服务范围包括：交互原型设计、产品视觉设计、网站设计与开发建设、移动及软件产品界面设计、图标设计、品牌及平面设计等。</p>\n\n<p>我们的价值与宗旨是为用户和客户打造的设计，用设计提升产品和企业价值。</p>\n\n<p>我们以网站建设与运营、中小企业网站推广、为主要经营项目的设计公司。&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>我们的优势客服由有运营经验和技术背景的人员担当，只有对你需求迅速的反馈和多年经验的建议 网站报价是对你需求真实的回应，不虚高，我也不能亏 6年来的客户维护售后服务，在网络上，没有任何的表扬或批评字眼，没有，才真实！</p>\n', null, '夜神', '');
INSERT INTO `cms_page_single` VALUES ('3', '11', '资质证书', null, null, null, '资质证书', null, null, null);
INSERT INTO `cms_page_single` VALUES ('4', '12', '企业文化', null, null, null, '企业文化', null, null, null);
INSERT INTO `cms_page_single` VALUES ('5', '13', '人才招聘', null, null, null, '人才招聘', null, null, null);
INSERT INTO `cms_page_single` VALUES ('7', '18', '资料下载', null, null, null, '资料下载', null, null, null);

-- ----------------------------
-- Table structure for `cms_site_channel`
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_channel`;
CREATE TABLE `cms_site_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(1) NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `title_en` varchar(30) DEFAULT NULL COMMENT '英文名称',
  `subtitle` varchar(100) DEFAULT NULL COMMENT '别名',
  `flag` varchar(100) DEFAULT NULL COMMENT '唯一标识',
  `path_url` varchar(100) DEFAULT NULL COMMENT '路径',
  `tid` int(1) NOT NULL DEFAULT '1' COMMENT '模型类别',
  `thumb` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `keywords` text COMMENT 'seo关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '外链',
  `order_id` int(1) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_url` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否外链',
  `is_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `params` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='导航库';

-- ----------------------------
-- Records of cms_site_channel
-- ----------------------------
INSERT INTO `cms_site_channel` VALUES ('2', '0', '关于', 'about', '', 'about', '#', '2', '', '', '', '#', '800', '1', '0', '1', '0', 'fa fa-pause-circle-o', '1', '');
INSERT INTO `cms_site_channel` VALUES ('3', '0', '新闻资讯', 'news', '', 'news', '#', '1', '', '', '', '', '400', '1', '0', '1', '0', 'fa fa-mixcloud', '1', '');
INSERT INTO `cms_site_channel` VALUES ('4', '0', '产品', 'product', '', 'product', '#', '3', '', '', '', '', '700', '1', '0', '1', '0', 'fa fa-usb', '1', '');
INSERT INTO `cms_site_channel` VALUES ('5', '3', '公告', 'notice', '', 'notice', '/news/notice', '1', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('6', '3', '资讯', 'information', '', 'information', '/news/information', '1', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('7', '0', '客户服务', '', '', 'custom', '#', '1', '', '', '', '', '600', '1', '0', '1', '0', 'fa fa-bars', '1', '');
INSERT INTO `cms_site_channel` VALUES ('8', '0', '经典案例', '', '', 'anli', '#', '1', '', '', '', '', '500', '1', '0', '1', '0', 'fa fa-arrows-h', '1', '');
INSERT INTO `cms_site_channel` VALUES ('9', '0', '联系', '', '', 'contract', '#', '1', '', '', '', '', '300', '1', '0', '1', '0', 'fa fa-barcode', '1', '');
INSERT INTO `cms_site_channel` VALUES ('10', '2', '关于我们', '', '', 'me', '/about/me', '2', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('11', '2', '资质证书', '', '', 'zhenshu', '/about/zhenshu', '2', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('12', '2', '企业文化', '', '', 'wenhua', '/about/wenhua', '2', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('13', '2', '人才招聘', '', '', 'zhaoping', '/about/zhaoping', '2', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('14', '4', '车载主机', '', '', 'zhuji', '/product/zhuji', '3', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('15', '4', '车载云台', '', '', 'yuntai', '/product/yuntai', '3', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('16', '7', '服务流程', '', '', 'liucheng', '/custom/liucheng', '1', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('17', '7', '常见问题', '', '', 'wenti', '/custom/wenti', '1', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);
INSERT INTO `cms_site_channel` VALUES ('18', '7', '资料下载', '', '', 'download', '/custom/download', '2', '', '', '', '', '0', '1', '0', '1', '0', null, '1', null);

-- ----------------------------
-- Table structure for `cms_site_config`
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_config`;
CREATE TABLE `cms_site_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `title` varchar(255) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(25) DEFAULT NULL COMMENT 'SEO关键词',
  `description` text COMMENT 'SEO描述',
  `copyright` varchar(255) DEFAULT NULL COMMENT '站点版权',
  `icp` varchar(32) DEFAULT NULL COMMENT 'ICP备案号',
  `statistics` varchar(255) DEFAULT NULL COMMENT '统计代码',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系手机',
  `tel` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(32) DEFAULT NULL COMMENT '传真号码',
  `email` varchar(32) DEFAULT NULL COMMENT '电子邮箱',
  `qq` varchar(32) NOT NULL DEFAULT '0' COMMENT '客服QQ',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `other` varchar(255) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点信息配置';

-- ----------------------------
-- Records of cms_site_config
-- ----------------------------
INSERT INTO `cms_site_config` VALUES ('1', 'SiteCMS测试站111', 'SiteCMS测试站', 'cms,sitecms', '一款极简的企业cms', 'Copyright 2018 sitecms.cn All rights reserved', '闽ICP备17008220号', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `cms_site_nav`
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_nav`;
CREATE TABLE `cms_site_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(1) NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `title_en` varchar(30) DEFAULT NULL COMMENT '英文名称',
  `flag` varchar(100) DEFAULT NULL COMMENT '唯一标识',
  `path_url` varchar(100) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) DEFAULT NULL COMMENT '外链',
  `sort` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `params` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='导航库';

-- ----------------------------
-- Records of cms_site_nav
-- ----------------------------
INSERT INTO `cms_site_nav` VALUES ('1', '0', '网站首页', 'home', 'index', '/home/cms', '#', '0', 'fa fa-bank', '1', '');
INSERT INTO `cms_site_nav` VALUES ('2', '0', '关于我们', 'about', 'about', '#', '#', '0', 'fa fa-pause-circle-o', '1', '');
INSERT INTO `cms_site_nav` VALUES ('3', '0', '新闻资讯', 'news', 'news', '#', '', '0', 'fa fa-mixcloud', '1', '');
INSERT INTO `cms_site_nav` VALUES ('4', '0', '产品中心', 'product', 'product', '#', '', '0', 'fa fa-usb', '1', '');
INSERT INTO `cms_site_nav` VALUES ('5', '3', '公告', 'notice', 'notice', '/home/cms/news?id=5', '', '0', '', '1', '');
INSERT INTO `cms_site_nav` VALUES ('6', '3', '资讯', 'information', 'information', '/home/cms/news?id=6', '', '0', '', '1', '');
INSERT INTO `cms_site_nav` VALUES ('8', '0', '联系我们', '', 'anli', '/home/cms/single?id=10', '', '0', 'fa fa-arrows-h', '1', '');
INSERT INTO `cms_site_nav` VALUES ('9', '0', '客户留言', '', 'contract', '/home/cms/message', '', '0', 'fa fa-barcode', '1', '');
INSERT INTO `cms_site_nav` VALUES ('10', '2', '企业简介', '', 'me', '/home/cms/single?id=10', '', '0', '', '1', '');
INSERT INTO `cms_site_nav` VALUES ('11', '2', '资质证书', '', 'zhenshu', '/home/cms/single?id=11', '', '0', '', '1', '');
INSERT INTO `cms_site_nav` VALUES ('12', '2', '企业文化', '', 'wenhua', '/home/cms/single?id=12', '', '0', '', '1', '');
INSERT INTO `cms_site_nav` VALUES ('13', '2', '人才招聘', '', 'zhaoping', '/home/cms/single?id=13', '', '0', '', '1', '');
INSERT INTO `cms_site_nav` VALUES ('14', '4', '车载主机', '', 'zhuji', '/home/cms/product?id=14', '', '0', '', '1', '');
INSERT INTO `cms_site_nav` VALUES ('15', '4', '车载云台', '', 'yuntai', '/home/cms/product?id=15', '', '0', '', '1', '');

-- ----------------------------
-- Table structure for `cms_site_slide`
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_slide`;
CREATE TABLE `cms_site_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '封面图',
  `url` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态,1启用,0禁用',
  `order_id` int(1) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片库';

-- ----------------------------
-- Records of cms_site_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_site_slider`
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_slider`;
CREATE TABLE `cms_site_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 焦点图 1 友情链接图 2 友情链接',
  `thumb` varchar(255) DEFAULT NULL COMMENT '封面图',
  `url` varchar(255) DEFAULT NULL COMMENT '原文链接',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态,1启用,0禁用',
  `sort` int(1) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='幻灯片库';

-- ----------------------------
-- Records of cms_site_slider
-- ----------------------------
INSERT INTO `cms_site_slider` VALUES ('1', '企业版幻灯', '0', '/static/upload/bb7b26435015b58b/992547a991d7197b.ico', '#', '首页焦点图片', '1', '10');
INSERT INTO `cms_site_slider` VALUES ('2', '百度', '2', '', 'http://www.baidu.com', '百度连接', '1', '0');
INSERT INTO `cms_site_slider` VALUES ('3', '云之讯', '1', 'http://192.168.31.47/static/upload/00cbe1ebdfe7e146/0e05e5edcec2e771.jpg', 'http://www.yunzhixun.com', '云之讯', '1', '20');
INSERT INTO `cms_site_slider` VALUES ('4', '企业幻灯片2', '0', 'http://192.168.31.47/static/upload/0a38e202a76dd593/8d33526feaa72ef0.jpg', '#', '', '1', '11');
INSERT INTO `cms_site_slider` VALUES ('5', '钉钉', '1', 'http://192.168.31.47/static/upload/0de6adc8ab30fcd8/ab449cc0bc1b1d00.jpg', '#', '', '1', '21');
INSERT INTO `cms_site_slider` VALUES ('6', '快站', '1', 'http://192.168.31.47/static/upload/01ea99a7a52732b7/603089a20706a2db.jpg', '#', '', '1', '22');

-- ----------------------------
-- Table structure for `cms_site_type`
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_type`;
CREATE TABLE `cms_site_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `flag` varchar(30) DEFAULT NULL COMMENT '标识',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='模型库';

-- ----------------------------
-- Records of cms_site_type
-- ----------------------------
INSERT INTO `cms_site_type` VALUES ('1', '文章\n', 'article', '1', '0');
INSERT INTO `cms_site_type` VALUES ('2', '单页\n', 'single', '1', '1');
INSERT INTO `cms_site_type` VALUES ('3', '产品\n', 'product', '1', '2');
INSERT INTO `cms_site_type` VALUES ('5', '定制页面', 'custom', '1', '3');

-- ----------------------------
-- Table structure for `cms_tags`
-- ----------------------------
DROP TABLE IF EXISTS `cms_tags`;
CREATE TABLE `cms_tags` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `sort` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_tags
-- ----------------------------
INSERT INTO `cms_tags` VALUES ('38', '科技', '0');
INSERT INTO `cms_tags` VALUES ('39', '平面设计', '0');
INSERT INTO `cms_tags` VALUES ('40', '天天酷跑', '0');
INSERT INTO `cms_tags` VALUES ('42', '肯德基', '0');
INSERT INTO `cms_tags` VALUES ('43', '宅急送', '0');
INSERT INTO `cms_tags` VALUES ('44', '人工智能', '0');
INSERT INTO `cms_tags` VALUES ('45', '手机', '0');
