-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           8.0.12 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de données de la table cantons_suisse.cantons : ~26 rows (environ)
/*!40000 ALTER TABLE `cantons` DISABLE KEYS */;
INSERT INTO `cantons` (`abr`, `nom`, `depuis`, `chef_lieu`, `population`, `superficie`, `densite`, `alt_max`, `alt_min`, `alt_moy`, `alt_diff`) VALUES
	('AG', 'Argovie', 1803, 'Aarau', 662224, 1403.73, 471.8, 908, 260, 476, 648),
	('AI', 'Appenzell Rhodes-Intérieures', 1513, 'Appenzell', 16003, 172.52, 92.8, 2502, 560, 1126, 1942),
	('AR', 'Appenzell Rhodes-Extérieures', 1513, 'Herisau', 54954, 242.86, 226.3, 2502, 440, 935, 2062),
	('BE', 'Berne', 1353, 'Berne', 1026513, 5959.44, 172.2, 4274, 402, 1198, 3872),
	('BL', 'Bâle-Campagne', 1501, 'Liestal', 286848, 517.56, 554.2, 1169, 246, 521, 923),
	('BS', 'Bâle-Ville', 1501, 'Bâle', 198249, 37.00, 5358.1, 522, 245, 295, 277),
	('FR', 'Fribourg', 1481, 'Fribourg', 311914, 1670.70, 186.7, 2389, 429, 856, 1960),
	('GE', 'Genève', 1815, 'Genève', 495325, 282.48, 1753.5, 516, 332, 419, 184),
	('GL', 'Glaris', 1352, 'Glaris', 40147, 685.30, 58.6, 3614, 410, 1589, 3204),
	('GR', 'Grisons', 1803, 'Coire', 197550, 7105.44, 27.8, 4049, 260, 2021, 3789),
	('JU', 'Jura', 1979, 'Delémont', 73122, 838.55, 87.2, 1302, 364, 690, 938),
	('LU', 'Lucerne', 1332, 'Lucerne', 403397, 1493.44, 270.1, 2350, 406, 777, 1944),
	('NE', 'Neuchâtel', 1815, 'Neuchâtel', 178567, 802.93, 222.4, 1552, 429, 919, 1123),
	('NW', 'Nidwald', 1291, 'Stans', 42556, 275.90, 154.2, 2901, 434, 1077, 2467),
	('OW', 'Obwald', 1291, 'Sarnen', 37378, 490.59, 76.2, 3238, 434, 1329, 2804),
	('SG', 'Saint-Gall', 1803, 'Saint-Gall', 502552, 2025.54, 248.1, 3248, 396, 1000, 2852),
	('SH', 'Schaffhouse', 1501, 'Schaffhouse', 80769, 298.42, 270.7, 912, 344, 538, 568),
	('SO', 'Soleure', 1481, 'Soleure', 269441, 790.49, 340.9, 1445, 277, 630, 1168),
	('SZ', 'Schwytz', 1291, 'Schwytz', 155863, 906.92, 171.9, 2802, 406, 1082, 2396),
	('TG', 'Thurgovie', 1803, 'Frauenfeld', 270709, 991.02, 273.2, 991, 370, 495, 621),
	('TI', 'Tessin', 1803, 'Bellinzone', 354375, 2812.20, 126.0, 3402, 193, 1412, 3209),
	('UR', 'Uri', 1291, 'Altdorf', 36145, 1076.57, 33.6, 3630, 434, 1896, 3196),
	('VD', 'Vaud', 1803, 'Lausanne', 784822, 3212.03, 244.3, 3210, 372, 827, 2838),
	('VS', 'Valais', 1815, 'Sion', 339176, 5224.25, 64.9, 4634, 372, 2140, 4262),
	('ZG', 'Zoug', 1352, 'Zoug', 123948, 238.69, 519.3, 1580, 388, 651, 1192),
	('ZH', 'Zurich', 1351, 'Zurich', 1487969, 1729.00, 860.6, 1292, 332, 533, 960);
/*!40000 ALTER TABLE `cantons` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
