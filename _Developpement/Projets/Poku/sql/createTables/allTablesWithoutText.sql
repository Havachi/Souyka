CREATE DATABASE IF NOT EXISTS `poku`;

USE `poku`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emailAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hashPsw` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `profilePicture` varchar(255) DEFAULT 'defaultUserProfilePicture.png' NOT NULL,
  `birthday` date,
  `description` varchar(2000),
  `joinDate` date,
  `display` tinyint(1) DEFAULT '1' NOT NULL,
  `displayLang` tinyint(1) DEFAULT '1' NOT NULL,
  `country` tinyint(255),
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudo` (`pseudo`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `lang` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `acronym` (`acronym`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `art` (
  `id` int unsigned AUTO_INCREMENT NOT NULL,
  `jpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `frName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `jpSynopsis` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enSynopsis` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `frSynopsis` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `episodes` tinyint,
  `startAiring` date,
  `endAiring` date,
  `broadcast` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `duration` tinyint(3),
  `status` tinyint(1),
  `premiered` tinyint(2),
  `producer` tinyint,
  `licensor` tinyint,
  `studio` tinyint,
  `magazine` tinyint,
  `type` tinyint(2),
  PRIMARY KEY (`id`),
  UNIQUE KEY `jpName` (`jpName`),
  UNIQUE KEY `enName` (`enName`),
  UNIQUE KEY `frName` (`frName`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `artTypes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `licensors` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `magazines` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `producers` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `studios` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `genres` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `enName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jpDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `people` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `enName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jpDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `clubs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `acronym` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tagLine` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `profilePicture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` tinyint,
  `artId` int,
  `creationDate` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acronym` (`acronym`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type`tinyint NOT NULL,
  `blogId` int NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `commentTypes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(2500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userId` int NOT NULL,
  `langId` tinyint NOT NULL,
  `blogTypeId` tinyint NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `blogTypes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `seasonNames` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `seasonYears` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `year` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year` (`year`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `seasons` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `seasonName` tinyint NOT NULL,
  `seasonYear` tinyint NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `rates` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `memberTypes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)



USE `poku`;
CREATE TABLE IF NOT EXISTS `St_haveBloqued` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `haveBloquedUserId` int(10) NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_follow` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `followUserId` int NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_friendRequest` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `requestForFriendUserId` int NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_haveForFriend` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `haveForFriendUserId` int NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_clubMemberTypes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` tinyint NOT NULL,
  `clubId` int NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_blogLang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `langId` tinyint NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `artId` int NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_userRates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `artId` int NOT NULL,
  `rateId` tinyint NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_userStatus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `artId` int NOT NULL,
  `statusId` tinyint NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_recommendations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `userId` int NOT NULL,
  `artId` int NOT NULL,
  `isLikeArtId` int NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_artCharacters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `characterId` int NOT NULL,
  `peopleId` int,
  `artId` int NOT NULL,
  PRIMARY KEY (`id`)
)

USE `poku`;
CREATE TABLE IF NOT EXISTS `St_artGenres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genreId` tinyint NOT NULL,
  `artId` int NOT NULL,
  PRIMARY KEY (`id`)
)




USE `poku`;
ALTER TABLE users
ADD FOREIGN KEY (displayLang) REFERENCES lang(id);
ALTER TABLE users
ADD FOREIGN KEY (country) REFERENCES countries(id);

USE `poku`;
ALTER TABLE art
ADD FOREIGN KEY (status) REFERENCES status(id);
ALTER TABLE art
ADD FOREIGN KEY (premiered) REFERENCES seasons(id);
ALTER TABLE art
ADD FOREIGN KEY (producer) REFERENCES producers(id);
ALTER TABLE art
ADD FOREIGN KEY (licensor) REFERENCES licensors(id);
ALTER TABLE art
ADD FOREIGN KEY (studio) REFERENCES studios(id);
ALTER TABLE art
ADD FOREIGN KEY (magazine) REFERENCES magazines(id);
ALTER TABLE art
ADD FOREIGN KEY (type) REFERENCES artTypes(id);

USE `poku`;
ALTER TABLE genres
ADD FOREIGN KEY (genreId) REFERENCES genres(id);
ALTER TABLE genres
ADD FOREIGN KEY (artId) REFERENCES art(id);

USE `poku`;
ALTER TABLE comments
ADD FOREIGN KEY (type) REFERENCES commentTypes(id);
ALTER TABLE comments
ADD FOREIGN KEY (blogId) REFERENCES blogs(id);

USE `poku`;
ALTER TABLE clubs
ADD FOREIGN KEY (country) REFERENCES countries(id);
ALTER TABLE clubs
ADD FOREIGN KEY (aboutId) REFERENCES art(id);

USE `poku`;
ALTER TABLE blogs
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE blogs
ADD FOREIGN KEY (langId) REFERENCES lang(id);
ALTER TABLE blogs
ADD FOREIGN KEY (blogTypeId) REFERENCES blogTypes(id);

USE `poku`;
ALTER TABLE seasons
ADD FOREIGN KEY (seasonName) REFERENCES seasonNames(id);
ALTER TABLE seasons
ADD FOREIGN KEY (seasonYear) REFERENCES seasonYears(id);

USE `poku`;
ALTER TABLE St_haveBloqued
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_haveBloqued
ADD FOREIGN KEY (haveBloquedUserId) REFERENCES users(id);

USE `poku`;
ALTER TABLE St_follow
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_follow
ADD FOREIGN KEY (followUserId) REFERENCES users(id);

USE `poku`;
ALTER TABLE St_friendRequest
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_friendRequest
ADD FOREIGN KEY (requestForFriendUserId) REFERENCES users(id);

USE `poku`;
ALTER TABLE St_haveForFriend
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_haveForFriend
ADD FOREIGN KEY (haveForFriendUserId) REFERENCES users(id);

USE `poku`;
ALTER TABLE St_clubMemberTypes
ADD FOREIGN KEY (type) REFERENCES memberTypes(id);
ALTER TABLE St_clubMemberTypes
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_clubMemberTypes
ADD FOREIGN KEY (clubId) REFERENCES clubs(id);

USE `poku`;
ALTER TABLE St_blogLang
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_blogLang
ADD FOREIGN KEY (langId) REFERENCES lang(id);

USE `poku`;
ALTER TABLE St_favorites
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_favorites
ADD FOREIGN KEY (artId) REFERENCES art(id);

USE `poku`;
ALTER TABLE St_userRates
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_userRates
ADD FOREIGN KEY (artId) REFERENCES art(id);
ALTER TABLE St_userRates
ADD FOREIGN KEY (rateId) REFERENCES rates(id);

USE `poku`;
ALTER TABLE St_userStatus
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_userStatus
ADD FOREIGN KEY (artId) REFERENCES art(id);
ALTER TABLE St_userStatus
ADD FOREIGN KEY (statusId) REFERENCES status(id);

USE `poku`;
ALTER TABLE St_recommendations
ADD FOREIGN KEY (userId) REFERENCES users(id);
ALTER TABLE St_recommendations
ADD FOREIGN KEY (artId) REFERENCES art(id);
ALTER TABLE St_recommendations
ADD FOREIGN KEY (isLikeArtId) REFERENCES art(id);

USE `poku`;
ALTER TABLE St_artCharacters
ADD FOREIGN KEY (characterId) REFERENCES characters(id);
ALTER TABLE St_artCharacters
ADD FOREIGN KEY (peopleId) REFERENCES people(id);
ALTER TABLE St_artCharacters
ADD FOREIGN KEY (artId) REFERENCES art(id);