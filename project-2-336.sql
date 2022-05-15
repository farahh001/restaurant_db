-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 08:18 PM
-- Server version: 8.0.28
-- PHP Version: 7.4.28

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
CREATE DATABASE IF NOT EXISTS `project-2-336` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `project-2-336`;

-- --------------------------------------------------------

--
-- Table structure for table `blog_com`
--

CREATE TABLE `blog_com` (
  `comment_id` int NOT NULL,
  `post_id` int NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_com`
--

INSERT INTO `blog_com` (`comment_id`, `post_id`, `comment`) VALUES
(14, 1, 'They are overpriced for no reason'),
(15, 1, 'Yeah i agree they charge more for non-dairy milk now'),
(16, 1, 'They charge more in general for any topping'),
(17, 15, 'i agree');

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `post_id` int NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`post_id`, `subject`) VALUES
(12, 'Why are Starbucks prices so high?'),
(13, 'What is your favorite food?'),
(15, 'Could Wendys $4 for $4 get any better?'),
(16, 'Starbucks Menu Hacks');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `complaint` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `name`, `complaint`) VALUES
(1, 'starbucks', 'Pink drink was not tasty'),
(2, 'Siri', 'I saw a rat in The windJammer'),
(3, 'Alexa_house', 'I saw a cockroach'),
(4, 'Meat_house', 'It was too salty');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `name`, `email`, `subject`, `message`) VALUES
(3, 'Alan Tepoxtecatl', 'alan.tepoxtecatl@gmail.com', 'Work inquiry', 'Hello i would like to work here '),
(4, 'sk', 'sk@gmail.com', 'Could Wendys $4 for $4 get any better?', 'good'),
(5, 'Siri', 'S@gmail.com', 'Starbucks Menu Hacks', 'i like the service');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `grade` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `address`, `grade`) VALUES
(1, 'THE MEATBALL SHOP', '170 BEDFORD AVENUE Brooklyn  NY 11249', 'B+'),
(3, 'RBQ BAR, RESTAURANT AND MARKET', '9720 ROCKAWAY BEACH BLVD Queens NY 11693', 'B'),
(4, 'EL LIDER RESTAURANT', '4535 PARK AVENUE Bronx NY 10457', 'A'),
(6, 'KENNEDY FRIED CHICKEN', '433 DEKALB AVENUE Brooklyn NY 11205', 'C'),
(7, 'THE GREEK KITCHEN', '889 10 AVENUE Manhattan NY 10019', 'A'),
(8, 'JULES BISTRO', '65 ST MARKS PLACE Manhattan NY 10003', 'B'),
(9, 'LOBSTER JOINT', '1073 MANHATTAN AVENUE Brooklyn NY 11222', 'A'),
(10, 'VARIETY', '146 WYCKOFF AVENUE Brooklyn NY 11237', 'A'),
(11, 'COURTSIDE LOUNGE SPORTS BAR', '6908 MYRTLE AVENUE Queens NY 11385', 'A'),
(12, 'RAZAG HALL', '739 EAST NEW YORK AVENUE Brooklyn NY 11203', 'A'),
(13, 'MONTE GRAB & GO MARKET', '1790 EASTCHESTER ROAD Bronx NY 10461', 'A'),
(14, 'STARBUCKS', '405 BROADWAY Manhattan NY 10013', 'A'),
(15, 'ESSEN', '515 MADISON AVENUE Manhattan NY 10022', 'B'),
(16, 'FOO HING KITCHEN', '2706 3 AVENUE Bronx NY 10454', 'A'),
(17, 'TRU', '3519 DITMARS BLVD QUEENS NY 11105', 'A'),
(18, 'CARVEL', '1652 86 STREET Brooklyn NY 11214', 'A'),
(19, 'DAIRY QUEEN GRILL & CHILL', '2005 FOREST AVENUE Staten Island NY 10303', 'A'),
(20, 'OSLO COFFEE ROASTERS', '133 ROEBLING STREET Brooklyn NY 11211', 'A'),
(22, 'sss', 'sss', 'A'),
(23, 'Wendys', 'new hyde park', 'A+'),
(24, 'Wendys', 'new hyde park', 'B+');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `roleId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `roleId`) VALUES
(1, 'all@gmail.com', 'Sara1234', 0),
(2, 'abc@gmail.com', '$2b$12$8pEbL8jiFfn2eGlxOjNQCO52dBVRGfTUKHB1tCpJIEjexeSybBB2m', 0),
(3, 'ida@gmail.com', '$2b$12$wmSdNCBdFwjPe8FXazC0TuNmHbqQ6k9PSur.3DwtwyuQZaf/6bYP.', 0),
(4, 'samiul@gmail.com', '$2b$12$rwgz6K6wWOHcwFJUJuqT7uhdh.SjMDXtaxTZ2rf1hDcFS/FWDKv9K', 0),
(5, 'alan@gmail.com', '$2b$12$M81N1DFt.757ihwnPB8f5.yuJNKszGnLnfgDr7Yc09yCe42VfgbRy', 0),
(6, 'ida01@gmail.com', '$2b$12$dDTPr6ZaKTQ0usxVGP.1gutUNmZFaFUDnankwuzN.5Q0lZZCWKSsG', 0),
(7, 'akk@gmail.com', '$2b$12$2IleU7FGEOg2iPdUIKFIYOC9zphepyIoHWgWXIFe5O.MWdyecN7c6', 0),
(8, 'ida01@gmail.com', '$2b$12$CI8ctR6.6R8WMkkQhFXEzuqan2hBFCsDxn8u7rbSNPbMchqsCSEWS', 0),
(9, 'alilisaba@gmail.com', '123456', 0),
(10, 'kk@gmail.com', '123456', 0),
(11, 'kkk@gmail.com', '123456', 0),
(12, 'ks@gmail,com', '123456', 0),
(13, 'abc@gmail.com', '123456', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `roleId` int NOT NULL,
  `role` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_com`
--
ALTER TABLE `blog_com`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_com`
--
ALTER TABLE `blog_com`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `roleId` int NOT NULL AUTO_INCREMENT;
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
