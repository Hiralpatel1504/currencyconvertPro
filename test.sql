-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `curr_list`
--

DROP TABLE IF EXISTS `curr_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curr_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curr_name` varchar(40) NOT NULL,
  `curr_id` varchar(20) DEFAULT NULL,
  `curr_symbol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curr_list`
--

LOCK TABLES `curr_list` WRITE;
/*!40000 ALTER TABLE `curr_list` DISABLE KEYS */;
INSERT INTO `curr_list` VALUES (3,'US Dollar','USD','$'),(11,'canadian dollar','CAD','$'),(12,'Indian Rupees','INR','rupee'),(13,'Angolan kwanza','AOA','Kz');
/*!40000 ALTER TABLE `curr_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_curr` varchar(20) DEFAULT NULL,
  `to_curr` varchar(20) DEFAULT NULL,
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` float DEFAULT NULL,
  `source_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
INSERT INTO `rates` VALUES (1,'EUR','USD','2020-09-06 04:00:00','2020-09-06 19:18:11',1.18386,'fixer.io'),(2,'EUR','CAD','2020-09-06 04:00:00','2020-09-06 19:18:11',1.54666,'fixer.io'),(3,'EUR','INR','2020-09-06 04:00:00','2020-09-06 19:18:11',86.7136,'fixer.io'),(4,'EUR','AOA','2020-09-06 04:00:00','2020-09-06 19:18:11',736.302,'fixer.io'),(5,'EUR','USD','2020-09-07 04:00:00','2020-09-07 02:02:44',1.18389,'fixer.io'),(6,'EUR','CAD','2020-09-07 04:00:00','2020-09-07 02:02:44',1.54798,'fixer.io'),(7,'EUR','INR','2020-09-07 04:00:00','2020-09-07 02:02:44',86.7687,'fixer.io'),(8,'EUR','AOA','2020-09-07 04:00:00','2020-09-07 02:02:44',736.321,'fixer.io'),(9,'EUR','USD','2020-09-14 04:00:00','2020-09-14 00:32:31',1.18385,'fixer.io'),(10,'EUR','CAD','2020-09-14 04:00:00','2020-09-14 00:32:31',1.56073,'fixer.io'),(11,'EUR','INR','2020-09-14 04:00:00','2020-09-14 00:32:31',86.9882,'fixer.io'),(12,'EUR','AOA','2020-09-14 04:00:00','2020-09-14 00:32:31',720.273,'fixer.io'),(13,'EUR','USD','2020-09-19 04:00:00','2020-09-19 16:14:59',1.18403,'fixer.io'),(14,'EUR','CAD','2020-09-19 04:00:00','2020-09-19 16:14:59',1.56335,'fixer.io'),(15,'EUR','INR','2020-09-19 04:00:00','2020-09-19 16:14:59',87.157,'fixer.io'),(16,'EUR','AOA','2020-09-19 04:00:00','2020-09-19 16:14:59',732.231,'fixer.io'),(17,'EUR','USD','2020-09-21 04:00:00','2020-09-21 23:29:48',1.17674,'fixer.io'),(18,'EUR','CAD','2020-09-21 04:00:00','2020-09-21 23:29:48',1.56578,'fixer.io'),(19,'EUR','INR','2020-09-21 04:00:00','2020-09-21 23:29:48',86.5848,'fixer.io'),(20,'EUR','AOA','2020-09-21 04:00:00','2020-09-21 23:29:48',728.334,'fixer.io');
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(40) NOT NULL,
  `endpoint` varchar(20) DEFAULT NULL,
  `api_key` varchar(20) DEFAULT NULL,
  `api_password` varchar(10) DEFAULT NULL,
  `base_url` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sources`
--

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `curr` varchar(10) DEFAULT NULL,
  `value` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
INSERT INTO `temp` VALUES ('inr','55'),('cad','1.2');
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `base_curr` varchar(10) DEFAULT NULL,
  `to_curr` varchar(10) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (117,'EUR','(u\'USD\',)',1.178),(118,'EUR','(u\'CAD\',)',1.579875),(119,'EUR','(u\'USD\',)',1.178),(120,'EUR','(u\'CAD\',)',1.579875),(121,'EUR','(u\'INR\',)',88.267431),(122,'EUR','(u\'USD\',)',1.178),(123,'EUR','(u\'CAD\',)',1.579875),(124,'EUR','(u\'INR\',)',88.267431),(125,'EUR','(u\'USD\',)',1.178),(126,'EUR','(u\'CAD\',)',1.579875),(127,'EUR','(u\'INR\',)',88.267431),(128,'EUR','(u\'USD\',)',1.177267),(129,'EUR','(u\'CAD\',)',1.577396),(130,'EUR','(u\'INR\',)',88.194971);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test2`
--

DROP TABLE IF EXISTS `test2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test2` (
  `base_curr` varchar(10) DEFAULT NULL,
  `to_curr` varchar(10) DEFAULT NULL,
  `rate` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test2`
--

LOCK TABLES `test2` WRITE;
/*!40000 ALTER TABLE `test2` DISABLE KEYS */;
INSERT INTO `test2` VALUES ('EUR','CAD','1.587383');
/*!40000 ALTER TABLE `test2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-01 13:16:22
