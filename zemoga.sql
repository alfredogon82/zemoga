CREATE DATABASE  IF NOT EXISTS `zemoga` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `zemoga`;
-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: zemoga
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1-log

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
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `principal` int(11) DEFAULT NULL,
  `active` varchar(45) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'Kanye West','Vestibulum diam ante, porttitor a odio eget, rhoncus neque. Aenean eu velit libero.','images/kanye-west.jpg',NULL,'1'),(2,'Mark Zuckerberg','Vestibulum diam ante, porttitor a odio eget, rhoncus neque. Aenean eu velit libero.','images/mark.jpg',NULL,'1'),(3,'Cristina Kirchner','Vestibulum diam ante, porttitor a odio eget, rhoncus neque. Aenean eu velit libero.','images/cristina.jpg',NULL,'1'),(4,'Malala Yousafzai','Vestibulum diam ante, porttitor a odio eget, rhoncus neque. Aenean eu velit libero.','images/malala.jpg',NULL,'1');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_person` int(11) DEFAULT NULL,
  `vote` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,1,'up'),(2,1,'up'),(3,1,'up'),(4,1,'down'),(5,1,'down'),(6,1,'up'),(7,2,'up'),(8,2,'down'),(9,4,'down'),(10,3,'up'),(11,4,'up'),(12,3,'down'),(13,1,'up'),(14,1,'up'),(15,1,'down'),(16,2,'up'),(17,1,'down'),(18,1,'up'),(19,1,'down'),(20,2,'up'),(21,2,'down'),(22,2,'up'),(23,2,'up'),(24,1,'up'),(25,1,'up'),(26,2,'up'),(27,2,'down'),(28,2,'up'),(29,2,'up'),(30,4,'up'),(31,2,'up'),(32,4,'up'),(33,2,'up'),(34,1,'up'),(35,1,'up'),(36,2,'up'),(37,1,'up'),(38,2,'up'),(39,2,'up'),(40,2,'up'),(41,2,'up'),(42,1,'up'),(43,1,'down'),(44,2,'up'),(45,2,'up'),(46,2,'down'),(47,2,'up'),(48,1,'up'),(49,1,'down'),(50,1,'down'),(51,1,'down'),(52,1,'down'),(53,1,'down'),(54,1,'down'),(55,1,'up'),(56,1,'up'),(57,1,'up'),(58,1,'up'),(59,1,'up'),(60,3,'up'),(61,3,'up'),(62,3,'up'),(63,3,'up'),(64,3,'up'),(65,3,'up'),(66,3,'up'),(67,3,'up'),(68,3,'up'),(69,3,'up'),(70,3,'up'),(71,3,'up'),(72,3,'up'),(73,3,'up'),(74,3,'up'),(75,3,'up'),(76,3,'up'),(77,3,'up'),(78,3,'up'),(79,1,'up'),(80,1,'up'),(81,1,'up'),(82,2,'up'),(83,3,'down'),(84,3,'down'),(85,1,'up'),(86,1,'up'),(87,1,'up'),(88,1,'up'),(89,1,'down'),(90,1,'down'),(91,1,'down'),(92,1,'down'),(93,1,'down'),(94,1,'down'),(95,1,'down'),(96,2,'down'),(97,1,'down'),(98,1,'down'),(99,1,'up'),(100,1,'up'),(101,1,'up'),(102,1,'down'),(103,2,'down'),(104,2,'down'),(105,2,'down'),(106,3,'down'),(107,3,'down'),(108,3,'down'),(109,3,'down'),(110,4,'up'),(111,4,'down'),(112,4,'down'),(113,3,'down'),(114,3,'down'),(115,3,'down'),(116,2,'down'),(117,2,'down'),(118,2,'down'),(119,2,'down'),(120,2,'down'),(121,2,'down'),(122,2,'down'),(123,2,'down'),(124,2,'down'),(125,2,'down'),(126,2,'down'),(127,2,'down'),(128,2,'down'),(129,2,'down'),(130,1,'up'),(131,1,'down');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-10 21:20:30
