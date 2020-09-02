/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : 5704

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-03-15 22:05:04
*/

USE 5704;
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `fans`
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans` (
  `id` varchar(32) NOT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `updatetime` date DEFAULT NULL,
  `user` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fans
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` varchar(32) NOT NULL,
  `LANGUAGE` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SECURECONF` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `MIDNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `JOBTITLE` varchar(255) DEFAULT NULL,
  `DEPARTMENT` varchar(255) DEFAULT NULL,
  `GENDER` varchar(255) DEFAULT NULL,
  `BIRTHDAY` varchar(255) DEFAULT NULL,
  `NICKNAME` varchar(255) DEFAULT NULL,
  `USERTYPE` varchar(255) DEFAULT NULL,
  `ORGI` varchar(50) DEFAULT NULL,
  -- `SEARCHPROJECTID` varchar(255) DEFAULT NULL,
  `CREATER` varchar(32) DEFAULT NULL,
  `CREATETIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `UPDATETIME` timestamp NULL DEFAULT NULL,
  `ORGAN` varchar(32) DEFAULT NULL,
  `MOBILE` varchar(32) DEFAULT NULL,
  `passupdatetime` timestamp NULL DEFAULT NULL,
  `sign` text,
  -- `del` tinyint(4) DEFAULT '0',
  -- `uname` varchar(100) DEFAULT NULL,
  -- `musteditpassword` tinyint(4) DEFAULT NULL,
  `AGENT` tinyint(4) DEFAULT NULL,
  `SKILL` varchar(512) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `fans` int(11) DEFAULT NULL,
  `follows` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `deactivetime` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,

  `name` varchar(255) DEFAULT NULL,
  `sno` varchar(255) DEFAULT NULL,
  -- `gender` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `room_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `parent_phone` varchar(255) DEFAULT NULL,
  `join_time` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `description` MEDIUMTEXT DEFAULT NULL,
  `remark` MEDIUMTEXT DEFAULT NULL,
  -- `project` varchar(255) DEFAULT NULL,
  -- `achievement` varchar(255) DEFAULT NULL,

  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
-- username admin password 123456
INSERT INTO `user` VALUES ('297e8c7b455798280145579c73e501c1', '汉语+英语', 'admin', '', '5', 'admin@5704.com', '管', '理', '员', '管理工作', '管理员部门', '男', '2019-08-14', '我是管理员', '0', NULL, 'Davies', '2017-02-14 11:19:46', '2017-03-12 18:06:29', '管理员组织部门', '18500000000', '2017-02-14 11:19:46', '世界上最遥远的距离不是生与死，而是你亲手制造的BUG就在你眼前，你却怎么都找不到她``````', '0', '管理5704系统', '四川省', '成都', '0', '1', '134', '2019-08-19 14:43:54', NULL, NULL, '超级管理员', '管理员', '', '2019', '计算机类', '#319', '18500000000', '18500000000', '2019-09-09', '核心成员', '我是管理员', '系统管理员');
INSERT INTO `user` VALUES ('397e8c7b455798280145579c73e501c1', '汉语+英语', 'davies', '', '5', 'davies@5704.com', '管', '理', '员', '管理工作', '管理员部门', '男', '2019-08-14', 'Davies', '0', NULL, 'Davies', '2017-02-14 11:19:46', '2017-03-12 18:06:29', '管理员组织部门', '18500000000', '2017-02-14 11:19:46', '我们不生产代码，我们只是github的搬运工。', '0', '管理5704系统', '四川省', '成都', '0', '1', '587', '2019-08-19 14:43:54', NULL, NULL, '超级管理员', 'Davies', '', '2019', '计算机类', '#319', '18500000000', '18500000000', '2019-09-09', '核心成员', 'I\'m 管理员', '5704系统管理员');
INSERT INTO `user` VALUES ('497e8c7b455798280145579c73e501c1', '汉语', 'user', '', '5', 'davies@5704.com', '普通', '用户', '啊', '发帖', '码农', '男', '2019-08-14', 'user', '1', NULL, 'Davies', '2017-02-14 11:19:46', '2017-03-12 18:06:29', '码农部门', '18500000000', '2017-02-14 11:19:46', '“借我1000块钱”，”再给你24，凑个整！”', '0', '只会敲代码', '四川省', '成都', '0', '1', '14', '2019-08-19 14:43:54', NULL, NULL, '我不是管理员', 'User', '201913160700', '2019', '计算机类', '#319', '18500000000', '18500000000', '2019-09-09', '普通成员', '我只是一个普通成员', '没有备注');


