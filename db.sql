-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `pathfinder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pathfinder`;

DROP VIEW IF EXISTS `TV Shows`;
CREATE TABLE `TV Shows` (`name` varchar(30), `episode` int unsigned, `season` int unsigned);


DROP TABLE IF EXISTS `prefHosts`;
CREATE TABLE `prefHosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first` varchar(30) DEFAULT NULL,
  `second` varchar(30) DEFAULT NULL,
  `third` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `searchURLs`;
CREATE TABLE `searchURLs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bs` varchar(200) DEFAULT NULL,
  `serienstream` varchar(200) DEFAULT NULL,
  `fmovies` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `shows`;
CREATE TABLE `shows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `episode` int unsigned NOT NULL,
  `season` int unsigned NOT NULL,
  `latestUse` date NOT NULL,
  `streamingsettings` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `streamingsettings` (`streamingsettings`),
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`streamingsettings`) REFERENCES `streamingsettings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `streamingsettings`;
CREATE TABLE `streamingsettings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `searchURLs` int unsigned NOT NULL,
  `prefHosts` int unsigned DEFAULT NULL,
  `languageTag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `searchURLs` (`searchURLs`),
  KEY `prefHosts` (`prefHosts`),
  CONSTRAINT `streamingsettings_ibfk_2` FOREIGN KEY (`prefHosts`) REFERENCES `prefHosts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `streamingsettings_ibfk_5` FOREIGN KEY (`searchURLs`) REFERENCES `searchURLs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `TV Shows`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `TV Shows` AS select `shows`.`name` AS `name`,`shows`.`episode` AS `episode`,`shows`.`season` AS `season` from `shows` order by `shows`.`latestUse`;

-- 2020-05-24 15:26:46
