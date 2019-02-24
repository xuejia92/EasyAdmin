/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : esadmin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-01 19:30:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `forum_addons`
-- ----------------------------
DROP TABLE IF EXISTS `forum_addons`;
CREATE TABLE `forum_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=500 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of forum_addons
-- ----------------------------

-- ----------------------------
-- Table structure for `forum_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `forum_admin_user`;
CREATE TABLE `forum_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` varchar(20) DEFAULT '0' COMMENT '注册时间',
  `last_login_time` varchar(20) DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `salt` varchar(20) DEFAULT NULL COMMENT 'salt',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of forum_admin_user
-- ----------------------------
INSERT INTO `forum_admin_user` VALUES ('1', 'admin', '0dfc7612f607db6c17fd99388e9e5f9c', '1', '1491037613', '1548562724', '127.0.0.1', '1dFlxLhiuLqnUZe9kA');

-- ----------------------------
-- Table structure for `forum_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `forum_auth_group`;
CREATE TABLE `forum_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of forum_auth_group
-- ----------------------------
INSERT INTO `forum_auth_group` VALUES ('1', '超级管理组', '1', '1');

-- ----------------------------
-- Table structure for `forum_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `forum_auth_group_access`;
CREATE TABLE `forum_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of forum_auth_group_access
-- ----------------------------
INSERT INTO `forum_auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `forum_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `forum_auth_rule`;
CREATE TABLE `forum_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of forum_auth_rule
-- ----------------------------
INSERT INTO `forum_auth_rule` VALUES ('1', 'admin/System/index', '系统配置', '1', '1', '0', 'fa-gears', '10', '');
INSERT INTO `forum_auth_rule` VALUES ('2', 'admin/System/siteConfig', '站点配置', '1', '1', '1', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('3', 'admin/System/updateSiteConfig', '更新配置', '1', '0', '2', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('5', 'admin/Bar/default', '菜单管理', '1', '1', '0', 'fa-bars', '9', '');
INSERT INTO `forum_auth_rule` VALUES ('6', 'admin/Menu/index', '后台菜单', '1', '1', '5', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('7', 'admin/Menu/add', '添加菜单', '1', '0', '6', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('8', 'admin/Menu/save', '保存菜单', '1', '0', '6', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('9', 'admin/Menu/edit', '编辑菜单', '1', '0', '6', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('10', 'admin/Menu/update', '更新菜单', '1', '0', '6', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('11', 'admin/Menu/delete', '删除菜单', '1', '0', '6', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('12', 'admin/Nav/index', '导航管理', '1', '1', '5', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('13', 'admin/Content/default', '内容管理', '1', '1', '0', 'fa fa-file-text', '8', '');
INSERT INTO `forum_auth_rule` VALUES ('14', 'admin/Forumcate/index', '社区版块', '1', '1', '13', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('15', 'admin/Forumcate/add', '添加版块', '1', '0', '14', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('16', 'admin/Forumcate/save', '保存版块', '1', '0', '14', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('17', 'admin/Forumcate/edit', '编辑版块', '1', '0', '14', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('18', 'admin/Forumcate/update', '更新版块', '1', '0', '14', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('19', 'admin/Forumcate/delete', '删除版块', '1', '0', '14', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('20', 'admin/Forum/index', '帖子管理', '1', '1', '13', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('21', 'admin/Forum/toggle', '帖子审核', '1', '0', '20', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('22', 'admin/Comment/index', '评论管理', '1', '1', '13', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('24', 'admin/Message/index', '消息管理', '1', '1', '13', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('25', 'admin/Message/add', '添加消息', '1', '0', '24', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('26', 'admin/Message/save', '保存消息', '1', '0', '24', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('27', 'admin/Message/edit', '编辑消息', '1', '0', '24', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('28', 'admin/Message/update', '更新消息', '1', '0', '24', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('29', 'admin/Message/delete', '删除消息', '1', '0', '24', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('30', 'admin/User/default', '用户管理', '1', '1', '0', 'fa-users', '7', '');
INSERT INTO `forum_auth_rule` VALUES ('31', 'admin/AuthGroup/add', '添加权限组', '1', '0', '88', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('32', 'admin/AuthGroup/save', '保存权限组', '1', '0', '88', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('33', 'admin/AuthGroup/edit', '编辑权限组', '1', '0', '88', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('34', 'admin/AuthGroup/update', '更新权限组', '1', '0', '88', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('35', 'admin/AuthGroup/delete', '删除权限组', '1', '0', '88', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('36', 'admin/AuthGroup/auth', '授权', '1', '0', '88', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('37', 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', '1', '0', '88', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('39', 'admin/Nav/add', '添加导航', '1', '0', '12', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('40', 'admin/Nav/save', '保存导航', '1', '0', '12', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('41', 'admin/Nav/edit', '编辑导航', '1', '0', '12', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('42', 'admin/Nav/update', '更新导航', '1', '0', '12', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('43', 'admin/Nav/delete', '删除导航', '1', '0', '12', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('44', 'admin/User/add', '添加用户', '1', '0', '86', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('45', 'admin/User/save', '保存用户', '1', '0', '86', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('46', 'admin/User/edit', '编辑用户', '1', '0', '86', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('47', 'admin/User/update', '更新用户', '1', '0', '86', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('48', 'admin/User/delete', '删除用户', '1', '0', '86', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('49', 'admin/AdminUser/add', '添加管理员', '1', '0', '87', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('50', 'admin/AdminUser/save', '保存管理员', '1', '0', '87', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('51', 'admin/AdminUser/edit', '编辑管理员', '1', '0', '87', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('52', 'admin/AdminUser/update', '更新管理员', '1', '0', '87', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('53', 'admin/AdminUser/delete', '删除管理员', '1', '0', '87', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('54', 'admin/Extend/default', '扩展管理', '1', '1', '0', 'fa-wrench', '5', '');
INSERT INTO `forum_auth_rule` VALUES ('73', 'admin/ChangePassword/index', '修改密码', '1', '1', '1', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('74', 'admin/ChangePassword/updatePassword', '更新密码', '1', '0', '73', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('75', 'admin/ChangePassword/diachange_password', '弹窗修改密码', '1', '0', '73', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('76', 'admin/Menu/updatestatus', '更新菜单状态', '1', '0', '6', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('77', 'admin/Database/index?type=export', '备份数据库', '1', '1', '1', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('78', 'admin/Database/index?type=import', '恢复数据库', '1', '1', '1', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('80', 'admin/Database/optimize', '优化表', '1', '0', '77', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('81', 'admin/Database/repair', '修复表', '1', '0', '77', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('82', 'admin/Database/export', '备份表', '1', '0', '77', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('83', 'admin/Database/import', '恢复表', '1', '0', '78', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('84', 'admin/Database/delete', '备份删除', '1', '0', '78', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('85', 'admin/Nav/updatestatus', '更新导航状态', '1', '0', '12', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('86', 'admin/User/index', '普通用户', '1', '1', '30', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('87', 'admin/AdminUser/index', '管理员', '1', '1', '30', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('88', 'admin/AuthGroup/index', '权限组', '1', '1', '30', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('89', 'admin/Forumcate/updatestatus', '更新板块状态', '1', '0', '14', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('90', 'admin/usergrade/index', '会员等级', '1', '1', '30', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('91', 'admin/usergrade/add', '添加等级', '1', '0', '90', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('92', 'admin/usergrade/save', '保存等级', '1', '0', '90', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('93', 'admin/usergrade/edit', '编辑等级', '1', '0', '90', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('94', 'admin/usergrade/update', '更新等级', '1', '0', '90', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('95', 'admin/usergrade/delete', '删除等级', '1', '0', '90', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('96', 'admin/Forum/edit', '编辑帖子', '1', '0', '20', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('97', 'admin/Forum/update', '更新帖子', '1', '0', '20', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('98', 'admin/Forum/delete', '删除帖子', '1', '0', '20', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('99', 'admin/Forum/alldelete', '批量删除帖子', '1', '0', '20', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('100', 'admin/Comment/delete', '评论删除', '1', '0', '22', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('101', 'admin/Comment/alldelete', '批量删除删除', '1', '0', '22', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('102', 'admin/Hooks/index', '钩子管理', '1', '1', '54', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('103', 'admin/Addons/index', '插件安装', '1', '1', '54', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('104', 'admin/InstallAddons/index', '已装插件', '1', '1', '0', 'fa-sliders', '4', '');
INSERT INTO `forum_auth_rule` VALUES ('105', 'admin/Hooks/add', '添加钩子', '1', '0', '102', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('106', 'admin/Hooks/save', '保存钩子', '1', '0', '102', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('107', 'admin/Hooks/edit', '编辑钩子', '1', '0', '102', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('108', 'admin/Hooks/update', '更新钩子', '1', '0', '102', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('109', 'admin/Hooks/delete', '删除钩子', '1', '0', '102', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('110', 'admin/Addons/adminlist', '插件后台', '1', '0', '103', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('111', 'admin/Addons/config', '设置插件', '1', '0', '103', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('112', 'admin/Addons/saveConfig', '插件设置保存', '1', '0', '103', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('113', 'admin/Addons/install', '安装插件', '1', '0', '103', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('114', 'admin/Addons/uninstall', '卸载插件', '1', '0', '103', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('115', 'admin/Logmanage/index', '记录管理', '1', '1', '0', 'fa-braille', '6', '');
INSERT INTO `forum_auth_rule` VALUES ('116', 'admin/Log/index', '操作记录', '1', '1', '115', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('117', 'admin/Log/delete', '删除记录', '1', '0', '116', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('118', 'admin/Log/alldelete', '清空记录', '1', '0', '116', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('119', 'admin/PointNote/index', '积分记录', '1', '1', '115', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('120', 'admin/PointNote/delete', '删除记录', '1', '0', '119', '', '0', '');
INSERT INTO `forum_auth_rule` VALUES ('121', 'admin/PointNote/alldelete', '清空记录', '1', '0', '119', '', '0', '');

-- ----------------------------
-- Table structure for `forum_comment`
-- ----------------------------
DROP TABLE IF EXISTS `forum_comment`;
CREATE TABLE `forum_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL COMMENT '上级评论',
  `uid` int(11) NOT NULL COMMENT '所属会员',
  `fid` int(11) NOT NULL COMMENT '所属帖子',
  `time` varchar(11) NOT NULL COMMENT '时间',
  `praise` varchar(11) DEFAULT '0' COMMENT '赞',
  `reply` varchar(11) DEFAULT '0' COMMENT '回复',
  `content` text NOT NULL COMMENT '内容',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of forum_comment
