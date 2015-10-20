-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: nono
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lovenotes`
--

DROP TABLE IF EXISTS `lovenotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovenotes` (
  `note_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  CONSTRAINT `love_note` FOREIGN KEY (`note_id`) REFERENCES `romantic_dates` (`romantic_date_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovenotes`
--

LOCK TABLES `lovenotes` WRITE;
/*!40000 ALTER TABLE `lovenotes` DISABLE KEYS */;
INSERT INTO `lovenotes` VALUES (1,'asdfasdf');
/*!40000 ALTER TABLE `lovenotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lovers`
--

DROP TABLE IF EXISTS `lovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovers` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `preference` tinyint(4) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `education` int(3) unsigned DEFAULT NULL,
  `zip` int(11) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `coupon` varchar(45) DEFAULT NULL,
  `frozen` tinyint(1) NOT NULL,
  `dispute_frozen` tinyint(1) DEFAULT '0',
  `boots` tinyint(4) DEFAULT '0',
  `dispute_boots` tinyint(1) DEFAULT '0',
  `mean` int(11) DEFAULT '0',
  `dispute_mean` tinyint(1) DEFAULT '0',
  `no_shows` int(11) DEFAULT '0',
  `dispute_no_shows` tinyint(1) DEFAULT '0',
  `no_contacts` int(11) DEFAULT '0',
  `dispute_no_contact` tinyint(1) DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  `datable_days` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `datableDays` (`datable_days`(1)),
  KEY `frozen` (`frozen`),
  FULLTEXT KEY `bio` (`bio`),
  FULLTEXT KEY `bio_2` (`bio`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovers`
--

LOCK TABLES `lovers` WRITE;
/*!40000 ALTER TABLE `lovers` DISABLE KEYS */;
INSERT INTO `lovers` VALUES (19,'subclass@gmail.com',1,1,36,18,53220,'Light, short, and unhandsome to many.','This is a dark and stormy test.',NULL,0,0,2,0,4,0,1,1,0,0,'loving, sexy, dimwitted','thursday dinner, wednesday dinner, tuesday dinner, monday dinner, friday dinner, saturday dinner, saturday lunch, sunday dinner, sunday lunch','2015-08-17 17:11:05'),(21,'nickolasnikolic@gmail.com',2,1,45,19,12345,'Dark, tall, and unhandsome to many.','This is a dark and stormy test. This is a dark and stormy test.This is a dark and stormy test.This is a dark and stormy test.This is a dark and stormy test.This is a dark and stormy test.This is a dark and stormy test.',NULL,0,0,3,0,26,0,23,0,27,0,'loving, sexy, mean, star','monday lunch, monday dinner, wednesday lunch, wednesday dinner, friday lunch, friday dinner, sunday lunch, sunday dinner, saturday lunch, thursday dinner, tuesday lunch','2015-08-17 17:11:05'),(22,'1@gmail.com',1,2,20,7,54321,'whoozits and zits','This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.',NULL,0,0,0,0,0,0,0,0,0,0,'fees',NULL,'2015-07-19 00:34:07'),(23,'2@gmail.com',2,1,20,12,54321,'acne and teeth','This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is est.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.',NULL,0,0,2,0,2,0,2,0,2,0,'fees, terrible liar, sexy',NULL,'2015-08-17 17:11:05'),(24,'3@gmail.com',2,1,18,13,54322,'whoozits and woozits, some whatsits too','This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.',NULL,0,0,0,0,0,0,0,0,0,0,'fees',NULL,'2015-08-17 17:11:05'),(25,'4@gmail.com',2,1,20,14,54323,'horseys are my life.','This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.',NULL,0,0,0,0,0,0,0,0,0,0,'fees, fies, foes, fums',NULL,'2015-08-17 17:11:05'),(26,'5@gmail.com',2,1,20,15,54324,'photographer for same, or musey type.','This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a ts just a test.This is just a test.This a test.This is just a test.This is just a test.This is just a test.',NULL,0,0,0,0,0,0,0,0,0,0,'fee, fie, foe, fum',NULL,'2015-08-17 17:11:05'),(27,'6@gmail.com',2,1,20,16,54325,'likes water','This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.',NULL,0,0,0,0,0,0,0,0,0,0,'power rangers',NULL,'2015-08-17 17:11:05'),(28,'7@gmail.com',2,1,50,7,54326,'looooooong walks on the beach.','This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.Ths just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.',NULL,0,0,0,0,0,0,0,0,0,0,'sexy, witty, estranged',NULL,'2015-07-19 00:42:19');
/*!40000 ALTER TABLE `lovers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `romantic_dates`
--

DROP TABLE IF EXISTS `romantic_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `romantic_dates` (
  `romantic_date_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asker` int(11) unsigned NOT NULL,
  `giver` int(11) unsigned NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `good_for_asker` tinyint(4) DEFAULT NULL,
  `good_for_giver` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`romantic_date_id`),
  UNIQUE KEY `index` (`romantic_date_id`) USING BTREE,
  KEY `asker_idx` (`asker`),
  KEY `giver_idx` (`giver`),
  CONSTRAINT `asker` FOREIGN KEY (`asker`) REFERENCES `lovers` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `giver` FOREIGN KEY (`giver`) REFERENCES `lovers` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `romantic_dates`
--

LOCK TABLES `romantic_dates` WRITE;
/*!40000 ALTER TABLE `romantic_dates` DISABLE KEYS */;
INSERT INTO `romantic_dates` VALUES (1,19,21,'2015-08-01 16:00:00','2015-08-01 23:00:00',NULL,NULL),(2,19,22,'2015-08-15 12:00:00','2015-08-15 16:00:00',NULL,NULL),(3,19,23,'2015-08-02 12:00:00','2015-08-02 16:00:00',NULL,NULL),(4,19,21,'2015-08-16 08:08:41','0000-00-00 00:00:00',NULL,NULL),(5,19,21,'2015-08-16 08:08:47','0000-00-00 00:00:00',NULL,NULL),(6,19,21,'2015-08-16 08:08:57','0000-00-00 00:00:00',NULL,NULL),(7,19,21,'2015-08-16 09:09:31','0000-00-00 00:00:00',NULL,NULL),(8,19,19,'2015-08-17 10:10:27','0000-00-00 00:00:00',NULL,NULL),(9,19,21,'2015-08-17 10:10:14','0000-00-00 00:00:00',NULL,NULL),(10,19,21,'2015-08-17 10:10:14','0000-00-00 00:00:00',NULL,NULL),(11,19,21,'2015-08-17 10:10:26','0000-00-00 00:00:00',NULL,NULL),(12,19,21,'2015-08-21 11:11:00','0000-00-00 00:00:00',NULL,NULL),(13,19,21,'2015-08-20 12:00:00','0000-00-00 00:00:00',NULL,NULL),(14,19,21,'2015-10-20 13:00:00','0000-00-00 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `romantic_dates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-20 10:13:19
