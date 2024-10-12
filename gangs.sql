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


-- Dumping database structure for tapatiodev
CREATE DATABASE IF NOT EXISTS `tapatiodev` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tapatiodev`;

-- Dumping structure for table tapatiodev.gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `leadership_rank` int(11) NOT NULL DEFAULT 3,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

-- Dumping data for table tapatiodev.gangs: 3 rows
/*!40000 ALTER TABLE `gangs` DISABLE KEYS */;
INSERT INTO `gangs` (`id`, `name`, `label`, `inventory`, `leadership_rank`) VALUES
	(1, 'woo', 'Woo', '{"dcash":0,"items":{"medikit":0,"meth_pooch":0,"bandage":0,"rolex":0,"diamond":0,"opium_pooch":0,"opium":0,"coke":0,"coke_pooch":0,"jewels":0,"meth":0},"cash":0}', 4),
	(2, 'otf', 'OTF', '{"dcash":0,"items":{"medikit":0,"meth_pooch":0,"bandage":0,"rolex":0,"diamond":0,"opium_pooch":0,"opium":0,"coke":0,"coke_pooch":0,"jewels":0,"meth":0},"cash":0}', 4),
	(3, 'gd', 'GD', '{"dcash":0,"items":{"medikit":0,"meth_pooch":0,"bandage":0,"rolex":0,"diamond":0,"opium_pooch":0,"opium":0,"coke":0,"coke_pooch":0,"jewels":0,"meth":0},"cash":0}', 4);
/*!40000 ALTER TABLE `gangs` ENABLE KEYS */;

-- Dumping structure for table tapatiodev.gang_ranks
CREATE TABLE IF NOT EXISTS `gang_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `gang_name` varchar(255) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `vehicles` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

-- Dumping data for table tapatiodev.gang_ranks: 15 rows
/*!40000 ALTER TABLE `gang_ranks` DISABLE KEYS */;
INSERT INTO `gang_ranks` (`id`, `name`, `label`, `gang_name`, `ranking`, `vehicles`) VALUES
	(1, 'recruit', 'Recruit', 'woo', 0, NULL),
	(2, 'member', 'Member', 'woo', 1, NULL),
	(3, 'shooter', 'Shooter', 'woo', 2, NULL),
	(4, 'topshooter', 'Top Shooter', 'woo', 3, NULL),
	(5, 'owner', 'Owner', 'otf', 4, NULL),
	(21, 'recruit', 'Recruit', 'otf', 0, NULL),
	(22, 'member', 'Member', 'otf', 1, NULL),
	(23, 'shooter', 'Shooter', 'otf', 2, NULL),
	(24, 'topshooter', 'Top Shooter', 'otf', 3, NULL),
	(25, 'owner', 'Owner', 'otf', 4, NULL),
	(31, 'recruit', 'Recruit', 'gd', 0, NULL),
	(32, 'member', 'Member', 'gd', 1, NULL),
	(33, 'shooter', 'Shooter', 'gd', 2, NULL),
	(34, 'topshooter', 'Top Shooter', 'gd', 3, NULL),
	(35, 'owner', 'Owner', 'gd', 4, NULL);
/*!40000 ALTER TABLE `gang_ranks` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
