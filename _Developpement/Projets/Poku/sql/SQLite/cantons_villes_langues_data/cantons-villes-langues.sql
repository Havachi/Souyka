-- MySQL Script generated by MySQL Workbench
-- Wed Nov  7 11:24:52 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cantons-villes-langues
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cantons-villes-langues
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cantons-villes-langues` DEFAULT CHARACTER SET utf8 ;
USE `cantons-villes-langues` ;

-- -----------------------------------------------------
-- Table `cantons-villes-langues`.`cantons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cantons-villes-langues`.`cantons` (
  `abr` VARCHAR(2) NOT NULL,
  `nom` VARCHAR(28) NULL,
  `depuis` SMALLINT NULL,
  `chef_lieu` VARCHAR(11) NULL,
  `population` MEDIUMINT NULL,
  `superficie` DECIMAL(7,2) NULL,
  `densite` DECIMAL(5,2) NULL,
  `alt_max` SMALLINT NULL,
  `alt_min` SMALLINT NULL,
  `alt_moy` SMALLINT NULL,
  `alt_diff` SMALLINT NULL,
  PRIMARY KEY (`abr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cantons-villes-langues`.`langues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cantons-villes-langues`.`langues` (
  `langue_id` INT NOT NULL,
  `nom` VARCHAR(28) NULL,
  PRIMARY KEY (`langue_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cantons-villes-langues`.`langues_officielles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cantons-villes-langues`.`langues_officielles` (
  `cantons_abr` VARCHAR(2) NOT NULL,
  `langues_langue_id` INT NOT NULL,
  PRIMARY KEY (`cantons_abr`, `langues_langue_id`),
  INDEX `fk_LANGUES_has_CANTONS_CANTONS1_idx` (`cantons_abr` ASC) VISIBLE,
  INDEX `fk_LANGUES_has_CANTONS_LANGUES_idx` (`langues_langue_id` ASC) VISIBLE,
  CONSTRAINT `fk_LANGUES_has_CANTONS_LANGUES`
    FOREIGN KEY (`langues_langue_id`)
    REFERENCES `cantons-villes-langues`.`langues` (`langue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LANGUES_has_CANTONS_CANTONS1`
    FOREIGN KEY (`cantons_abr`)
    REFERENCES `cantons-villes-langues`.`cantons` (`abr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cantons-villes-langues`.`villes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cantons-villes-langues`.`villes` (
  `ville_id` INT NOT NULL,
  `nom` VARCHAR(28) NULL,
  `rang` SMALLINT NULL,
  `cantons_abr` VARCHAR(2) NOT NULL,
  `population` MEDIUMINT NULL,
  `superficie` DECIMAL(7,2) NULL,
  `densite` DECIMAL(5,2) NULL,
  PRIMARY KEY (`ville_id`, `cantons_abr`),
  INDEX `fk_villes_CANTONS1_idx` (`cantons_abr` ASC) VISIBLE,
  CONSTRAINT `fk_villes_CANTONS1`
    FOREIGN KEY (`cantons_abr`)
    REFERENCES `cantons-villes-langues`.`cantons` (`abr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;