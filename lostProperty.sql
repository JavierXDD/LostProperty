/*
SQLyog Ultimate v8.32 
MySQL - 5.5.36 : Database - lost
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lost` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lost`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `aName` varchar(20) DEFAULT NULL,
  `aPassword` varchar(20) DEFAULT NULL,
  `isSuper` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`aName`,`aPassword`,`isSuper`) values ('xie','123',1),('admin','admin',1);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `mid` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`mid`,`name`,`email`,`phone`,`message`) values ('854284D65E7944A889BAC331397F100B','name','dsafdsaf','dsfasdfas','sdfasfdsaf'),('00DF051273F742C0B11623439838BFC9','xiejiawei','132@QQ.COM','13312341234','DJSIAFSOJFDOSA');

/*Table structure for table `thing` */

DROP TABLE IF EXISTS `thing`;

CREATE TABLE `thing` (
  `tid` varchar(40) DEFAULT NULL,
  `mType` varchar(10) DEFAULT NULL,
  `tName` varchar(20) DEFAULT NULL,
  `tType` varchar(20) DEFAULT NULL,
  `tAddress` varchar(80) DEFAULT NULL,
  `tTime` varchar(20) DEFAULT NULL,
  `tDescription` varchar(80) DEFAULT NULL,
  `uName` varchar(20) DEFAULT NULL,
  `uTelephone` varchar(20) DEFAULT NULL,
  `tState` varchar(10) DEFAULT '未认领',
  `gName` varchar(20) DEFAULT NULL,
  `gTelephone` varchar(20) DEFAULT NULL,
  UNIQUE KEY `tName` (`tName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `thing` */

insert  into `thing`(`tid`,`mType`,`tName`,`tType`,`tAddress`,`tTime`,`tDescription`,`uName`,`uTelephone`,`tState`,`gName`,`gTelephone`) values ('86FBF880841B48D79CA56856075DFE1D','失物招领','javaweb程序开发入门','书本','图书馆','2016-05-02','就是一本书哈哈哈哈哈哈哈哈哈\r\n    			','谢佳伟','13333333333','认领中','xiejiawei','13312341234'),('85DFF52BBB524B23BDB47465F08976C8','失物招领','我的小手机啊','钥匙','明德楼','2016-06-02','我的小手机及啊啊啊啊啊啊啊啊啊啊','谢佳伟','13333333333','认领中','暂无','暂无'),('754B11DC95DF4F25959ADE44278348D4','失物招领','键盘','钥匙','品学楼','2016-06-17','大的撒发生大幅度','xiejiawei','13812341234','未认领','暂无','暂无'),('31C385ABA6C14A379F802CBBF4BD595B','失物招领','手提包','钥匙','明德楼','2016-05-23','aa对方手机大佛撒娇掉发\r\n    			','xiejiawei','13812341234','认领中','123','13333333333'),('E1DF3A771DA64FFDB50E62296E7E606A','失物招领','dfsadfadsa','钥匙','明德楼','2016-05-03','dfsafsdfsafd\r\n    			','woshishi','13212341234','认领中','fff','13312341234'),('77BB6AD477A8497DA1463DA27A4D54AF','失物招领','fdsfasdfsa','钥匙','明德楼','2016-05-17','fdsafdsfas','woshishi','13212341234','未认领','暂无','暂无'),('DD3ED2FE32284EDC801D73E78744EC55','失物招领','trhetrutru','钥匙','明德楼','2016-06-12','tuertreurue\r\n    			\r\n    			','woshishi','13212341234','认领中','123','13333333333'),('679A3A7F8604440EA518A11B4BF0FDEF','失物招领','jyetyjeyet','钥匙','明德楼','2016-06-10','yjtejtyjetjtye','woshishi','13212341234','未认领','暂无','暂无'),('A095BB8CC1CE4BDBB0D8DF1811E851F9','失物招领','aaaaaaaaaaa','钥匙','明德楼','2016-06-05','aaaaaaaaaaaaaaaaaaaaaa','xiejiawei','13812341234','未认领','暂无','暂无'),('9D0A6E1B89014E79B4906B5A63F6AB70','失物招领','bbbbbbbbbbbb','钥匙','明德楼','2016-06-03','bbbbbbbbbbbbbbbbbb','xiejiawei','13812341234','未认领','暂无','暂无'),('D5DA019B0F0045B8A8AB86BEC7A752FB','失物招领','ccccccccccc','钥匙','明德楼','2016-06-11','ccccccccccccccccccccccc','xiejiawei','13812341234','未认领','暂无','暂无'),('D4C0B1E44F004ACDAB9F260DA00EAF4B','失物招领','eeeeeeeeeeeeeeeee','钥匙','明德楼','2016-06-11','eeeeeeeeeeeeeeeeeeeeee','xiejiawei','13812341234','未认领','暂无','暂无'),('A4202F6BE8124998800772E906B7B470','失物招领','大幅度','钥匙','明德楼','2016-06-07','范德萨','123','13333333333','未认领','暂无','暂无'),('4D312DD906964EF0A6A08499D01A9486','失物招领','shouji','手机','明德楼','2016-06-22','sadasdadada','fff','13312341234','未认领','暂无','暂无');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` varchar(40) NOT NULL,
  `uName` varchar(10) NOT NULL,
  `uPassword` varchar(20) DEFAULT NULL,
  `uTelephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uName` (`uName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`uName`,`uPassword`,`uTelephone`) values ('31F259137765493797694C212A14910A','fff','fff','13312341234'),('748B61FD28234C1A9C3A9D391D219EBB','123','123','13333333333'),('F15BC1981E694D6FA2CFA186DCD9A12F','你管我','123','13312341234');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
