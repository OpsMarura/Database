/*
SQLyog Community v11.2 (64 bit)
MySQL - 5.6.19-log : Database - clinic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clinic` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clinic`;

/*Table structure for table `child` */

DROP TABLE IF EXISTS `child`;

CREATE TABLE `child` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(20) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `father_name` varchar(20) NOT NULL,
  `mother_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `child` */

insert  into `child`(`id`,`f_name`,`l_name`,`gender`,`dob`,`father_name`,`mother_name`) values (1,'Dennis','Moseti','Male','2015-03-12','John','Mary');

/*Table structure for table `vaccine` */

DROP TABLE IF EXISTS `vaccine`;

CREATE TABLE `vaccine` (
  ` id` int(11) NOT NULL AUTO_INCREMENT,
  `vaccine_date` varchar(20) NOT NULL,
  `age_at_vaccination` varchar(60) NOT NULL,
  `administration_method` varchar(50) NOT NULL,
  PRIMARY KEY (` id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vaccine` */

/*Table structure for table `vaccine_administration` */

DROP TABLE IF EXISTS `vaccine_administration`;

CREATE TABLE `vaccine_administration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_child` int(11) NOT NULL,
  `fk_vaccine_period` int(11) NOT NULL,
  `administration_method_id` int(6) NOT NULL,
  `administration_method_name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id` (`administration_method_id`),
  KEY `fk_child_vaccine_admin` (`fk_child`),
  KEY `fk_vaccine_period_admin` (`fk_vaccine_period`),
  CONSTRAINT `fk_child_vaccine_admin` FOREIGN KEY (`fk_child`) REFERENCES `child` (`id`),
  CONSTRAINT `fk_vaccine_period_admin` FOREIGN KEY (`fk_vaccine_period`) REFERENCES `vaccine_period` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vaccine_administration` */

/*Table structure for table `vaccine_period` */

DROP TABLE IF EXISTS `vaccine_period`;

CREATE TABLE `vaccine_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_vaccine` int(11) NOT NULL,
  `vaccine_name` varchar(16) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `vaccine_period` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vaccine_vaccine_period` (`fk_vaccine`),
  CONSTRAINT `fk_vaccine_vaccine_period` FOREIGN KEY (`fk_vaccine`) REFERENCES `vaccine` (` id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vaccine_period` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
