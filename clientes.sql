-- MySQL Script generated by MySQL Workbench
-- Fri Mar 19 16:49:20 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clientes
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clientes` ;

-- -----------------------------------------------------
-- Schema clientes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clientes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `clientes` ;

-- -----------------------------------------------------
-- Table `clientes`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientes`.`clientes` ;

CREATE TABLE IF NOT EXISTS `clientes`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientes`.`direcciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientes`.`direcciones` ;

CREATE TABLE IF NOT EXISTS `clientes`.`direcciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `domicilio` VARCHAR(45) NULL,
  `calle` VARCHAR(45) NULL,
  `colonia` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_direcciones_personas_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_direcciones_personas`
    FOREIGN KEY (`idCliente`)
    REFERENCES `clientes`.`clientes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientes`.`telefonos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientes`.`telefonos` ;

CREATE TABLE IF NOT EXISTS `clientes`.`telefonos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `tipo` INT NOT NULL,
  `esPrincipal` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_telefonos_clientes_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_telefonos_clientes`
    FOREIGN KEY (`idCliente`)
    REFERENCES `clientes`.`clientes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientes`.`correos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientes`.`correos` ;

CREATE TABLE IF NOT EXISTS `clientes`.`correos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `correo` VARCHAR(320) NOT NULL,
  `esPrincipal` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_correos_personas_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_correos_personas`
    FOREIGN KEY (`idCliente`)
    REFERENCES `clientes`.`clientes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientes`.`reportes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientes`.`reportes` ;

CREATE TABLE IF NOT EXISTS `clientes`.`reportes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `asunto` VARCHAR(45) NOT NULL,
  `notas` VARCHAR(320) NOT NULL,
  `folio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reportes_clientes_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_reportes_clientes`
    FOREIGN KEY (`idCliente`)
    REFERENCES `clientes`.`clientes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientes`.`membresias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientes`.`membresias` ;

CREATE TABLE IF NOT EXISTS `clientes`.`membresias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `tipo` INT NOT NULL,
  `fechaMembresia` DATETIME NOT NULL,
  `ultimaRenovacion` DATETIME NOT NULL,
  `idTelefono` INT NULL,
  `idCorreo` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_membresias_clientes_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_membresias_telefonos_idx` (`idTelefono` ASC) VISIBLE,
  INDEX `fk_membresias_correos_idx` (`idCorreo` ASC) VISIBLE,
  CONSTRAINT `fk_membresias_clientes`
    FOREIGN KEY (`idCliente`)
    REFERENCES `clientes`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_membresias_telefonos`
    FOREIGN KEY (`idTelefono`)
    REFERENCES `clientes`.`telefonos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_membresias_correos`
    FOREIGN KEY (`idCorreo`)
    REFERENCES `clientes`.`correos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin' IDENTIFIED BY 'admin';
-- GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;