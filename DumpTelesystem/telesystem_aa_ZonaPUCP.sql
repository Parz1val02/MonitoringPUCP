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
-- Table structure for table `ZonaPUCP`
--

DROP TABLE IF EXISTS `ZonaPUCP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZonaPUCP` (
  `idZonaPUCP` int(11) NOT NULL AUTO_INCREMENT,
  `nombreZona` varchar(45) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  PRIMARY KEY (`idZonaPUCP`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ZonaPUCP`
--

LOCK TABLES `ZonaPUCP` WRITE;
/*!40000 ALTER TABLE `ZonaPUCP` DISABLE KEYS */;
INSERT INTO `ZonaPUCP` VALUES
(1,'Entrada Principal',-12.06888,-77.07805),
(2,'Pabellón V',-12.07316,-77.08187),
(3,'EE.GG.CC',-12.07102,-77.079245),
(4,'EE.GG.LL',-12.06752,-77.0802),
(5,'Coliseo Polideportivo',-12.06654,-77.08016),
(6,'CIA',-12.07211,-77.08012),
(7,'Comedor Central',-12.07044,-77.08151),
(8,'Biblioteca Central',-12.0691,-77.08015),
(9,'Aulario',-12.07271,-77.07958),
(10,'Edificio McGregor',-12.0685,-77.07876),
(11,'Cancha de Minas',-12.07214,-77.08201),
(12,'Digimundo',-12.073,-77.08113),
(13,'Pabellón Z',-12.0691,-77.08088),
(14,'Comedor Artes',-12.07039,-77.07958),
(15,'Facultad de Derecho',-12.07006,-77.08053),
(16,'Facultad de Arquitectura y Urbanismo',-12.07151,-77.08091),
(17,'Tinkuy',-12.06822,-77.07929),
(18,'Biblioteca de Ciencias Sociales',-12.07087,-77.08038),
(19,'DTI',-12.07046,-77.08053),
(20,'Tesorería General',-12.06963,-77.07923),
(21,'CEPREPUC',-12.07151,-77.08091);
/*!40000 ALTER TABLE `ZonaPUCP` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-12  1:55:54
