-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Host: localhost:8080
-- Generation Time: Aug 24, 2015 at 11:49 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `to_do_test`
--
CREATE DATABASE IF NOT EXISTS `to_do_test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `to_do_test`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories_tasks`
--

CREATE TABLE IF NOT EXISTS `categories_tasks` (
  `id` bigint(20) unsigned NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_tasks`
--

INSERT INTO `categories_tasks` (`id`, `category_id`, `task_id`) VALUES
(2, 10, 2),
(3, 11, 3),
(4, 11, 4),
(5, 17, 13),
(6, 18, 14),
(7, 19, 14),
(10, 30, 18),
(11, 31, 19),
(12, 31, 20),
(13, 37, 29),
(14, 38, 30),
(15, 39, 30),
(18, 50, 34),
(19, 51, 35),
(20, 51, 36),
(21, 57, 45),
(22, 58, 46),
(23, 59, 46),
(26, 70, 50),
(27, 71, 51),
(28, 71, 52),
(29, 77, 61),
(30, 78, 62),
(31, 79, 62),
(34, 90, 66),
(35, 91, 67),
(36, 91, 68),
(37, 97, 77),
(38, 98, 78),
(39, 99, 78),
(42, 110, 82),
(43, 111, 83),
(44, 111, 84),
(45, 117, 93),
(46, 118, 94),
(47, 119, 94),
(50, 130, 98),
(51, 131, 99),
(52, 131, 100),
(53, 137, 109),
(54, 138, 110),
(55, 139, 110),
(58, 150, 114),
(59, 151, 115),
(60, 151, 116),
(61, 157, 125),
(62, 158, 126),
(63, 159, 126),
(66, 170, 130),
(67, 171, 131),
(68, 171, 132),
(69, 177, 141),
(70, 178, 142),
(71, 179, 142),
(74, 190, 146),
(75, 191, 147),
(76, 191, 148),
(77, 197, 157),
(78, 198, 158),
(79, 199, 158),
(82, 210, 162),
(83, 211, 163),
(84, 211, 164),
(85, 217, 173),
(86, 218, 174),
(87, 219, 174);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `complete` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `categories_tasks`
--
ALTER TABLE `categories_tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=221;
--
-- AUTO_INCREMENT for table `categories_tasks`
--
ALTER TABLE `categories_tasks`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=177;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
