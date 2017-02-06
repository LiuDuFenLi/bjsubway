/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.15 : Database - subway
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`subway` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `subway`;

/*Table structure for table `all_lines` */

DROP TABLE IF EXISTS `all_lines`;

CREATE TABLE `all_lines` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `line_id` tinyint(2) unsigned NOT NULL COMMENT '线路id',
  `line_name` char(10) NOT NULL COMMENT '线路名称',
  `is_huan` tinyint(1) unsigned NOT NULL COMMENT '1是环线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `all_lines` */

insert  into `all_lines`(`id`,`line_id`,`line_name`,`is_huan`) values (1,1,'一号线',0),(2,2,'二号线',1),(3,4,'四号线',0),(4,5,'五号线',0),(5,6,'六号线',0),(6,8,'八号线',0),(7,9,'九号线',0);

/*Table structure for table `line_1` */

DROP TABLE IF EXISTS `line_1`;

CREATE TABLE `line_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `line_1` */

insert  into `line_1`(`id`,`sid`,`zhan_name`,`backlen`,`aheadlen`,`is_transfer`) values (1,1,'苹果园',0,25,0),(2,2,'古城',25,19,0),(3,3,'八角游乐园',19,24,0),(4,4,'八宝山',24,9,0),(5,5,'玉泉路',9,17,0),(6,6,'五棵松',17,18,0),(7,7,'万寿路',18,12,0),(8,8,'公主坟',12,17,1),(9,9,'军事博物馆',17,22,1),(10,10,'木樨地',22,12,0),(11,12,'复兴门',15,16,1),(12,13,'西单',16,12,1),(13,14,'天安门西',12,8,0),(14,15,'天安门东',8,13,0),(15,16,'王府井',13,11,0),(16,17,'东单',11,13,1),(17,18,'建国门',13,8,1),(18,19,'永安里',8,8,0),(19,20,'国贸',8,13,1),(20,21,'大望路',13,16,0),(21,22,'四惠',16,17,1),(22,23,'四惠东',17,0,1),(23,11,'南礼士路',12,15,0);

/*Table structure for table `line_10` */

DROP TABLE IF EXISTS `line_10`;

CREATE TABLE `line_10` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `line_10` */

/*Table structure for table `line_2` */

DROP TABLE IF EXISTS `line_2`;

CREATE TABLE `line_2` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `line_2` */

insert  into `line_2`(`id`,`sid`,`zhan_name`,`backlen`,`aheadlen`,`is_transfer`) values (1,1,'西直门',8,18,1),(2,2,'积水潭',18,17,0),(3,3,'鼓楼大街',17,12,1),(4,4,'安定门',12,11,0),(5,5,'雍和宫',11,26,1),(6,6,'东直门',26,8,1),(7,7,'东四十条',8,10,0),(8,8,'朝阳门',10,18,1),(9,9,'建国门',18,10,1),(10,10,'北京站',10,9,0),(11,11,'崇文门',9,19,1),(12,12,'前门',19,14,0),(13,13,'和平门',14,8,0),(14,14,'宣武门',8,9,1),(15,15,'长椿街',9,12,0),(16,16,'复兴门',12,18,1),(17,17,'阜成门',18,10,0),(18,18,'车公庄',10,8,1);

/*Table structure for table `line_4` */

DROP TABLE IF EXISTS `line_4`;

CREATE TABLE `line_4` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `line_4` */

insert  into `line_4`(`id`,`sid`,`zhan_name`,`backlen`,`aheadlen`,`is_transfer`) values (1,1,'安河桥北',0,14,0),(2,2,'北宫门',14,12,0),(3,3,'西苑',12,21,0),(4,4,'圆明园',21,16,0),(5,5,'北京大学东门',16,10,0),(6,6,'中关村',10,10,0),(7,7,'海淀黄庄',10,10,1),(8,8,'人民大学',10,10,0),(9,9,'魏公村',10,16,0),(10,10,'国家图书馆',16,17,1),(11,11,'动物园',17,7,0),(12,12,'西直门',7,10,1),(13,13,'新街口',10,11,0),(14,14,'平安里',11,10,1),(15,15,'西四',10,8,0),(16,16,'灵境胡同',8,9,0),(17,17,'西单',9,8,1),(18,18,'宣武门',8,11,1),(19,19,'菜市口',11,19,0),(20,20,'陶然亭',19,16,0),(21,21,'北京南站',16,17,0),(22,22,'马家堡',17,8,0),(23,23,'角门西',8,9,1),(24,24,'公益西桥',9,0,0);

/*Table structure for table `line_5` */

DROP TABLE IF EXISTS `line_5`;

CREATE TABLE `line_5` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `line_5` */

insert  into `line_5`(`id`,`sid`,`zhan_name`,`backlen`,`aheadlen`,`is_transfer`) values (1,1,'宋家庄',0,17,1),(2,2,'刘家窑',17,8,0),(3,3,'蒲黄榆',8,18,0),(4,4,'天坛东门',18,12,0),(5,5,'磁器口',12,8,0),(6,6,'崇文门',8,8,1),(7,7,'东单',8,10,1),(8,8,'灯市口',10,7,0),(9,9,'东四',7,10,1),(10,10,'张自忠路',10,8,0),(11,11,'北新桥',8,10,0),(12,12,'雍和宫',10,14,1),(13,13,'和平里北街',14,10,0),(14,14,'和平西桥',10,9,0),(15,15,'惠新西街南口',9,12,0),(16,16,'惠新西街北口',12,17,1),(17,17,'大屯路东',17,29,0),(18,18,'北苑路北',29,13,0),(19,19,'立水桥南',13,13,0),(20,20,'立水桥',13,15,1),(21,21,'天通苑南',15,9,0),(22,22,'天通苑',9,9,0),(23,23,'天通苑北',9,0,0);

/*Table structure for table `line_6` */

DROP TABLE IF EXISTS `line_6`;

CREATE TABLE `line_6` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `line_6` */

insert  into `line_6`(`id`,`sid`,`zhan_name`,`backlen`,`aheadlen`,`is_transfer`) values (1,1,'海淀五路居',0,14,0),(2,2,'慈寿寺',14,14,0),(3,3,'花园桥',14,12,0),(4,4,'白石桥南',12,16,0),(5,5,'车公庄西',16,9,0),(6,6,'车公庄',9,14,0),(7,7,'平安里',14,12,0),(8,8,'北海北',12,14,0),(9,9,'南锣鼓巷',14,19,0),(10,10,'东四',19,14,0),(11,11,'朝阳门',14,15,0),(12,12,'东大桥',15,8,0),(13,13,'呼家楼',8,14,0),(14,14,'金台路',14,19,0),(15,15,'十里堡',19,13,0),(16,16,'青年路',13,39,0),(17,17,'褡裢坡',39,12,0),(18,18,'黄渠',12,17,0),(19,19,'常营',17,15,0),(20,20,'草房',15,0,0);

/*Table structure for table `line_8` */

DROP TABLE IF EXISTS `line_8`;

CREATE TABLE `line_8` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `line_8` */

insert  into `line_8`(`id`,`sid`,`zhan_name`,`backlen`,`aheadlen`,`is_transfer`) values (1,1,'朱辛庄',0,23,0),(2,2,'育知路',23,20,0),(3,3,'平西府',20,19,0),(4,4,'回龙观东大街',19,10,0),(5,5,'霍营',10,17,0),(6,6,'育新',17,15,0),(7,7,'西小口',15,10,0),(8,8,'永泰庄',10,24,0),(9,9,'林萃桥',24,27,0),(10,10,'森林公园南门',27,11,0),(11,11,'奥林匹克公园',11,17,0),(12,12,'奥体中心',17,10,0),(13,13,'北土城',10,9,0),(14,14,'安华桥',9,23,0),(15,15,'鼓楼大街',23,11,0),(16,16,'什刹海',11,10,0),(17,17,'南锣鼓巷',10,0,0);

/*Table structure for table `line_9` */

DROP TABLE IF EXISTS `line_9`;

CREATE TABLE `line_9` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `line_9` */

insert  into `line_9`(`id`,`sid`,`zhan_name`,`backlen`,`aheadlen`,`is_transfer`) values (1,1,'郭公庄',20,20,0),(2,2,'丰台科技园',20,20,0),(3,3,'科怡路',20,20,0),(4,4,'丰台南路',20,20,0),(5,5,'丰台东大街',20,20,0),(6,6,'七里庄',20,20,0),(7,7,'六里桥',20,20,0),(8,8,'六里桥东',20,20,0),(9,9,'北京西站',20,20,0),(10,10,'军事博物馆',20,20,0),(11,11,'白堆子',20,20,0),(12,12,'白石桥南',20,20,0),(13,13,'国家图书馆',20,20,0);

/*Table structure for table `lines` */

DROP TABLE IF EXISTS `lines`;

CREATE TABLE `lines` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `line_id` tinyint(4) NOT NULL COMMENT '线路id',
  `line_name` char(10) NOT NULL COMMENT '线路名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lines` */