-- ----------------------------
INSERT INTO `forum_comment` VALUES ('1', '0', '11256', '1', '1548563605', '1', '1', '&lt;p&gt;哎呦 不错哦&lt;/p&gt;', '0');
INSERT INTO `forum_comment` VALUES ('2', '1', '11256', '1', '1548563619', '0', '0', '&lt;p&gt;加油吧 小比孩子&lt;/p&gt;', '0');

-- ----------------------------
-- Table structure for `forum_file`
-- ----------------------------
DROP TABLE IF EXISTS `forum_file`;
CREATE TABLE `forum_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(255) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(255) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` varchar(255) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` varchar(255) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  `download` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of forum_file
-- ----------------------------

-- ----------------------------
-- Table structure for `forum_forum`
-- ----------------------------
DROP TABLE IF EXISTS `forum_forum`;
CREATE TABLE `forum_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '上级',
  `uid` int(11) NOT NULL COMMENT '用户',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示',
  `choice` tinyint(1) NOT NULL DEFAULT '0' COMMENT '精贴',
  `settop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '顶置',
  `praise` varchar(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `view` varchar(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `time` varchar(11) NOT NULL COMMENT '时间',
  `reply` varchar(11) NOT NULL DEFAULT '0' COMMENT '回复',
  `keywords` varchar(100) NOT NULL COMMENT '关键词',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '内容',
  `is_deleted` tinyint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum_forum
-- ----------------------------
INSERT INTO `forum_forum` VALUES ('1', '1', '10001', 'php开发中的超级牛逼的套路', '1', '1', '1', '0', '5', '1548563588', '2', '搓搓粗', '&lt;p&gt;什么套路呢 没有啦 哈哈哈哈&amp;nbsp; 这是什么鬼东西呢&lt;/p&gt;', '<p>&lt;p&gt;什么套路呢 没有啦 哈哈哈哈&amp;nbsp; 这是什么鬼东西呢&lt;/p&gt;</p>\r\n\r\n<dl>\r\n	<dd><a href=\"http://127.0.0.1:81/thread/4.html\">心动模式有什么功能，感觉跟随机播放没什么区别啊？</a>&nbsp;<i></i>&nbsp;3</dd>\r\n	<dd><a href=\"http://127.0.0.1:81/thread/1.html\">php开发中的超级牛逼的套路</a>&nbsp;<i></i>&nbsp;20</dd>\r\n	<dd><a href=\"http://127.0.0.1:81/thread/2.html\">不错的东西</a>&nbsp;<i></i>&nbsp;1</dd>\r\n	<dd><a href=\"http://127.0.0.1:81/thread/3.html\">你好，这是格式</a>&nbsp;<i></i>&nbsp;1</dd>\r\n</dl>\r\n', '0');

-- ----------------------------
-- Table structure for `forum_forumcate`
-- ----------------------------
DROP TABLE IF EXISTS `forum_forumcate`;
CREATE TABLE `forum_forumcate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL COMMENT '上级',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型',
  `show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示',
  `sidebar` tinyint(1) NOT NULL DEFAULT '1' COMMENT '侧栏',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` varchar(100) NOT NULL COMMENT '图片',
  `time` varchar(32) NOT NULL COMMENT '时间',
  `keywords` varchar(100) NOT NULL COMMENT '关键词',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `is_deleted` tinyint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='社区分类表';

