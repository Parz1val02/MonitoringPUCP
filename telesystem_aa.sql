-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema telesystem_aa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema telesystem_aa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `telesystem_aa` DEFAULT CHARACTER SET utf8 ;
USE `telesystem_aa` ;

-- -----------------------------------------------------
-- Table `telesystem_aa`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Roles` (
  `idRoles` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`CategoriaPUCP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`CategoriaPUCP` (
  `idCategoriaPUCP` INT NOT NULL AUTO_INCREMENT,
  `nombreCategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoriaPUCP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`FotoPerfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`FotoPerfil` (
  `idFotoPerfil` INT NOT NULL AUTO_INCREMENT,
  `fotoPerfil` LONGBLOB NOT NULL,
  `nombreFoto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFotoPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Usuarios` (
  `codigo` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(8) NOT NULL,
  `validaUsuario` TINYINT NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `celular` VARCHAR(9) NULL,
  `idRoles` INT NOT NULL,
  `idCategoriaPUCP` INT NULL,
  `idFotoPerfil` INT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Usuarios_Roles_idx` (`idRoles` ASC) VISIBLE,
  INDEX `fk_Usuarios_CategoriaPUCP1_idx` (`idCategoriaPUCP` ASC) VISIBLE,
  INDEX `fk_Usuarios_FotoPerfil1_idx` (`idFotoPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Roles`
    FOREIGN KEY (`idRoles`)
    REFERENCES `telesystem_aa`.`Roles` (`idRoles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_CategoriaPUCP1`
    FOREIGN KEY (`idCategoriaPUCP`)
    REFERENCES `telesystem_aa`.`CategoriaPUCP` (`idCategoriaPUCP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_FotoPerfil1`
    FOREIGN KEY (`idFotoPerfil`)
    REFERENCES `telesystem_aa`.`FotoPerfil` (`idFotoPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`TipoIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`TipoIncidencia` (
  `idTipoIncidencia` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `iconoFoto` LONGBLOB NULL,
  `nombreIcono` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoIncidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`NivelUrgencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`NivelUrgencia` (
  `idNivelUrgencia` INT NOT NULL AUTO_INCREMENT,
  `nivel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNivelUrgencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`EstadoIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`EstadoIncidencia` (
  `idEstadoIncidencia` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstadoIncidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`ZonaPUCP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`ZonaPUCP` (
  `idZonaPUCP` INT NOT NULL AUTO_INCREMENT,
  `nombreZona` VARCHAR(45) NOT NULL,
  `latitud` DOUBLE NOT NULL,
  `longitud` DOUBLE NOT NULL,
  PRIMARY KEY (`idZonaPUCP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Incidencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Incidencias` (
  `idIncidencia` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `nombreIncidencia` VARCHAR(45) NOT NULL,
  `validaIncidencia` TINYINT NOT NULL,
  `descripcion` TEXT NOT NULL,
  `contadorReabierto` INT NULL,
  `otroTipo` VARCHAR(45) NULL,
  `idTipoIncidencia` INT NOT NULL,
  `idNivelUrgencia` INT NOT NULL,
  `idEstadoIncidencia` INT NOT NULL,
  `codigoUsuario` VARCHAR(8) NOT NULL,
  `idZonaPUCP` INT NOT NULL,
  PRIMARY KEY (`idIncidencia`),
  INDEX `fk_Incidencia_TipoIncidencia1_idx` (`idTipoIncidencia` ASC) VISIBLE,
  INDEX `fk_Incidencia_NivelUrgencia1_idx` (`idNivelUrgencia` ASC) VISIBLE,
  INDEX `fk_Incidencia_table11_idx` (`idEstadoIncidencia` ASC) VISIBLE,
  INDEX `fk_Incidencia_Usuarios1_idx` (`codigoUsuario` ASC) VISIBLE,
  INDEX `fk_Incidencias_ZonaPUCP1_idx` (`idZonaPUCP` ASC) VISIBLE,
  CONSTRAINT `fk_Incidencia_TipoIncidencia1`
    FOREIGN KEY (`idTipoIncidencia`)
    REFERENCES `telesystem_aa`.`TipoIncidencia` (`idTipoIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_NivelUrgencia1`
    FOREIGN KEY (`idNivelUrgencia`)
    REFERENCES `telesystem_aa`.`NivelUrgencia` (`idNivelUrgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_table11`
    FOREIGN KEY (`idEstadoIncidencia`)
    REFERENCES `telesystem_aa`.`EstadoIncidencia` (`idEstadoIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencia_Usuarios1`
    FOREIGN KEY (`codigoUsuario`)
    REFERENCES `telesystem_aa`.`Usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_ZonaPUCP1`
    FOREIGN KEY (`idZonaPUCP`)
    REFERENCES `telesystem_aa`.`ZonaPUCP` (`idZonaPUCP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`IncidenciasDestacadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`IncidenciasDestacadas` (
  `idIncidenciaDestacadas` INT NOT NULL AUTO_INCREMENT,
  `contadorDestacado` INT NOT NULL,
  `idIncidencia` INT NOT NULL,
  PRIMARY KEY (`idIncidenciaDestacadas`),
  INDEX `fk_IncidenciaDestacadas_Incidencia1_idx` (`idIncidencia` ASC) VISIBLE,
  CONSTRAINT `fk_IncidenciaDestacadas_Incidencia1`
    FOREIGN KEY (`idIncidencia`)
    REFERENCES `telesystem_aa`.`Incidencias` (`idIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Usuarios_has_IncidenciasDestacadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Usuarios_has_IncidenciasDestacadas` (
  `codigoUsuario` VARCHAR(8) NOT NULL,
  `idIncidenciaDestacadas` INT NOT NULL,
  PRIMARY KEY (`codigoUsuario`, `idIncidenciaDestacadas`),
  INDEX `fk_Usuarios_has_IncidenciaDestacadas_IncidenciaDestacadas1_idx` (`idIncidenciaDestacadas` ASC) VISIBLE,
  INDEX `fk_Usuarios_has_IncidenciaDestacadas_Usuarios1_idx` (`codigoUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_has_IncidenciaDestacadas_Usuarios1`
    FOREIGN KEY (`codigoUsuario`)
    REFERENCES `telesystem_aa`.`Usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_IncidenciaDestacadas_IncidenciaDestacadas1`
    FOREIGN KEY (`idIncidenciaDestacadas`)
    REFERENCES `telesystem_aa`.`IncidenciasDestacadas` (`idIncidenciaDestacadas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`FotosIncidencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`FotosIncidencias` (
  `idFotosIncidencias` INT NOT NULL AUTO_INCREMENT,
  `fotoIncidencia` LONGBLOB NOT NULL,
  `nombreFoto` VARCHAR(45) NOT NULL,
  `idIncidencia` INT NOT NULL,
  PRIMARY KEY (`idFotosIncidencias`),
  INDEX `fk_Fotos_Incidencia1_idx` (`idIncidencia` ASC) VISIBLE,
  CONSTRAINT `fk_Fotos_Incidencia1`
    FOREIGN KEY (`idIncidencia`)
    REFERENCES `telesystem_aa`.`Incidencias` (`idIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`Comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `comentarios` VARCHAR(45) NULL,
  `fecha` VARCHAR(45) NULL,
  `codigoUsuario` VARCHAR(8) NOT NULL,
  `idIncidencia` INT NOT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Usuarios1_idx` (`codigoUsuario` ASC) VISIBLE,
  INDEX `fk_Comentario_Incidencia1_idx` (`idIncidencia` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Usuarios1`
    FOREIGN KEY (`codigoUsuario`)
    REFERENCES `telesystem_aa`.`Usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Incidencia1`
    FOREIGN KEY (`idIncidencia`)
    REFERENCES `telesystem_aa`.`Incidencias` (`idIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`RegistroAdmin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`RegistroAdmin` (
  `idRegistroAdmin` INT NOT NULL AUTO_INCREMENT,
  `nombreAdmin` VARCHAR(45) NOT NULL,
  `passwordAdmin` VARCHAR(128) NOT NULL,
  `nombreRol` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRegistroAdmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telesystem_aa`.`MasterTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telesystem_aa`.`MasterTable` (
  `codigo` VARCHAR(8) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


use telesystem_aa;
insert into TipoIncidencia(tipo) 
		values ("Accidente"),
			("Reporte de robos"),
            ("Infraestructura en mal estado"),
            ("Objetos perdidos"),
            ("Ambulancia PUCP"),
            ("Otros");

insert into NivelUrgencia (nivel) values ("Leve"), ("Moderado"), ("Critico");
insert into EstadoIncidencia (estado) values ("Registrado"),
																	("En proceso"),
																	("Atendido"),
                                                                    ("Resuelto");
insert into Roles (nombreRol) values ("Usuario PUCP"),("Seguridad");

insert into CategoriaPUCP(nombreCategoria) values ("Alumno"),("Administrativo"),("Jefe de practica"),("Profesor"),("Egresado");

insert into ZonaPUCP(nombreZona,latitud,longitud) values("Entrada Principal",-12.068956336898212, -77.07804319110836),
														("Pabellon V",-12.07310658364993, -77.08194620101752),
                                                        ("EE.GG.CC",-12.070705979576289, -77.07939072636044),
                                                        ("EE.GG.LL",-12.06747847412385, -77.07994862590206),
                                                        ("Polidepotivo",-12.066496182128535, -77.08051323080757),
                                                        ("CIA",-12.071498096004184, -77.08033084066658),
                                                        ("Comedor Central",-12.070273199678287, -77.08143054631317),
                                                        ("Bliblioteca Central",-12.069197804278202, -77.08003311549426),
                                                        ("Aulario", -12.069197804278202, -77.08003311549426),
                                                        ("Edificio McGregor",-12.068447704957036, -77.07872784337455),
                                                        ("Cancha de Minas",-12.072218866144826, -77.08199637475859);
                                                        
insert into Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, celular, idRoles, idCategoriaPUCP, idFotoPerfil)
					values (20201696, "Leonardo", "Abanto", "a20201696@pucp.edu.pe", 12345678, true, sha2("clashroyale123",256),"987654321",1,1,null),
                    (19905060,"Jorge","Gonzales", "jorege.g@pucp.edu.pe",87654321, true,sha2("tele1000",256),null,1,4,null),
                    (20113456,"Goku","kakaroto", "goku.kakaroto@pucp.edu.pe", 56546767, true,sha2("milk4355",256),"976976976", 2,null,null);
                    
insert into Incidencias (fecha,nombreIncidencia, validaIncidencia, descripcion,
						 contadorReabierto, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia,
                         codigoUsuario, idZonaPUCP)
                         values (now(),"Explosion en KILO",true,"Fuga de gas ocurrido en la mañana, previo al abrir al local",
                         0,1,3,1,20201696,9),
                         (now(),"Accidente de semana de Ingenieria",true,"Lesion de alumno en evento",0,1,2,1,19905060,11),
                         (now(),"Laptop perdida en Charlotte",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,4,3,1,20113456,10),
                         (now(),"Accidente en CIA",true,"Lesion de alumno en evento",0,1,2,1,19905060,6),
                         (now(),"Laptop perdida en el V",true,"Mi Macbook M1, que no sirve para jugar Valorant, se extravio ayer",0,4,3,1,20113456,2);
insert into IncidenciasDestacadas (contadorDestacado,idIncidencia) values (0,1),(0,2),(1,3),(0,4),(1,5);

insert into RegistroAdmin (nombreAdmin, passwordAdmin, nombreRol, correo) values("EternalBlue", sha2("DoublePulsar",256), "Administrador", "EternalBlue@pucp.edu.pe");
