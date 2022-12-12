CREATE DATABASE  IF NOT EXISTS `telesystem_aa` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `telesystem_aa`;
-- MariaDB dump 10.19  Distrib 10.9.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: telesystem_aa
-- ------------------------------------------------------
-- Server version	10.9.3-MariaDB

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
-- Table structure for table `RegistroAdmin`
--

DROP TABLE IF EXISTS `RegistroAdmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegistroAdmin` (
  `idRegistroAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAdmin` varchar(45) NOT NULL,
  `passwordAdmin` varchar(128) NOT NULL,
  `nombreRol` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `codigo2fa` int(11) DEFAULT NULL,
  `activeTime2fa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idRegistroAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegistroAdmin`
--

LOCK TABLES `RegistroAdmin` WRITE;
/*!40000 ALTER TABLE `RegistroAdmin` DISABLE KEYS */;
INSERT INTO `RegistroAdmin` VALUES
(1,'EternalBlue','53e5a84fd38c5f0864994678f388beed42230498fbbefab983a1d27aad446f3a','Administrador','EternalBlue@pucp.edu.pe',NULL,NULL);
/*!40000 ALTER TABLE `RegistroAdmin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-11 20:28:05
