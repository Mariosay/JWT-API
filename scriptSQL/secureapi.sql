/*
SQLyog Ultimate v13.1.2 (64 bit)
MySQL - 5.7.31 : Database - secureapi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`secureapi` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;

USE `secureapi`;

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `retainer_fee` int(100) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `retainer_fee` (`retainer_fee`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `client` */

insert  into `client`(`id`,`name`,`email`,`retainer_fee`,`updated_at`,`created_at`) values 
(1,'Dr. Terence Bauch','vpaucek@hotmail.com',48191680,NULL,'2022-01-03 14:44:28'),
(2,'Rosa Bashirian','smith.keenan@roberts.org',36828409,NULL,'2022-01-03 14:44:28'),
(3,'Dr. Colin Haley','yharris@kessler.org',79177517,NULL,'2022-01-03 14:44:28'),
(4,'Dora Marks','gage69@ritchie.biz',95167514,NULL,'2022-01-03 14:44:28'),
(5,'Enoch Quigley','carter.romaguera@hotmail.com',93259638,NULL,'2022-01-03 14:44:28'),
(6,'Mrs. Zelda Rohan','qhuels@eichmann.com',51171229,NULL,'2022-01-03 14:44:28'),
(7,'Mr. Tanner Feest','owilliamson@yahoo.com',50510630,NULL,'2022-01-03 14:44:28'),
(8,'Vaughn Breitenberg','mark82@yahoo.com',68834608,NULL,'2022-01-03 14:44:28'),
(9,'Whitney Langosh','kozey.dallin@gmail.com',33971074,NULL,'2022-01-03 14:44:28'),
(10,'Fae Lowe','imraz@yahoo.com',18307595,NULL,'2022-01-03 14:44:28'),
(11,'Mr. Efren King MD','lfeest@yahoo.com',82290242,NULL,'2022-01-03 14:44:28'),
(14,'Porfirio Cadenas','porfirio1@example.com',10000052,'2022-01-07 11:42:06','2022-01-07 11:42:06');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) values 
(1,'2022-01-03-201506','App\\Database\\Migrations\\AddClient','default','App',1641241189,1),
(2,'2022-01-03-201518','App\\Database\\Migrations\\AddUser','default','App',1641241189,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`password`,`updated_at`,`created_at`) values 
(1,'Mario Hernandez','mario@example.com','$2y$10$7yqFRR8k5le8.N4bQ3JwT.aq4PSLmJRSCBh3bHPPERHzPxWBZ8M16',NULL,'2022-01-04 12:15:34'),
(2,'Juan Yebra','juan@example.com','$2y$10$r9iOJYmNok7Ki6C5IB43E.AuddGL7ziANfvzteqg4vOFqYBU4qJsK',NULL,'2022-01-04 12:22:17'),
(3,'felipe','felipe@example.com','$2y$10$BqysP.qNaOipS3l6b/ZjoO8RbRIN0rDeMAFa.tdSD2WCxYt2lRSRy',NULL,'2022-01-05 10:09:22'),
(4,'felipe1','felipe1@example.com','$2y$10$rSnX8olZgXBaDjdH8Xk8..nID/xDOCfaCogRglkg6XlnA87ruIrry',NULL,'2022-01-07 09:37:44'),
(5,'niki','niki@example.com','$2y$10$NheOR/MoM1epGweTZCtuD.t.qocCrvKFTnZJiE1uNzM2pwlS3AfnW',NULL,'2022-01-07 09:41:02'),
(6,'mario1','mario1@example.com','$2y$10$MWtAB/aEktYbsfd9LasrBu06y3Oei2BvDuQYT1ZsbWMDIbfcyuaR2',NULL,'2022-01-07 11:39:02');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
