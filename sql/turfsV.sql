-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.18-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Creating the database (if not exists) with utf8 charset
CREATE DATABASE IF NOT EXISTS `turfsV` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `turfsV`;

-- Creating the gangs table
CREATE TABLE IF NOT EXISTS `turfsV_gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,   -- Unique identifier for the gang
  `label` varchar(255) NOT NULL,  -- Display name for the gang
  `inventory` JSON DEFAULT NULL,  -- JSON format for storing gang inventory (dcash, items, cash)
  `leadership_rank` int(11) NOT NULL DEFAULT 3, -- Default rank for leadership
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`) -- Ensure gang names are unique
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- Inserting data for gangs (Example data for Aztecas, Ballas, Families)
INSERT INTO `turfsV_gangs` (`id`, `name`, `label`, `inventory`, `leadership_rank`) VALUES
(1, 'aztecas', 'Aztecas', '{"dcash": 0, "items": {"meth_pooch": 0, "rolex": 0, "coke": 0}, "cash": 0}', 4),
(2, 'ballas', 'Ballas', '{"dcash": 0, "items": {"coke_pooch": 0, "diamond": 0, "meth": 0}, "cash": 0}', 4),
(3, 'families', 'Families', '{"dcash": 0, "items": {"jewels": 0, "meth_pooch": 0, "coke": 0}, "cash": 0}', 4);
(4, 'vagos', 'Vagos', '{"dcash": 0, "items": {"jewels": 0, "meth_pooch": 0, "coke": 0}, "cash": 0}', 4);

-- Creating the ranks table for gangs
CREATE TABLE IF NOT EXISTS `turfsV_gang_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,      -- Rank name (e.g., recruit, member)
  `label` varchar(255) NOT NULL,     -- Display label for the rank
  `gang_name` varchar(255) NOT NULL, -- The gang associated with this rank
  `ranking` int(11) NOT NULL,        -- Rank order (higher numbers indicate higher rank)
  `vehicles` JSON DEFAULT NULL,      -- JSON format to store vehicle permissions for the rank
  PRIMARY KEY (`id`),
  FOREIGN KEY (`gang_name`) REFERENCES `turfsV_gangs`(`name`) ON DELETE CASCADE -- Ensure ranks belong to valid gangs
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- Inserting rank data for each gang (Aztecas, Ballas, Families)
INSERT INTO `turfsV_gang_ranks` (`id`, `name`, `label`, `gang_name`, `ranking`, `vehicles`) VALUES
(1, 'recruit', 'Recruit', 'aztecas', 0, '{"insurgent3": 0}'),
(2, 'member', 'Member', 'aztecas', 1, '{"insurgent3": 0}'),
(3, 'shooter', 'Shooter', 'aztecas', 2, '{"supervolito2": 0}'),
(4, 'topshooter', 'Top Shooter', 'aztecas', 3, '{"supervolito2": 0}'),
(5, 'owner', 'Owner', 'aztecas', 4, NULL),
(6, 'recruit', 'Recruit', 'ballas', 0, '{"insurgent3": 0}'),
(7, 'member', 'Member', 'ballas', 1, '{"insurgent3": 0}'),
(8, 'shooter', 'Shooter', 'ballas', 2, '{"supervolito2": 0}'),
(9, 'topshooter', 'Top Shooter', 'ballas', 3, '{"supervolito2": 0}'),
(10, 'owner', 'Owner', 'ballas', 4, NULL),
(11, 'recruit', 'Recruit', 'families', 0, '{"insurgent3": 0}'),
(12, 'member', 'Member', 'families', 1, '{"insurgent3": 0}'),
(13, 'shooter', 'Shooter', 'families', 2, '{"supervolito2": 0}'),
(14, 'topshooter', 'Top Shooter', 'families', 3, '{"supervolito2": 0}'),
(15, 'owner', 'Owner', 'families', 4, NULL);

-- Creating the turfs table for capturing territories
CREATE TABLE IF NOT EXISTS `turfsV_turfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,           -- Turf name (e.g., methfarm)
  `owner` varchar(255) DEFAULT NULL,      -- Current owner of the turf (gang name)
  `last_captured` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Time the turf was last captured
  PRIMARY KEY (`id`),
  FOREIGN KEY (`owner`) REFERENCES `turfsV_gangs`(`name`) ON DELETE SET NULL -- Link turf ownership to gangs
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- Insert data for initial turf zones
INSERT INTO `turfsV_turfs` (`id`, `name`, `owner`) VALUES
(1, 'methfarm', 'aztecas'),
(2, 'cokefarm', 'ballas'),
(3, 'weedfarm', 'families');

-- Reset the SQL environment settings to default
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
