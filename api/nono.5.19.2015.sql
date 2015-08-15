-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2015 at 09:03 PM
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
-- Table structure for table `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `blocker` int(11) NOT NULL,
  `blocked` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `datable_days`
--

CREATE TABLE IF NOT EXISTS `datable_days` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discount_codes`
--

CREATE TABLE IF NOT EXISTS `discount_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `zip` int(11) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `frozen` tinyint(1) NOT NULL,
  `boots` tinyint(4) DEFAULT NULL,
  `mean` int(11) DEFAULT NULL,
  `no_shows` int(11) DEFAULT NULL,
  `no_contacts` int(11) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `romantic_dates`
--

CREATE TABLE IF NOT EXISTS `romantic_dates` (
  `romantic_date_id` int(11) unsigned NOT NULL,
  `asker` int(11) NOT NULL,
  `giver` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `good_for_asker` tinyint(4) NOT NULL,
  `good_for_giver` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `datable_days`
--
ALTER TABLE `datable_days`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD UNIQUE KEY `id` (`id`), ADD KEY `discounts` (`code`);

--
-- Indexes for table `lovers`
--
ALTER TABLE `lovers`
  ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `user_id` (`user_id`), ADD UNIQUE KEY `email` (`email`), ADD KEY `frozen` (`frozen`), ADD FULLTEXT KEY `bio_search` (`bio`);

--
-- Indexes for table `romantic_dates`
--
ALTER TABLE `romantic_dates`
  ADD PRIMARY KEY (`romantic_date_id`), ADD UNIQUE KEY `index` (`romantic_date_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `datable_days`
--
ALTER TABLE `datable_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lovers`
--
ALTER TABLE `lovers`
  MODIFY `user_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `romantic_dates`
--
ALTER TABLE `romantic_dates`
  MODIFY `romantic_date_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