-- ----------------------------
-- Records of forum_forumcate
-- ----------------------------
INSERT INTO `forum_forumcate` VALUES ('1', '0', 'php开发', '1', '1', '1', '4', '', '1548563022', '', '', '0');
INSERT INTO `forum_forumcate` VALUES ('2', '0', 'java开发', '1', '1', '1', '1', '', '1548563060', 'spring，boot', 'java的描述', '0');
INSERT INTO `forum_forumcate` VALUES ('3', '0', 'c语言', '1', '0', '0', '2', '', '1548584417', '', '', '0');
INSERT INTO `forum_forumcate` VALUES ('4', '0', '气功', '1', '1', '1', '3', '', '1548584275', '', '', '1');

-- ----------------------------
-- Table structure for `forum_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `forum_hooks`;
CREATE TABLE `forum_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=500 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum_hooks
-- ----------------------------
INSERT INTO `forum_hooks` VALUES ('30', 'friendLink', '友情链接插件', '1', '1406690225', '');

-- ----------------------------
-- Table structure for `forum_log`
-- ----------------------------
DROP TABLE IF EXISTS `forum_log`;
CREATE TABLE `forum_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `username` varchar(55) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum_log
-- ----------------------------
INSERT INTO `forum_log` VALUES ('1', 'admin/Index/adminindex', '1', 'admin', '1548562725');
INSERT INTO `forum_log` VALUES ('2', 'admin/Index/home', '1', 'admin', '1548562725');
INSERT INTO `forum_log` VALUES ('3', 'admin/Hooks/index', '1', 'admin', '1548562731');
INSERT INTO `forum_log` VALUES ('4', 'admin/Addons/index', '1', 'admin', '1548562734');
INSERT INTO `forum_log` VALUES ('5', 'admin/Hooks/edit', '1', 'admin', '1548562749');
INSERT INTO `forum_log` VALUES ('6', 'admin/Hooks/index', '1', 'admin', '1548562760');
INSERT INTO `forum_log` VALUES ('8', 'admin/PointNote/index', '1', 'admin', '1548562780');
INSERT INTO `forum_log` VALUES ('9', 'admin/User/index', '1', 'admin', '1548562783');
INSERT INTO `forum_log` VALUES ('10', 'admin/AdminUser/index', '1', 'admin', '1548562784');
INSERT INTO `forum_log` VALUES ('11', 'admin/Forumcate/index', '1', 'admin', '1548562785');
INSERT INTO `forum_log` VALUES ('12', 'admin/Forum/index', '1', 'admin', '1548562788');
INSERT INTO `forum_log` VALUES ('13', 'admin/Comment/index', '1', 'admin', '1548562789');
INSERT INTO `forum_log` VALUES ('14', 'admin/Message/index', '1', 'admin', '1548562790');
INSERT INTO `forum_log` VALUES ('15', 'admin/System/siteconfig', '1', 'admin', '1548562798');
INSERT INTO `forum_log` VALUES ('16', 'admin/ChangePassword/index', '1', 'admin', '1548562801');
INSERT INTO `forum_log` VALUES ('17', 'admin/Database/index', '1', 'admin', '1548562802');
INSERT INTO `forum_log` VALUES ('18', 'admin/Database/index', '1', 'admin', '1548562809');
INSERT INTO `forum_log` VALUES ('19', 'admin/Forum/index', '1', 'admin', '1548562992');
INSERT INTO `forum_log` VALUES ('20', 'admin/Comment/index', '1', 'admin', '1548562993');
INSERT INTO `forum_log` VALUES ('21', 'admin/Message/index', '1', 'admin', '1548562993');
INSERT INTO `forum_log` VALUES ('22', 'admin/Forumcate/add', '1', 'admin', '1548563006');
INSERT INTO `forum_log` VALUES ('23', 'admin/Forumcate/save', '1', 'admin', '1548563022');
INSERT INTO `forum_log` VALUES ('24', 'admin/Forumcate/index', '1', 'admin', '1548563023');
INSERT INTO `forum_log` VALUES ('25', 'admin/Forumcate/add', '1', 'admin', '1548563030');
INSERT INTO `forum_log` VALUES ('26', 'admin/Forumcate/save', '1', 'admin', '1548563060');
INSERT INTO `forum_log` VALUES ('27', 'admin/Forumcate/index', '1', 'admin', '1548563062');
INSERT INTO `forum_log` VALUES ('28', 'admin/Index/adminindex', '1', 'admin', '1548563104');
INSERT INTO `forum_log` VALUES ('29', 'admin/Index/adminindex', '1', 'admin', '1548563118');
INSERT INTO `forum_log` VALUES ('30', 'admin/Index/adminindex', '1', 'admin', '1548563143');
INSERT INTO `forum_log` VALUES ('31', 'admin/Index/home', '1', 'admin', '1548563144');
INSERT INTO `forum_log` VALUES ('32', 'admin/Index/adminindex', '1', 'admin', '1548563144');
INSERT INTO `forum_log` VALUES ('33', 'admin/Index/home', '1', 'admin', '1548563144');
INSERT INTO `forum_log` VALUES ('34', 'admin/Forumcate/index', '1', 'admin', '1548563147');
INSERT INTO `forum_log` VALUES ('35', 'admin/User/index', '1', 'admin', '1548563482');
INSERT INTO `forum_log` VALUES ('36', 'admin/User/add', '1', 'admin', '1548563484');
INSERT INTO `forum_log` VALUES ('37', 'admin/User/save', '1', 'admin', '1548563507');
INSERT INTO `forum_log` VALUES ('38', 'admin/User/save', '1', 'admin', '1548563518');
INSERT INTO `forum_log` VALUES ('39', 'admin/User/index', '1', 'admin', '1548563519');
INSERT INTO `forum_log` VALUES ('40', 'admin/Nav/index', '1', 'admin', '1548563744');

-- ----------------------------
-- Table structure for `forum_mail_queue`
-- ----------------------------
DROP TABLE IF EXISTS `forum_mail_queue`;
CREATE TABLE `forum_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(120) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `lock_expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum_mail_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `forum_message`
-- ----------------------------
DROP TABLE IF EXISTS `forum_message`;
CREATE TABLE `forum_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '所属会员',
  `touid` int(11) NOT NULL DEFAULT '0' COMMENT '发送对象',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1系统消息2帖子动态',
  `content` text NOT NULL COMMENT '内容',
  `time` varchar(32) NOT NULL COMMENT '时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of forum_message
