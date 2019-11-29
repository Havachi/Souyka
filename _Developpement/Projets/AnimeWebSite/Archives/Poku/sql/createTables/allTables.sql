-- --------------------------------------------------------
-- Host :                       127.0.0.1
-- Server Version:           	8.0.14 - MySQL Community Server - GPL
-- Server OS:                	Win64
-- HeidiSQL Version:            9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export database's structure for poku
CREATE DATABASE IF NOT EXISTS `poku` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `poku`;


/*
-- Primaries Tables
*/

-- Export table's structure of poku. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emailAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hashPsw` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `profilePicture` varchar(255),
  `birthday` date,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `joinDate` date NOT NULL,
  `country` tinyint,
  `type` tinyint DEFAULT '1' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudo` (`pseudo`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
)

-- Export table's structure of poku. lang
CREATE TABLE IF NOT EXISTS `lang` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `acronym` (`acronym`)
)

-- Export table's structure of poku. art
CREATE TABLE IF NOT EXISTS `art` (
  `id` int unsigned AUTO_INCREMENT NOT NULL,
  `enName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `frName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `synonyms` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `jpSynopsis` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enSynopsis` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `frSynopsis` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `episodes` tinyint,
  `startAiring` date,
  `endAiring` date,
  `broadcast` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `duration` tinyint,
  `status` tinyint(1),
  `premiered` tinyint(2),
  `studio` tinyint,
  `magazine` tinyint,
  `type` tinyint(2),
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jpName` (`jpName`),
  UNIQUE KEY `enName` (`enName`),
  UNIQUE KEY `frName` (`frName`)
)

-- Export table's structure of poku. artTypes
CREATE TABLE IF NOT EXISTS `artTypes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

-- Export table's structure of poku. status
CREATE TABLE IF NOT EXISTS `status` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

-- Export table's structure of poku. magazines
CREATE TABLE IF NOT EXISTS `magazines` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

-- Export table's structure of poku. studios
CREATE TABLE IF NOT EXISTS `studios` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

-- Export table's structure of poku. genres
CREATE TABLE IF NOT EXISTS `genres` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

-- Export table's structure of poku. characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `romajiName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jpjiName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `synonyms` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `jpDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `frDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. people
CREATE TABLE IF NOT EXISTS `people` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `romajiName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jpjiName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `jpDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `frDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. clubs
CREATE TABLE IF NOT EXISTS `clubs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `acronym` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tagLine` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `profilePicture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` tinyint,
  `artId` int,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acronym` (`acronym`),
  UNIQUE KEY `name` (`name`)
)

-- Export table's structure of poku. comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parentComment` int,
  `blogId` int NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. blogs
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userId` int NOT NULL,
  `langId` tinyint NOT NULL,
  `blogTypeId` tinyint NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. blogTypes
CREATE TABLE IF NOT EXISTS `blogTypes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

-- Export table's structure of poku. seasonsYear
CREATE TABLE IF NOT EXISTS `seasonYears` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `year` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year` (`year`)
)

-- Export table's structure of poku. seasons
CREATE TABLE IF NOT EXISTS `seasons` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `seasonName` tinyint NOT NULL,
  `seasonYear` tinyint NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. rates
CREATE TABLE IF NOT EXISTS `rates` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `rate` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mean` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rate` (`rate`),
  UNIQUE KEY `mean` (`mean`)
)

-- Export table's structure of poku. scores
CREATE TABLE IF NOT EXISTS `scores` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)


/*
-- Sub-Tables
*/

-- Export table's structure of poku. St_haveBloqued
CREATE TABLE IF NOT EXISTS `St_haveBloqued` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `haveBloquedUserId` int(10) NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_follow
CREATE TABLE IF NOT EXISTS `St_follow` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `followUserId` int NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_friendRequest
CREATE TABLE IF NOT EXISTS `St_friendRequest` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `requestForFriendUserId` int NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_haveForFriend
CREATE TABLE IF NOT EXISTS `St_haveForFriend` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `haveForFriendUserId` int NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_clubMemberTypes
CREATE TABLE IF NOT EXISTS `St_clubMemberTypes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` tinyint NOT NULL,
  `clubId` int NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_blogLang
CREATE TABLE IF NOT EXISTS `St_blogLang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `langId` tinyint NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_favorites
CREATE TABLE IF NOT EXISTS `St_favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `artId` int NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_userRates
CREATE TABLE IF NOT EXISTS `St_userScores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `artId` int NOT NULL,
  `scoreId` tinyint NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_userStatus
CREATE TABLE IF NOT EXISTS `St_userStatus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `artId` int NOT NULL,
  `statusId` tinyint NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_recommendations
CREATE TABLE IF NOT EXISTS `St_recommendations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `userId` int NOT NULL,
  `artId` int NOT NULL,
  `isLikeArtId` int NOT NULL,
  `update` timestamp NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_artCharacters
