/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.20 : Database - test1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test1`;

/*Table structure for table `e_order` */

DROP TABLE IF EXISTS `e_order`;

CREATE TABLE `e_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` bigint(30) DEFAULT NULL COMMENT '用户ID',
  `order_status` tinyint(1) DEFAULT NULL COMMENT '订单状态0未完成，1已完成， 2已取消， 3已过期',
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `pay_status` tinyint(1) DEFAULT NULL COMMENT '支付状态0未付款， 1已付款',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '商品总价格',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `delivery_status` tinyint(1) DEFAULT NULL COMMENT '配送状态 0待确认， 2配送中， 9配送完成',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '是否删除0否，1是',
  `return_total_score` int(11) DEFAULT NULL COMMENT '奖励积分',
  `refund_amount` varchar(50) DEFAULT NULL COMMENT '退款账号',
  `province` varchar(30) DEFAULT NULL COMMENT '省',
  `city` varchar(50) DEFAULT NULL COMMENT '市',
  `area` varchar(50) DEFAULT NULL COMMENT '区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `mobile` varchar(18) DEFAULT NULL COMMENT '联系电话',
  `zip` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL COMMENT '收货人',
  `deal_total_price` decimal(10,2) DEFAULT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '折扣价',
  `delivery_fee` decimal(10,2) DEFAULT NULL COMMENT '运费',
  `payment_id` varchar(50) DEFAULT NULL COMMENT '第三方支付流水码',
  `refund_money` varchar(255) DEFAULT NULL COMMENT '退款金额',
  `refund_status` tinyint(1) DEFAULT NULL COMMENT '退款状态 0无需退款，1退款完成， 2退款中， 3退款驳回',
  `org_id` bigint(11) DEFAULT NULL COMMENT '组织ID/停车场ID',
  `packet_id` bigint(11) DEFAULT NULL COMMENT '红包ID',
  `packet_money` decimal(10,2) DEFAULT NULL COMMENT '红包扣除金额',
  `order_send_time` varchar(50) DEFAULT NULL COMMENT '订单送达时间',
  `order_last_time` varchar(50) DEFAULT NULL COMMENT '实际送达时间',
  `ticket_id` bigint(11) DEFAULT NULL COMMENT '发票id',
  `is_order_type` tinyint(4) DEFAULT NULL COMMENT '订单类型:0,正常订单;1,积分订单',
  `total_score` int(11) DEFAULT NULL COMMENT '扣除积分',
  `order_comment` tinyint(2) DEFAULT NULL COMMENT '订单评论状态:0,未评论;1,已评论',
  `goods_con_num` int(11) DEFAULT NULL COMMENT '订单下面商品总数量',
  `delivery_code` varchar(255) DEFAULT NULL COMMENT '配送验证码',
  `delivery_user_id` int(11) DEFAULT NULL COMMENT '配送者id',
  `surplus_money` decimal(10,2) DEFAULT NULL COMMENT '不够起送价多余价格',
  `favorable_user_id` int(11) DEFAULT NULL COMMENT '优惠券id',
  `favorable_user_money` int(11) DEFAULT NULL COMMENT '优惠券金额',
  `location_money` decimal(11,2) DEFAULT NULL COMMENT '停车场最终结算价格',
  `location_money_status` tinyint(2) DEFAULT NULL COMMENT '停车场收入订单状态:0,没操作过;1,已操作',
  `pay_time` varchar(50) DEFAULT NULL COMMENT '支付时间',
  `package_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;

/*Table structure for table `e_order_items` */

DROP TABLE IF EXISTS `e_order_items`;

