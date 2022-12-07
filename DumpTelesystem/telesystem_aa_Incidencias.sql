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
  `fecha` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incidencias`
--

LOCK TABLES `Incidencias` WRITE;
/*!40000 ALTER TABLE `Incidencias` DISABLE KEYS */;
INSERT INTO `Incidencias` VALUES
(1,'2022-12-06 22:12:29','Explosion en KILO',1,'Fuga de gas ocurrido en la mañana, previo al abrir al local',0,'Explosion',3,1,1,'20201696',9),
(2,'2022-12-06 22:12:29','Robo en Biblioteca Central',1,'Sujetos armados entraron a las instalaciones muy temprano, antes de que abriera',0,NULL,2,3,3,'20201696',8),
(3,'2022-12-06 22:12:29','Accidente en semana de Ingenieria',1,'Lesion de alumno en evento',0,NULL,1,2,1,'19905060',11),
(4,'2022-12-06 22:12:29','Laptop perdida en Charlotte',1,'Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer',0,NULL,4,3,1,'19905060',10),
(5,'2022-12-06 22:12:29','Laptop perdida en el V',1,'Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer',0,NULL,4,3,1,'20113456',2),
(6,'2022-12-01 00:00:00','Maquina malograda',1,'Maquina dispensadora malograda',0,NULL,3,3,1,'20171198',3),
(7,'2022-11-30 00:00:00','Discusion entre alumnos',1,'Pelea a muerte de cuchillos jugando un partido de futebol',0,'Pelea',6,2,3,'20201696',11),
(8,'2022-12-02 00:00:00','Inasistencia del profesor',1,'En el A-702, los alumnos no saben que hacer pipipi',0,'Falta',6,1,3,'20171198',9),
(9,'2022-12-01 00:00:00','Ruidos en el cubiculo',1,'Chicos que estan gritando y no dejan estudiar tmr',0,'Ruidos molestos',6,1,3,'20195922',6),
(10,'2022-12-01 00:00:00','Problemas en la graduacion',1,'No dejan entrar a mas de 2 personas ',0,'Alerta',6,1,4,'20047106',5),
(11,'2022-12-06 22:12:29','Ransomware en el V',1,'Se colo el wannacry en el V pipipi',0,'Hackeo',6,3,1,'20195922',2),
(12,'2022-12-06 22:12:29','Robo de bicicleta',1,'Se robaron mi bici, partieron el candado a la mitad y f',0,NULL,2,2,1,'20047106',5);
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

-- Dump completed on 2022-12-06 22:24:25
