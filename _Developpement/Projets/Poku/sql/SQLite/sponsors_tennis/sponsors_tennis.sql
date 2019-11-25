/* Titre : Sponors_tennis.sql*/
/* Auteur : raphael.favre@cpnv.ch*/
/* Version : 29-SEP-2018*/

-- MySQL Script generated by MySQL Workbench
-- Fri Sep 28 16:44:15 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sponsors_tennis
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sponsors_tennis` ;

-- -----------------------------------------------------
-- Schema sponsors_tennis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sponsors_tennis` DEFAULT CHARACTER SET utf8 ;
USE `sponsors_tennis` ;

-- -----------------------------------------------------
-- Table `sponsors_tennis`.`sponsors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sponsors_tennis`.`sponsors` ;

CREATE TABLE IF NOT EXISTS `sponsors_tennis`.`sponsors` (
  `id_sponsor` INT NOT NULL,
  `nom_sponsor` VARCHAR(100) NULL,
  PRIMARY KEY (`id_sponsor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sponsors_tennis`.`joueurs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sponsors_tennis`.`joueurs` ;

CREATE TABLE IF NOT EXISTS `sponsors_tennis`.`joueurs` (
  `id_joueur` INT NOT NULL,
  `prenom_joueur` VARCHAR(100) NULL,
  `nom_joueur` VARCHAR(100) NULL,
  `sponsors_id_sponsor` INT NULL,
  PRIMARY KEY (`id_joueur`),
  INDEX `fk_joueurs_sponsors_idx` (`sponsors_id_sponsor` ASC),
  CONSTRAINT `fk_joueurs_sponsors`
    FOREIGN KEY (`sponsors_id_sponsor`)
    REFERENCES `sponsors_tennis`.`sponsors` (`id_sponsor`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Insertion des données de la table "sponsors"
INSERT INTO sponsors(id_sponsor,nom_sponsor) VALUES (1,'Babolat');
INSERT INTO sponsors(id_sponsor,nom_sponsor) VALUES (2,'Dunlop');
INSERT INTO sponsors(id_sponsor,nom_sponsor) VALUES (3,'Head');
INSERT INTO sponsors(id_sponsor,nom_sponsor) VALUES (4,'Wilson');
INSERT INTO sponsors(id_sponsor,nom_sponsor) VALUES (5,'Yonex');

-- Insertion des données de la table "joueurs"
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (1,'Novak','Djokovic',3);
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (2,'Jean-Claude','Duss',NULL);
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (3,'Roger','Federer',4);
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (4,'Andy','Murray',3);
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (5,'Rafael','Nadal',1);
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (6,'Kei','Nishikori',4);
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (7,'Milos','Raonoic',4);
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (8,'Frodon','Sacquet',NULL);
INSERT INTO joueurs(id_joueur,prenom_joueur,nom_joueur,sponsors_id_sponsor) VALUES (9,'Dominic','Thiem',1);