-- ----------------------------
INSERT INTO `forum_message` VALUES ('1', '11256', '10002', '2', '1', '1548563605', '1', '0');
INSERT INTO `forum_message` VALUES ('2', '10002', '10001', '2', '1', '1548563619', '1', '0');
INSERT INTO `forum_message` VALUES ('3', '0', '0', '1', '好的 ，活动平开始，新年快乐\r\n', '1548593151', '1', '0');

-- ----------------------------
-- Table structure for `forum_nav`
-- ----------------------------
DROP TABLE IF EXISTS `forum_nav`;
CREATE TABLE `forum_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL COMMENT '顶部还是底部',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '内部还是外部',
  `name` varchar(20) NOT NULL COMMENT '导航名称',
  `alias` varchar(20) DEFAULT '' COMMENT '导航别称',
  `link` varchar(255) DEFAULT '' COMMENT '导航链接',
  `icon` varchar(255) DEFAULT '' COMMENT '导航图标',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of forum_nav
-- ----------------------------
INSERT INTO `forum_nav` VALUES ('1', '1', '1', '首页', 'Home', 'index/index', 'wenda', '_blank', '1', '0');

-- ----------------------------
-- Table structure for `forum_point_note`
-- ----------------------------
DROP TABLE IF EXISTS `forum_point_note`;
CREATE TABLE `forum_point_note` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `pointid` int(10) unsigned NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum_point_note
-- ----------------------------
INSERT INTO `forum_point_note` VALUES ('1', 'commentadd', '2', '1', '1', '1548563605');
INSERT INTO `forum_point_note` VALUES ('2', 'commentadd', '2', '2', '1', '1548563619');
INSERT INTO `forum_point_note` VALUES ('3', 'login', '10001', '0', '1', '1548610690');

-- ----------------------------
-- Table structure for `forum_readmessage`
-- ----------------------------
DROP TABLE IF EXISTS `forum_readmessage`;
CREATE TABLE `forum_readmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '消息对象',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of forum_readmessage
-- ----------------------------

