/*
 Navicat Premium Data Transfer

 Source Server         : 121.43.116.27-aliyun
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 121.43.116.27
 Source Database       : taokeeper

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : utf-8

 Date: 03/26/2016 00:33:05 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `alarm_settings`
-- ----------------------------
DROP TABLE IF EXISTS `alarm_settings`;
CREATE TABLE `alarm_settings` (
  `alarm_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `cluster_id` int(11) NOT NULL,
  `wangwang_list` varchar(255) DEFAULT NULL,
  `phone_list` varchar(255) DEFAULT NULL,
  `email_list` varchar(255) DEFAULT NULL,
  `max_delay_of_check` varchar(255) DEFAULT NULL,
  `max_cpu_usage` varchar(255) DEFAULT NULL,
  `max_memory_usage` varchar(255) DEFAULT NULL,
  `max_load` varchar(255) DEFAULT NULL,
  `max_connection_per_ip` varchar(255) DEFAULT NULL,
  `max_watch_per_ip` varchar(255) DEFAULT NULL,
  `data_dir` varchar(255) DEFAULT NULL,
  `data_log_dir` varchar(255) DEFAULT NULL,
  `max_disk_usage` varchar(255) DEFAULT NULL,
  `node_path_check_rule` text,
  PRIMARY KEY (`alarm_settings_id`),
  UNIQUE KEY `uk_alarm_settings_cid` (`cluster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Records of `alarm_settings`
-- ----------------------------
BEGIN;
INSERT INTO `alarm_settings` VALUES ('1', '1', '银时', '15869027928', 'yinshi.nc@taobao.com', '5', '60', '70', '2', '200', '1000', '/home/yinshi.nc', '/home/yinshi.nc', '70', null);
COMMIT;

-- ----------------------------
--  Table structure for `taokeeper_settings`
-- ----------------------------
DROP TABLE IF EXISTS `taokeeper_settings`;
CREATE TABLE `taokeeper_settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `env_name` varchar(20) DEFAULT NULL,
  `max_threads_of_zookeeper_check` int(5) DEFAULT NULL,
  `description` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`settings_id`),
  UNIQUE KEY `uk_alarm_settings_cid` (`env_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Records of `taokeeper_settings`
-- ----------------------------
BEGIN;
INSERT INTO `taokeeper_settings` VALUES ('1', 'My TaoKeeper', '5', '我的TaoKeepe');
COMMIT;

-- ----------------------------
--  Table structure for `taokeeper_stat`
-- ----------------------------
DROP TABLE IF EXISTS `taokeeper_stat`;
CREATE TABLE `taokeeper_stat` (
  `cluster_id` int(11) NOT NULL,
  `server` varchar(30) NOT NULL COMMENT '127.0.0.1:2181',
  `stat_date_time` datetime NOT NULL COMMENT '统计时间 2012-01-05 14:56:20',
  `stat_date` date NOT NULL,
  `connections` int(11) DEFAULT NULL,
  `watches` int(11) DEFAULT NULL COMMENT '订阅者数目',
  `send_times` bigint(20) unsigned DEFAULT '0',
  `receive_times` bigint(20) unsigned DEFAULT '0',
  `node_count` int(11) DEFAULT '0',
  `rwps` varchar(255) NOT NULL,
  PRIMARY KEY (`cluster_id`,`server`,`stat_date_time`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `zookeeper_cluster`
-- ----------------------------
DROP TABLE IF EXISTS `zookeeper_cluster`;
CREATE TABLE `zookeeper_cluster` (
  `cluster_id` int(11) NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(255) NOT NULL,
  `server_list` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cluster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Records of `zookeeper_cluster`
-- ----------------------------
BEGIN;
INSERT INTO `zookeeper_cluster` VALUES ('1', 'MyTest', '121.43.116.27:2181', 'MyTest');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
