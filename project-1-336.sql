-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2022 at 08:25 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project-1-336`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `building_num` int(11) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `boro_id` int(11) DEFAULT NULL,
  `zipcode_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `building_num`, `street`, `boro_id`, `zipcode_id`) VALUES
(1, 170, 'BEDFORD AVENUE', 1, 1000),
(2, 552, 'GRANDVIEW AVENUE', 2, 1001),
(3, 9720, 'ROCKAWAY BEACH BLVD', 2, 1002),
(4, 4535, 'PARK AVENUE', 3, 1003),
(5, 1898, 'HYLAN BOULEVARD', 4, 1004),
(6, 433, 'DEKALB AVENUE', 1, 1005),
(7, 889, '10 AVENUE', 5, 1006),
(8, 65, 'ST MARKS PLACE', 5, 1007),
(9, 1073, 'MANHATTAN AVENUE', 1, 1008),
(10, 146, 'WYCKOFF AVENUE', 1, 1009),
(11, 6908, 'MYRTLE AVENUE', 2, 1010),
(12, 739, 'EAST NEW YORK AVENUE', 1, 1011),
(13, 1790, 'EASTCHESTER ROAD', 3, 1012),
(14, 405, 'BROADWAY', 5, 1013),
(15, 515, 'MADISON AVENUE', 5, 1014),
(16, 2706, '3 AVENUE', 3, 1015),
(17, 3519, 'DITMARS BLVD', 2, 1016),
(18, 1652, '86 STREET', 1, 1017),
(19, 2005, 'FOREST AVENUE', 4, 1018),
(20, 133, 'ROEBLING STREET', 1, 1019),
(21, 212, 'EAST   52 STREET', 5, 1020),
(22, 165, 'CHURCH STREET', 5, 1021),
(23, 849, 'LEXINGTON AVENUE', 5, 1022),
(24, 15401, 'UNION TPKE', 2, 1023),
(25, 372, 'MYRTLE AVENUE', 1, 1024),
(26, 10, 'EAST   39 STREET', 5, 1025),
(27, 13655, 'ROOSEVELT AVE', 2, 1026),
(28, 111, '8 AVENUE', 5, 1027),
(29, 2665, 'BROADWAY', 5, 1028),
(30, 6405, '108 STREET', 2, 1029),
(31, 125, '1ST AVE #127', 5, 1030),
(32, 309, 'GOLD STREET', 1, 1031),
(33, 11116, 'ROOSEVELT AVENUE', 2, 1032),
(34, 137, 'EAST  116 STREET', 5, 1033),
(35, 3815, 'DYRE AVENUE', 3, 1034),
(36, 521, 'OCEAN AVENUE', 1, 1035),
(37, 108, 'VICTORY BOULEVARD', 4, 1036),
(38, 645, 'ROSSVILLE AVENUE', 4, 1037),
(39, 1810, 'VICTORY BOULEVARD', 4, 1038),
(40, 1815, 'FOREST AVENUE', 4, 1039),
(41, 369, 'CLEVELAND AVENUE', 4, 1040);

-- --------------------------------------------------------

--
-- Table structure for table `boros`
--

CREATE TABLE `boros` (
  `boro_id` int(11) NOT NULL,
  `boro_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `boros`
--

INSERT INTO `boros` (`boro_id`, `boro_name`) VALUES
(1, 'Brooklyn'),
(2, 'Queens'),
(3, 'Bronx'),
(4, 'Staten Island'),
(5, 'Manhattan');

-- --------------------------------------------------------

--
-- Table structure for table `cuisine`
--

CREATE TABLE `cuisine` (
  `restaurant_permit` int(11) NOT NULL,
  `cuisine_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cuisine`
--

INSERT INTO `cuisine` (`restaurant_permit`, `cuisine_name`) VALUES
(40377262, 'Pizza'),
(40396000, 'French'),
(40734589, 'Greek'),
(40759602, 'Soups'),
(40959012, 'Frozen Desserts'),
(41018252, 'Italian'),
(41238641, 'Coffee'),
(41271537, 'Latin American'),
(41282127, 'Mexican'),
(41366722, 'Tea'),
(41505432, 'American'),
(41530056, 'Tex-Mex'),
(41572590, 'American'),
(41587378, 'Seafood'),
(41603129, 'Seafood'),
(41608382, 'Irish'),
(41608998, 'Japanese'),
(41635663, 'Mexican'),
(41665894, 'American'),
(41702914, 'Caribbean'),
(50003218, 'Iranian'),
(50007942, 'Greek'),
(50008061, 'Coffee'),
(50012118, 'Japanese'),
(50018268, 'Hamburgers'),
(50019227, 'Thai'),
(50033403, 'Chinese'),
(50036123, 'Hamburgers'),
(50036226, 'Coffee'),
(50043049, 'American'),
(50046941, 'American'),
(50050198, 'American'),
(50053105, 'Chicken'),
(50055536, 'Hamburgers'),
(50058095, 'Chicken'),
(50064927, 'Mexican'),
(50067281, 'Kosher'),
(50071889, 'Chinese'),
(50072165, 'Tex-Mex'),
(50075543, 'Chinese'),
(50079098, 'Barbecue');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `boro_id_idx` (`boro_id`),
  ADD KEY `zipcode_id_idx` (`zipcode_id`);

--
-- Indexes for table `boros`
--
ALTER TABLE `boros`
  ADD PRIMARY KEY (`boro_id`),
  ADD UNIQUE KEY `boro_id_UNIQUE` (`boro_id`);

--
-- Indexes for table `cuisine`
--
ALTER TABLE `cuisine`
  ADD PRIMARY KEY (`restaurant_permit`),
  ADD KEY `ï»¿restaurant_permit_idx` (`restaurant_permit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `boros`
--
ALTER TABLE `boros`
  MODIFY `boro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `boro_id` FOREIGN KEY (`boro_id`) REFERENCES `boros` (`boro_id`),
  ADD CONSTRAINT `zipcode_id` FOREIGN KEY (`zipcode_id`) REFERENCES `zipcode` (`zipcode_id`);

--
-- Constraints for table `cuisine`
--
ALTER TABLE `cuisine`
  ADD CONSTRAINT `restaurant_permit` FOREIGN KEY (`restaurant_permit`) REFERENCES `restaurant` (`restaurant_permit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
