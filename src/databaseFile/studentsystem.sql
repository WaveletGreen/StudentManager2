/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : root

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-23 06:54:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for studentsystem
-- ----------------------------
DROP TABLE IF EXISTS `studentsystem`;
CREATE TABLE `studentsystem` (
  `Sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `Name` varchar(50) DEFAULT NULL COMMENT '学生姓名',
  `Sex` char(2) DEFAULT NULL COMMENT '年龄',
  `Age` int(11) DEFAULT NULL,
  `Grade` varchar(20) DEFAULT NULL COMMENT '所在年级',
  `Major` varchar(50) DEFAULT NULL COMMENT '主修专业',
  `Address` varchar(50) DEFAULT NULL COMMENT '所在地址',
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2017020104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentsystem
-- ----------------------------
INSERT INTO `studentsystem` VALUES ('2017020101', '管成为', '男', '26', '大七', '艺术', '杭州');
INSERT INTO `studentsystem` VALUES ('2017020102', '夜里好', '男', '23', '大四', '机械', '杭州');
INSERT INTO `studentsystem` VALUES ('2017020103', 'sss', '男', '23', '大四', '机械', '杭州');
