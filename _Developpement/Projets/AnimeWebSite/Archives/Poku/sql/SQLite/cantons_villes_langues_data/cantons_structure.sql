/*  Titre   : cantons_structure.sql
    Auteur  : Raphaël Favre
    Version : 1.0
*/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Création de la structure de la base pour cantons_suisse
DROP DATABASE IF EXISTS `cantons_suisse`;
CREATE DATABASE IF NOT EXISTS `cantons_suisse` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cantons_suisse`;

-- Création de la structure de la table cantons_suisse. cantons
DROP TABLE IF EXISTS `cantons`;
CREATE TABLE IF NOT EXISTS `cantons` (
  `abr` varchar(2) NOT NULL,
  `nom` varchar(28) NOT NULL,
  `depuis` smallint(6) DEFAULT NULL,
  `chef_lieu` varchar(11) DEFAULT NULL,
  `population` mediumint(9) DEFAULT NULL,
  `superficie` decimal(7,2) DEFAULT NULL,
  `nb_communes` smallint(6) DEFAULT NULL,
  `densite` smallint(6) DEFAULT NULL,
  `alt_max` smallint(6) DEFAULT NULL,
  `alt_min` varchar(3) DEFAULT NULL,
  `alt_moy` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`abr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
