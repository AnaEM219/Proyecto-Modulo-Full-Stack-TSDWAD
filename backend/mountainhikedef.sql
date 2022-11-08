-- MySQL Script generated by MySQL Workbench
-- Tue Nov  8 11:52:38 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mountainhikedef
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mountainhikedef
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mountainhikedef` ;
USE `mountainhikedef` ;

-- -----------------------------------------------------
-- Table `mountainhikedef`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mountainhikedef`.`admin` (
  `id_admin` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `contraseña` BLOB NOT NULL,
  PRIMARY KEY (`id_admin`))
ENGINE = InnoDB
AUTO_INCREMENT = 5;


-- -----------------------------------------------------
-- Table `mountainhikedef`.`blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mountainhikedef`.`blog` (
  `id_blog` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `titulo` VARCHAR(250) COLLATE 'utf8mb3_bin' NULL DEFAULT NULL,
  `imagen` BLOB NULL DEFAULT NULL,
  `cuerpo` VARCHAR(250) COLLATE 'utf8mb3_bin' NULL DEFAULT NULL,
  `admin_id_admin` INT NOT NULL,
  PRIMARY KEY (`id_blog`),
  INDEX `fk_blog_admin1_idx` (`admin_id_admin` ASC) VISIBLE,
  CONSTRAINT `fk_blog_admin1`
    FOREIGN KEY (`admin_id_admin`)
    REFERENCES `mountainhikedef`.`admin` (`id_admin`))
ENGINE = InnoDB
AUTO_INCREMENT = 4;


-- -----------------------------------------------------
-- Table `mountainhikedef`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mountainhikedef`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `Apellido` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `edad` INT NULL DEFAULT NULL,
  `ciudad` VARCHAR(45) COLLATE 'utf8mb3_bin' NULL DEFAULT NULL,
  `email` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `telefono` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `contraseña` BLOB NOT NULL,
  `id_admin` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_Usuario_admin1_idx` (`id_admin` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_admin1`
    FOREIGN KEY (`id_admin`)
    REFERENCES `mountainhikedef`.`admin` (`id_admin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountainhikedef`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mountainhikedef`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `id_reserva` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_Usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mountainhikedef`.`usuario` (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountainhikedef`.`guia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mountainhikedef`.`guia` (
  `id_guia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `id_recorrido` INT NOT NULL,
  PRIMARY KEY (`id_guia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountainhikedef`.`recorridos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mountainhikedef`.`recorridos` (
  `id_recorridos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) COLLATE 'utf8mb3_bin' NOT NULL,
  `descripcion` VARCHAR(1500) COLLATE 'utf8mb3_bin' NULL DEFAULT NULL,
  `id_guia` INT NOT NULL,
  `valor` INT NOT NULL,
  PRIMARY KEY (`id_recorridos`))
ENGINE = InnoDB
AUTO_INCREMENT = 6;


-- -----------------------------------------------------
-- Table `mountainhikedef`.`guia_recorridos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mountainhikedef`.`guia_recorridos` (
  `id_guia` INT NOT NULL,
  `id_recorridos` INT NOT NULL,
  PRIMARY KEY (`id_guia`, `id_recorridos`),
  INDEX `fk_guia_has_recorridos_recorridos1_idx` (`id_recorridos` ASC) VISIBLE,
  INDEX `fk_guia_has_recorridos_guia1_idx` (`id_guia` ASC) VISIBLE,
  CONSTRAINT `fk_guia_has_recorridos_guia1`
    FOREIGN KEY (`id_guia`)
    REFERENCES `mountainhikedef`.`guia` (`id_guia`),
  CONSTRAINT `fk_guia_has_recorridos_recorridos1`
    FOREIGN KEY (`id_recorridos`)
    REFERENCES `mountainhikedef`.`recorridos` (`id_recorridos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mountainhikedef`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mountainhikedef`.`reservas` (
  `id_reservas` INT NOT NULL AUTO_INCREMENT,
  `fecha_reserva` DATE NOT NULL,
  `id_recorrido` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_reservas`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `id_recorrido_idx` (`id_recorrido` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mountainhikedef`.`cliente` (`id_cliente`),
  CONSTRAINT `id_recorrido`
    FOREIGN KEY (`id_recorrido`)
    REFERENCES `mountainhikedef`.`recorridos` (`id_recorridos`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
