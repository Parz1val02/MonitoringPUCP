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
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `codigo` varchar(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `validaUsuario` tinyint(4) NOT NULL,
  `password` varchar(128) NOT NULL,
  `celular` varchar(9) DEFAULT NULL,
  `idRoles` int(11) NOT NULL,
  `idCategoriaPUCP` int(11) DEFAULT NULL,
  `idFotoPerfil` int(11) DEFAULT NULL,
  `codigo2fa` int(11) DEFAULT NULL,
  `activeTime2fa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_Usuarios_Roles_idx` (`idRoles`),
  KEY `fk_Usuarios_CategoriaPUCP1_idx` (`idCategoriaPUCP`),
  KEY `fk_Usuarios_FotoPerfil1_idx` (`idFotoPerfil`),
  CONSTRAINT `fk_Usuarios_CategoriaPUCP1` FOREIGN KEY (`idCategoriaPUCP`) REFERENCES `CategoriaPUCP` (`idCategoriaPUCP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_FotoPerfil1` FOREIGN KEY (`idFotoPerfil`) REFERENCES `FotoPerfil` (`idFotoPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_Roles` FOREIGN KEY (`idRoles`) REFERENCES `Roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES
('20113456','Goku','kakaroto','goku.kakaroto@pucp.edu.pe','56546767',1,'53e5a84fd38c5f0864994678f388beed42230498fbbefab983a1d27aad446f3a','976976976',2,NULL,NULL,NULL,NULL),
('20171198','Luis','Ramos','luis.ramost@pucp.edu.pe','78349206',1,'53e5a84fd38c5f0864994678f388beed42230498fbbefab983a1d27aad446f3a','928374937',1,3,3,NULL,NULL),
('20195922','Carlos','Pisco','cpisco@pucp.edu.pe','65358947',1,'53e5a84fd38c5f0864994678f388beed42230498fbbefab983a1d27aad446f3a','976239385',1,5,2,NULL,NULL),
('20201696','Leonardo','Abanto','a20201696@pucp.edu.pe','61485249',1,'53e5a84fd38c5f0864994678f388beed42230498fbbefab983a1d27aad446f3a','987654321',1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
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
