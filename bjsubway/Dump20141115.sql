/*!40101 SET NAMES utf8 */;

-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: subway

use app_bjsubway;
--
-- Table structure for table `all_lines`
--

DROP TABLE IF EXISTS `all_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_lines` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `line_id` tinyint(2) unsigned NOT NULL COMMENT '线路id',
  `line_name` char(10) NOT NULL COMMENT '线路名称',
  `is_huan` tinyint(1) unsigned NOT NULL COMMENT '1是环线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_lines`
--

LOCK TABLES `all_lines` WRITE;
/*!40000 ALTER TABLE `all_lines` DISABLE KEYS */;
INSERT INTO `all_lines` VALUES (1,1,'一号线',0),(2,2,'二号线',1),(3,4,'四号线',0),(4,5,'五号线',0),(5,6,'六号线',0),(6,8,'八号线',0),(7,9,'九号线',0),(8,10,'十号线',1),(9,13,'十三号线',0),(10,14,'十四号线',0),(11,15,'十五号线',0),(12,50,'八通线',0),(13,51,'昌平线',0),(14,52,'亦庄线',0),(15,53,'房山线',0),(16,54,'大兴线',0),(17,55,'机场线',0);
/*!40000 ALTER TABLE `all_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_1`
--

DROP TABLE IF EXISTS `line_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_1`
--

LOCK TABLES `line_1` WRITE;
/*!40000 ALTER TABLE `line_1` DISABLE KEYS */;
INSERT INTO `line_1` VALUES (1,1,'苹果园',0,25,0),(2,2,'古城',25,19,0),(3,3,'八角游乐园',19,24,0),(4,4,'八宝山',24,9,0),(5,5,'玉泉路',9,17,0),(6,6,'五棵松',17,18,0),(7,7,'万寿路',18,12,0),(8,8,'公主坟',12,17,1),(9,9,'军事博物馆',17,22,1),(10,10,'木樨地',22,12,0),(11,12,'复兴门',15,16,1),(12,13,'西单',16,12,1),(13,14,'天安门西',12,8,0),(14,15,'天安门东',8,13,0),(15,16,'王府井',13,11,0),(16,17,'东单',11,13,1),(17,18,'建国门',13,8,1),(18,19,'永安里',8,8,0),(19,20,'国贸',8,13,1),(20,21,'大望路',13,16,0),(21,22,'四惠',16,17,1),(22,23,'四惠东',17,0,1),(23,11,'南礼士路',12,15,0);
/*!40000 ALTER TABLE `line_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_10`
--

DROP TABLE IF EXISTS `line_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_10` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_10`
--

LOCK TABLES `line_10` WRITE;
/*!40000 ALTER TABLE `line_10` DISABLE KEYS */;
INSERT INTO `line_10` VALUES (1,1,'巴沟',14,10,0),(2,2,'苏州街',10,9,0),(3,3,'海淀黄庄',9,10,1),(4,4,'知春里',10,10,0),(5,5,'知春路',10,10,1),(6,6,'西土城',10,13,0),(7,7,'牡丹园',13,9,0),(8,8,'健德门',9,10,0),(9,9,'北土城',10,9,1),(10,10,'安贞门',9,9,0),(11,11,'惠新西街南口',9,17,1),(12,12,'芍药居',17,9,1),(13,13,'太阳宫',9,17,0),(14,14,'三元桥',17,14,1),(15,15,'亮马桥',14,8,0),(16,16,'农业展览馆',8,8,0),(17,17,'团结湖',8,10,0),(18,18,'呼家楼',10,6,1),(19,19,'金台夕照',6,8,0),(20,20,'国贸',8,17,1),(21,21,'双井',17,10,0),(22,22,'劲松',10,11,0),(23,23,'潘家园',11,11,0),(24,24,'十里河',11,13,0),(25,25,'分钟寺',13,9,0),(26,26,'成寿寺',9,16,0),(27,27,'宋家庄',16,12,1),(28,28,'石榴庄',12,13,0),(29,29,'大红门',13,10,0),(30,30,'角门东',10,12,0),(31,31,'角门西',12,15,1),(32,32,'草桥',15,16,0),(33,33,'纪家庙',16,11,0),(34,34,'首经贸',11,16,0),(35,35,'丰台站',16,9,0),(36,36,'泥洼',9,8,0),(37,37,'西局',8,16,1),(38,38,'六里桥',16,22,1),(39,39,'莲花桥',22,10,0),(40,40,'公主坟',10,22,1),(41,41,'西钓鱼台',22,11,0),(42,42,'慈寿寺',11,17,1),(43,43,'车道沟',17,11,0),(44,44,'长春桥',11,9,0),(45,45,'火器营',9,14,0);
/*!40000 ALTER TABLE `line_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_13`
--

DROP TABLE IF EXISTS `line_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_13` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_13`
--

LOCK TABLES `line_13` WRITE;
/*!40000 ALTER TABLE `line_13` DISABLE KEYS */;
INSERT INTO `line_13` VALUES (1,1,'西直门',0,28,1),(2,2,'大钟寺',28,12,0),(3,3,'知春路',12,18,1),(4,4,'五道口',18,48,0),(5,5,'上地',48,25,0),(6,6,'西二旗',25,36,1),(7,7,'龙泽',36,20,0),(8,8,'回龙观',20,11,0),(9,9,'霍营',11,48,1),(10,10,'立水桥',48,23,1),(11,11,'北苑',23,67,0),(12,12,'望京西',67,20,1),(13,13,'芍药居',20,11,1),(14,14,'光熙门',11,11,0),(15,15,'柳芳',11,17,0),(16,16,'东直门',17,0,1);
/*!40000 ALTER TABLE `line_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_14`
--

DROP TABLE IF EXISTS `line_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_14` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_14`
--

LOCK TABLES `line_14` WRITE;
/*!40000 ALTER TABLE `line_14` DISABLE KEYS */;
INSERT INTO `line_14` VALUES (1,1,'张郭庄',0,13,0),(2,2,'园博园',13,38,0),(3,3,'大瓦窑',38,12,0),(4,4,'郭庄子',12,19,0),(5,5,'大井',19,15,0),(6,6,'七里庄',15,8,1),(7,7,'西局',8,0,1);
/*!40000 ALTER TABLE `line_14` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_15`
--

DROP TABLE IF EXISTS `line_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_15` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_15`
--

LOCK TABLES `line_15` WRITE;
/*!40000 ALTER TABLE `line_15` DISABLE KEYS */;
INSERT INTO `line_15` VALUES (1,1,'望京西',0,16,1),(2,2,'望京',16,39,0),(3,3,'崔各庄',39,19,0),(4,4,'马泉营',19,33,0),(5,5,'孙河',33,33,0),(6,6,'国展',33,16,0),(7,7,'花梨坎',16,33,0),(8,8,'后沙峪',33,45,0),(9,9,'南法信',45,26,0),(10,10,'石门',26,13,0),(11,11,'顺义',13,29,0),(12,12,'俸伯',29,0,0);
/*!40000 ALTER TABLE `line_15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_2`
--

DROP TABLE IF EXISTS `line_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_2` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_2`
--

LOCK TABLES `line_2` WRITE;
/*!40000 ALTER TABLE `line_2` DISABLE KEYS */;
INSERT INTO `line_2` VALUES (1,1,'西直门',8,18,1),(2,2,'积水潭',18,17,0),(3,3,'鼓楼大街',17,12,1),(4,4,'安定门',12,11,0),(5,5,'雍和宫',11,26,1),(6,6,'东直门',26,8,1),(7,7,'东四十条',8,10,0),(8,8,'朝阳门',10,18,1),(9,9,'建国门',18,10,1),(10,10,'北京站',10,9,0),(11,11,'崇文门',9,19,1),(12,12,'前门',19,14,0),(13,13,'和平门',14,8,0),(14,14,'宣武门',8,9,1),(15,15,'长椿街',9,12,0),(16,16,'复兴门',12,18,1),(17,17,'阜成门',18,10,0),(18,18,'车公庄',10,8,1);
/*!40000 ALTER TABLE `line_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_4`
--

DROP TABLE IF EXISTS `line_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_4` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_4`
--

LOCK TABLES `line_4` WRITE;
/*!40000 ALTER TABLE `line_4` DISABLE KEYS */;
INSERT INTO `line_4` VALUES (1,1,'安河桥北',0,14,0),(2,2,'北宫门',14,12,0),(3,3,'西苑',12,21,0),(4,4,'圆明园',21,16,0),(5,5,'北京大学东门',16,10,0),(6,6,'中关村',10,10,0),(7,7,'海淀黄庄',10,10,1),(8,8,'人民大学',10,10,0),(9,9,'魏公村',10,16,0),(10,10,'国家图书馆',16,17,1),(11,11,'动物园',17,7,0),(12,12,'西直门',7,10,1),(13,13,'新街口',10,11,0),(14,14,'平安里',11,10,1),(15,15,'西四',10,8,0),(16,16,'灵境胡同',8,9,0),(17,17,'西单',9,8,1),(18,18,'宣武门',8,11,1),(19,19,'菜市口',11,19,0),(20,20,'陶然亭',19,16,0),(21,21,'北京南站',16,17,0),(22,22,'马家堡',17,8,0),(23,23,'角门西',8,9,1),(24,24,'公益西桥',9,0,1);
/*!40000 ALTER TABLE `line_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_5`
--

DROP TABLE IF EXISTS `line_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_5` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_5`
--

LOCK TABLES `line_5` WRITE;
/*!40000 ALTER TABLE `line_5` DISABLE KEYS */;
INSERT INTO `line_5` VALUES (1,1,'宋家庄',0,17,1),(2,2,'刘家窑',17,8,0),(3,3,'蒲黄榆',8,18,0),(4,4,'天坛东门',18,12,0),(5,5,'磁器口',12,8,0),(6,6,'崇文门',8,8,1),(7,7,'东单',8,10,1),(8,8,'灯市口',10,7,0),(9,9,'东四',7,10,1),(10,10,'张自忠路',10,8,0),(11,11,'北新桥',8,10,0),(12,12,'雍和宫',10,14,1),(13,13,'和平里北街',14,10,0),(14,14,'和平西桥',10,9,0),(15,15,'惠新西街南口',9,12,0),(16,16,'惠新西街北口',12,17,1),(17,17,'大屯路东',17,29,0),(18,18,'北苑路北',29,13,0),(19,19,'立水桥南',13,13,0),(20,20,'立水桥',13,15,1),(21,21,'天通苑南',15,9,0),(22,22,'天通苑',9,9,0),(23,23,'天通苑北',9,0,0);
/*!40000 ALTER TABLE `line_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_50`
--

DROP TABLE IF EXISTS `line_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_50` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='八通线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_50`
--

LOCK TABLES `line_50` WRITE;
/*!40000 ALTER TABLE `line_50` DISABLE KEYS */;
INSERT INTO `line_50` VALUES (1,1,'四惠',0,17,1),(2,2,'四惠东',17,13,1),(3,3,'高碑店',13,19,0),(4,4,'传媒大学',19,18,0),(5,5,'双桥',18,19,0),(6,6,'管庄',19,17,0),(7,7,'八里桥',17,17,0),(8,8,'通州北苑',17,14,0),(9,9,'果园',14,9,0),(10,10,'九棵树',9,12,0),(11,11,'梨园',12,12,0),(12,12,'临河里',12,7,0),(13,13,'土桥',7,0,0);
/*!40000 ALTER TABLE `line_50` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_51`
--

DROP TABLE IF EXISTS `line_51`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_51` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='昌平线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_51`
--

LOCK TABLES `line_51` WRITE;
/*!40000 ALTER TABLE `line_51` DISABLE KEYS */;
INSERT INTO `line_51` VALUES (1,1,'南邵',0,54,0),(2,2,'沙河高教园',54,19,0),(3,3,'沙河',19,20,0),(4,4,'巩华城',20,38,0),(5,5,'朱辛庄',38,24,1),(6,6,'生命科学园',24,54,0),(7,7,'西二旗',54,0,1);
/*!40000 ALTER TABLE `line_51` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_52`
--

DROP TABLE IF EXISTS `line_52`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_52` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='亦庄线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_52`
--

LOCK TABLES `line_52` WRITE;
/*!40000 ALTER TABLE `line_52` DISABLE KEYS */;
INSERT INTO `line_52` VALUES (1,1,'宋家庄',0,29,1),(2,2,'肖村',29,13,0),(3,3,'小红门',13,24,0),(4,4,'旧宫',24,19,0),(5,5,'亦庄桥',19,9,0),(6,6,'亦庄文化园',9,15,0),(7,7,'万源街',15,12,0),(8,8,'荣京东街',12,13,0),(9,9,'荣昌东街',13,23,0),(10,10,'同济南路',23,22,0),(11,11,'经海路',22,20,0),(12,12,'次渠南',20,12,0),(13,13,'次渠',12,0,0);
/*!40000 ALTER TABLE `line_52` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_53`
--

DROP TABLE IF EXISTS `line_53`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_53` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='房山线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_53`
--

LOCK TABLES `line_53` WRITE;
/*!40000 ALTER TABLE `line_53` DISABLE KEYS */;
INSERT INTO `line_53` VALUES (1,1,'郭公庄',0,13,1),(2,2,'大葆台',13,64,0),(3,3,'稻田',64,40,0),(4,4,'长阳',40,21,0),(5,5,'篱笆房',21,14,0),(6,6,'广阳城',14,20,0),(7,7,'良乡大学城北',20,10,0),(8,8,'良乡大学城',10,17,0),(9,9,'良乡大学城西',17,13,0),(10,10,'良乡南关',13,13,0),(11,11,'苏庄',13,0,0);
/*!40000 ALTER TABLE `line_53` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_54`
--

DROP TABLE IF EXISTS `line_54`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_54` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='大兴线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_54`
--

LOCK TABLES `line_54` WRITE;
/*!40000 ALTER TABLE `line_54` DISABLE KEYS */;
INSERT INTO `line_54` VALUES (1,1,'公益西桥',0,28,1),(2,2,'新宫',28,50,0),(3,3,'西红门',50,17,0),(4,4,'高米店北',17,11,0),(5,5,'高米店南',11,11,0),(6,6,'枣园',11,11,0),(7,7,'清源路',11,12,0),(8,8,'黄村西大街',12,10,0),(9,9,'黄村火车站',10,18,0),(10,10,'义和庄',18,29,0),(11,11,'生物医药基地',29,18,0),(12,12,'天宫院',18,0,0);
/*!40000 ALTER TABLE `line_54` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_55`
--

DROP TABLE IF EXISTS `line_55`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_55` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='机场线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_55`
--

LOCK TABLES `line_55` WRITE;
/*!40000 ALTER TABLE `line_55` DISABLE KEYS */;
/*!40000 ALTER TABLE `line_55` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_6`
--

DROP TABLE IF EXISTS `line_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_6` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_6`
--

LOCK TABLES `line_6` WRITE;
/*!40000 ALTER TABLE `line_6` DISABLE KEYS */;
INSERT INTO `line_6` VALUES (1,1,'海淀五路居',0,14,0),(2,2,'慈寿寺',14,14,1),(3,3,'花园桥',14,12,0),(4,4,'白石桥南',12,16,1),(5,5,'车公庄西',16,9,0),(6,6,'车公庄',9,14,1),(7,7,'平安里',14,12,1),(8,8,'北海北',12,14,0),(9,9,'南锣鼓巷',14,19,1),(10,10,'东四',19,14,0),(11,11,'朝阳门',14,15,1),(12,12,'东大桥',15,8,0),(13,13,'呼家楼',8,14,1),(14,14,'金台路',14,19,0),(15,15,'十里堡',19,13,0),(16,16,'青年路',13,39,0),(17,17,'褡裢坡',39,12,0),(18,18,'黄渠',12,17,0),(19,19,'常营',17,15,0),(20,20,'草房',15,0,0);
/*!40000 ALTER TABLE `line_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_8`
--

DROP TABLE IF EXISTS `line_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_8` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_8`
--

LOCK TABLES `line_8` WRITE;
/*!40000 ALTER TABLE `line_8` DISABLE KEYS */;
INSERT INTO `line_8` VALUES (1,1,'朱辛庄',0,23,1),(2,2,'育知路',23,20,0),(3,3,'平西府',20,19,0),(4,4,'回龙观东大街',19,10,0),(5,5,'霍营',10,17,1),(6,6,'育新',17,15,0),(7,7,'西小口',15,10,0),(8,8,'永泰庄',10,24,0),(9,9,'林萃桥',24,27,0),(10,10,'森林公园南门',27,11,0),(11,11,'奥林匹克公园',11,17,0),(12,12,'奥体中心',17,10,0),(13,13,'北土城',10,9,1),(14,14,'安华桥',9,23,0),(15,15,'鼓楼大街',23,11,0),(16,16,'什刹海',11,10,0),(17,17,'南锣鼓巷',10,0,1);
/*!40000 ALTER TABLE `line_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_9`
--

DROP TABLE IF EXISTS `line_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_9` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_9`
--

LOCK TABLES `line_9` WRITE;
/*!40000 ALTER TABLE `line_9` DISABLE KEYS */;
INSERT INTO `line_9` VALUES (1,1,'郭公庄',0,13,1),(2,2,'丰台科技园',13,8,0),(3,3,'科怡路',8,8,0),(4,4,'丰台南路',8,16,0),(5,5,'丰台东大街',16,13,0),(6,6,'七里庄',13,17,1),(7,7,'六里桥',17,12,1),(8,8,'六里桥东',12,12,0),(9,9,'北京西站',12,14,0),(10,10,'军事博物馆',14,26,1),(11,11,'白堆子',26,9,0),(12,12,'白石桥南',9,11,0),(13,13,'国家图书馆',11,0,1);
/*!40000 ALTER TABLE `line_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_batong`
--

DROP TABLE IF EXISTS `line_batong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_batong` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sid` tinyint(3) unsigned NOT NULL COMMENT '站号，从1开始',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站名',
  `backlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与后一个站点的距离',
  `aheadlen` mediumint(9) NOT NULL DEFAULT '20' COMMENT '与前一个站点的距离',
  `is_transfer` tinyint(1) DEFAULT '0' COMMENT '1是换乘站点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_batong`
--

LOCK TABLES `line_batong` WRITE;
/*!40000 ALTER TABLE `line_batong` DISABLE KEYS */;
/*!40000 ALTER TABLE `line_batong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lines`
--

DROP TABLE IF EXISTS `lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lines` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `line_id` tinyint(4) NOT NULL COMMENT '线路id',
  `line_name` char(10) NOT NULL COMMENT '线路名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lines`
--

LOCK TABLES `lines` WRITE;
/*!40000 ALTER TABLE `lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` tinyint(3) unsigned DEFAULT NULL,
  `to_id` tinyint(3) unsigned DEFAULT NULL,
  `distance` mediumint(9) DEFAULT NULL COMMENT '从from到to的距离',
  `path` varchar(45) DEFAULT NULL COMMENT '从form到to的路径',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1681 DEFAULT CHARSET=utf8 COMMENT='换乘站之间最短路径';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (1,0,1,126,'8,6,2'),(2,0,2,109,'8,6'),(3,0,3,58,'7,5'),(4,0,4,75,'7,5,3'),(5,0,5,29,'7'),(6,0,6,60,'8'),(7,0,7,13,''),(8,0,8,44,''),(9,0,9,49,'7,12'),(10,0,10,49,'11'),(11,0,11,8,''),(12,0,12,31,'7'),(13,0,13,83,'22,26,19'),(14,0,14,76,'22,26,19'),(15,0,15,45,'22'),(16,0,16,57,'22,26'),(17,0,17,127,'11,23,21'),(18,0,18,107,'22,26,19,13'),(19,0,19,62,'22,26'),(20,0,20,143,'22,26,19,13,18'),(21,0,21,118,'11,23'),(22,0,22,17,''),(23,0,23,71,'11'),(24,0,24,78,'22,15'),(25,0,25,198,'7,12,9,37,39'),(26,0,26,36,'22'),(27,0,27,43,'7,5'),(28,0,28,127,'22,26,19,14,29'),(29,0,29,101,'22,26,19,14'),(30,0,30,89,'22,26'),(31,0,31,292,'22,26,19,13,36,40'),(32,0,32,220,'22,26,30'),(33,0,33,164,'8,6,2,34'),(34,0,34,147,'8,6,2'),(35,0,35,222,'8,6,2,34,33'),(36,0,36,123,'22,26,19,13'),(37,0,37,88,'7,12,9'),(38,0,38,163,'8,6,2,34'),(39,0,39,108,'7,12,9,37'),(40,0,40,214,'22,26,19,13,36'),(41,1,0,126,'2,6,8'),(42,1,2,17,''),(43,1,3,184,'2,6,8,0,7,5'),(44,1,4,201,'2,6,8,0,7,5,3'),(45,1,5,155,'2,6,8,0,7'),(46,1,6,66,'2'),(47,1,7,139,'2,6,8,0'),(48,1,8,82,'2,6'),(49,1,9,168,'2,29,14,19,26,12'),(50,1,10,87,'2,6'),(51,1,11,128,'2,6,10'),(52,1,12,150,'2,29,14,19,26'),(53,1,13,85,'2,29,14'),(54,1,14,77,'2,29'),(55,1,15,143,'2,29,14,13,16'),(56,1,16,120,'2,29,14,13'),(57,1,17,132,'34,38,21'),(58,1,18,63,'2'),(59,1,19,91,'2,29,14'),(60,1,20,99,'2,18'),(61,1,21,123,'34,38'),(62,1,22,136,'2,29,14,19,26'),(63,1,23,170,'34,38,21'),(64,1,24,170,'2,29,14,13,16,30'),(65,1,25,297,'2,29,14,13,16,30,24,37,39'),(66,1,26,117,'2,29,14,19'),(67,1,27,169,'2,6,8,0,7,5'),(68,1,28,33,''),(69,1,29,52,'2'),(70,1,30,152,'2,29,14,13,16'),(71,1,31,288,'2,18,20,36,40'),(72,1,32,277,'2,18,20,36,40'),(73,1,33,49,'34'),(74,1,34,32,''),(75,1,35,107,'34,33'),(76,1,36,119,'2,18,20'),(77,1,37,187,'2,29,14,13,16,30,24'),(78,1,38,48,'34'),(79,1,39,207,'2,29,14,13,16,30,24,37'),(80,1,40,210,'2,18,20,36'),(81,2,0,109,'6,8'),(82,2,1,17,''),(83,2,3,167,'6,8,0,7,5'),(84,2,4,184,'6,8,0,7,5,3'),(85,2,5,138,'6,8,0,7'),(86,2,6,49,''),(87,2,7,122,'6,8,0'),(88,2,8,65,'6'),(89,2,9,151,'29,14,19,26,12'),(90,2,10,70,'6'),(91,2,11,111,'6,10'),(92,2,12,133,'29,14,19,26'),(93,2,13,68,'29,14'),(94,2,14,60,'29'),(95,2,15,126,'29,14,13,16'),(96,2,16,103,'29,14,13'),(97,2,17,138,'34,38,21'),(98,2,18,46,''),(99,2,19,74,'29,14'),(100,2,20,82,'18'),(101,2,21,129,'34,38'),(102,2,22,119,'29,14,19,26'),(103,2,23,174,'6,10,11'),(104,2,24,153,'29,14,13,16,30'),(105,2,25,280,'29,14,13,16,30,24,37,39'),(106,2,26,100,'29,14,19'),(107,2,27,152,'6,8,0,7,5'),(108,2,28,50,'1'),(109,2,29,35,''),(110,2,30,135,'29,14,13,16'),(111,2,31,271,'18,20,36,40'),(112,2,32,260,'18,20,36,40'),(113,2,33,55,'34'),(114,2,34,38,''),(115,2,35,113,'34,33'),(116,2,36,102,'18,20'),(117,2,37,170,'29,14,13,16,30,24'),(118,2,38,54,'34'),(119,2,39,190,'29,14,13,16,30,24,37'),(120,2,40,193,'18,20,36'),(121,3,0,58,'5,7'),(122,3,1,184,'5,7,0,8,6,2'),(123,3,2,167,'5,7,0,8,6'),(124,3,4,17,''),(125,3,5,29,''),(126,3,6,118,'5,7,0,8'),(127,3,7,45,'5'),(128,3,8,102,'5,7,0'),(129,3,9,81,'5,7,12'),(130,3,10,105,'5,7,11'),(131,3,11,64,'5,7'),(132,3,12,63,'5,7'),(133,3,13,141,'5,7,0,22,26,19'),(134,3,14,134,'5,7,0,22,26,19'),(135,3,15,103,'5,7,0,22'),(136,3,16,115,'5,7,0,22,26'),(137,3,17,172,'5,23,21'),(138,3,18,165,'5,7,0,22,26,19,13'),(139,3,19,120,'5,7,0,22,26'),(140,3,20,201,'5,7,0,22,26,19,13,18'),(141,3,21,163,'5,23'),(142,3,22,75,'5,7,0'),(143,3,23,116,'5'),(144,3,24,136,'5,7,0,22,15'),(145,3,25,230,'5,7,12,9,37,39'),(146,3,26,94,'5,7,0,22'),(147,3,27,43,'5'),(148,3,28,185,'5,7,0,22,26,19,14,29'),(149,3,29,159,'5,7,0,22,26,19,14'),(150,3,30,147,'5,7,0,22,26'),(151,3,31,350,'5,7,0,22,26,19,13,36,40'),(152,3,32,278,'5,7,0,22,26,30'),(153,3,33,222,'5,7,0,8,6,2,34'),(154,3,34,205,'5,7,0,8,6,2'),(155,3,35,280,'5,7,0,8,6,2,34,33'),(156,3,36,181,'5,7,0,22,26,19,13'),(157,3,37,120,'5,7,12,9'),(158,3,38,221,'5,7,0,8,6,2,34'),(159,3,39,140,'5,7,12,9,37'),(160,3,40,272,'5,7,0,22,26,19,13,36'),(161,4,0,75,'3,5,7'),(162,4,1,201,'3,5,7,0,8,6,2'),(163,4,2,184,'3,5,7,0,8,6'),(164,4,3,17,''),(165,4,5,46,'3'),(166,4,6,135,'3,5,7,0,8'),(167,4,7,62,'3,5'),(168,4,8,119,'3,5,7,0'),(169,4,9,98,'3,5,7,12'),(170,4,10,122,'3,5,7,11'),(171,4,11,81,'3,5,7'),(172,4,12,80,'3,5,7'),(173,4,13,158,'3,5,7,0,22,26,19'),(174,4,14,151,'3,5,7,0,22,26,19'),(175,4,15,120,'3,5,7,0,22'),(176,4,16,132,'3,5,7,0,22,26'),(177,4,17,189,'3,5,23,21'),(178,4,18,182,'3,5,7,0,22,26,19,13'),(179,4,19,137,'3,5,7,0,22,26'),(180,4,20,218,'3,5,7,0,22,26,19,13,18'),(181,4,21,180,'3,5,23'),(182,4,22,92,'3,5,7,0'),(183,4,23,133,'3,5'),(184,4,24,153,'3,5,7,0,22,15'),(185,4,25,247,'3,5,7,12,9,37,39'),(186,4,26,111,'3,5,7,0,22'),(187,4,27,60,'3,5'),(188,4,28,202,'3,5,7,0,22,26,19,14,29'),(189,4,29,176,'3,5,7,0,22,26,19,14'),(190,4,30,164,'3,5,7,0,22,26'),(191,4,31,367,'3,5,7,0,22,26,19,13,36,40'),(192,4,32,295,'3,5,7,0,22,26,30'),(193,4,33,239,'3,5,7,0,8,6,2,34'),(194,4,34,222,'3,5,7,0,8,6,2'),(195,4,35,297,'3,5,7,0,8,6,2,34,33'),(196,4,36,198,'3,5,7,0,22,26,19,13'),(197,4,37,137,'3,5,7,12,9'),(198,4,38,238,'3,5,7,0,8,6,2,34'),(199,4,39,157,'3,5,7,12,9,37'),(200,4,40,289,'3,5,7,0,22,26,19,13,36'),(241,5,0,29,'7'),(242,5,1,155,'7,0,8,6,2'),(243,5,2,138,'7,0,8,6'),(244,5,3,29,''),(245,5,4,46,'3'),(246,5,6,89,'7,0,8'),(247,5,7,16,''),(248,5,8,73,'7,0'),(249,5,9,52,'7,12'),(250,5,10,76,'7,11'),(251,5,11,35,'7'),(252,5,12,34,'7'),(253,5,13,112,'7,0,22,26,19'),(254,5,14,105,'7,0,22,26,19'),(255,5,15,74,'7,0,22'),(256,5,16,86,'7,0,22,26'),(257,5,17,143,'23,21'),(258,5,18,136,'7,0,22,26,19,13'),(259,5,19,91,'7,0,22,26'),(260,5,20,172,'7,0,22,26,19,13,18'),(261,5,21,134,'23'),(262,5,22,46,'7,0'),(263,5,23,87,''),(264,5,24,107,'7,0,22,15'),(265,5,25,201,'7,12,9,37,39'),(266,5,26,65,'7,0,22'),(267,5,27,14,''),(268,5,28,156,'7,0,22,26,19,14,29'),(269,5,29,130,'7,0,22,26,19,14'),(270,5,30,118,'7,0,22,26'),(271,5,31,321,'7,0,22,26,19,13,36,40'),(272,5,32,249,'7,0,22,26,30'),(273,5,33,193,'7,0,8,6,2,34'),(274,5,34,176,'7,0,8,6,2'),(275,5,35,251,'7,0,8,6,2,34,33'),(276,5,36,152,'7,0,22,26,19,13'),(277,5,37,91,'7,12,9'),(278,5,38,192,'7,0,8,6,2,34'),(279,5,39,111,'7,12,9,37'),(280,5,40,243,'7,0,22,26,19,13,36'),(281,6,0,60,'8'),(282,6,1,66,'2'),(283,6,2,49,''),(284,6,3,118,'8,0,7,5'),(285,6,4,135,'8,0,7,5,3'),(286,6,5,89,'8,0,7'),(287,6,7,73,'8,0'),(288,6,8,16,''),(289,6,9,109,'8,0,7,12'),(290,6,10,21,''),(291,6,11,62,'10'),(292,6,12,91,'8,0,7'),(293,6,13,36,'14'),(294,6,14,28,''),(295,6,15,94,'14,13,16'),(296,6,16,71,'14,13'),(297,6,17,101,'10,21'),(298,6,18,60,'14,13'),(299,6,19,42,'14'),(300,6,20,96,'14,13,18'),(301,6,21,92,'10'),(302,6,22,77,'8,0'),(303,6,23,125,'10,11'),(304,6,24,121,'14,13,16,30'),(305,6,25,248,'14,13,16,30,24,37,39'),(306,6,26,68,'14,19'),(307,6,27,103,'8,0,7,5'),(308,6,28,79,'14,29'),(309,6,29,53,'14'),(310,6,30,103,'14,13,16'),(311,6,31,245,'14,13,36,40'),(312,6,32,234,'14,13,16,30'),(313,6,33,104,'2,34'),(314,6,34,87,'2'),(315,6,35,162,'2,34,33'),(316,6,36,76,'14,13'),(317,6,37,138,'14,13,16,30,24'),(318,6,38,103,'2,34'),(319,6,39,158,'14,13,16,30,24,37'),(320,6,40,167,'14,13,36'),(321,7,0,13,''),(322,7,1,139,'0,8,6,2'),(323,7,2,122,'0,8,6'),(324,7,3,45,'5'),(325,7,4,62,'5,3'),(326,7,5,16,''),(327,7,6,73,'0,8'),(328,7,8,57,'0'),(329,7,9,36,'12'),(330,7,10,60,'11'),(331,7,11,19,''),(332,7,12,18,''),(333,7,13,96,'0,22,26,19'),(334,7,14,89,'0,22,26,19'),(335,7,15,58,'0,22'),(336,7,16,70,'0,22,26'),(337,7,17,138,'11,23,21'),(338,7,18,120,'0,22,26,19,13'),(339,7,19,75,'0,22,26'),(340,7,20,156,'0,22,26,19,13,18'),(341,7,21,129,'11,23'),(342,7,22,30,'0'),(343,7,23,82,'11'),(344,7,24,91,'0,22,15'),(345,7,25,185,'12,9,37,39'),(346,7,26,49,'0,22'),(347,7,27,30,'5'),(348,7,28,140,'0,22,26,19,14,29'),(349,7,29,114,'0,22,26,19,14'),(350,7,30,102,'0,22,26'),(351,7,31,305,'0,22,26,19,13,36,40'),(352,7,32,233,'0,22,26,30'),(353,7,33,177,'0,8,6,2,34'),(354,7,34,160,'0,8,6,2'),(355,7,35,235,'0,8,6,2,34,33'),(356,7,36,136,'0,22,26,19,13'),(357,7,37,75,'12,9'),(358,7,38,176,'0,8,6,2,34'),(359,7,39,95,'12,9,37'),(360,7,40,227,'0,22,26,19,13,36'),(361,8,0,44,''),(362,8,1,82,'6,2'),(363,8,2,65,'6'),(364,8,3,102,'0,7,5'),(365,8,4,119,'0,7,5,3'),(366,8,5,73,'0,7'),(367,8,6,16,''),(368,8,7,57,'0'),(369,8,9,93,'0,7,12'),(370,8,10,8,''),(371,8,11,49,'10'),(372,8,12,75,'0,7'),(373,8,13,48,'19'),(374,8,14,41,'19'),(375,8,15,89,'0,22'),(376,8,16,74,'19,26'),(377,8,17,88,'10,21'),(378,8,18,72,'19,13'),(379,8,19,27,''),(380,8,20,108,'19,13,18'),(381,8,21,79,'10'),(382,8,22,61,'0'),(383,8,23,112,'10,11'),(384,8,24,122,'0,22,15'),(385,8,25,242,'0,7,12,9,37,39'),(386,8,26,53,'19'),(387,8,27,87,'0,7,5'),(388,8,28,92,'19,14,29'),(389,8,29,66,'19,14'),(390,8,30,106,'19,26'),(391,8,31,257,'19,13,36,40'),(392,8,32,237,'19,26,30'),(393,8,33,120,'6,2,34'),(394,8,34,103,'6,2'),(395,8,35,178,'6,2,34,33'),(396,8,36,88,'19,13'),(397,8,37,132,'0,7,12,9'),(398,8,38,119,'6,2,34'),(399,8,39,152,'0,7,12,9,37'),(400,8,40,179,'19,13,36'),(401,9,0,49,'12,22'),(402,9,1,168,'12,26,19,14,29,2'),(403,9,2,151,'12,26,19,14,29'),(404,9,3,81,'12,7,5'),(405,9,4,98,'12,7,5,3'),(406,9,5,52,'12,7'),(407,9,6,109,'12,22,0,8'),(408,9,7,36,'12'),(409,9,8,93,'12,22,0'),(410,9,10,96,'12,7,11'),(411,9,11,55,'12,7'),(412,9,12,18,''),(413,9,13,84,'15,16'),(414,9,14,91,'12,26,19'),(415,9,15,26,''),(416,9,16,49,'15'),(417,9,17,174,'12,7,11,23,21'),(418,9,18,108,'15,16,13'),(419,9,19,77,'12,26'),(420,9,20,136,'37,24,30,36'),(421,9,21,165,'12,7,11,23'),(422,9,22,32,'12'),(423,9,23,118,'12,7,11'),(424,9,24,56,'37'),(425,9,25,149,'37,39'),(426,9,26,51,'12'),(427,9,27,41,'12'),(428,9,28,142,'12,26,19,14,29'),(429,9,29,116,'12,26,19,14'),(430,9,30,74,'37,24'),(431,9,31,269,'37,39,25,32'),(432,9,32,197,'37,39,25'),(433,9,33,206,'12,26,19,14,29,2,34'),(434,9,34,189,'12,26,19,14,29,2'),(435,9,35,264,'12,26,19,14,29,2,34,33'),(436,9,36,116,'37,24,30'),(437,9,37,39,''),(438,9,38,205,'12,26,19,14,29,2,34'),(439,9,39,59,'37'),(440,9,40,207,'37,24,30,36'),(441,10,0,49,'11'),(442,10,1,87,'6,2'),(443,10,2,70,'6'),(444,10,3,105,'11,7,5'),(445,10,4,122,'11,7,5,3'),(446,10,5,76,'11,7'),(447,10,6,21,''),(448,10,7,60,'11'),(449,10,8,8,''),(450,10,9,96,'11,7,12'),(451,10,11,41,''),(452,10,12,78,'11,7'),(453,10,13,56,'8,19'),(454,10,14,49,'6'),(455,10,15,94,'11,0,22'),(456,10,16,82,'8,19,26'),(457,10,17,80,'21'),(458,10,18,80,'8,19,13'),(459,10,19,35,'8'),(460,10,20,116,'8,19,13,18'),(461,10,21,71,''),(462,10,22,66,'11,0'),(463,10,23,104,'11'),(464,10,24,127,'11,0,22,15'),(465,10,25,245,'11,7,12,9,37,39'),(466,10,26,61,'8,19'),(467,10,27,90,'11,7,5'),(468,10,28,100,'6,14,29'),(469,10,29,74,'6,14'),(470,10,30,114,'8,19,26'),(471,10,31,265,'8,19,13,36,40'),(472,10,32,245,'8,19,26,30'),(473,10,33,125,'6,2,34'),(474,10,34,108,'6,2'),(475,10,35,183,'6,2,34,33'),(476,10,36,96,'8,19,13'),(477,10,37,135,'11,7,12,9'),(478,10,38,124,'6,2,34'),(479,10,39,155,'11,7,12,9,37'),(480,10,40,187,'8,19,13,36'),(481,11,0,8,''),(482,11,1,128,'10,6,2'),(483,11,2,111,'10,6'),(484,11,3,64,'7,5'),(485,11,4,81,'7,5,3'),(486,11,5,35,'7'),(487,11,6,62,'10'),(488,11,7,19,''),(489,11,8,49,'10'),(490,11,9,55,'7,12'),(491,11,10,41,''),(492,11,12,37,'7'),(493,11,13,91,'0,22,26,19'),(494,11,14,84,'0,22,26,19'),(495,11,15,53,'0,22'),(496,11,16,65,'0,22,26'),(497,11,17,119,'23,21'),(498,11,18,115,'0,22,26,19,13'),(499,11,19,70,'0,22,26'),(500,11,20,151,'0,22,26,19,13,18'),(501,11,21,110,'23'),(502,11,22,25,'0'),(503,11,23,63,''),(504,11,24,86,'0,22,15'),(505,11,25,204,'7,12,9,37,39'),(506,11,26,44,'0,22'),(507,11,27,49,'7,5'),(508,11,28,135,'0,22,26,19,14,29'),(509,11,29,109,'0,22,26,19,14'),(510,11,30,97,'0,22,26'),(511,11,31,300,'0,22,26,19,13,36,40'),(512,11,32,228,'0,22,26,30'),(513,11,33,166,'10,6,2,34'),(514,11,34,149,'10,6,2'),(515,11,35,224,'10,6,2,34,33'),(516,11,36,131,'0,22,26,19,13'),(517,11,37,94,'7,12,9'),(518,11,38,165,'10,6,2,34'),(519,11,39,114,'7,12,9,37'),(520,11,40,222,'0,22,26,19,13,36'),(521,12,0,31,'22'),(522,12,1,150,'26,19,14,29,2'),(523,12,2,133,'26,19,14,29'),(524,12,3,63,'7,5'),(525,12,4,80,'7,5,3'),(526,12,5,34,'7'),(527,12,6,91,'22,0,8'),(528,12,7,18,''),(529,12,8,75,'22,0'),(530,12,9,18,''),(531,12,10,78,'7,11'),(532,12,11,37,'7'),(533,12,13,80,'26,19'),(534,12,14,73,'26,19'),(535,12,15,42,'22'),(536,12,16,54,'26'),(537,12,17,156,'7,11,23,21'),(538,12,18,104,'26,19,13'),(539,12,19,59,'26'),(540,12,20,140,'26,19,13,18'),(541,12,21,147,'7,11,23'),(542,12,22,14,''),(543,12,23,100,'7,11'),(544,12,24,74,'9,37'),(545,12,25,167,'9,37,39'),(546,12,26,33,''),(547,12,27,23,''),(548,12,28,124,'26,19,14,29'),(549,12,29,98,'26,19,14'),(550,12,30,86,'26'),(551,12,31,287,'9,37,39,25,32'),(552,12,32,215,'9,37,39,25'),(553,12,33,188,'26,19,14,29,2,34'),(554,12,34,171,'26,19,14,29,2'),(555,12,35,246,'26,19,14,29,2,34,33'),(556,12,36,120,'26,19,13'),(557,12,37,57,'9'),(558,12,38,187,'26,19,14,29,2,34'),(559,12,39,77,'9,37'),(560,12,40,211,'26,19,13,36'),(561,13,0,83,'19,26,22'),(562,13,1,85,'14,29,2'),(563,13,2,68,'14,29'),(564,13,3,141,'19,26,22,0,7,5'),(565,13,4,158,'19,26,22,0,7,5,3'),(566,13,5,112,'19,26,22,0,7'),(567,13,6,36,'14'),(568,13,7,96,'19,26,22,0'),(569,13,8,48,'19'),(570,13,9,84,'16,15'),(571,13,10,56,'19,8'),(572,13,11,91,'19,26,22,0'),(573,13,12,80,'19,26'),(574,13,14,8,''),(575,13,15,58,'16'),(576,13,16,35,''),(577,13,17,136,'19,8,10,21'),(578,13,18,24,''),(579,13,19,21,''),(580,13,20,60,'18'),(581,13,21,127,'19,8,10'),(582,13,22,66,'19,26'),(583,13,23,154,'19,26,22,0,11'),(584,13,24,85,'16,30'),(585,13,25,212,'16,30,24,37,39'),(586,13,26,47,'19'),(587,13,27,103,'19,26,12'),(588,13,28,59,'14,29'),(589,13,29,33,'14'),(590,13,30,67,'16'),(591,13,31,209,'36,40'),(592,13,32,198,'16,30'),(593,13,33,123,'14,29,2,34'),(594,13,34,106,'14,29,2'),(595,13,35,181,'14,29,2,34,33'),(596,13,36,40,''),(597,13,37,102,'16,30,24'),(598,13,38,122,'14,29,2,34'),(599,13,39,122,'16,30,24,37'),(600,13,40,131,'36'),(601,14,0,76,'19,26,22'),(602,14,1,77,'29,2'),(603,14,2,60,'29'),(604,14,3,134,'19,26,22,0,7,5'),(605,14,4,151,'19,26,22,0,7,5,3'),(606,14,5,105,'19,26,22,0,7'),(607,14,6,28,''),(608,14,7,89,'19,26,22,0'),(609,14,8,41,'19'),(610,14,9,91,'19,26,12'),(611,14,10,49,'6'),(612,14,11,84,'19,26,22,0'),(613,14,12,73,'19,26'),(614,14,13,8,''),(615,14,15,66,'13,16'),(616,14,16,43,'13'),(617,14,17,129,'6,10,21'),(618,14,18,32,'13'),(619,14,19,14,''),(620,14,20,68,'13,18'),(621,14,21,120,'6,10'),(622,14,22,59,'19,26'),(623,14,23,147,'19,26,22,0,11'),(624,14,24,93,'13,16,30'),(625,14,25,220,'13,16,30,24,37,39'),(626,14,26,40,'19'),(627,14,27,96,'19,26,12'),(628,14,28,51,'29'),(629,14,29,25,''),(630,14,30,75,'13,16'),(631,14,31,217,'13,36,40'),(632,14,32,206,'13,16,30'),(633,14,33,115,'29,2,34'),(634,14,34,98,'29,2'),(635,14,35,173,'29,2,34,33'),(636,14,36,48,'13'),(637,14,37,110,'13,16,30,24'),(638,14,38,114,'29,2,34'),(639,14,39,130,'13,16,30,24,37'),(640,14,40,139,'13,36'),(641,15,0,45,'22'),(642,15,1,143,'16,13,14,29,2'),(643,15,2,126,'16,13,14,29'),(644,15,3,103,'22,0,7,5'),(645,15,4,120,'22,0,7,5,3'),(646,15,5,74,'22,0,7'),(647,15,6,94,'16,13,14'),(648,15,7,58,'22,0'),(649,15,8,89,'22,0'),(650,15,9,26,''),(651,15,10,94,'22,0,11'),(652,15,11,53,'22,0'),(653,15,12,42,'22'),(654,15,13,58,'16'),(655,15,14,66,'16,13'),(656,15,16,23,''),(657,15,17,172,'22,0,11,23,21'),(658,15,18,82,'16,13'),(659,15,19,70,'16,26'),(660,15,20,113,'24,30,36'),(661,15,21,163,'22,0,11,23'),(662,15,22,28,''),(663,15,23,116,'22,0,11'),(664,15,24,33,''),(665,15,25,160,'24,37,39'),(666,15,26,44,'16'),(667,15,27,65,'22,12'),(668,15,28,117,'16,13,14,29'),(669,15,29,91,'16,13,14'),(670,15,30,51,'24'),(671,15,31,254,'24,30,32'),(672,15,32,182,'24,30'),(673,15,33,181,'16,13,14,29,2,34'),(674,15,34,164,'16,13,14,29,2'),(675,15,35,239,'16,13,14,29,2,34,33'),(676,15,36,93,'24,30'),(677,15,37,50,'24'),(678,15,38,180,'16,13,14,29,2,34'),(679,15,39,70,'24,37'),(680,15,40,184,'24,30,36'),(681,16,0,57,'26,22'),(682,16,1,120,'13,14,29,2'),(683,16,2,103,'13,14,29'),(684,16,3,115,'26,22,0,7,5'),(685,16,4,132,'26,22,0,7,5,3'),(686,16,5,86,'26,22,0,7'),(687,16,6,71,'13,14'),(688,16,7,70,'26,22,0'),(689,16,8,74,'26,19'),(690,16,9,49,'15'),(691,16,10,82,'26,19,8'),(692,16,11,65,'26,22,0'),(693,16,12,54,'26'),(694,16,13,35,''),(695,16,14,43,'13'),(696,16,15,23,''),(697,16,17,162,'26,19,8,10,21'),(698,16,18,59,'13'),(699,16,19,47,'26'),(700,16,20,94,'30,36'),(701,16,21,153,'26,19,8,10'),(702,16,22,40,'26'),(703,16,23,128,'26,22,0,11'),(704,16,24,50,'30'),(705,16,25,177,'30,24,37,39'),(706,16,26,21,''),(707,16,27,77,'26,12'),(708,16,28,94,'13,14,29'),(709,16,29,68,'13,14'),(710,16,30,32,''),(711,16,31,235,'30,32'),(712,16,32,163,'30'),(713,16,33,158,'13,14,29,2,34'),(714,16,34,141,'13,14,29,2'),(715,16,35,216,'13,14,29,2,34,33'),(716,16,36,74,'30'),(717,16,37,67,'30,24'),(718,16,38,157,'13,14,29,2,34'),(719,16,39,87,'30,24,37'),(720,16,40,165,'30,36'),(721,17,0,127,'21,23,11'),(722,17,1,132,'21,38,34'),(723,17,2,138,'21,38,34'),(724,17,3,172,'21,23,5'),(725,17,4,189,'21,23,5,3'),(726,17,5,143,'21,23'),(727,17,6,101,'21,10'),(728,17,7,138,'21,23,11'),(729,17,8,88,'21,10'),(730,17,9,174,'21,23,11,7,12'),(731,17,10,80,'21'),(732,17,11,119,'21,23'),(733,17,12,156,'21,23,11,7'),(734,17,13,136,'21,10,8,19'),(735,17,14,129,'21,10,6'),(736,17,15,172,'21,23,11,0,22'),(737,17,16,162,'21,10,8,19,26'),(738,17,18,160,'21,10,8,19,13'),(739,17,19,115,'21,10,8'),(740,17,20,196,'21,10,8,19,13,18'),(741,17,21,9,''),(742,17,22,144,'21,23,11,0'),(743,17,23,56,'21'),(744,17,24,205,'21,23,11,0,22,15'),(745,17,25,323,'21,23,11,7,12,9,37,39'),(746,17,26,141,'21,10,8,19'),(747,17,27,157,'21,23,5'),(748,17,28,165,'21,38,34,1'),(749,17,29,154,'21,10,6,14'),(750,17,30,194,'21,10,8,19,26'),(751,17,31,345,'21,10,8,19,13,36,40'),(752,17,32,325,'21,10,8,19,26,30'),(753,17,33,92,'21,38'),(754,17,34,100,'21,38'),(755,17,35,150,'21,38,33'),(756,17,36,176,'21,10,8,19,13'),(757,17,37,213,'21,23,11,7,12,9'),(758,17,38,84,'21'),(759,17,39,233,'21,23,11,7,12,9,37'),(760,17,40,267,'21,10,8,19,13,36'),(761,18,0,107,'13,19,26,22'),(762,18,1,63,'2'),(763,18,2,46,''),(764,18,3,165,'13,19,26,22,0,7,5'),(765,18,4,182,'13,19,26,22,0,7,5,3'),(766,18,5,136,'13,19,26,22,0,7'),(767,18,6,60,'13,14'),(768,18,7,120,'13,19,26,22,0'),(769,18,8,72,'13,19'),(770,18,9,108,'13,16,15'),(771,18,10,80,'13,19,8'),(772,18,11,115,'13,19,26,22,0'),(773,18,12,104,'13,19,26'),(774,18,13,24,''),(775,18,14,32,'13'),(776,18,15,82,'13,16'),(777,18,16,59,'13'),(778,18,17,160,'13,19,8,10,21'),(779,18,19,45,'13'),(780,18,20,36,''),(781,18,21,151,'13,19,8,10'),(782,18,22,90,'13,19,26'),(783,18,23,178,'13,19,26,22,0,11'),(784,18,24,109,'13,16,30'),(785,18,25,236,'13,16,30,24,37,39'),(786,18,26,71,'13,19'),(787,18,27,127,'13,19,26,12'),(788,18,28,37,'29'),(789,18,29,11,''),(790,18,30,91,'13,16'),(791,18,31,225,'20,36,40'),(792,18,32,214,'20,36,40'),(793,18,33,101,'2,34'),(794,18,34,84,'2'),(795,18,35,159,'2,34,33'),(796,18,36,56,'20'),(797,18,37,126,'13,16,30,24'),(798,18,38,100,'2,34'),(799,18,39,146,'13,16,30,24,37'),(800,18,40,147,'20,36'),(801,19,0,62,'26,22'),(802,19,1,91,'14,29,2'),(803,19,2,74,'14,29'),(804,19,3,120,'26,22,0,7,5'),(805,19,4,137,'26,22,0,7,5,3'),(806,19,5,91,'26,22,0,7'),(807,19,6,42,'14'),(808,19,7,75,'26,22,0'),(809,19,8,27,''),(810,19,9,77,'26,12'),(811,19,10,35,'8'),(812,19,11,70,'26,22,0'),(813,19,12,59,'26'),(814,19,13,21,''),(815,19,14,14,''),(816,19,15,70,'26,16'),(817,19,16,47,'26'),(818,19,17,115,'8,10,21'),(819,19,18,45,'13'),(820,19,20,81,'13,18'),(821,19,21,106,'8,10'),(822,19,22,45,'26'),(823,19,23,133,'26,22,0,11'),(824,19,24,97,'26,30'),(825,19,25,224,'26,30,24,37,39'),(826,19,26,26,''),(827,19,27,82,'26,12'),(828,19,28,65,'14,29'),(829,19,29,39,'14'),(830,19,30,79,'26'),(831,19,31,230,'13,36,40'),(832,19,32,210,'26,30'),(833,19,33,129,'14,29,2,34'),(834,19,34,112,'14,29,2'),(835,19,35,187,'14,29,2,34,33'),(836,19,36,61,'13'),(837,19,37,114,'26,30,24'),(838,19,38,128,'14,29,2,34'),(839,19,39,134,'26,30,24,37'),(840,19,40,152,'13,36'),(841,20,0,143,'36,13,19,26,22'),(842,20,1,99,'18,2'),(843,20,2,82,'18'),(844,20,3,201,'36,13,19,26,22,0,7,5'),(845,20,4,218,'36,13,19,26,22,0,7,5,3'),(846,20,5,172,'36,13,19,26,22,0,7'),(847,20,6,96,'36,13,14'),(848,20,7,156,'36,13,19,26,22,0'),(849,20,8,108,'36,13,19'),(850,20,9,136,'36,30,24,37'),(851,20,10,116,'36,13,19,8'),(852,20,11,151,'36,13,19,26,22,0'),(853,20,12,140,'36,13,19,26'),(854,20,13,60,'36'),(855,20,14,68,'36,13'),(856,20,15,113,'36,30,24'),(857,20,16,94,'36,30'),(858,20,17,196,'36,13,19,8,10,21'),(859,20,18,36,''),(860,20,19,81,'36,13'),(861,20,21,187,'36,13,19,8,10'),(862,20,22,126,'36,13,19,26'),(863,20,23,214,'36,13,19,26,22,0,11'),(864,20,24,80,'36,30'),(865,20,25,207,'36,30,24,37,39'),(866,20,26,107,'36,13,19'),(867,20,27,163,'36,13,19,26,12'),(868,20,28,70,''),(869,20,29,47,'18'),(870,20,30,62,'36'),(871,20,31,189,'36,40'),(872,20,32,178,'36,40'),(873,20,33,137,'18,2,34'),(874,20,34,120,'18,2'),(875,20,35,195,'18,2,34,33'),(876,20,36,20,''),(877,20,37,97,'36,30,24'),(878,20,38,136,'18,2,34'),(879,20,39,117,'36,30,24,37'),(880,20,40,111,'36'),(881,21,0,118,'23,11'),(882,21,1,123,'38,34'),(883,21,2,129,'38,34'),(884,21,3,163,'23,5'),(885,21,4,180,'23,5,3'),(886,21,5,134,'23'),(887,21,6,92,'10'),(888,21,7,129,'23,11'),(889,21,8,79,'10'),(890,21,9,165,'23,11,7,12'),(891,21,10,71,''),(892,21,11,110,'23'),(893,21,12,147,'23,11,7'),(894,21,13,127,'10,8,19'),(895,21,14,120,'10,6'),(896,21,15,163,'23,11,0,22'),(897,21,16,153,'10,8,19,26'),(898,21,17,9,''),(899,21,18,151,'10,8,19,13'),(900,21,19,106,'10,8'),(901,21,20,187,'10,8,19,13,18'),(902,21,22,135,'23,11,0'),(903,21,23,47,''),(904,21,24,196,'23,11,0,22,15'),(905,21,25,314,'23,11,7,12,9,37,39'),(906,21,26,132,'10,8,19'),(907,21,27,148,'23,5'),(908,21,28,156,'38,34,1'),(909,21,29,145,'10,6,14'),(910,21,30,185,'10,8,19,26'),(911,21,31,336,'10,8,19,13,36,40'),(912,21,32,316,'10,8,19,26,30'),(913,21,33,83,'38'),(914,21,34,91,'38'),(915,21,35,141,'38,33'),(916,21,36,167,'10,8,19,13'),(917,21,37,204,'23,11,7,12,9'),(918,21,38,75,''),(919,21,39,224,'23,11,7,12,9,37'),(920,21,40,258,'10,8,19,13,36'),(921,22,0,17,''),(922,22,1,136,'26,19,14,29,2'),(923,22,2,119,'26,19,14,29'),(924,22,3,75,'0,7,5'),(925,22,4,92,'0,7,5,3'),(926,22,5,46,'0,7'),(927,22,6,77,'0,8'),(928,22,7,30,'0'),(929,22,8,61,'0'),(930,22,9,32,'12'),(931,22,10,66,'0,11'),(932,22,11,25,'0'),(933,22,12,14,''),(934,22,13,66,'26,19'),(935,22,14,59,'26,19'),(936,22,15,28,''),(937,22,16,40,'26'),(938,22,17,144,'0,11,23,21'),(939,22,18,90,'26,19,13'),(940,22,19,45,'26'),(941,22,20,126,'26,19,13,18'),(942,22,21,135,'0,11,23'),(943,22,23,88,'0,11'),(944,22,24,61,'15'),(945,22,25,181,'12,9,37,39'),(946,22,26,19,''),(947,22,27,37,'12'),(948,22,28,110,'26,19,14,29'),(949,22,29,84,'26,19,14'),(950,22,30,72,'26'),(951,22,31,275,'26,19,13,36,40'),(952,22,32,203,'26,30'),(953,22,33,174,'26,19,14,29,2,34'),(954,22,34,157,'26,19,14,29,2'),(955,22,35,232,'26,19,14,29,2,34,33'),(956,22,36,106,'26,19,13'),(957,22,37,71,'12,9'),(958,22,38,173,'26,19,14,29,2,34'),(959,22,39,91,'12,9,37'),(960,22,40,197,'26,19,13,36'),(961,23,0,71,'11'),(962,23,1,170,'21,38,34'),(963,23,2,174,'11,10,6'),(964,23,3,116,'5'),(965,23,4,133,'5,3'),(966,23,5,87,''),(967,23,6,125,'11,10'),(968,23,7,82,'11'),(969,23,8,112,'11,10'),(970,23,9,118,'11,7,12'),(971,23,10,104,'11'),(972,23,11,63,''),(973,23,12,100,'11,7'),(974,23,13,154,'11,0,22,26,19'),(975,23,14,147,'11,0,22,26,19'),(976,23,15,116,'11,0,22'),(977,23,16,128,'11,0,22,26'),(978,23,17,56,'21'),(979,23,18,178,'11,0,22,26,19,13'),(980,23,19,133,'11,0,22,26'),(981,23,20,214,'11,0,22,26,19,13,18'),(982,23,21,47,''),(983,23,22,88,'11,0'),(984,23,24,149,'11,0,22,15'),(985,23,25,267,'11,7,12,9,37,39'),(986,23,26,107,'11,0,22'),(987,23,27,101,'5'),(988,23,28,198,'11,0,22,26,19,14,29'),(989,23,29,172,'11,0,22,26,19,14'),(990,23,30,160,'11,0,22,26'),(991,23,31,363,'11,0,22,26,19,13,36,40'),(992,23,32,291,'11,0,22,26,30'),(993,23,33,130,'21,38'),(994,23,34,138,'21,38'),(995,23,35,188,'21,38,33'),(996,23,36,194,'11,0,22,26,19,13'),(997,23,37,157,'11,7,12,9'),(998,23,38,122,'21'),(999,23,39,177,'11,7,12,9,37'),(1000,23,40,285,'11,0,22,26,19,13,36'),(1001,24,0,78,'15,22'),(1002,24,1,170,'30,16,13,14,29,2'),(1003,24,2,153,'30,16,13,14,29'),(1004,24,3,136,'15,22,0,7,5'),(1005,24,4,153,'15,22,0,7,5,3'),(1006,24,5,107,'15,22,0,7'),(1007,24,6,121,'30,16,13,14'),(1008,24,7,91,'15,22,0'),(1009,24,8,122,'15,22,0'),(1010,24,9,56,'37'),(1011,24,10,127,'15,22,0,11'),(1012,24,11,86,'15,22,0'),(1013,24,12,74,'37,9'),(1014,24,13,85,'30,16'),(1015,24,14,93,'30,16,13'),(1016,24,15,33,''),(1017,24,16,50,'30'),(1018,24,17,205,'15,22,0,11,23,21'),(1019,24,18,109,'30,16,13'),(1020,24,19,97,'30,26'),(1021,24,20,80,'30,36'),(1022,24,21,196,'15,22,0,11,23'),(1023,24,22,61,'15'),(1024,24,23,149,'15,22,0,11'),(1025,24,25,127,'37,39'),(1026,24,26,71,'30'),(1027,24,27,97,'37,9,12'),(1028,24,28,144,'30,16,13,14,29'),(1029,24,29,118,'30,16,13,14'),(1030,24,30,18,''),(1031,24,31,221,'30,32'),(1032,24,32,149,'30'),(1033,24,33,208,'30,16,13,14,29,2,34'),(1034,24,34,191,'30,16,13,14,29,2'),(1035,24,35,266,'30,16,13,14,29,2,34,33'),(1036,24,36,60,'30'),(1037,24,37,17,''),(1038,24,38,207,'30,16,13,14,29,2,34'),(1039,24,39,37,'37'),(1040,24,40,151,'30,36'),(1041,25,0,198,'39,37,9,12,22'),(1042,25,1,297,'39,37,24,30,16,13,14,29,2'),(1043,25,2,280,'39,37,24,30,16,13,14,29'),(1044,25,3,230,'39,37,9,12,7,5'),(1045,25,4,247,'39,37,9,12,7,5,3'),(1046,25,5,201,'39,37,9,12,7'),(1047,25,6,248,'39,37,24,30,16,13,14'),(1048,25,7,185,'39,37,9,12'),(1049,25,8,242,'39,37,9,12,22,0'),(1050,25,9,149,'39,37'),(1051,25,10,245,'39,37,9,12,7,11'),(1052,25,11,204,'39,37,9,12,7'),(1053,25,12,167,'39,37,9'),(1054,25,13,212,'39,37,24,30,16'),(1055,25,14,220,'39,37,24,30,16,13'),(1056,25,15,160,'39,37,24'),(1057,25,16,177,'39,37,24,30'),(1058,25,17,323,'39,37,9,12,7,11,23,21'),(1059,25,18,236,'39,37,24,30,16,13'),(1060,25,19,224,'39,37,24,30,26'),(1061,25,20,207,'39,37,24,30,36'),(1062,25,21,314,'39,37,9,12,7,11,23'),(1063,25,22,181,'39,37,9,12'),(1064,25,23,267,'39,37,9,12,7,11'),(1065,25,24,127,'39,37'),(1066,25,26,198,'39,37,24,30'),(1067,25,27,190,'39,37,9,12'),(1068,25,28,271,'39,37,24,30,16,13,14,29'),(1069,25,29,245,'39,37,24,30,16,13,14'),(1070,25,30,145,'39,37,24'),(1071,25,31,120,'32'),(1072,25,32,48,''),(1073,25,33,335,'39,37,24,30,16,13,14,29,2,34'),(1074,25,34,318,'39,37,24,30,16,13,14,29,2'),(1075,25,35,393,'39,37,24,30,16,13,14,29,2,34,33'),(1076,25,36,187,'39,37,24,30'),(1077,25,37,110,'39'),(1078,25,38,334,'39,37,24,30,16,13,14,29,2,34'),(1079,25,39,90,''),(1080,25,40,115,'32'),(1081,26,0,36,'22'),(1082,26,1,117,'19,14,29,2'),(1083,26,2,100,'19,14,29'),(1084,26,3,94,'22,0,7,5'),(1085,26,4,111,'22,0,7,5,3'),(1086,26,5,65,'22,0,7'),(1087,26,6,68,'19,14'),(1088,26,7,49,'22,0'),(1089,26,8,53,'19'),(1090,26,9,51,'12'),(1091,26,10,61,'19,8'),(1092,26,11,44,'22,0'),(1093,26,12,33,''),(1094,26,13,47,'19'),(1095,26,14,40,'19'),(1096,26,15,44,'16'),(1097,26,16,21,''),(1098,26,17,141,'19,8,10,21'),(1099,26,18,71,'19,13'),(1100,26,19,26,''),(1101,26,20,107,'19,13,18'),(1102,26,21,132,'19,8,10'),(1103,26,22,19,''),(1104,26,23,107,'22,0,11'),(1105,26,24,71,'30'),(1106,26,25,198,'30,24,37,39'),(1107,26,27,56,'12'),(1108,26,28,91,'19,14,29'),(1109,26,29,65,'19,14'),(1110,26,30,53,''),(1111,26,31,256,'19,13,36,40'),(1112,26,32,184,'30'),(1113,26,33,155,'19,14,29,2,34'),(1114,26,34,138,'19,14,29,2'),(1115,26,35,213,'19,14,29,2,34,33'),(1116,26,36,87,'19,13'),(1117,26,37,88,'30,24'),(1118,26,38,154,'19,14,29,2,34'),(1119,26,39,108,'30,24,37'),(1120,26,40,178,'19,13,36'),(1121,27,0,43,'5,7'),(1122,27,1,169,'5,7,0,8,6,2'),(1123,27,2,152,'5,7,0,8,6'),(1124,27,3,43,'5'),(1125,27,4,60,'5,3'),(1126,27,5,14,''),(1127,27,6,103,'5,7,0,8'),(1128,27,7,30,'5'),(1129,27,8,87,'5,7,0'),(1130,27,9,41,'12'),(1131,27,10,90,'5,7,11'),(1132,27,11,49,'5,7'),(1133,27,12,23,''),(1134,27,13,103,'12,26,19'),(1135,27,14,96,'12,26,19'),(1136,27,15,65,'12,22'),(1137,27,16,77,'12,26'),(1138,27,17,157,'5,23,21'),(1139,27,18,127,'12,26,19,13'),(1140,27,19,82,'12,26'),(1141,27,20,163,'12,26,19,13,18'),(1142,27,21,148,'5,23'),(1143,27,22,37,'12'),(1144,27,23,101,'5'),(1145,27,24,97,'12,9,37'),(1146,27,25,190,'12,9,37,39'),(1147,27,26,56,'12'),(1148,27,28,147,'12,26,19,14,29'),(1149,27,29,121,'12,26,19,14'),(1150,27,30,109,'12,26'),(1151,27,31,310,'12,9,37,39,25,32'),(1152,27,32,238,'12,9,37,39,25'),(1153,27,33,207,'5,7,0,8,6,2,34'),(1154,27,34,190,'5,7,0,8,6,2'),(1155,27,35,265,'5,7,0,8,6,2,34,33'),(1156,27,36,143,'12,26,19,13'),(1157,27,37,80,'12,9'),(1158,27,38,206,'5,7,0,8,6,2,34'),(1159,27,39,100,'12,9,37'),(1160,27,40,234,'12,26,19,13,36'),(1161,28,0,127,'29,14,19,26,22'),(1162,28,1,33,''),(1163,28,2,50,'1'),(1164,28,3,185,'29,14,19,26,22,0,7,5'),(1165,28,4,202,'29,14,19,26,22,0,7,5,3'),(1166,28,5,156,'29,14,19,26,22,0,7'),(1167,28,6,79,'29,14'),(1168,28,7,140,'29,14,19,26,22,0'),(1169,28,8,92,'29,14,19'),(1170,28,9,142,'29,14,19,26,12'),(1171,28,10,100,'29,14,6'),(1172,28,11,135,'29,14,19,26,22,0'),(1173,28,12,124,'29,14,19,26'),(1174,28,13,59,'29,14'),(1175,28,14,51,'29'),(1176,28,15,117,'29,14,13,16'),(1177,28,16,94,'29,14,13'),(1178,28,17,165,'1,34,38,21'),(1179,28,18,37,'29'),(1180,28,19,65,'29,14'),(1181,28,20,70,''),(1182,28,21,156,'1,34,38'),(1183,28,22,110,'29,14,19,26'),(1184,28,23,198,'29,14,19,26,22,0,11'),(1185,28,24,144,'29,14,13,16,30'),(1186,28,25,271,'29,14,13,16,30,24,37,39'),(1187,28,26,91,'29,14,19'),(1188,28,27,147,'29,14,19,26,12'),(1189,28,29,26,''),(1190,28,30,126,'29,14,13,16'),(1191,28,31,259,'20,36,40'),(1192,28,32,248,'20,36,40'),(1193,28,33,82,'1,34'),(1194,28,34,65,'1'),(1195,28,35,140,'1,34,33'),(1196,28,36,90,'20'),(1197,28,37,161,'29,14,13,16,30,24'),(1198,28,38,81,'1,34'),(1199,28,39,181,'29,14,13,16,30,24,37'),(1200,28,40,181,'20,36'),(1201,29,0,101,'14,19,26,22'),(1202,29,1,52,'2'),(1203,29,2,35,''),(1204,29,3,159,'14,19,26,22,0,7,5'),(1205,29,4,176,'14,19,26,22,0,7,5,3'),(1206,29,5,130,'14,19,26,22,0,7'),(1207,29,6,53,'14'),(1208,29,7,114,'14,19,26,22,0'),(1209,29,8,66,'14,19'),(1210,29,9,116,'14,19,26,12'),(1211,29,10,74,'14,6'),(1212,29,11,109,'14,19,26,22,0'),(1213,29,12,98,'14,19,26'),(1214,29,13,33,'14'),(1215,29,14,25,''),(1216,29,15,91,'14,13,16'),(1217,29,16,68,'14,13'),(1218,29,17,154,'14,6,10,21'),(1219,29,18,11,''),(1220,29,19,39,'14'),(1221,29,20,47,'18'),(1222,29,21,145,'14,6,10'),(1223,29,22,84,'14,19,26'),(1224,29,23,172,'14,19,26,22,0,11'),(1225,29,24,118,'14,13,16,30'),(1226,29,25,245,'14,13,16,30,24,37,39'),(1227,29,26,65,'14,19'),(1228,29,27,121,'14,19,26,12'),(1229,29,28,26,''),(1230,29,30,100,'14,13,16'),(1231,29,31,236,'18,20,36,40'),(1232,29,32,225,'18,20,36,40'),(1233,29,33,90,'2,34'),(1234,29,34,73,'2'),(1235,29,35,148,'2,34,33'),(1236,29,36,67,'18,20'),(1237,29,37,135,'14,13,16,30,24'),(1238,29,38,89,'2,34'),(1239,29,39,155,'14,13,16,30,24,37'),(1240,29,40,158,'18,20,36'),(1241,30,0,89,'26,22'),(1242,30,1,152,'16,13,14,29,2'),(1243,30,2,135,'16,13,14,29'),(1244,30,3,147,'26,22,0,7,5'),(1245,30,4,164,'26,22,0,7,5,3'),(1246,30,5,118,'26,22,0,7'),(1247,30,6,103,'16,13,14'),(1248,30,7,102,'26,22,0'),(1249,30,8,106,'26,19'),(1250,30,9,74,'24,37'),(1251,30,10,114,'26,19,8'),(1252,30,11,97,'26,22,0'),(1253,30,12,86,'26'),(1254,30,13,67,'16'),(1255,30,14,75,'16,13'),(1256,30,15,51,'24'),(1257,30,16,32,''),(1258,30,17,194,'26,19,8,10,21'),(1259,30,18,91,'16,13'),(1260,30,19,79,'26'),(1261,30,20,62,'36'),(1262,30,21,185,'26,19,8,10'),(1263,30,22,72,'26'),(1264,30,23,160,'26,22,0,11'),(1265,30,24,18,''),(1266,30,25,145,'24,37,39'),(1267,30,26,53,''),(1268,30,27,109,'26,12'),(1269,30,28,126,'16,13,14,29'),(1270,30,29,100,'16,13,14'),(1271,30,31,203,'32'),(1272,30,32,131,''),(1273,30,33,190,'16,13,14,29,2,34'),(1274,30,34,173,'16,13,14,29,2'),(1275,30,35,248,'16,13,14,29,2,34,33'),(1276,30,36,42,''),(1277,30,37,35,'24'),(1278,30,38,189,'16,13,14,29,2,34'),(1279,30,39,55,'24,37'),(1280,30,40,133,'36'),(1281,31,0,292,'32,30,26,22'),(1282,31,1,288,'40,36,20,18,2'),(1283,31,2,271,'40,36,20,18'),(1284,31,3,350,'32,25,39,37,9,12,7,5'),(1285,31,4,367,'32,25,39,37,9,12,7,5,3'),(1286,31,5,321,'32,25,39,37,9,12,7'),(1287,31,6,245,'40,36,13,14'),(1288,31,7,305,'32,25,39,37,9,12'),(1289,31,8,257,'40,36,13,19'),(1290,31,9,269,'32,25,39,37'),(1291,31,10,265,'40,36,13,19,8'),(1292,31,11,300,'32,30,26,22,0'),(1293,31,12,287,'32,25,39,37,9'),(1294,31,13,209,'40,36'),(1295,31,14,217,'40,36,13'),(1296,31,15,254,'32,30,24'),(1297,31,16,235,'32,30'),(1298,31,17,345,'40,36,13,19,8,10,21'),(1299,31,18,225,'40,36,20'),(1300,31,19,230,'40,36,13'),(1301,31,20,189,'40,36'),(1302,31,21,336,'40,36,13,19,8,10'),(1303,31,22,275,'32,30,26'),(1304,31,23,363,'32,30,26,22,0,11'),(1305,31,24,221,'32,30'),(1306,31,25,120,'32'),(1307,31,26,256,'32,30'),(1308,31,27,310,'32,25,39,37,9,12'),(1309,31,28,259,'40,36,20'),(1310,31,29,236,'40,36,20,18'),(1311,31,30,203,'32'),(1312,31,32,72,''),(1313,31,33,326,'40,36,20,18,2,34'),(1314,31,34,309,'40,36,20,18,2'),(1315,31,35,384,'40,36,20,18,2,34,33'),(1316,31,36,169,'40'),(1317,31,37,230,'32,25,39'),(1318,31,38,325,'40,36,20,18,2,34'),(1319,31,39,210,'32,25'),(1320,31,40,78,''),(1321,32,0,220,'30,26,22'),(1322,32,1,277,'40,36,20,18,2'),(1323,32,2,260,'40,36,20,18'),(1324,32,3,278,'25,39,37,9,12,7,5'),(1325,32,4,295,'25,39,37,9,12,7,5,3'),(1326,32,5,249,'25,39,37,9,12,7'),(1327,32,6,234,'40,36,13,14'),(1328,32,7,233,'25,39,37,9,12'),(1329,32,8,237,'30,26,19'),(1330,32,9,197,'25,39,37'),(1331,32,10,245,'30,26,19,8'),(1332,32,11,228,'30,26,22,0'),(1333,32,12,215,'25,39,37,9'),(1334,32,13,198,'40,36'),(1335,32,14,206,'40,36,13'),(1336,32,15,182,'30,24'),(1337,32,16,163,'30'),(1338,32,17,325,'30,26,19,8,10,21'),(1339,32,18,214,'40,36,20'),(1340,32,19,210,'30,26'),(1341,32,20,178,'40,36'),(1342,32,21,316,'30,26,19,8,10'),(1343,32,22,203,'30,26'),(1344,32,23,291,'30,26,22,0,11'),(1345,32,24,149,'30'),(1346,32,25,48,''),(1347,32,26,184,'30'),(1348,32,27,238,'25,39,37,9,12'),(1349,32,28,248,'40,36,20'),(1350,32,29,225,'40,36,20,18'),(1351,32,30,131,''),(1352,32,31,72,''),(1353,32,33,315,'40,36,20,18,2,34'),(1354,32,34,298,'40,36,20,18,2'),(1355,32,35,373,'40,36,20,18,2,34,33'),(1356,32,36,158,'40'),(1357,32,37,158,'25,39'),(1358,32,38,314,'40,36,20,18,2,34'),(1359,32,39,138,'25'),(1360,32,40,67,''),(1361,33,0,164,'34,2,6,8'),(1362,33,1,49,'34'),(1363,33,2,55,'34'),(1364,33,3,222,'34,2,6,8,0,7,5'),(1365,33,4,239,'34,2,6,8,0,7,5,3'),(1366,33,5,193,'34,2,6,8,0,7'),(1367,33,6,104,'34,2'),(1368,33,7,177,'34,2,6,8,0'),(1369,33,8,120,'34,2,6'),(1370,33,9,206,'34,2,29,14,19,26,12'),(1371,33,10,125,'34,2,6'),(1372,33,11,166,'34,2,6,10'),(1373,33,12,188,'34,2,29,14,19,26'),(1374,33,13,123,'34,2,29,14'),(1375,33,14,115,'34,2,29'),(1376,33,15,181,'34,2,29,14,13,16'),(1377,33,16,158,'34,2,29,14,13'),(1378,33,17,92,'38,21'),(1379,33,18,101,'34,2'),(1380,33,19,129,'34,2,29,14'),(1381,33,20,137,'34,2,18'),(1382,33,21,83,'38'),(1383,33,22,174,'34,2,29,14,19,26'),(1384,33,23,130,'38,21'),(1385,33,24,208,'34,2,29,14,13,16,30'),(1386,33,25,335,'34,2,29,14,13,16,30,24,37,39'),(1387,33,26,155,'34,2,29,14,19'),(1388,33,27,207,'34,2,6,8,0,7,5'),(1389,33,28,82,'34,1'),(1390,33,29,90,'34,2'),(1391,33,30,190,'34,2,29,14,13,16'),(1392,33,31,326,'34,2,18,20,36,40'),(1393,33,32,315,'34,2,18,20,36,40'),(1394,33,34,17,''),(1395,33,35,58,''),(1396,33,36,157,'34,2,18,20'),(1397,33,37,225,'34,2,29,14,13,16,30,24'),(1398,33,38,8,''),(1399,33,39,245,'34,2,29,14,13,16,30,24,37'),(1400,33,40,248,'34,2,18,20,36'),(1401,34,0,147,'2,6,8'),(1402,34,1,32,''),(1403,34,2,38,''),(1404,34,3,205,'2,6,8,0,7,5'),(1405,34,4,222,'2,6,8,0,7,5,3'),(1406,34,5,176,'2,6,8,0,7'),(1407,34,6,87,'2'),(1408,34,7,160,'2,6,8,0'),(1409,34,8,103,'2,6'),(1410,34,9,189,'2,29,14,19,26,12'),(1411,34,10,108,'2,6'),(1412,34,11,149,'2,6,10'),(1413,34,12,171,'2,29,14,19,26'),(1414,34,13,106,'2,29,14'),(1415,34,14,98,'2,29'),(1416,34,15,164,'2,29,14,13,16'),(1417,34,16,141,'2,29,14,13'),(1418,34,17,100,'38,21'),(1419,34,18,84,'2'),(1420,34,19,112,'2,29,14'),(1421,34,20,120,'2,18'),(1422,34,21,91,'38'),(1423,34,22,157,'2,29,14,19,26'),(1424,34,23,138,'38,21'),(1425,34,24,191,'2,29,14,13,16,30'),(1426,34,25,318,'2,29,14,13,16,30,24,37,39'),(1427,34,26,138,'2,29,14,19'),(1428,34,27,190,'2,6,8,0,7,5'),(1429,34,28,65,'1'),(1430,34,29,73,'2'),(1431,34,30,173,'2,29,14,13,16'),(1432,34,31,309,'2,18,20,36,40'),(1433,34,32,298,'2,18,20,36,40'),(1434,34,33,17,''),(1435,34,35,75,'33'),(1436,34,36,140,'2,18,20'),(1437,34,37,208,'2,29,14,13,16,30,24'),(1438,34,38,16,''),(1439,34,39,228,'2,29,14,13,16,30,24,37'),(1440,34,40,231,'2,18,20,36'),(1441,35,0,222,'33,34,2,6,8'),(1442,35,1,107,'33,34'),(1443,35,2,113,'33,34'),(1444,35,3,280,'33,34,2,6,8,0,7,5'),(1445,35,4,297,'33,34,2,6,8,0,7,5,3'),(1446,35,5,251,'33,34,2,6,8,0,7'),(1447,35,6,162,'33,34,2'),(1448,35,7,235,'33,34,2,6,8,0'),(1449,35,8,178,'33,34,2,6'),(1450,35,9,264,'33,34,2,29,14,19,26,12'),(1451,35,10,183,'33,34,2,6'),(1452,35,11,224,'33,34,2,6,10'),(1453,35,12,246,'33,34,2,29,14,19,26'),(1454,35,13,181,'33,34,2,29,14'),(1455,35,14,173,'33,34,2,29'),(1456,35,15,239,'33,34,2,29,14,13,16'),(1457,35,16,216,'33,34,2,29,14,13'),(1458,35,17,150,'33,38,21'),(1459,35,18,159,'33,34,2'),(1460,35,19,187,'33,34,2,29,14'),(1461,35,20,195,'33,34,2,18'),(1462,35,21,141,'33,38'),(1463,35,22,232,'33,34,2,29,14,19,26'),(1464,35,23,188,'33,38,21'),(1465,35,24,266,'33,34,2,29,14,13,16,30'),(1466,35,25,393,'33,34,2,29,14,13,16,30,24,37,39'),(1467,35,26,213,'33,34,2,29,14,19'),(1468,35,27,265,'33,34,2,6,8,0,7,5'),(1469,35,28,140,'33,34,1'),(1470,35,29,148,'33,34,2'),(1471,35,30,248,'33,34,2,29,14,13,16'),(1472,35,31,384,'33,34,2,18,20,36,40'),(1473,35,32,373,'33,34,2,18,20,36,40'),(1474,35,33,58,''),(1475,35,34,75,'33'),(1476,35,36,215,'33,34,2,18,20'),(1477,35,37,283,'33,34,2,29,14,13,16,30,24'),(1478,35,38,66,'33'),(1479,35,39,303,'33,34,2,29,14,13,16,30,24,37'),(1480,35,40,306,'33,34,2,18,20,36'),(1481,36,0,123,'13,19,26,22'),(1482,36,1,119,'20,18,2'),(1483,36,2,102,'20,18'),(1484,36,3,181,'13,19,26,22,0,7,5'),(1485,36,4,198,'13,19,26,22,0,7,5,3'),(1486,36,5,152,'13,19,26,22,0,7'),(1487,36,6,76,'13,14'),(1488,36,7,136,'13,19,26,22,0'),(1489,36,8,88,'13,19'),(1490,36,9,116,'30,24,37'),(1491,36,10,96,'13,19,8'),(1492,36,11,131,'13,19,26,22,0'),(1493,36,12,120,'13,19,26'),(1494,36,13,40,''),(1495,36,14,48,'13'),(1496,36,15,93,'30,24'),(1497,36,16,74,'30'),(1498,36,17,176,'13,19,8,10,21'),(1499,36,18,56,'20'),(1500,36,19,61,'13'),(1501,36,20,20,''),(1502,36,21,167,'13,19,8,10'),(1503,36,22,106,'13,19,26'),(1504,36,23,194,'13,19,26,22,0,11'),(1505,36,24,60,'30'),(1506,36,25,187,'30,24,37,39'),(1507,36,26,87,'13,19'),(1508,36,27,143,'13,19,26,12'),(1509,36,28,90,'20'),(1510,36,29,67,'20,18'),(1511,36,30,42,''),(1512,36,31,169,'40'),(1513,36,32,158,'40'),(1514,36,33,157,'20,18,2,34'),(1515,36,34,140,'20,18,2'),(1516,36,35,215,'20,18,2,34,33'),(1517,36,37,77,'30,24'),(1518,36,38,156,'20,18,2,34'),(1519,36,39,97,'30,24,37'),(1520,36,40,91,''),(1521,37,0,88,'9,12,22'),(1522,37,1,187,'24,30,16,13,14,29,2'),(1523,37,2,170,'24,30,16,13,14,29'),(1524,37,3,120,'9,12,7,5'),(1525,37,4,137,'9,12,7,5,3'),(1526,37,5,91,'9,12,7'),(1527,37,6,138,'24,30,16,13,14'),(1528,37,7,75,'9,12'),(1529,37,8,132,'9,12,22,0'),(1530,37,9,39,''),(1531,37,10,135,'9,12,7,11'),(1532,37,11,94,'9,12,7'),(1533,37,12,57,'9'),(1534,37,13,102,'24,30,16'),(1535,37,14,110,'24,30,16,13'),(1536,37,15,50,'24'),(1537,37,16,67,'24,30'),(1538,37,17,213,'9,12,7,11,23,21'),(1539,37,18,126,'24,30,16,13'),(1540,37,19,114,'24,30,26'),(1541,37,20,97,'24,30,36'),(1542,37,21,204,'9,12,7,11,23'),(1543,37,22,71,'9,12'),(1544,37,23,157,'9,12,7,11'),(1545,37,24,17,''),(1546,37,25,110,'39'),(1547,37,26,88,'24,30'),(1548,37,27,80,'9,12'),(1549,37,28,161,'24,30,16,13,14,29'),(1550,37,29,135,'24,30,16,13,14'),(1551,37,30,35,'24'),(1552,37,31,230,'39,25,32'),(1553,37,32,158,'39,25'),(1554,37,33,225,'24,30,16,13,14,29,2,34'),(1555,37,34,208,'24,30,16,13,14,29,2'),(1556,37,35,283,'24,30,16,13,14,29,2,34,33'),(1557,37,36,77,'24,30'),(1558,37,38,224,'24,30,16,13,14,29,2,34'),(1559,37,39,20,''),(1560,37,40,168,'24,30,36'),(1561,38,0,163,'34,2,6,8'),(1562,38,1,48,'34'),(1563,38,2,54,'34'),(1564,38,3,221,'34,2,6,8,0,7,5'),(1565,38,4,238,'34,2,6,8,0,7,5,3'),(1566,38,5,192,'34,2,6,8,0,7'),(1567,38,6,103,'34,2'),(1568,38,7,176,'34,2,6,8,0'),(1569,38,8,119,'34,2,6'),(1570,38,9,205,'34,2,29,14,19,26,12'),(1571,38,10,124,'34,2,6'),(1572,38,11,165,'34,2,6,10'),(1573,38,12,187,'34,2,29,14,19,26'),(1574,38,13,122,'34,2,29,14'),(1575,38,14,114,'34,2,29'),(1576,38,15,180,'34,2,29,14,13,16'),(1577,38,16,157,'34,2,29,14,13'),(1578,38,17,84,'21'),(1579,38,18,100,'34,2'),(1580,38,19,128,'34,2,29,14'),(1581,38,20,136,'34,2,18'),(1582,38,21,75,''),(1583,38,22,173,'34,2,29,14,19,26'),(1584,38,23,122,'21'),(1585,38,24,207,'34,2,29,14,13,16,30'),(1586,38,25,334,'34,2,29,14,13,16,30,24,37,39'),(1587,38,26,154,'34,2,29,14,19'),(1588,38,27,206,'34,2,6,8,0,7,5'),(1589,38,28,81,'34,1'),(1590,38,29,89,'34,2'),(1591,38,30,189,'34,2,29,14,13,16'),(1592,38,31,325,'34,2,18,20,36,40'),(1593,38,32,314,'34,2,18,20,36,40'),(1594,38,33,8,''),(1595,38,34,16,''),(1596,38,35,66,'33'),(1597,38,36,156,'34,2,18,20'),(1598,38,37,224,'34,2,29,14,13,16,30,24'),(1599,38,39,244,'34,2,29,14,13,16,30,24,37'),(1600,38,40,247,'34,2,18,20,36'),(1601,39,0,108,'37,9,12,22'),(1602,39,1,207,'37,24,30,16,13,14,29,2'),(1603,39,2,190,'37,24,30,16,13,14,29'),(1604,39,3,140,'37,9,12,7,5'),(1605,39,4,157,'37,9,12,7,5,3'),(1606,39,5,111,'37,9,12,7'),(1607,39,6,158,'37,24,30,16,13,14'),(1608,39,7,95,'37,9,12'),(1609,39,8,152,'37,9,12,22,0'),(1610,39,9,59,'37'),(1611,39,10,155,'37,9,12,7,11'),(1612,39,11,114,'37,9,12,7'),(1613,39,12,77,'37,9'),(1614,39,13,122,'37,24,30,16'),(1615,39,14,130,'37,24,30,16,13'),(1616,39,15,70,'37,24'),(1617,39,16,87,'37,24,30'),(1618,39,17,233,'37,9,12,7,11,23,21'),(1619,39,18,146,'37,24,30,16,13'),(1620,39,19,134,'37,24,30,26'),(1621,39,20,117,'37,24,30,36'),(1622,39,21,224,'37,9,12,7,11,23'),(1623,39,22,91,'37,9,12'),(1624,39,23,177,'37,9,12,7,11'),(1625,39,24,37,'37'),(1626,39,25,90,''),(1627,39,26,108,'37,24,30'),(1628,39,27,100,'37,9,12'),(1629,39,28,181,'37,24,30,16,13,14,29'),(1630,39,29,155,'37,24,30,16,13,14'),(1631,39,30,55,'37,24'),(1632,39,31,210,'25,32'),(1633,39,32,138,'25'),(1634,39,33,245,'37,24,30,16,13,14,29,2,34'),(1635,39,34,228,'37,24,30,16,13,14,29,2'),(1636,39,35,303,'37,24,30,16,13,14,29,2,34,33'),(1637,39,36,97,'37,24,30'),(1638,39,37,20,''),(1639,39,38,244,'37,24,30,16,13,14,29,2,34'),(1640,39,40,188,'37,24,30,36'),(1641,40,0,214,'36,13,19,26,22'),(1642,40,1,210,'36,20,18,2'),(1643,40,2,193,'36,20,18'),(1644,40,3,272,'36,13,19,26,22,0,7,5'),(1645,40,4,289,'36,13,19,26,22,0,7,5,3'),(1646,40,5,243,'36,13,19,26,22,0,7'),(1647,40,6,167,'36,13,14'),(1648,40,7,227,'36,13,19,26,22,0'),(1649,40,8,179,'36,13,19'),(1650,40,9,207,'36,30,24,37'),(1651,40,10,187,'36,13,19,8'),(1652,40,11,222,'36,13,19,26,22,0'),(1653,40,12,211,'36,13,19,26'),(1654,40,13,131,'36'),(1655,40,14,139,'36,13'),(1656,40,15,184,'36,30,24'),(1657,40,16,165,'36,30'),(1658,40,17,267,'36,13,19,8,10,21'),(1659,40,18,147,'36,20'),(1660,40,19,152,'36,13'),(1661,40,20,111,'36'),(1662,40,21,258,'36,13,19,8,10'),(1663,40,22,197,'36,13,19,26'),(1664,40,23,285,'36,13,19,26,22,0,11'),(1665,40,24,151,'36,30'),(1666,40,25,115,'32'),(1667,40,26,178,'36,13,19'),(1668,40,27,234,'36,13,19,26,12'),(1669,40,28,181,'36,20'),(1670,40,29,158,'36,20,18'),(1671,40,30,133,'36'),(1672,40,31,78,''),(1673,40,32,67,''),(1674,40,33,248,'36,20,18,2,34'),(1675,40,34,231,'36,20,18,2'),(1676,40,35,306,'36,20,18,2,34,33'),(1677,40,36,91,''),(1678,40,37,168,'36,30,24'),(1679,40,38,247,'36,20,18,2,34'),(1680,40,39,188,'36,30,24,37');
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhans`
--

DROP TABLE IF EXISTS `zhans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhans` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增的id',
  `zhan_name` char(10) NOT NULL DEFAULT '' COMMENT '站点名称',
  `line_id` tinyint(3) unsigned NOT NULL COMMENT '属于的线路。1号线，2号线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhans`
--

LOCK TABLES `zhans` WRITE;
/*!40000 ALTER TABLE `zhans` DISABLE KEYS */;
INSERT INTO `zhans` VALUES (1,'苹果园',1),(2,'古城',1),(3,'八角游乐园',1),(4,'八宝山',1),(5,'玉泉路',1),(6,'五棵松',1),(7,'万寿路',1),(8,'公主坟',1),(9,'军事博物馆',1),(10,'木樨地',1),(11,'南礼士路',1),(12,'复兴门',1),(13,'西单',1),(14,'天安门西',1),(15,'天安门东',1),(16,'王府井',1),(17,'东单',1),(18,'建国门',1),(19,'永安里',1),(20,'国贸',1),(21,'大望路',1),(22,'四惠',1),(23,'四惠东',1),(24,'西直门',2),(25,'积水潭',2),(26,'鼓楼大街',2),(27,'安定门',2),(28,'雍和宫',2),(29,'东直门',2),(30,'东四十条',2),(31,'朝阳门',2),(32,'建国门',2),(33,'北京站',2),(34,'崇文门',2),(35,'前门',2),(36,'和平门',2),(37,'宣武门',2),(38,'长椿街',2),(39,'复兴门',2),(40,'阜成门',2),(41,'车公庄',2),(42,'安河桥北',4),(43,'北宫门',4),(44,'西苑',4),(45,'圆明园',4),(46,'北京大学东门',4),(47,'中关村',4),(48,'海淀黄庄',4),(49,'人民大学',4),(50,'魏公村',4),(51,'国家图书馆',4),(52,'动物园',4),(53,'西直门',4),(54,'新街口',4),(55,'平安里',4),(56,'西四',4),(57,'灵境胡同',4),(58,'西单',4),(59,'宣武门',4),(60,'菜市口',4),(61,'陶然亭',4),(62,'北京南站',4),(63,'马家堡',4),(64,'角门西',4),(65,'公益西桥',4),(66,'宋家庄',5),(67,'刘家窑',5),(68,'蒲黄榆',5),(69,'天坛东门',5),(70,'磁器口',5),(71,'崇文门',5),(72,'东单',5),(73,'灯市口',5),(74,'东四',5),(75,'张自忠路',5),(76,'北新桥',5),(77,'雍和宫',5),(78,'和平里北街',5),(79,'和平西桥',5),(80,'惠新西街南口',5),(81,'惠新西街北口',5),(82,'大屯路东',5),(83,'北苑路北',5),(84,'立水桥南',5),(85,'立水桥',5),(86,'天通苑南',5),(87,'天通苑',5),(88,'天通苑北',5),(89,'海淀五路居',6),(90,'慈寿寺',6),(91,'花园桥',6),(92,'白石桥南',6),(93,'车公庄西',6),(94,'车公庄',6),(95,'平安里',6),(96,'北海北',6),(97,'南锣鼓巷',6),(98,'东四',6),(99,'朝阳门',6),(100,'东大桥',6),(101,'呼家楼',6),(102,'金台路',6),(103,'十里堡',6),(104,'青年路',6),(105,'褡裢坡',6),(106,'黄渠',6),(107,'常营',6),(108,'草房',6),(109,'朱辛庄',8),(110,'育知路',8),(111,'平西府',8),(112,'回龙观东大街',8),(113,'霍营',8),(114,'育新',8),(115,'西小口',8),(116,'永泰庄',8),(117,'林萃桥',8),(118,'森林公园南门',8),(119,'奥林匹克公园',8),(120,'奥体中心',8),(121,'北土城',8),(122,'安华桥',8),(123,'鼓楼大街',8),(124,'什刹海',8),(125,'南锣鼓巷',8),(126,'郭公庄',9),(127,'丰台科技园',9),(128,'科怡路',9),(129,'丰台南路',9),(130,'丰台东大街',9),(131,'七里庄',9),(132,'六里桥',9),(133,'六里桥东',9),(134,'北京西站',9),(135,'军事博物馆',9),(136,'白堆子',9),(137,'白石桥南',9),(138,'国家图书馆',9),(139,'巴沟',10),(140,'苏州街',10),(141,'海淀黄庄',10),(142,'知春里',10),(143,'知春路',10),(144,'西土城',10),(145,'牡丹园',10),(146,'健德门',10),(147,'北土城',10),(148,'安贞门',10),(149,'惠新西街南口',10),(150,'芍药居',10),(151,'太阳宫',10),(152,'三元桥',10),(153,'亮马桥',10),(154,'农业展览馆',10),(155,'团结湖',10),(156,'呼家楼',10),(157,'金台夕照',10),(158,'国贸',10),(159,'双井',10),(160,'劲松',10),(161,'潘家园',10),(162,'十里河',10),(163,'分钟寺',10),(164,'成寿寺',10),(165,'宋家庄',10),(166,'石榴庄',10),(167,'大红门',10),(168,'角门东',10),(169,'角门西',10),(170,'草桥',10),(171,'纪家庙',10),(172,'首经贸',10),(173,'丰台站',10),(174,'泥洼',10),(175,'西局',10),(176,'六里桥',10),(177,'莲花桥',10),(178,'公主坟',10),(179,'西钓鱼台',10),(180,'慈寿寺',10),(181,'车道沟',10),(182,'长春桥',10),(183,'火器营',10),(184,'西直门',13),(185,'大钟寺',13),(186,'知春路',13),(187,'五道口',13),(188,'上地',13),(189,'西二旗',13),(190,'龙泽',13),(191,'回龙观',13),(192,'霍营',13),(193,'立水桥',13),(194,'北苑',13),(195,'望京西',13),(196,'芍药居',13),(197,'光熙门',13),(198,'柳芳',13),(199,'东直门',13),(200,'张郭庄',14),(201,'园博园',14),(202,'大瓦窑',14),(203,'郭庄子',14),(204,'大井',14),(205,'七里庄',14),(206,'西局',14),(207,'望京西',15),(208,'望京',15),(209,'崔各庄',15),(210,'马泉营',15),(211,'孙河',15),(212,'国展',15),(213,'花梨坎',15),(214,'后沙峪',15),(215,'南法信',15),(216,'石门',15),(217,'顺义',15),(218,'俸伯',15),(219,'四惠',50),(220,'四惠东',50),(221,'高碑店',50),(222,'传媒大学',50),(223,'双桥',50),(224,'管庄',50),(225,'八里桥',50),(226,'通州北苑',50),(227,'果园',50),(228,'九棵树',50),(229,'梨园',50),(230,'临河里',50),(231,'土桥',50),(232,'南邵',51),(233,'沙河高教园',51),(234,'沙河',51),(235,'巩华城',51),(236,'朱辛庄',51),(237,'生命科学园',51),(238,'西二旗',51),(239,'宋家庄',52),(240,'肖村',52),(241,'小红门',52),(242,'旧宫',52),(243,'亦庄桥',52),(244,'亦庄文化园',52),(245,'万源街',52),(246,'荣京东街',52),(247,'荣昌东街',52),(248,'同济南路',52),(249,'经海路',52),(250,'次渠南',52),(251,'次渠',52),(252,'郭公庄',53),(253,'大葆台',53),(254,'稻田',53),(255,'长阳',53),(256,'篱笆房',53),(257,'广阳城',53),(258,'良乡大学城北',53),(259,'良乡大学城',53),(260,'良乡大学城西',53),(261,'良乡南关',53),(262,'苏庄',53),(263,'公益西桥',54),(264,'新宫',54),(265,'西红门',54),(266,'高米店北',54),(267,'高米店南',54),(268,'枣园',54),(269,'清源路',54),(270,'黄村西大街',54),(271,'黄村火车站',54),(272,'义和庄',54),(273,'生物医药基地',54),(274,'天宫院',54);
/*!40000 ALTER TABLE `zhans` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2014-11-15 16:44:31
