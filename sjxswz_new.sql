/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.16-log : Database - sjxswz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sjxswz` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sjxswz`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `reallyname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  `shengri` date DEFAULT NULL,
  `xueli` varchar(50) DEFAULT NULL,
  `shenfen` varchar(50) DEFAULT '1',
  PRIMARY KEY (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`pwd`,`reallyname`,`sex`,`qq`,`email`,`phone`,`address`,`postcode`,`shengri`,`xueli`,`shenfen`) values (1,'admin','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(2,'lisi','123','李四','男','456789123','222@163.com','13545678912','北京市相辅相成区','123456','2016-01-27','大专','1');

/*Table structure for table `cake` */

DROP TABLE IF EXISTS `cake`;

CREATE TABLE `cake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `leibie` varchar(50) DEFAULT NULL,
  `date` text,
  `baozhuang` text,
  `cunyu` text,
  `pinpai` text,
  `price` int(11) DEFAULT NULL,
  `shuoming` text,
  `img` varchar(100) DEFAULT NULL,
  `kuchun` int(11) DEFAULT NULL,
  `advice` varchar(500) DEFAULT NULL COMMENT '用户评价',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9000024 DEFAULT CHARSET=utf8;

/*Data for the table `cake` */

insert  into `cake`(`id`,`name`,`leibie`,`date`,`baozhuang`,`cunyu`,`pinpai`,`price`,`shuoming`,`img`,`kuchun`,`advice`) values (9000014,'双层冰雪奇缘蛋糕','儿童蛋糕','300天','盒装','0-8℃','返湾湖',228,'蛋糕尺寸18寸','pic/11.jpg',99,'很好吃，值得购买！'),(9000015,'东莞蛋糕','鲜奶水果蛋糕','7天','盒装','冷藏0-8度','花语蛋糕',188,'非常好吃','pic/13.jpg',98,NULL),(9000016,'Olive烘焙彩虹','个性蛋糕','7天','盒装','0-8度','olive',288,'好吃','pic/14.jpg',98,NULL),(9000017,'巴特烘焙裸蛋糕','巴特烘焙','7天','盒装','0-8度','巴特烘焙',178,'好吃','pic/15.jpg',99,NULL),(9000018,'水果生日蛋糕','水果蛋糕','10天','盒装','0-4℃冷藏','树上茗香',198,'北京重庆天津石家庄济南福州预定水果生日蛋糕店同城速递全国配送','pic/1.jpg',102,NULL),(9000019,'情人节蛋糕','情人节蛋糕','10','盒装','冷藏0-4℃','百果楼',100,'好吃','pic/2.jpg',98,NULL),(9000020,'美人鱼','订做生日蛋糕','7天','盒装','0-4℃冷藏','树上茗香',321,'好吃','pic/4.jpg',128,NULL),(9000021,'双层迪士尼Frozen','双层蛋糕','7天','盒装','533','名典',531,'53双层迪士尼Frozen冰雪奇缘','pic/3.jpg',5532,'实惠划算！'),(9000022,'睡美人蛋糕','情人蛋糕','7天','盒装','正常','睡美人',321,'好吃的蛋糕','pic/6.jpg',327,'睡美人好吃又好看');

/*Table structure for table `dandu` */

DROP TABLE IF EXISTS `dandu`;

