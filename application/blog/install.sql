/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : esadmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-04 20:58:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog_article`
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `ori_author` varchar(50) DEFAULT '佚名',
  `laiyuan` varchar(350) DEFAULT NULL COMMENT '来源地',
  `thumb` varchar(500) DEFAULT NULL,
  `pub_author` varchar(50) NOT NULL DEFAULT '1',
  `pub_time` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  `view_count` smallint(7) NOT NULL DEFAULT '0',
  `category` tinyint(3) DEFAULT NULL,
  `isfabu` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0:不发布 1：发布',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  `tags` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('77', '1', '佚名', '', '/static/plugs/uploader/theme/image.png', '1', '1546345867', '', '0', null, '1', '1', '');

-- ----------------------------
-- Table structure for `blog_article_label`
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_label`;
CREATE TABLE `blog_article_label` (
  `label_name` varchar(36) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`label_name`,`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article_label
-- ----------------------------
INSERT INTO `blog_article_label` VALUES ('android ui', '44');
INSERT INTO `blog_article_label` VALUES ('apache', '47');
INSERT INTO `blog_article_label` VALUES ('cdn', '0');
INSERT INTO `blog_article_label` VALUES ('cdn', '78');
INSERT INTO `blog_article_label` VALUES ('cocos creator', '45');
INSERT INTO `blog_article_label` VALUES ('git', '17');
INSERT INTO `blog_article_label` VALUES ('git', '38');
INSERT INTO `blog_article_label` VALUES ('git', '58');
INSERT INTO `blog_article_label` VALUES ('git升级', '17');
INSERT INTO `blog_article_label` VALUES ('git版本库', '38');
INSERT INTO `blog_article_label` VALUES ('git错误', '37');
INSERT INTO `blog_article_label` VALUES ('ionic', '20');
INSERT INTO `blog_article_label` VALUES ('jquery', '21');
INSERT INTO `blog_article_label` VALUES ('js数组值', '22');
INSERT INTO `blog_article_label` VALUES ('js时间', '23');
INSERT INTO `blog_article_label` VALUES ('junit', '19');
INSERT INTO `blog_article_label` VALUES ('laravel', '25');
INSERT INTO `blog_article_label` VALUES ('linux定时', '15');
INSERT INTO `blog_article_label` VALUES ('linux磁盘', '64');
INSERT INTO `blog_article_label` VALUES ('Linux网卡设置', '13');
INSERT INTO `blog_article_label` VALUES ('Linux网卡设置', '63');
INSERT INTO `blog_article_label` VALUES ('linux错误解决', '18');
INSERT INTO `blog_article_label` VALUES ('maven2', '19');
INSERT INTO `blog_article_label` VALUES ('mongodb', '26');
INSERT INTO `blog_article_label` VALUES ('mongodb', '27');
INSERT INTO `blog_article_label` VALUES ('mysql', '28');
INSERT INTO `blog_article_label` VALUES ('mysql', '29');
INSERT INTO `blog_article_label` VALUES ('mysql字段更新', '35');
INSERT INTO `blog_article_label` VALUES ('nginx', '40');
INSERT INTO `blog_article_label` VALUES ('phpmailer', '30');
INSERT INTO `blog_article_label` VALUES ('phpstrom插件', '61');
INSERT INTO `blog_article_label` VALUES ('phpstrom激活码', '54');
INSERT INTO `blog_article_label` VALUES ('php下载', '32');
INSERT INTO `blog_article_label` VALUES ('php框架', '48');
INSERT INTO `blog_article_label` VALUES ('php框架', '49');
INSERT INTO `blog_article_label` VALUES ('php框架', '50');
INSERT INTO `blog_article_label` VALUES ('php框架', '51');
INSERT INTO `blog_article_label` VALUES ('php框架', '52');
INSERT INTO `blog_article_label` VALUES ('php汉字', '33');
INSERT INTO `blog_article_label` VALUES ('php路由', '47');
INSERT INTO `blog_article_label` VALUES ('redis', '14');
INSERT INTO `blog_article_label` VALUES ('redis安装', '16');
INSERT INTO `blog_article_label` VALUES ('session', '25');
INSERT INTO `blog_article_label` VALUES ('sublime', '39');
INSERT INTO `blog_article_label` VALUES ('swoole', '56');
INSERT INTO `blog_article_label` VALUES ('swoole', '57');
INSERT INTO `blog_article_label` VALUES ('thinkphp', '2');
INSERT INTO `blog_article_label` VALUES ('timestamp', '53');
INSERT INTO `blog_article_label` VALUES ('virtualbox', '63');
INSERT INTO `blog_article_label` VALUES ('yaf', '61');
INSERT INTO `blog_article_label` VALUES ('主从数据库', '28');
INSERT INTO `blog_article_label` VALUES ('人性化', '31');
INSERT INTO `blog_article_label` VALUES ('优化', '0');
INSERT INTO `blog_article_label` VALUES ('优化', '78');
INSERT INTO `blog_article_label` VALUES ('删除值', '22');
INSERT INTO `blog_article_label` VALUES ('发送邮件', '30');
INSERT INTO `blog_article_label` VALUES ('哈哈', '1');
INSERT INTO `blog_article_label` VALUES ('图片处理', '24');
INSERT INTO `blog_article_label` VALUES ('图片旋转', '24');
INSERT INTO `blog_article_label` VALUES ('多表查询', '2');
INSERT INTO `blog_article_label` VALUES ('导出excel', '34');
INSERT INTO `blog_article_label` VALUES ('小程序', '41');
INSERT INTO `blog_article_label` VALUES ('幻灯', '21');
INSERT INTO `blog_article_label` VALUES ('微信', '55');
INSERT INTO `blog_article_label` VALUES ('微信客服消息', '57');
INSERT INTO `blog_article_label` VALUES ('批量', '55');
INSERT INTO `blog_article_label` VALUES ('拼音转化', '33');
INSERT INTO `blog_article_label` VALUES ('文件类型', '36');
INSERT INTO `blog_article_label` VALUES ('时间', '31');
INSERT INTO `blog_article_label` VALUES ('权限', '29');
INSERT INTO `blog_article_label` VALUES ('模板消息', '55');
INSERT INTO `blog_article_label` VALUES ('游戏资源', '45');
INSERT INTO `blog_article_label` VALUES ('缓存', '14');
INSERT INTO `blog_article_label` VALUES ('缓存', '16');
INSERT INTO `blog_article_label` VALUES ('缓存', '26');
INSERT INTO `blog_article_label` VALUES ('表格', '34');
INSERT INTO `blog_article_label` VALUES ('路由', '49');
INSERT INTO `blog_article_label` VALUES ('轮播', '21');
INSERT INTO `blog_article_label` VALUES ('造轮子', '44');
INSERT INTO `blog_article_label` VALUES ('邮件发送', '56');
INSERT INTO `blog_article_label` VALUES ('队列', '56');

-- ----------------------------
-- Table structure for `blog_article_zan`
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_zan`;
CREATE TABLE `blog_article_zan` (
  `articleid` int(10) NOT NULL,
  `clientip` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog_article_zan
-- ----------------------------
INSERT INTO `blog_article_zan` VALUES ('1', '117.82.43.16');
INSERT INTO `blog_article_zan` VALUES ('1', '117.82.43.160');
INSERT INTO `blog_article_zan` VALUES ('2', '101.226.225.59');
INSERT INTO `blog_article_zan` VALUES ('1', '121.228.30.20');
INSERT INTO `blog_article_zan` VALUES ('6', '121.228.30.20');
INSERT INTO `blog_article_zan` VALUES ('6', '61.135.152.131');
INSERT INTO `blog_article_zan` VALUES ('7', '121.228.30.20');
INSERT INTO `blog_article_zan` VALUES ('7', '116.23.137.222');
INSERT INTO `blog_article_zan` VALUES ('8', '121.228.30.20');
INSERT INTO `blog_article_zan` VALUES ('9', '114.220.206.168');
INSERT INTO `blog_article_zan` VALUES ('10', '114.220.206.168');
INSERT INTO `blog_article_zan` VALUES ('6', '114.220.206.168');
INSERT INTO `blog_article_zan` VALUES ('11', '114.220.206.168');
INSERT INTO `blog_article_zan` VALUES ('6', '49.73.123.8');
INSERT INTO `blog_article_zan` VALUES ('2', '49.73.123.8');
INSERT INTO `blog_article_zan` VALUES ('8', '49.73.123.8');
INSERT INTO `blog_article_zan` VALUES ('31', '117.62.105.50');
INSERT INTO `blog_article_zan` VALUES ('9', '117.62.105.50');
INSERT INTO `blog_article_zan` VALUES ('35', '117.62.105.50');
INSERT INTO `blog_article_zan` VALUES ('24', '117.62.105.50');
INSERT INTO `blog_article_zan` VALUES ('6', '101.226.225.59');
INSERT INTO `blog_article_zan` VALUES ('7', '101.226.225.59');
INSERT INTO `blog_article_zan` VALUES ('9', '49.75.151.42');
INSERT INTO `blog_article_zan` VALUES ('2', '47.52.74.212');
INSERT INTO `blog_article_zan` VALUES ('24', '49.75.151.42');
INSERT INTO `blog_article_zan` VALUES ('29', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('39', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('42', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('38', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('36', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('35', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('40', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('24', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('42', '101.226.225.59');
INSERT INTO `blog_article_zan` VALUES ('30', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('32', '114.218.172.90');
INSERT INTO `blog_article_zan` VALUES ('17', '221.225.147.151');
INSERT INTO `blog_article_zan` VALUES ('8', '117.60.191.171');
INSERT INTO `blog_article_zan` VALUES ('7', '121.224.143.154');
INSERT INTO `blog_article_zan` VALUES ('53', '114.218.129.27');
INSERT INTO `blog_article_zan` VALUES ('60', '222.92.113.42');
INSERT INTO `blog_article_zan` VALUES ('60', '180.117.42.54');
INSERT INTO `blog_article_zan` VALUES ('60', '58.209.171.225');
INSERT INTO `blog_article_zan` VALUES ('32', '111.11.6.57');
INSERT INTO `blog_article_zan` VALUES ('9', '103.240.126.31');
INSERT INTO `blog_article_zan` VALUES ('62', '49.84.147.10');
INSERT INTO `blog_article_zan` VALUES ('54', '117.81.4.32');
INSERT INTO `blog_article_zan` VALUES ('8', '117.81.4.141');
INSERT INTO `blog_article_zan` VALUES ('6', '218.4.123.170');
INSERT INTO `blog_article_zan` VALUES ('64', '114.93.49.16');
INSERT INTO `blog_article_zan` VALUES ('54', '114.217.147.203');

-- ----------------------------
-- Table structure for `blog_category`
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('2', 'C语言');
INSERT INTO `blog_category` VALUES ('4', 'Python语言');
INSERT INTO `blog_category` VALUES ('5', 'PHP语言');
INSERT INTO `blog_category` VALUES ('7', 'websocket测试');
INSERT INTO `blog_category` VALUES ('8', '标签云');
INSERT INTO `blog_category` VALUES ('9', '读者墙');
INSERT INTO `blog_category` VALUES ('10', '网站历史纪实');
INSERT INTO `blog_category` VALUES ('11', '前端技术');
INSERT INTO `blog_category` VALUES ('20', 'Cocos creator');
INSERT INTO `blog_category` VALUES ('13', 'Android语言');
INSERT INTO `blog_category` VALUES ('14', 'About Me');
INSERT INTO `blog_category` VALUES ('15', '留言板');
INSERT INTO `blog_category` VALUES ('16', '科技随侃');
INSERT INTO `blog_category` VALUES ('17', 'Mysql数据库');
INSERT INTO `blog_category` VALUES ('18', '技术随记');
INSERT INTO `blog_category` VALUES ('19', 'Linux技术');
INSERT INTO `blog_category` VALUES ('21', '技术教程');
INSERT INTO `blog_category` VALUES ('22', '编程语言');
INSERT INTO `blog_category` VALUES ('23', '杂七杂八');
INSERT INTO `blog_category` VALUES ('24', '关于');

-- ----------------------------
-- Table structure for `blog_commit`
-- ----------------------------
DROP TABLE IF EXISTS `blog_commit`;
CREATE TABLE `blog_commit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `articleid` int(10) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `addtime` int(10) NOT NULL,
  `content` text NOT NULL,
  `isshow` tinyint(2) NOT NULL DEFAULT '1',
  `parentid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog_commit
-- ----------------------------
INSERT INTO `blog_commit` VALUES ('1', '2', '706179062', '1516137785', '我顶！！顶顶顶', '1', '0');
INSERT INTO `blog_commit` VALUES ('41', '42', '706179062', '1519028038', 'https://www.baidu.com', '1', '0');
INSERT INTO `blog_commit` VALUES ('43', '60', '706179062', '1523767836', '哈哈', '1', '0');

-- ----------------------------
-- Table structure for `blog_nav`
-- ----------------------------
DROP TABLE IF EXISTS `blog_nav`;
CREATE TABLE `blog_nav` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of blog_nav
-- ----------------------------
INSERT INTO `blog_nav` VALUES ('93', '0', '科技随侃', '', '', '/blog/category', 'id=16', '_blank', '0', '1', '0', '2018-12-31 21:03:33');
INSERT INTO `blog_nav` VALUES ('94', '0', '技术随记', '', '', '/blog/category', 'id=18', '_blank', '0', '1', '0', '2018-12-31 21:03:56');
INSERT INTO `blog_nav` VALUES ('95', '0', '技术教程', '', '', '/blog/tech', '', '_blank', '0', '1', '0', '2018-12-31 21:04:20');
INSERT INTO `blog_nav` VALUES ('96', '0', '编程语言', '', 'fa fa-file-powerpoint-o', '#', 'id=96', '_blank', '0', '1', '0', '2018-12-31 21:05:07');
INSERT INTO `blog_nav` VALUES ('97', '0', '杂七杂八', '', 'fa fa-star-half', '#', 'id=97', '_blank', '0', '1', '0', '2018-12-31 21:05:38');
INSERT INTO `blog_nav` VALUES ('98', '0', '关于', '', 'fa fa-star-o', '#', 'id=98', '_blank', '0', '1', '0', '2018-12-31 21:06:10');
INSERT INTO `blog_nav` VALUES ('99', '96', 'C语言', '', 'fa fa-user-secret', '/blog/category', 'id=2', '_blank', '0', '1', '0', '2018-12-31 21:06:38');
INSERT INTO `blog_nav` VALUES ('100', '96', 'Python语言', '', 'fa fa-google-wallet', '/blog/category', 'id=4', '_blank', '0', '1', '0', '2018-12-31 21:06:58');
INSERT INTO `blog_nav` VALUES ('101', '96', 'PHP语言', '', 'fa fa-thumbs-up', '/blog/category', 'id=5', '_blank', '0', '1', '0', '2018-12-31 21:07:18');
INSERT INTO `blog_nav` VALUES ('105', '96', '前端技术', '', 'fa fa-bluetooth-b', '/blog/category', 'id=11', '_blank', '0', '1', '0', '2019-01-01 16:59:25');
INSERT INTO `blog_nav` VALUES ('106', '96', 'Cocos creator', '', 'fa fa-toggle-down', '/blog/category', 'id=20', '_blank', '0', '1', '0', '2019-01-01 16:59:33');
INSERT INTO `blog_nav` VALUES ('107', '96', 'Android语言', '', 'fa fa-cloud-download', '/blog/category', 'id=13', '_blank', '0', '1', '0', '2019-01-01 16:59:39');
INSERT INTO `blog_nav` VALUES ('108', '96', 'Linux技术', '', 'fa fa-calendar-minus-o', '/blog/category', 'id=19', '_blank', '0', '1', '0', '2019-01-01 16:59:56');
INSERT INTO `blog_nav` VALUES ('109', '97', 'websocket测试', '', 'fa fa-circle-o', '/blog/tool/websocket', '', '_self', '0', '1', '0', '2019-01-01 17:12:20');
INSERT INTO `blog_nav` VALUES ('110', '98', 'About Me', '', 'fa fa-calendar-plus-o', '/blog/article/blog', 'id=8', '_self', '0', '1', '0', '2019-01-01 17:12:44');
INSERT INTO `blog_nav` VALUES ('111', '98', '留言板', '', 'fa fa-circle-o', '/blog/article/blog', 'id=7', '_self', '0', '1', '0', '2019-01-01 17:13:04');
INSERT INTO `blog_nav` VALUES ('112', '98', '网站历史纪实', '', 'fa fa-check-circle-o', '/blog/article/blog', 'id=6', '_self', '0', '1', '0', '2019-01-01 17:13:14');
INSERT INTO `blog_nav` VALUES ('113', '96', 'Mysql数据库', '', 'fa fa-file-archive-o', '/blog/category', 'id=113', '_self', '0', '1', '0', '2019-01-06 20:01:59');

-- ----------------------------
-- Table structure for `blog_notify`
-- ----------------------------
DROP TABLE IF EXISTS `blog_notify`;
CREATE TABLE `blog_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '1',
  `sort` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_notify
-- ----------------------------
INSERT INTO `blog_notify` VALUES ('20', '第一', '夜神个人博客唯一域名：http://www.dusy110.top', '1', '0');
INSERT INTO `blog_notify` VALUES ('21', '第二', '博客交流 qq：1922884595', '1', '0');

-- ----------------------------
-- Table structure for `blog_pic`
-- ----------------------------
DROP TABLE IF EXISTS `blog_pic`;
CREATE TABLE `blog_pic` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `imgurl` varchar(300) NOT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2822 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog_pic
-- ----------------------------
INSERT INTO `blog_pic` VALUES ('2592', '科技', '/upload/mypic/644188f138cb3fcfd8d2e0309187462e.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2593', '焦点图', '/upload/mypic/646ae41c702ce97853fbbfab4e2de897.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2594', '科技', '/upload/mypic/64e4fd0467389cf55100fea6052f667d.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2595', '科技', '/upload/mypic/653f3b476147a74723c98063c0951010.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2596', '科技', '/upload/mypic/655a7e54ad317cd6085882ef19774dcf.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2597', '焦点图', '/upload/mypic/6575de54042ff2ed8badf878b0e531f8.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2598', '科技', '/upload/mypic/6593c3551ff7527357d3526d3ec68c26.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2599', '科技', '/upload/mypic/659b805286f2da671cdd2b2077488899.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2600', '科技', '/upload/mypic/65a4dff58ad865f4f05e31e008d79b10.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2601', '科技', '/upload/mypic/65cf122e805959916091aaed90896d2f.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2602', '科技', '/upload/mypic/664dc7b39fc7fdf8bc44c7cb2143a69f.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2603', '科技', '/upload/mypic/6689868ad4c7e7fef6344341db3a645b.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2604', '科技', '/upload/mypic/66cb70fcc1d0ed708276fba650d2c62b.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2605', '科技', '/upload/mypic/66ec7526a3643d149208dee736ac3c9b.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2606', '科技', '/upload/mypic/671904de6628f1cafe234f00e03145fb.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2607', '科技', '/upload/mypic/672beca520e84404478bbb37d680a712.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2608', '科技', '/upload/mypic/67331104aa6fc5a3f097fb01dc227521.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2609', '科技', '/upload/mypic/6746a8431b50f52429185abeb0b7b7dc.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2610', '科技', '/upload/mypic/674ee8a75ebff7aae858170ccb95c4e1.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2611', '科技', '/upload/mypic/678855519abe36d4396882c05de6d3a0.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2612', '科技', '/upload/mypic/678fc6505ef370823f7d0c335aad7ddf.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2613', '科技', '/upload/mypic/6797ead8821d853595e356fe2204b5a6.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2614', '科技', '/upload/mypic/679ee6a26b948493180bcf8ba23aff1b.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2615', '科技', '/upload/mypic/67c708fa3e7cb57bc07337863b8d55f9.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2616', '焦点图', '/upload/mypic/67e544da0c05e926853e86a297c12bc0.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2617', '科技', '/upload/mypic/67eae9294b95616c310e7a8928c53fcd.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2618', '科技', '/upload/mypic/68300bb8169bdbd93e9aba48bc0577ac.jpg', '1525786893');
INSERT INTO `blog_pic` VALUES ('2619', '科技', '/upload/mypic/68a372a868853bd56b991d62326eeb50.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2620', '科技', '/upload/mypic/68bba31ce0c52d5250a381bb718499e2.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2621', '科技', '/upload/mypic/69116d769c342e2d0093a5ec1c25381e.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2622', '科技', '/upload/mypic/69227ed2261a1c6faa1ed5eb47c6b1fd.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2623', '科技', '/upload/mypic/6927c03b89624cddbc9fe26d9d682e68.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2624', '科技', '/upload/mypic/69a838e96f0d504363336bc13d2da283.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2625', '科技', '/upload/mypic/69f442cec59bf222545e510d8e2ca5ca.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2626', '科技', '/upload/mypic/6a65fd681d947ef8ec4c89967e485eb5.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2627', '科技', '/upload/mypic/6aabf2f5684d74d3a9d2f298e6e86336.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2628', '科技', '/upload/mypic/6b42147a7bba0c7a96872030a38ce267.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2629', '科技', '/upload/mypic/6b5fbbf5605f9f3adf98c35287d6c5d3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2630', '科技', '/upload/mypic/6bc5c511d60e1223164261a09acce504.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2631', '科技', '/upload/mypic/6be7b30f67ef3d75ba7b147857cabfda.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2632', '科技', '/upload/mypic/6beb6d7eb8563a2b9e732b1819362e93.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2633', '科技', '/upload/mypic/6becf8e411bb7fcf2e877c030f05803e.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2634', '科技', '/upload/mypic/6beea8c9bb2f9078f3e3893fd7c114f0.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2635', '科技', '/upload/mypic/6bf6566b4a90b2d90a1b5b7dbd90defe.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2636', '科技', '/upload/mypic/6c302bc65eb8d5f926366dcbfc8a93ba.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2637', '科技', '/upload/mypic/6c8f4997c0e2241dd8b063608ed834a4.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2638', '科技', '/upload/mypic/6ca5f32d3eb35b9b86ebc2439859d6d2.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2639', '科技', '/upload/mypic/6ce39cad3f59eab40dfb6960285bd8de.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2640', '科技', '/upload/mypic/6d381af61b4af47c29f0abe0cfbc3eee.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2641', '科技', '/upload/mypic/6d48f565855ab21c7143f2e70f9a90b3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2642', '科技', '/upload/mypic/6d6e650003d51c4cad975603031bc689.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2643', '科技', '/upload/mypic/6d8a8838367643bbdf147ca8e8c3f4d4.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2644', '科技', '/upload/mypic/6d9ff1985d62d3f24f32de58a7a76136.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2645', '科技', '/upload/mypic/6df191ea9596d16c877ca5442943bd96.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2646', '科技', '/upload/mypic/6df282f8e50ff541ddd56fd1eb0c9d37.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2647', '科技', '/upload/mypic/6e48325b829d6a04a73439c811eab905.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2648', '科技', '/upload/mypic/6e4cbdba1262acb4f251e5e890180881.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2649', '科技', '/upload/mypic/6ef9adedd934003cdc56391e5c1c72fb.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2650', '科技', '/upload/mypic/6efd9a2908b7d77b3f8676e4b3ff7967.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2651', '科技', '/upload/mypic/6f370f8a8b09d3fef16c5b7da64a92f4.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2652', '科技', '/upload/mypic/6f863655a47e7fced3ac65699a3223b3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2653', '科技', '/upload/mypic/6fc3ecda99990d035aec9592b919d21e.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2654', '科技', '/upload/mypic/6ff5b2de5e88c32c6478a859c5c07f07.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2655', '科技', '/upload/mypic/700a16bcd66a4c035ba20a14ac927005.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2656', '科技', '/upload/mypic/70bd3df92690bc44405251c23c68c46d.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2657', '科技', '/upload/mypic/70d420468f4b679f0c7dce574b5f9267.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2658', '科技', '/upload/mypic/71346c0b9ad8e6f8f2618485f8c38257.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2659', '科技', '/upload/mypic/714b57922c3fbd636987bb9c1ddf3f6a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2660', '科技', '/upload/mypic/719585db9aab3d1dd5fde874246f5a68.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2661', '科技', '/upload/mypic/719f8b2b7c2244116bb1c7a54c4e4d20.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2662', '科技', '/upload/mypic/71afd4cec9d93dd5016b850c120bfdc5.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2663', '科技', '/upload/mypic/71fa22b682f75dbb649aa2ac3da22ec9.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2664', '科技', '/upload/mypic/7229d0791384d1550faeae796d28b017.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2665', '科技', '/upload/mypic/7298d0dfa4959d766275e14cb97dc204.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2666', '科技', '/upload/mypic/73027db79f10a665156099407ba1e1b6.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2667', '科技', '/upload/mypic/73124cf3a6695bf2799626ac5a212c2a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2668', '科技', '/upload/mypic/732027a99ab2decdd8ecf24993f6af08.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2669', '科技', '/upload/mypic/732c8c65b8312bfb62ff449ea95c7412.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2670', '科技', '/upload/mypic/7337eed4c325529de9aff010e795c324.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2671', '科技', '/upload/mypic/742a69d9463bca02ca2d596127af7dfb.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2672', '科技', '/upload/mypic/744612e64b5b6b922d080885e57d728f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2673', '科技', '/upload/mypic/7493a0410832b694c4a0cd20936b7837.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2674', '科技', '/upload/mypic/7499c8189ae2a84685b4cf0380223e4b.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2675', '科技', '/upload/mypic/74d3f1e9fd0e3093f2143672ac030001.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2676', '科技', '/upload/mypic/74e2acbe91b7e5ec1949336e9f0b75dc.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2677', '科技', '/upload/mypic/74ff022d28c977eb2534ecccb817886f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2678', '科技', '/upload/mypic/75b18f7be31daafa7cf429eb9cd321c0.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2679', '科技', '/upload/mypic/75d194641775d6e677808ddc7740bef7.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2680', '科技', '/upload/mypic/768001043a7145525feb25d866425d34.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2681', '科技', '/upload/mypic/768f740a2ba57755064d1c7746a0a544.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2682', '科技', '/upload/mypic/76c5f1484843eefddd93b8cd8b79ffb8.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2683', '科技', '/upload/mypic/76e7e2d94b24a10bc0566f118f744f8f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2684', '科技', '/upload/mypic/77524271944d1a722f765244527368f2.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2685', '科技', '/upload/mypic/77bdadb708c0cf5d1a7f5b409dd9b6b6.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2686', '科技', '/upload/mypic/77cb4893e17572e8c694740b93680b73.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2687', '科技', '/upload/mypic/783517298a8a1631b644abe404989802.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2688', '科技', '/upload/mypic/783e130610d6c087306840f9d9ac40b0.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2689', '科技', '/upload/mypic/78996feb44dc006d049bc5825734d1c3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2690', '科技', '/upload/mypic/78bed8b09d090753db7979d6278020d2.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2691', '科技', '/upload/mypic/79359748f83aa7da75c067f5702cea6a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2692', '科技', '/upload/mypic/79536f927ddd4ec4e288864047bfebe5.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2693', '科技', '/upload/mypic/79917d6d0b41ffb2dc9c7bfbea24c406.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2694', '科技', '/upload/mypic/7993c69f9620a1f1e006fef25cf75200.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2695', '科技', '/upload/mypic/79bcd735193f65c1be6f32387f29e30c.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2696', '科技', '/upload/mypic/79cf3172e074a82dc9d48291a09a7fef.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2697', '科技', '/upload/mypic/7a04ac08e6e97a42bf3e5c097478ffcd.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2698', '科技', '/upload/mypic/7a35e580ac3c8f39f9eb62b91d7344c7.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2699', '科技', '/upload/mypic/7a7dca498cc28d932508d4cdb2cb1639.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2700', '科技', '/upload/mypic/7a89e17ec8fe1c1d67853e0a40cd5960.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2701', '科技', '/upload/mypic/7a9e8f6e3058402230afc8726feadaed.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2702', '科技', '/upload/mypic/7ac82e15fdeebae8f35cf6733eb811ce.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2703', '科技', '/upload/mypic/7ad28f4b3c325141b7cf33041ac4d6d1.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2704', '科技', '/upload/mypic/7ad5dc65582f6419635c1707cd41a05a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2705', '科技', '/upload/mypic/7b40bc274ed34174a5c2b7f815f46594.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2706', '科技', '/upload/mypic/7b546a79fe67b5a0a3ed2c098b96987e.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2707', '科技', '/upload/mypic/7ba4fb337f70ffc1fb8dca2a26662839.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2708', '科技', '/upload/mypic/7be4c43c784c14a7a782f4fa94e40e3f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2709', '科技', '/upload/mypic/7c37eaff9ec4a3075496639d1672e07a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2710', '科技', '/upload/mypic/7c3cc68d1cd583162f80173b1a1f6f10.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2711', '科技', '/upload/mypic/7c7d04b39642e3ee89433b71c5c4c273.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2712', '科技', '/upload/mypic/7cb1ae8d6219b8f10ece6520314b9c71.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2713', '科技', '/upload/mypic/7cb4090e0a4ae8c52285e26c057e6f65.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2714', '科技', '/upload/mypic/7ccfc1d5e0be77a0358c74db22769329.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2715', '科技', '/upload/mypic/7cdacf99dd7eb20eff1fc11d1cc6659f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2716', '科技', '/upload/mypic/7d11bae4bfafeb63fd97b7ca987cabd3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2717', '科技', '/upload/mypic/7d28ac93b944ee8c0ad8d45f6e3ce32b.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2718', '科技', '/upload/mypic/7d385f6ed30efae6357ca4f0bd43f9f3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2719', '科技', '/upload/mypic/7dcc6087a811d9138cc1bd0974432143.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2720', '科技', '/upload/mypic/7e237a8d2bf1b463fea1a3c8ba591629.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2721', '科技', '/upload/mypic/7e33dcbce8cf9fe9b3d21241f8d2ef6f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2722', '科技', '/upload/mypic/7e4cbd905bfcefa7b77595c3ae473739.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2723', '科技', '/upload/mypic/7e718e31b0d81b98e3a204e2d469f118.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2724', '科技', '/upload/mypic/7e8d2026e349febf207c327a02a2d178.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2725', '科技', '/upload/mypic/7e99209a0dafb106a310dbc61ac7e983.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2726', '科技', '/upload/mypic/7ee459cca47e0643043b5aed9a0c447c.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2727', '科技', '/upload/mypic/7f040052cba802aec4935105d8c4759c.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2728', '科技', '/upload/mypic/7f1a97adeb8440b323360ce90bc7090f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2729', '科技', '/upload/mypic/7f48227f0915dfe9904c0356e04170a6.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2730', '科技', '/upload/mypic/7f9d03bb4ed59f7b7bdc9030871c8e13.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2731', '科技', '/upload/mypic/7f9dee2f547329d7f0cef184bcfc3181.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2732', '科技', '/upload/mypic/7fb47c500c54120ebc721592b7b6fb2c.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2733', '科技', '/upload/mypic/7ff396cae6cda1b0638a8792091d6316.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2734', '科技', '/upload/mypic/807869c92aba39c5f623115af1a83bb7.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2735', '科技', '/upload/mypic/807c0fc24e10989140e715b45bb6f42a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2736', '科技', '/upload/mypic/80840bd33b427ccafc55f9236a70e8ce.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2737', '科技', '/upload/mypic/80911d355c511b532c3b1bd8801223f4.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2738', '科技', '/upload/mypic/80a6244cc57b37e5baec9de5d6f38230.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2739', '科技', '/upload/mypic/80b4f3861fc0ce49b2d8ac8bd96773bf.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2740', '科技', '/upload/mypic/80c4154fc179742ef0a12f7fdc8f1d23.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2741', '科技', '/upload/mypic/80e88c743f602ad7bf5377ba24151af3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2742', '科技', '/upload/mypic/81760e4a1e0beefd73b45a90d283e975.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2743', '科技', '/upload/mypic/81d3e198b353ca9905341c8a9137b1e4.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2744', '科技', '/upload/mypic/822b09bc89203240a4078ecb79301f31.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2745', '科技', '/upload/mypic/8245daee624a642560faf2b849899477.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2746', '科技', '/upload/mypic/82487b3f1cf93e3e3e72f3e8077fb4ae.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2747', '科技', '/upload/mypic/826488e34556ae0f5d39003583dc7d33.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2748', '科技', '/upload/mypic/82a24893be74474c6c59e28deea1fcf2.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2749', '科技', '/upload/mypic/82e44694f4f2cebedb173294af45ad09.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2750', '科技', '/upload/mypic/8315537d2941efcaf0c41bcfed48350c.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2751', '科技', '/upload/mypic/8325dec0db998a593d9bf1ba85a86e5c.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2752', '科技', '/upload/mypic/838f5d79648c30a80eb0ec6640505978.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2753', '科技', '/upload/mypic/83d75de8562c390e6732dfa2393df5ea.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2754', '科技', '/upload/mypic/83f2eb7db91bb649765315485079d0e1.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2755', '科技', '/upload/mypic/83ff5e99119e33ceb37fd50712f1a3ce.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2756', '科技', '/upload/mypic/850706eef5b887b31be006b0c36b38ca.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2757', '科技', '/upload/mypic/85178f5422367acc910056f68bf3243a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2758', '科技', '/upload/mypic/852486d6d794227b5388e60a9f62a08a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2759', '科技', '/upload/mypic/853c1b1a41fd76b57af8b0645707286e.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2760', '科技', '/upload/mypic/8573e0a3ba10644ce663e7171c6bf3c5.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2761', '科技', '/upload/mypic/860fd5760cc07cdb8e5fd48e807bd71a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2762', '科技', '/upload/mypic/861cbea2b579e0b127396e80759f7e1c.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2763', '科技', '/upload/mypic/8621abf4687f837fe8882952169fd852.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2764', '科技', '/upload/mypic/86297de73aeb850ec0ec2751e748383d.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2765', '科技', '/upload/mypic/863fc7dafb319fed5e3e3aecc737357f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2766', '科技', '/upload/mypic/8681a1eaa79c258e4084da56490d5335.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2767', '科技', '/upload/mypic/869fb15edfae5747d9569b30a750d889.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2768', '科技', '/upload/mypic/8737d851b9a3a850a2845d1a9a7cf1a9.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2769', '科技', '/upload/mypic/8782e2fec9a9888ec2c6eba7e6bd051e.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2770', '科技', '/upload/mypic/87bc87e78cce07edab0e7967d06b16c1.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2771', '科技', '/upload/mypic/885c8f313402e1de232209b167400926.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2772', '科技', '/upload/mypic/8876c8c777bd876862191c95888020c6.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2773', '科技', '/upload/mypic/88c168a82a3661c26ab8890b3ac08e52.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2774', '科技', '/upload/mypic/88fd534df90738486e40f99427c52a70.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2775', '科技', '/upload/mypic/892affb24751db43ba8a8c03a7abd4ad.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2776', '科技', '/upload/mypic/896b7fc3ac5f92dab1520035f2b6d347.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2777', '科技', '/upload/mypic/898ea37aacaaa34a9ce09a293b8bd3fb.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2778', '科技', '/upload/mypic/89a14b23590df2d1789822bd441b1e33.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2779', '科技', '/upload/mypic/89c52dfae97c85b6697c342c72a9ed01.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2780', '科技', '/upload/mypic/89fa437e638d8c33e35224ab2285fe83.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2781', '科技', '/upload/mypic/8a509f44208c2a8c80ffe65fad7f3bbd.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2782', '科技', '/upload/mypic/8a5f75e7b2fefbeed08a611ee4fae812.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2783', '科技', '/upload/mypic/8a89acfc74ddce000cc1c48b5345c17a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2784', '科技', '/upload/mypic/8aa9f89dd69171f5da9732a8e12fe1f6.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2785', '科技', '/upload/mypic/8aadca054bff8394ca04e99517aecba5.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2786', '科技', '/upload/mypic/8ac1213dc766e38c1b7e9afe5a7ef1e3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2787', '科技', '/upload/mypic/8acccef3325e17bf14cfb71040c90c25.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2788', '科技', '/upload/mypic/8ad4f9f4e7c1fdc26a5828b0ef05a252.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2789', '科技', '/upload/mypic/8b0a89b410fe8410641bcd2f2dd96cef.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2790', '科技', '/upload/mypic/8b513922020741742a2946fa4bbfd0c7.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2791', '科技', '/upload/mypic/8b988fc703cbd5b2f61f0297b1b888cf.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2792', '科技', '/upload/mypic/8bc5b24aef93d9f6283791a8a8840477.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2793', '科技', '/upload/mypic/8bcdc21805a8b864de90f77201c98448.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2794', '科技', '/upload/mypic/8bee27c6ff57de0fb8154995d5bb7881.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2795', '科技', '/upload/mypic/8bf5718066bddbab8af8e84294293622.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2796', '科技', '/upload/mypic/8c016e6ebea54370161f51f2ce9ab129.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2797', '科技', '/upload/mypic/8c0781934ecd3b9c9a97564258fa32ac.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2798', '科技', '/upload/mypic/8c128ef064f186767655430c675536be.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2799', '科技', '/upload/mypic/8c21537c8826964583a1bc5ebfd277e7.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2800', '科技', '/upload/mypic/8c6d33dd0e27383ed123d432b8fb47ad.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2801', '科技', '/upload/mypic/8c6eaaaec9fb98251f7ea870038ee7e7.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2802', '科技', '/upload/mypic/8c8ce2f243bb4a1b86fe5a669f19181b.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2803', '科技', '/upload/mypic/8cd4b02d7ffdf33789b70c5c176d66c2.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2804', '科技', '/upload/mypic/8d02badc9cff15c18de4750a4de58545.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2805', '科技', '/upload/mypic/8d87c943046ae51b53a4273a4681ae2f.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2806', '科技', '/upload/mypic/8de840077fc26ad96ea4b7e60a2e004a.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2807', '科技', '/upload/mypic/8e2500a730d4413aaa57744182ccd497.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2808', '科技', '/upload/mypic/8e3b6a4a861d7567a22c91206e0c1803.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2809', '科技', '/upload/mypic/8e45b26e5a236f0eac75461259234611.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2810', '科技', '/upload/mypic/8e6a2214c0d042772f802940fa0a8965.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2811', '科技', '/upload/mypic/8e9744f14a8000ba3afb685c124d752c.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2812', '科技', '/upload/mypic/8ed6476edb76455f34de6b0084563c10.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2813', '科技', '/upload/mypic/8eeb39e68084ec7c5aa0b1ca209a6005.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2814', '科技', '/upload/mypic/8efb763c8d7edc052ee2d1338809c6a6.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2815', '科技', '/upload/mypic/8f049c98cb794a0ca1219f5ba7c6b439.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2816', '科技', '/upload/mypic/8f8a7515e7b7c8ef8a5719a7f939d141.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2817', '科技', '/upload/mypic/8ff79f5c794ef54c753e721e454d0fe7.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2818', '科技', '/upload/mypic/900e21e96945f7ded0e806d7a8048d41.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2819', '科技', '/upload/mypic/902838a3ca3fe107c42cb7a2c0eb1cd3.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2820', '科技', '/upload/mypic/90564edf87b1903aeccd557c12866ae4.jpg', '1525786894');
INSERT INTO `blog_pic` VALUES ('2821', '科技', '/upload/mypic/90cd5b5c7260eb86d27a9cb570989d5e.jpg', '1525786895');

-- ----------------------------
-- Table structure for `blog_site_slider`
-- ----------------------------
DROP TABLE IF EXISTS `blog_site_slider`;
CREATE TABLE `blog_site_slider` (
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
-- Records of blog_site_slider
-- ----------------------------
INSERT INTO `blog_site_slider` VALUES ('1', '企业版幻灯', '0', '/static/upload/0b7d971bc3a2fdc1/bbf4ee6e64ca35d4.jpg', '#', '首页焦点图片', '1', '10');
INSERT INTO `blog_site_slider` VALUES ('2', '百度', '2', '', 'http://www.baidu.com', '百度连接', '1', '0');
INSERT INTO `blog_site_slider` VALUES ('3', '云之讯', '1', 'http://192.168.31.47/static/upload/00cbe1ebdfe7e146/0e05e5edcec2e771.jpg', 'http://www.yunzhixun.com', '云之讯', '1', '20');
INSERT INTO `blog_site_slider` VALUES ('4', '企业幻灯片2', '0', '/static/upload/0fe464f952fdf43b/e47ef66741a87a50.jpg', '#', '', '1', '11');
INSERT INTO `blog_site_slider` VALUES ('5', '钉钉', '1', 'http://192.168.31.47/static/upload/0de6adc8ab30fcd8/ab449cc0bc1b1d00.jpg', '#', '', '1', '21');
INSERT INTO `blog_site_slider` VALUES ('6', '快站', '1', 'http://192.168.31.47/static/upload/01ea99a7a52732b7/603089a20706a2db.jpg', '#', '', '1', '22');

-- ----------------------------
-- Table structure for `blog_tech`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tech`;
CREATE TABLE `blog_tech` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of blog_tech
-- ----------------------------
INSERT INTO `blog_tech` VALUES ('93', '0', '服务器端', '', '', '#', '', '_blank', '0', '1', '0', '2018-12-31 21:03:33');
INSERT INTO `blog_tech` VALUES ('94', '0', '前端', '', '', '#', '', '_blank', '0', '1', '0', '2018-12-31 21:03:56');
INSERT INTO `blog_tech` VALUES ('95', '0', '移动端', '', '', '#', '', '_blank', '0', '1', '0', '2018-12-31 21:04:20');
INSERT INTO `blog_tech` VALUES ('96', '0', '开发工具', '', '', '#', '', '_blank', '0', '1', '0', '2018-12-31 21:05:07');
INSERT INTO `blog_tech` VALUES ('97', '0', '服务器运维', '', '', '#', '', '_blank', '0', '1', '0', '2018-12-31 21:05:38');
INSERT INTO `blog_tech` VALUES ('98', '0', '数据库开发', '', '', '#', '', '_blank', '0', '1', '0', '2018-12-31 21:06:10');
INSERT INTO `blog_tech` VALUES ('99', '93', 'php教程', '', '', 'https://www.w3cschool.cn/php', '', '_blank', '0', '1', '0', '2018-12-31 21:06:38');
INSERT INTO `blog_tech` VALUES ('100', '94', 'html教程', '', '', 'https://www.w3cschool.cn/htmltags', '', '_blank', '0', '1', '0', '2018-12-31 21:06:58');
INSERT INTO `blog_tech` VALUES ('101', '95', 'Android教程', '', '', 'http://www.runoob.com/w3cnote/android-tutorial-intro.html', '', '_blank', '0', '1', '0', '2018-12-31 21:07:18');
INSERT INTO `blog_tech` VALUES ('105', '93', 'Linux教程', '', '', 'https://www.w3cschool.cn/linux/', '', '_blank', '0', '1', '0', '2019-01-01 16:59:25');
INSERT INTO `blog_tech` VALUES ('106', '97', 'Git教程', '', '', 'https://www.w3cschool.cn/git/', '', '_blank', '0', '1', '0', '2019-01-01 16:59:33');
INSERT INTO `blog_tech` VALUES ('107', '94', 'css3教程', '', '', 'https://www.w3cschool.cn/css3/', '', '_blank', '0', '1', '0', '2019-01-01 16:59:39');
INSERT INTO `blog_tech` VALUES ('108', '94', 'javascript教程', '', '', 'https://www.w3cschool.cn/javascript/', '', '_blank', '0', '1', '0', '2019-01-01 16:59:56');
INSERT INTO `blog_tech` VALUES ('109', '94', 'Bootstrap教程', '', '', 'https://v3.bootcss.com/', '', '_self', '0', '1', '0', '2019-01-01 17:12:20');
INSERT INTO `blog_tech` VALUES ('110', '94', 'Jquery教程', '', '', 'http://www.w3school.com.cn/jquery/index.asp', '', '_self', '0', '1', '0', '2019-01-01 17:12:44');
INSERT INTO `blog_tech` VALUES ('111', '93', 'thinkphp3.2.2教程', '', '', 'https://www.kancloud.cn/manual/thinkphp/1678', '', '_self', '0', '1', '0', '2019-01-01 17:13:04');
INSERT INTO `blog_tech` VALUES ('112', '95', '微信公众平台开发', '', '', 'https://mp.weixin.qq.com/wiki', '', '_self', '0', '1', '0', '2019-01-01 17:13:14');
INSERT INTO `blog_tech` VALUES ('113', '95', '微信小程序开发', '', '', 'https://mp.weixin.qq.com/debug/wxadoc/dev/quickstart/basic/getting-started.html', '', '_self', '0', '1', '0', '2019-01-01 17:49:40');
INSERT INTO `blog_tech` VALUES ('114', '93', 'Java开发', '', '', 'https://www.w3cschool.cn/java/', '', '_self', '0', '1', '0', '2019-01-01 17:49:49');
INSERT INTO `blog_tech` VALUES ('115', '93', 'wepy官方教程', '', '', 'https://tencent.github.io/wepy/document.html', '', '_self', '0', '1', '0', '2019-01-01 17:49:54');
INSERT INTO `blog_tech` VALUES ('116', '95', 'EasyWeChat微信框架', '', '', 'https://www.easywechat.com', '', '_self', '0', '1', '0', '2019-01-01 17:49:59');