CREATE TABLE `e_order_items` (
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细ID',
  `target_id` bigint(20) DEFAULT NULL COMMENT '关联ID',
  `money` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `num` int(10) DEFAULT NULL COMMENT '数量',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `unit_id` varchar(100) DEFAULT NULL COMMENT '购买物ID/车牌号',
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` varchar(255) DEFAULT NULL,
  `ext5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `e_role` */

DROP TABLE IF EXISTS `e_role`;

CREATE TABLE `e_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `update_time` varchar(50) DEFAULT NULL COMMENT '更新时间',
  `obj1` varchar(255) DEFAULT NULL COMMENT '预留字段1',
  `obj2` varchar(255) DEFAULT NULL COMMENT '预留字段2',
  `obj3` varchar(255) DEFAULT NULL COMMENT '预留字段3',
  `obj4` varchar(255) DEFAULT NULL COMMENT '预留字段4',
  `obj5` varchar(255) DEFAULT NULL COMMENT '预留字段5',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `e_service` */

DROP TABLE IF EXISTS `e_service`;

CREATE TABLE `e_service` (
  `service_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `service_state` int(10) DEFAULT NULL COMMENT '服务状态：0 申请状态；可报名；2不可报名',
  `service_type` bigint(20) DEFAULT NULL COMMENT '设备型号(对应EqpType)',
  `name` varchar(200) DEFAULT '' COMMENT '名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `hidden` tinyint(4) DEFAULT NULL COMMENT '是否隐藏0：不隐藏  1：隐藏',
  `image` varchar(100) DEFAULT NULL COMMENT '设备图标',
  `update_time` varchar(50) DEFAULT NULL COMMENT '更新时间',
  `end_time` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `obj1` varchar(255) DEFAULT NULL,
  `obj2` varchar(255) DEFAULT NULL,
  `obj3` varchar(255) DEFAULT NULL COMMENT '预留字段3',
  `obj4` varchar(255) DEFAULT NULL COMMENT '预留字段4',
  `obj5` varchar(255) DEFAULT NULL COMMENT '预留字段5',
  `month_price` decimal(10,2) DEFAULT NULL COMMENT '包月价格(*元/每小时)',
  PRIMARY KEY (`service_id`),
  KEY `fk_eEqpEquipment_eEqpType_1` (`service_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2034 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `e_service_apply` */

DROP TABLE IF EXISTS `e_service_apply`;

CREATE TABLE `e_service_apply` (
  `apply_id` varchar(20) NOT NULL COMMENT '活动申请id',
  `service_id` varchar(20) DEFAULT NULL COMMENT '活动Id',
  `user_id` varchar(20) DEFAULT NULL COMMENT '申请人ID',
  `create_time` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `e_service_evaluate` */

DROP TABLE IF EXISTS `e_service_evaluate`;

CREATE TABLE `e_service_evaluate` (
  `evaluate_id` varchar(20) NOT NULL COMMENT '评价ID',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `service_id` varchar(20) DEFAULT NULL COMMENT '服务ID',
  `order_id` varchar(20) DEFAULT NULL COMMENT '订单ID',
  `create_time` varchar(20) DEFAULT NULL COMMENT '描述',
  `describe` varchar(30) DEFAULT NULL COMMENT '满意程度',
  `img` varchar(20) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`evaluate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `e_service_info` */

DROP TABLE IF EXISTS `e_service_info`;

CREATE TABLE `e_service_info` (
  `service_info_id` varchar(20) NOT NULL COMMENT '服务详情ID',
  `service_id` varchar(20) DEFAULT NULL COMMENT '服务ID',
  `name` varchar(200) DEFAULT NULL COMMENT '名字',
  PRIMARY KEY (`service_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `e_system` */

DROP TABLE IF EXISTS `e_system`;

CREATE TABLE `e_system` (
  `id` varchar(20) NOT NULL COMMENT 'ID',
  `name` varchar(20) DEFAULT NULL COMMENT '名字',
  `des` varbinary(200) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `img` varchar(20) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `e_system_company` */

DROP TABLE IF EXISTS `e_system_company`;

CREATE TABLE `e_system_company` (
  `company_id` varchar(20) NOT NULL COMMENT 'id',
  `company_name` varchar(30) DEFAULT NULL COMMENT '公司名字',
  `company_login` varchar(50) DEFAULT NULL COMMENT '公司logo',
  `company_des` varchar(50) DEFAULT NULL COMMENT '公司简介',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `e_user` */

DROP TABLE IF EXISTS `e_user`;

CREATE TABLE `e_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(100) DEFAULT '' COMMENT '用户名',
  `user_mobile` varchar(50) DEFAULT '' COMMENT '手机号',
  `user_state` tinyint(4) DEFAULT '0' COMMENT '0-超级管理员；1-企业管理员；2用户；3停车场主；4商户；5管理员',
  `sex` tinyint(4) DEFAULT '0' COMMENT '0:男  1：女',
  `nick_name` varchar(100) DEFAULT '' COMMENT '别名',
  `user_area` varchar(100) DEFAULT '' COMMENT '用户区域',
  `user_address` varchar(100) DEFAULT '' COMMENT '地址',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `user_password` varchar(100) DEFAULT '' COMMENT '密码',
  `birthday` varchar(100) DEFAULT '' COMMENT '生日',
  `reg_time` varchar(100) DEFAULT '' COMMENT '注册时间',
  `last_time` varchar(100) DEFAULT '' COMMENT '最后登录时间',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `weibo` varchar(100) DEFAULT '' COMMENT '微博',
  `weixin` varchar(100) DEFAULT '' COMMENT '微信',
  `is_validated` tinyint(4) DEFAULT '0' COMMENT '0:不可用， 1：可用',
  `header_img` varchar(100) DEFAULT '' COMMENT '头像',
  `userType` tinyint(4) DEFAULT '2' COMMENT '0-超级管理员；1-企业管理员；2用户；3员工；',
  `obj3` varchar(255) DEFAULT '',
  `obj4` varchar(255) DEFAULT '',
  `obj5` varchar(255) DEFAULT '',
  `obj1` varchar(255) DEFAULT '',
  `obj6` varchar(255) DEFAULT '',
  `obj2` varchar(255) DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `e_user_complaint` */

DROP TABLE IF EXISTS `e_user_complaint`;

CREATE TABLE `e_user_complaint` (
  `complaint_id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '投诉ID',
  `user_id` bigint(22) DEFAULT NULL COMMENT '用户ID',
  `service_id` bigint(22) DEFAULT NULL COMMENT '服务ID',
  `complaint_type` varchar(255) DEFAULT NULL COMMENT '服务类型',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `img` varchar(255) DEFAULT NULL COMMENT '上传图片',
  `add_time` varchar(50) DEFAULT NULL COMMENT ' 添加时间',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 0:未审核，1:已审核，2：驳回',
  `back_description` varchar(255) DEFAULT NULL COMMENT '处理结果',
  `evaluate` varchar(255) DEFAULT NULL COMMENT '评价：1非常满意；2满意，3一般，4不满意，5非常不满意',
  `obj3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `e_user_info` */

DROP TABLE IF EXISTS `e_user_info`;

CREATE TABLE `e_user_info` (
  `user_info_id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `dead_time` varchar(50) DEFAULT NULL COMMENT '产品使用截止时间(APP)',
  `obj2` varchar(255) DEFAULT NULL COMMENT '预留2(注册支付方式 0：支付宝，1：微信)',
  `obj3` varchar(255) DEFAULT NULL COMMENT '预留3',
  `refund_amount` varchar(50) DEFAULT NULL COMMENT '退款账号',
  `money` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `frozen_money` decimal(10,2) DEFAULT NULL COMMENT '押金',
  `package_id` int(11) NOT NULL COMMENT '套餐ID, 对应e_user_package表',
  `pay_account` varchar(150) DEFAULT NULL COMMENT '押金支付帐号',
  `obj4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_info_id`,`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `e_user_queue` */

DROP TABLE IF EXISTS `e_user_queue`;

CREATE TABLE `e_user_queue` (
  `queue_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `service_id` varchar(30) DEFAULT NULL COMMENT '服务ID',
  `add_time` varchar(50) DEFAULT NULL COMMENT '预约时间',
  `org_id` bigint(20) DEFAULT NULL COMMENT '停车场ID',
  `time_length` int(11) DEFAULT NULL COMMENT '预估到位时长(分钟)',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态：0等待中， 1取消， 2超时，3预约进行中， 4完成， 5.排队待确定',
  PRIMARY KEY (`queue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
