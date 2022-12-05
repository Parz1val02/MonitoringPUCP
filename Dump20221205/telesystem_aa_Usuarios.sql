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
  `primerIngreso` tinyint(1) NOT NULL,
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
('19905060','Jorge','Gonzales','jorege.g@pucp.edu.pe','87654321',1,'62ee6fe4e66b38771e14a727a86d90ef600882c5b327eddfc89a63918da0f902',NULL,1,4,2,NULL,NULL,1),
('20047106','Hansel','Martinez','martinez.hj@pucp.edu.pe','49543859',1,'caa470e7188962c98649b2f85ede448bd3902e1a97c9b8d3969b468d0dfe0858','923847189',1,4,4,NULL,NULL,1),
('20113456','Goku','kakaroto','goku.kakaroto@pucp.edu.pe','56546767',1,'fb409de70cbe86186ad4782e5469b61599ba5f01ce3c213dd8b30f0dbf7458b9','976976976',2,NULL,NULL,NULL,NULL,1),
('20171198','Luis','Ramos','luis.ramost@pucp.edu.pe','78349206',1,'01acc2c38fe0b1cc4f3465e5316d0b9938975d78aa3183eacb8c9fb015f32647','928374937',1,3,3,NULL,NULL,1),
('20195922','Carlos','Pisco','cpisco@pucp.edu.pe','65358947',1,'79a40cc30a82d12eb1050512e57fef741fc730cd606acee0ba44eddb69ddc5a3','976239385',1,5,5,NULL,NULL,1),
('20201696','Leonardo','Abanto','a20201696@pucp.edu.pe','12345678',1,'93b906ff975b5de8af94e5537d3e6b81b244c7e11c8d9074d7f47e488b28dcc1','987654321',1,1,1,NULL,NULL,1);
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

-- Dump completed on 2022-12-05  1:43:38