-- ----------------------------
-- Table structure for `forum_system`
-- ----------------------------
DROP TABLE IF EXISTS `forum_system`;
CREATE TABLE `forum_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of forum_system
-- ----------------------------
INSERT INTO `forum_system` VALUES ('1', 'site_config', 'a:26:{s:10:\"site_title\";s:27:\"EasyAdmin极简社区系统\";s:9:\"seo_title\";s:38:\"一个ThinkPHP+LayUI极简社区系统\";s:11:\"seo_keyword\";s:37:\"EasyAdmin,ThinkPHP,极简社区系统\";s:15:\"seo_description\";s:116:\"EasyAdmin极简社区系统是基于LayUI模板制作的一套社区系统，后台支撑采用了ThinkPHP5框架。\";s:8:\"site_tpl\";s:7:\"default\";s:4:\"tplh\";s:1:\"0\";s:8:\"user_reg\";s:1:\"1\";s:8:\"forum_sh\";s:1:\"1\";s:8:\"email_sh\";s:1:\"1\";s:8:\"site_yzm\";s:5:\"1,2,4\";s:8:\"site_wjt\";s:1:\"1\";s:12:\"site_keyword\";s:9:\"EasyAdmin\";s:14:\"site_copyright\";s:0:\"\";s:8:\"site_icp\";s:0:\"\";s:11:\"site_tongji\";s:0:\"\";s:6:\"baoliu\";s:0:\"\";s:11:\"smtp_server\";s:12:\"smtp.163.com\";s:9:\"smtp_port\";s:2:\"25\";s:9:\"smtp_user\";s:19:\"17309981908@163.com\";s:9:\"smtp_pass\";s:9:\"5150161aa\";s:7:\"smtp_cs\";s:15:\"49007623@qq.com\";s:11:\"jifen_email\";s:1:\"0\";s:9:\"jifen_reg\";s:1:\"0\";s:11:\"jifen_login\";s:1:\"0\";s:9:\"jifen_add\";s:1:\"0\";s:13:\"jifen_comment\";s:1:\"1\";}');
INSERT INTO `forum_system` VALUES ('2', 'version', '5');

-- ----------------------------
-- Table structure for `forum_user`
-- ----------------------------
DROP TABLE IF EXISTS `forum_user`;
CREATE TABLE `forum_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `money` float(110,2) NOT NULL DEFAULT '0.00',
  `gradename` varchar(20) NOT NULL DEFAULT '普通会员',
  `point` int(10) NOT NULL,
  PRIMARY KEY (`id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of forum_user
-- ----------------------------
INSERT INTO `forum_user` VALUES ('1', '10001', '0.00', '普通会员', '10');

-- ----------------------------
-- Table structure for `forum_usergrade`
-- ----------------------------
DROP TABLE IF EXISTS `forum_usergrade`;
CREATE TABLE `forum_usergrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '名称',
  `score` int(11) NOT NULL COMMENT '等级所需积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员等级表';

-- ----------------------------
-- Records of forum_usergrade
-- ----------------------------
INSERT INTO `forum_usergrade` VALUES ('1', '小白', '12');
INSERT INTO `forum_usergrade` VALUES ('2', '青铜', '25');
INSERT INTO `forum_usergrade` VALUES ('3', '菜鸡', '5');

-- ----------------------------
-- Table structure for `forum_zan`
-- ----------------------------
DROP TABLE IF EXISTS `forum_zan`;
CREATE TABLE `forum_zan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` tinyint(3) unsigned NOT NULL COMMENT '顶部还是底部',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '对方id或者帖子id或者回复的id',
  `time` varchar(20) DEFAULT '0' COMMENT '操作时间',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0 好友  1 帖子2 回复评论',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of forum_zan
-- ----------------------------
INSERT INTO `forum_zan` VALUES ('1', '2', '1', '1548563629', '2');