-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `principal` varchar(32) DEFAULT NULL,
  `match` varchar(255) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `description` MEDIUMTEXT DEFAULT NULL,
  `remark` MEDIUMTEXT DEFAULT NULL,
  -- `achievement` varchar(255) DEFAULT NULL,
  -- `members` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (principal)
  REFERENCES user(id)
  ON UPDATE CASCADE
  ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO  `project` VALUES('ff8080816cb713c1016cb718c6370020','5704管理平台','397e8c7b455798280145579c73e501c1','未参加任何比赛','接近完成','5704管理平台供工作室内部使用','5704管理平台由Davies开发');

-- ----------------------------
-- Table structure for `achievement`
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `description` MEDIUMTEXT DEFAULT NULL,
  `remark` MEDIUMTEXT DEFAULT NULL,
  -- `project` varchar(255) DEFAULT NULL,
  -- `members` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `achievement` VALUES ('ff8080816cb74fd9016cb751cb2b0009','5704管理平台软件著作第一著作人','软件著作','0123456789','5704管理平台由Davies开发','5704管理平台软件著作由2019年12月3日获得');

-- ----------------------------
-- Many-to-Many Table for `user_achievement`
-- ----------------------------
DROP TABLE IF EXISTS `user_achievement`;
CREATE TABLE `user_achievement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) DEFAULT NULL,
  `achievement_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),

  FOREIGN KEY (user_id)
  REFERENCES user(id)
  ON UPDATE CASCADE
  ON DELETE NO ACTION,
  FOREIGN KEY (achievement_id)
  REFERENCES achievement(id)
  ON UPDATE CASCADE
  ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO  `user_achievement` (user_id,achievement_id) VALUES('297e8c7b455798280145579c73e501c1','ff8080816cb74fd9016cb751cb2b0009');
INSERT INTO  `user_achievement` (user_id,achievement_id) VALUES('397e8c7b455798280145579c73e501c1','ff8080816cb74fd9016cb751cb2b0009');


-- ----------------------------
-- Many-to-Many Table for `user_project`
-- ----------------------------
DROP TABLE IF EXISTS `user_project`;
CREATE TABLE `user_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) DEFAULT NULL,
  `project_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),

  FOREIGN KEY (user_id)
  REFERENCES user(id)
  ON UPDATE CASCADE
  ON DELETE NO ACTION,
  FOREIGN KEY (project_id)
  REFERENCES project(id)
  ON UPDATE CASCADE
  ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO  `user_project` (user_id,project_id) VALUES('297e8c7b455798280145579c73e501c1','ff8080816cb713c1016cb718c6370020');
INSERT INTO  `user_project` (user_id,project_id) VALUES('397e8c7b455798280145579c73e501c1','ff8080816cb713c1016cb718c6370020');
INSERT INTO  `user_project` (user_id,project_id) VALUES('497e8c7b455798280145579c73e501c1','ff8080816cb713c1016cb718c6370020');

-- ----------------------------
-- Many-to-Many Table for `project_achievement`
-- ----------------------------
DROP TABLE IF EXISTS `project_achievement`;
CREATE TABLE `project_achievement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` varchar(32) DEFAULT NULL,
  `achievement_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),

  FOREIGN KEY (project_id)
  REFERENCES project(id)
  ON UPDATE CASCADE
  ON DELETE NO ACTION,
  FOREIGN KEY (achievement_id)
  REFERENCES achievement(id)
  ON UPDATE CASCADE
  ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO  `project_achievement` (project_id,achievement_id) VALUES('ff8080816cb713c1016cb718c6370020','ff8080816cb74fd9016cb751cb2b0009');

-- ----------------------------
-- Table structure for `userevent`
-- ----------------------------
DROP TABLE IF EXISTS `userevent`;
CREATE TABLE `userevent` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(32) DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `orgi` varchar(50) DEFAULT NULL,
  `maintype` varchar(32) DEFAULT NULL,
  `subtype` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `admin` tinyint(32) DEFAULT NULL,
  `access` tinyint(32) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `isp` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sessionid` varchar(32) DEFAULT NULL,
  `param` text,
  `times` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ostype` varchar(50) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `model` varchar(10) DEFAULT NULL,
  `appid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userevent
-- ----------------------------
