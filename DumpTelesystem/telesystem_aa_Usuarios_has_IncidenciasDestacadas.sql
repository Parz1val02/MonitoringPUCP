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
-- Table structure for table `Usuarios_has_IncidenciasDestacadas`
--

DROP TABLE IF EXISTS `Usuarios_has_IncidenciasDestacadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios_has_IncidenciasDestacadas` (
  `codigoUsuario` varchar(8) NOT NULL,
  `idIncidenciaDestacadas` int(11) NOT NULL,
  PRIMARY KEY (`codigoUsuario`,`idIncidenciaDestacadas`),
  KEY `fk_Usuarios_has_IncidenciaDestacadas_IncidenciaDestacadas1_idx` (`idIncidenciaDestacadas`),
  KEY `fk_Usuarios_has_IncidenciaDestacadas_Usuarios1_idx` (`codigoUsuario`),
  CONSTRAINT `fk_Usuarios_has_IncidenciaDestacadas_IncidenciaDestacadas1` FOREIGN KEY (`idIncidenciaDestacadas`) REFERENCES `IncidenciasDestacadas` (`idIncidenciaDestacadas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_IncidenciaDestacadas_Usuarios1` FOREIGN KEY (`codigoUsuario`) REFERENCES `Usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios_has_IncidenciasDestacadas`
--

LOCK TABLES `Usuarios_has_IncidenciasDestacadas` WRITE;
/*!40000 ALTER TABLE `Usuarios_has_IncidenciasDestacadas` DISABLE KEYS */;
INSERT INTO `Usuarios_has_IncidenciasDestacadas` VALUES
('20171198',1),
('20195922',4),
('20201696',2),
('20201696',3),
('20201696',5);
/*!40000 ALTER TABLE `Usuarios_has_IncidenciasDestacadas` ENABLE KEYS */;
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
