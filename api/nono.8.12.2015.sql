-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 12, 2015 at 06:10 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nono`
--

-- --------------------------------------------------------

--
-- Table structure for table `lovers`
--

CREATE TABLE IF NOT EXISTS `lovers` (
  `user_id` int(11) unsigned zerofill NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `preference` tinyint(4) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `education` int(3) unsigned DEFAULT NULL,
  `zip` int(11) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `frozen` tinyint(1) NOT NULL,
  `boots` tinyint(4) DEFAULT '0',
  `mean` int(11) DEFAULT '0',
  `no_shows` int(11) DEFAULT '0',
  `no_contacts` int(11) DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  `datable_days` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lovers`
--

INSERT INTO `lovers` (`user_id`, `email`, `gender`, `preference`, `age`, `education`, `zip`, `tagline`, `bio`, `frozen`, `boots`, `mean`, `no_shows`, `no_contacts`, `tags`, `datable_days`, `date_created`) VALUES
(00000000019, 'subclass@gmail.com', 1, 1, 36, 7, 53220, 'Light, short, and unhandsome to many.', 'This is a dark and stormy test.', 0, 2, 4, 1, 0, 'loving, sexy, dimwitted', 'false, thursday dinner, false', '2015-07-19 00:37:57'),
(00000000021, 'nickolasnikolic@gmail.com', 2, 1, 45, 20, 12345, 'Dark, tall, and unhandsome to many.', 'This is a dark and stormy test. This is a dark and stormy test.This is a dark and stormy test.This is a dark and stormy test.This is a dark and stormy test.This is a dark and stormy test.This is a dark and stormy test.', 0, 3, 16, 13, 15, 'loving, sexy, mean, star', 'monday lunch, monday dinner, wednesday lunch, wednesday dinner, friday lunch, friday dinner, sunday lunch, sunday dinner, saturday lunch, thursday dinner, tuesday lunch', '2015-07-19 00:37:33'),
(00000000022, '1@gmail.com', 1, 2, 20, 7, 54321, 'whoozits and zits', 'This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.', 0, 0, 0, 0, 0, 'fees', NULL, '2015-07-19 00:34:07'),
(00000000023, '2@gmail.com', 2, 1, 20, 7, 54321, 'acne and teeth', 'This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is est.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.', 0, 2, 2, 2, 2, 'fees, terrible liar, sexy', NULL, '2015-07-19 00:38:52'),
(00000000024, '3@gmail.com', 2, 1, 18, 7, 54322, 'whoozits and woozits, some whatsits too', 'This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.', 0, 0, 0, 0, 0, 'fees', NULL, '2015-07-19 00:39:21'),
(00000000025, '4@gmail.com', 2, 1, 20, 7, 54323, 'horseys are my life.', 'This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.', 0, 0, 0, 0, 0, 'fees, fies, foes, fums', NULL, '2015-07-19 00:40:00'),
(00000000026, '5@gmail.com', 2, 1, 20, 7, 54324, 'photographer for same, or musey type.', 'This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a ts just a test.This is just a test.This a test.This is just a test.This is just a test.This is just a test.', 0, 0, 0, 0, 0, 'fee, fie, foe, fum', NULL, '2015-07-19 00:40:56'),
(00000000027, '6@gmail.com', 2, 1, 20, 7, 54325, 'likes water', 'This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.', 0, 0, 0, 0, 0, 'power rangers', NULL, '2015-07-19 00:41:24'),
(00000000028, '7@gmail.com', 2, 1, 50, 7, 54326, 'looooooong walks on the beach.', 'This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.Ths just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.This is just a test.', 0, 0, 0, 0, 0, 'sexy, witty, estranged', NULL, '2015-07-19 00:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `romantic_dates`
--

CREATE TABLE IF NOT EXISTS `romantic_dates` (
  `romantic_date_id` int(11) unsigned NOT NULL,
  `asker` int(11) NOT NULL,
  `giver` int(11) NOT NULL,
  `date` date NOT NULL,
  `good` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lovers`
--
ALTER TABLE `lovers`
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `datableDays` (`datable_days`(1)),
  ADD KEY `frozen` (`frozen`),
  ADD FULLTEXT KEY `bio` (`bio`);
ALTER TABLE `lovers`
  ADD FULLTEXT KEY `bio_2` (`bio`);

--
-- Indexes for table `romantic_dates`
--
ALTER TABLE `romantic_dates`
  ADD PRIMARY KEY (`romantic_date_id`),
  ADD UNIQUE KEY `index` (`romantic_date_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lovers`
--
ALTER TABLE `lovers`
  MODIFY `user_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `romantic_dates`
--
ALTER TABLE `romantic_dates`
  MODIFY `romantic_date_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
