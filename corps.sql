/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : corps

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2016-07-21 09:22:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `score` tinyint(2) NOT NULL DEFAULT '0' COMMENT '十分制',
  `comment` text,
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `images` text,
  `dolike` int(11) NOT NULL DEFAULT '0' COMMENT '点赞',
  `isdel` tinyint(1) NOT NULL DEFAULT '0',
  `object_id` varchar(50) NOT NULL COMMENT '评价对象 ：tablename_tableid',
  `obejct_pid` varchar(50) DEFAULT NULL COMMENT '评价父对象 ：tablename_tableid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '权重',
  `intro` varchar(255) DEFAULT NULL COMMENT '简介',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '阶段',
  `industry_type` tinyint(4) DEFAULT NULL COMMENT '行业类型',
  `address` varchar(255) DEFAULT NULL,
  `zip_code` char(6) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL COMMENT '经度',
  `lat` varchar(15) DEFAULT NULL COMMENT '纬度',
  `create_time` datetime DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL COMMENT '网址',
  `slogan` varchar(255) DEFAULT NULL COMMENT '口号',
  `stock_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `company_department`
-- ----------------------------
DROP TABLE IF EXISTS `company_department`;
CREATE TABLE `company_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `industry_type` tinyint(4) DEFAULT NULL COMMENT '行业类型',
  `address` varchar(255) DEFAULT NULL COMMENT '办公地点',
  `cid` int(11) NOT NULL COMMENT '企业id',
  `zip_code` char(6) DEFAULT NULL COMMENT '邮编',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '权重',
  `lng` varchar(15) DEFAULT NULL COMMENT '经度',
  `lat` varchar(15) DEFAULT NULL COMMENT '纬度',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of company_department
-- ----------------------------

-- ----------------------------
-- Table structure for `company_relations`
-- ----------------------------
DROP TABLE IF EXISTS `company_relations`;
CREATE TABLE `company_relations` (
  `cid` int(11) NOT NULL COMMENT '公司id',
  `pcid` int(11) NOT NULL COMMENT '父类公司id',
  PRIMARY KEY (`cid`,`pcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of company_relations
-- ----------------------------

-- ----------------------------
-- Table structure for `config_constants`
-- ----------------------------
DROP TABLE IF EXISTS `config_constants`;
CREATE TABLE `config_constants` (
  `name` varchar(50) NOT NULL,
  `enname` varchar(50) NOT NULL,
  UNIQUE KEY `enname_index` (`enname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of config_constants
-- ----------------------------
INSERT INTO `config_constants` VALUES ('公司发展阶段', 'corp_dev_level');
INSERT INTO `config_constants` VALUES ('行业类型', 'industry_type');
INSERT INTO `config_constants` VALUES ('IT技能人员数', 'it_employee_count');
INSERT INTO `config_constants` VALUES ('股票编码', 'stack_code');
INSERT INTO `config_constants` VALUES ('员工总数', 'total_employee_count');

-- ----------------------------
-- Table structure for `config_enum`
-- ----------------------------
DROP TABLE IF EXISTS `config_enum`;
CREATE TABLE `config_enum` (
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  UNIQUE KEY `type_code_index` (`code`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of config_enum
-- ----------------------------

-- ----------------------------
-- Table structure for `data`
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `object_id` varchar(50) NOT NULL,
  `key` varchar(20) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  UNIQUE KEY `object_id_key` (`object_id`,`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of data
-- ----------------------------

-- ----------------------------
-- Table structure for `production`
-- ----------------------------
DROP TABLE IF EXISTS `production`;
CREATE TABLE `production` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `intro` varchar(255) DEFAULT NULL COMMENT '简介',
  `site` varchar(255) DEFAULT NULL COMMENT '获取网址',
  `images` text,
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT '权重',
  `cid` int(11) DEFAULT NULL COMMENT '产品id',
  `dep_id` int(11) DEFAULT NULL COMMENT '部门id',
  `code` varchar(20) DEFAULT NULL COMMENT '产品编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of production
-- ----------------------------
