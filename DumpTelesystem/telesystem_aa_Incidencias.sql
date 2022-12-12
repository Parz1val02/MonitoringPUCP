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
-- Table structure for table `Incidencias`
--

DROP TABLE IF EXISTS `Incidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Incidencias` (
  `idIncidencia` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `nombreIncidencia` varchar(45) NOT NULL,
  `validaIncidencia` tinyint(4) NOT NULL,
  `descripcion` text NOT NULL,
  `contadorReabierto` int(11) DEFAULT NULL,
  `otroTipo` varchar(45) DEFAULT NULL,
  `idTipoIncidencia` int(11) NOT NULL,
  `idNivelUrgencia` int(11) NOT NULL,
  `idEstadoIncidencia` int(11) NOT NULL,
  `codigoUsuario` varchar(8) NOT NULL,
  `idZonaPUCP` int(11) NOT NULL,
  PRIMARY KEY (`idIncidencia`),
  KEY `fk_Incidencia_TipoIncidencia1_idx` (`idTipoIncidencia`),
  KEY `fk_Incidencia_NivelUrgencia1_idx` (`idNivelUrgencia`),
  KEY `fk_Incidencia_table11_idx` (`idEstadoIncidencia`),
  KEY `fk_Incidencia_Usuarios1_idx` (`codigoUsuario`),
  KEY `fk_Incidencias_ZonaPUCP1_idx` (`idZonaPUCP`),
  CONSTRAINT `fk_Incidencia_NivelUrgencia1` FOREIGN KEY (`idNivelUrgencia`) REFERENCES `NivelUrgencia` (`idNivelUrgencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_TipoIncidencia1` FOREIGN KEY (`idTipoIncidencia`) REFERENCES `TipoIncidencia` (`idTipoIncidencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_Usuarios1` FOREIGN KEY (`codigoUsuario`) REFERENCES `Usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_table11` FOREIGN KEY (`idEstadoIncidencia`) REFERENCES `EstadoIncidencia` (`idEstadoIncidencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_ZonaPUCP1` FOREIGN KEY (`idZonaPUCP`) REFERENCES `ZonaPUCP` (`idZonaPUCP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incidencias`
--

LOCK TABLES `Incidencias` WRITE;
/*!40000 ALTER TABLE `Incidencias` DISABLE KEYS */;
INSERT INTO `Incidencias` VALUES
(1,'2022-12-09','Accidente de tránsito',1,'Camioneta se chocó y derribó un muro',0,NULL,1,3,1,'20201696',12),
(2,'2022-12-11','Accidente en semana de Ingeniería',1,'Lesión de alumna en evento',0,NULL,1,2,1,'20195922',11),
(3,'2022-12-09','Robo de bicicleta',1,'Se robaron mi bicicleta cerca de generales letras',0,NULL,2,2,1,'20171198',4),
(4,'2022-12-11','Robo en comedor central',1,'Sujetos armados ingresaron y robaron',0,NULL,2,3,1,'20201696',7),
(5,'2022-12-10','Problemas en la graduación',1,'No dejan entrar a las personas',0,'Alerta',6,1,1,'20171198',5);
/*!40000 ALTER TABLE `Incidencias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-11 23:27:00