CREATE TABLE `dandu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `dandu` */

insert  into `dandu`(`id`,`content`) values (1,'<p>如何订购 <br />\r\n2017-2-21</p>\r\n<p>订购方式<br />\r\n<br />\r\n①&nbsp; QQ/MSN/在线客服<br />\r\n<br />\r\n②&nbsp; 电话订购（400-88888888）<br />\r\n<br />\r\n③&nbsp; 网上直接提交订单（新订单/快订单）</p>\r\n<p>&nbsp;</p>'),(2,'<div class=\"help_txt\" align=\"left\">\r\n<p>建于2017年自己发挥自己填写</p>\r\n</div>'),(3,'<p>\r\n<p>&nbsp;</p>\r\n<p style=\"line-height: 200%; margin-top: 6px\">&nbsp;</p>\r\n</p>\r\n<p>建于2017年自己发挥自己填写</p>\r\n<p style=\"line-height: 200%; margin-top: 6px\">&nbsp;</p>'),(4,'<p>建于2017年自己发挥自己填写</p>'),(5,'<p>自己修改自己发挥</p>');

/*Table structure for table `dizhi` */

DROP TABLE IF EXISTS `dizhi`;

CREATE TABLE `dizhi` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `userid` int(32) DEFAULT NULL COMMENT '用户id',
  `dizhi` varchar(500) DEFAULT NULL COMMENT '地址',
  `sfmr` varchar(10) DEFAULT '否' COMMENT '是否默认地址，',
  `zt` varchar(10) DEFAULT '有效' COMMENT '状态，是否有效',
  `bz1` varchar(100) DEFAULT NULL COMMENT '预留字段',
  `bz2` varchar(200) DEFAULT NULL,
  `bz3` varchar(200) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `tel` varchar(20) DEFAULT NULL COMMENT '收货人联系方式',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40008 DEFAULT CHARSET=utf8;

/*Data for the table `dizhi` */

insert  into `dizhi`(`id`,`userid`,`dizhi`,`sfmr`,`zt`,`bz1`,`bz2`,`bz3`,`name`,`tel`) values (40001,1,'福州市仓山万达','否','有效',NULL,NULL,NULL,'张三','13159123456'),(40002,1,'福州市台江步行街','否','有效',NULL,NULL,NULL,'李四','15394412222'),(40004,1,'福州师范大学','否','有效',NULL,NULL,NULL,'王五','15396012365'),(40005,1,'福州师范大学','否','无效',NULL,NULL,NULL,'王五','15396012365'),(40006,1,'测试地址','是','有效',NULL,NULL,NULL,'测试','15394412222');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `neirong` varchar(50) DEFAULT NULL,
  `huifu` varchar(50) DEFAULT NULL,
  `shijian` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`name`,`phone`,`email`,`neirong`,`huifu`,`shijian`) values (2,'张三','13892928181','123@126.com','你们什么时候开始生产美好蛋糕','你好 我们马上就快了','2017-03-01 12:19:16');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usersid` int(11) DEFAULT NULL,
  `shijian` datetime DEFAULT NULL,
  `fahuo` varchar(50) DEFAULT '未发货',
  `huifu` varchar(50) DEFAULT '未回复',
  `adminid` int(11) DEFAULT NULL,
  `yeji` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40200041 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`usersid`,`shijian`,`fahuo`,`huifu`,`adminid`,`yeji`) values (40200030,1,'2017-02-23 09:53:21','未发货','你好',1,178),(40200031,1,'2017-02-23 09:57:14','已发货','发琥珀了',2,576),(40200032,1,'2017-03-01 12:11:58','未发货','未回复',NULL,321),(40200035,1,'2017-04-25 21:46:36','未发货','未回复',NULL,228),(40200039,1,'2017-04-25 21:50:02','未发货','未回复',NULL,321),(40200040,1,'2017-04-25 22:14:32','未发货','未回复',NULL,1040);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `reallyname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`pwd`,`reallyname`,`sex`,`qq`,`email`,`phone`,`address`,`postcode`) values (1,'111','111','张三','男','123456789','222@163.com','13545678912','北京市相辅相成区','123456');

/*Table structure for table `xiangxi` */

DROP TABLE IF EXISTS `xiangxi`;

CREATE TABLE `xiangxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordersid` int(11) DEFAULT NULL,
  `cakeid` int(11) DEFAULT NULL,
  `sums` int(11) DEFAULT NULL,
  `dizhiid` int(32) DEFAULT NULL COMMENT '地址表id',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Data for the table `xiangxi` */

insert  into `xiangxi`(`id`,`ordersid`,`cakeid`,`sums`,`dizhiid`) values (64,40200030,9000017,1,NULL),(65,40200031,9000016,2,NULL),(66,40200032,9000020,1,NULL),(67,40200033,9000015,1,NULL),(68,40200034,9000022,1,NULL),(69,40200033,9000019,1,NULL),(70,40200033,9000020,1,NULL),(71,40200032,9000021,1,NULL),(72,40200032,9000019,1,NULL),(73,40200039,9000022,1,40006),(74,40200040,9000022,1,40006),(75,40200040,9000015,1,40006),(76,40200040,9000021,1,40006);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