CREATE TABLE IF NOT EXISTS `St_artCharacters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `characterId` int NOT NULL,
  `peopleId` int,
  `artId` int NOT NULL,
  PRIMARY KEY (`id`)
)

-- Export table's structure of poku. St_artGenres
CREATE TABLE IF NOT EXISTS `St_artGenres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genreId` tinyint NOT NULL,
  `artId` int NOT NULL,
  PRIMARY KEY (`id`)
)



/*
-- References
*/


-- Export table's references of poku. users
ALTER TABLE users
ADD FOREIGN KEY (country) REFERENCES countries(id);

-- Export table's references of poku. art
ALTER TABLE art
ADD FOREIGN KEY (status) REFERENCES status(id);
ALTER TABLE art
ADD FOREIGN KEY (premiered) REFERENCES seasons(id);
ALTER TABLE art
ADD FOREIGN KEY (studio) REFERENCES studios(id);
ALTER TABLE art
ADD FOREIGN KEY (magazine) REFERENCES magazines(id);
ALTER TABLE art
ADD FOREIGN KEY (type) REFERENCES artTypes(id);

-- Export table's references of poku. St_artGenres
ALTER TABLE St_artGenres
ADD FOREIGN KEY (genreId) REFERENCES genres(id);
ALTER TABLE St_artGenres
ADD FOREIGN KEY (artId) REFERENCES art(id);

-- Export table's references of poku. comments
ALTER TABLE comments
ADD FOREIGN KEY (blogId) REFERENCES blogs(id);

-- Export table's references of poku. clubs
ALTER TABLE clubs
ADD FOREIGN KEY (country) REFERENCES countries(id);
ALTER TABLE clubs
ADD FOREIGN KEY (artId) REFERENCES art(id);

-- Export table's references of poku. blogs
ALTER TABLE blogs
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE blogs
ADD FOREIGN KEY (langId) REFERENCES lang(id);
ALTER TABLE blogs
ADD FOREIGN KEY (blogTypeId) REFERENCES blogTypes(id);

-- Export table's references of poku. seasons
ALTER TABLE seasons
ADD FOREIGN KEY (seasonYear) REFERENCES seasonYears(id);

-- Export table's references of poku. St_haveBloqued
ALTER TABLE St_haveBloqued
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_haveBloqued
ADD FOREIGN KEY (haveBloquedUserId) REFERENCES users(id);

-- Export table's references of poku. St_follow
ALTER TABLE St_follow
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_follow
ADD FOREIGN KEY (followUserId) REFERENCES users(id);

-- Export table's references of poku. St_friendRequest
ALTER TABLE St_friendRequest
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_friendRequest
ADD FOREIGN KEY (requestForFriendUserId) REFERENCES users(id);

-- Export table's references of poku. St_haveForFriend
ALTER TABLE St_haveForFriend
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_haveForFriend
ADD FOREIGN KEY (haveForFriendUserId) REFERENCES users(id);

-- Export table's references of poku. St_clubMemberTypes
ALTER TABLE St_clubMemberTypes
ADD FOREIGN KEY (type) REFERENCES memberTypes(id);
ALTER TABLE St_clubMemberTypes
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_clubMemberTypes
ADD FOREIGN KEY (clubId) REFERENCES clubs(id);

-- Export table's references of poku. St_blogLang
ALTER TABLE St_blogLang
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_blogLang
ADD FOREIGN KEY (langId) REFERENCES lang(id);

-- Export table's references of poku. St_favorites
ALTER TABLE St_favorites
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_favorites
ADD FOREIGN KEY (artId) REFERENCES art(id);

-- Export table's references of poku. St_userRates
ALTER TABLE St_userScores
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_userScores
ADD FOREIGN KEY (artId) REFERENCES art(id);
ALTER TABLE St_userScores
ADD FOREIGN KEY (scoreId) REFERENCES scores(id);

-- Export table's references of poku. St_userStatus
ALTER TABLE St_userStatus
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_userStatus
ADD FOREIGN KEY (artId) REFERENCES art(id);
ALTER TABLE St_userStatus
ADD FOREIGN KEY (statusId) REFERENCES status(id);

-- Export table's references of poku. St_recommendations
ALTER TABLE St_recommendations
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_recommendations
ADD FOREIGN KEY (artId) REFERENCES art(id);
ALTER TABLE St_recommendations
ADD FOREIGN KEY (isLikeArtId) REFERENCES art(id);

-- Export table's references of poku. St_artCharacters
ALTER TABLE St_artCharacters
ADD FOREIGN KEY (characterId) REFERENCES characters(id);
ALTER TABLE St_artCharacters
ADD FOREIGN KEY (peopleId) REFERENCES people(id);
ALTER TABLE St_artCharacters
ADD FOREIGN KEY (artId) REFERENCES art(id);


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