/*Table structure for table `zhans` */

DROP TABLE IF EXISTS `zhans`;

CREATE TABLE `zhans` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增的id',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站点名称',
  `line_id` tinyint(3) unsigned NOT NULL COMMENT '属于的线路。1号线，2号线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

/*Data for the table `zhans` */

insert  into `zhans`(`id`,`zhan_name`,`line_id`) values (1,'苹果园',1),(2,'古城',1),(3,'八角游乐园',1),(4,'八宝山',1),(5,'玉泉路',1),(6,'五棵松',1),(7,'万寿路',1),(8,'公主坟',1),(9,'军事博物馆',1),(10,'木樨地',1),(11,'南礼士路',1),(12,'复兴门',1),(13,'西单',1),(14,'天安门西',1),(15,'天安门东',1),(16,'王府井',1),(17,'东单',1),(18,'建国门',1),(19,'永安里',1),(20,'国贸',1),(21,'大望路',1),(22,'四惠',1),(23,'四惠东',1),(24,'西直门',2),(25,'积水潭',2),(26,'鼓楼大街',2),(27,'安定门',2),(28,'雍和宫',2),(29,'东直门',2),(30,'东四十条',2),(31,'朝阳门',2),(32,'建国门',2),(33,'北京站',2),(34,'崇文门',2),(35,'前门',2),(36,'和平门',2),(37,'宣武门',2),(38,'长椿街',2),(39,'复兴门',2),(40,'阜成门',2),(41,'车公庄',2),(42,'安河桥北',4),(43,'北宫门',4),(44,'西苑',4),(45,'圆明园',4),(46,'北京大学东门',4),(47,'中关村',4),(48,'海淀黄庄',4),(49,'人民大学',4),(50,'魏公村',4),(51,'国家图书馆',4),(52,'动物园',4),(53,'西直门',4),(54,'新街口',4),(55,'平安里',4),(56,'西四',4),(57,'灵境胡同',4),(58,'西单',4),(59,'宣武门',4),(60,'菜市口',4),(61,'陶然亭',4),(62,'北京南站',4),(63,'马家堡',4),(64,'角门西',4),(65,'公益西桥',4),(66,'宋家庄',5),(67,'刘家窑',5),(68,'蒲黄榆',5),(69,'天坛东门',5),(70,'磁器口',5),(71,'崇文门',5),(72,'东单',5),(73,'灯市口',5),(74,'东四',5),(75,'张自忠路',5),(76,'北新桥',5),(77,'雍和宫',5),(78,'和平里北街',5),(79,'和平西桥',5),(80,'惠新西街南口',5),(81,'惠新西街北口',5),(82,'大屯路东',5),(83,'北苑路北',5),(84,'立水桥南',5),(85,'立水桥',5),(86,'天通苑南',5),(87,'天通苑',5),(88,'天通苑北',5),(89,'海淀五路居',6),(90,'慈寿寺',6),(91,'花园桥',6),(92,'白石桥南',6),(93,'车公庄西',6),(94,'车公庄',6),(95,'平安里',6),(96,'北海北',6),(97,'南锣鼓巷',6),(98,'东四',6),(99,'朝阳门',6),(100,'东大桥',6),(101,'呼家楼',6),(102,'金台路',6),(103,'十里堡',6),(104,'青年路',6),(105,'褡裢坡',6),(106,'黄渠',6),(107,'常营',6),(108,'草房',6),(109,'朱辛庄',8),(110,'育知路',8),(111,'平西府',8),(112,'回龙观东大街',8),(113,'霍营',8),(114,'育新',8),(115,'西小口',8),(116,'永泰庄',8),(117,'林萃桥',8),(118,'森林公园南门',8),(119,'奥林匹克公园',8),(120,'奥体中心',8),(121,'北土城',8),(122,'安华桥',8),(123,'鼓楼大街',8),(124,'什刹海',8),(125,'南锣鼓巷',8),(126,'郭公庄',9),(127,'丰台科技园',9),(128,'科怡路',9),(129,'丰台南路',9),(130,'丰台东大街',9),(131,'七里庄',9),(132,'六里桥',9),(133,'六里桥东',9),(134,'北京西站',9),(135,'军事博物馆',9),(136,'白堆子',9),(137,'白石桥南',9),(138,'国家图书馆',9);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
