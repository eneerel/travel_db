-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 09, 2023 at 11:07 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azure_db`
--
CREATE DATABASE IF NOT EXISTS `azure_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `azure_db`;

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `agent_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` text DEFAULT NULL,
  `role` enum('USER','ADMIN') DEFAULT 'USER',
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `azure_user`
--

DROP TABLE IF EXISTS `azure_user`;
CREATE TABLE `azure_user` (
  `aid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `owog` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `azure_user`
--

INSERT INTO `azure_user` (`aid`, `name`, `owog`) VALUES
(2, 'Naraa', ''),
(3, 'jaja', NULL),
(4, 's', 'undefined'),
(5, 'Turmaa', NULL),
(6, 'Otgoo', 'Lil'),
(7, 'Jujaaa', 'Tami'),
(8, 'Aami', 'Taami'),
(9, 'Burmaa', 'Huurhun'),
(10, 'Jims', 'Tsetseg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `image`, `description`) VALUES
(1, 'Beaches', '@url', 'All categories,travles'),
(2, 'Deserts', '@url2', 'beaches details'),
(3, 'Mountains', '@url3', 'Deserts details');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `order_type` varchar(255) NOT NULL,
  `status` enum('CANCEL','APPROVED') DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `category_id`, `travel_id`, `rating`) VALUES
(1, 1, 1, 1, 8),
(3, 2, 1, 1, 9),
(4, 2, 2, 2, 9),
(5, 3, 2, 2, 9),
(6, 3, 1, 1, 100),
(7, 1, 1, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `images` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travel`
--

INSERT INTO `travel` (`id`, `title`, `images`, `detail`, `price`, `location`, `day`, `cat_id`) VALUES
(1, 'Mauritius', './images/image 27.png', 'Tour combo with return airport transter', 88, 'url', 7, 1),
(2, 'Jeju', './images/image 27.png', 'Tour combo with return airport transter', 300, 'url', 7, 2),
(3, 'Japan Puji_Mountain', './images/image 27.png', 'Tour combo with return airport transter', 300, 'url', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `travel_list`
--

DROP TABLE IF EXISTS `travel_list`;
CREATE TABLE `travel_list` (
  `id` int(11) NOT NULL,
  `travel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `adult` int(11) DEFAULT NULL,
  `child` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  `ROLE` enum('USER','ADMIN') DEFAULT 'USER',
  `profileImg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `phone_number`, `ROLE`, `profileImg`) VALUES
(1, 'Naraa', 'pass123', 'naraa@gmail.com', NULL, 'USER', NULL),
(2, 'Saraa', 'pass123', 'saraa@gmail.com', NULL, 'USER', NULL),
(3, 'Baraa', 'pass123', 'baraa@gmail.com', NULL, 'USER', NULL),
(4, 'naraa', '$2b$10$EZCNdNUlm471aiCrQh1TV.NAy4Nu6F5dJwbN4RaszhnIrPxI8gHai', 'b@gmail.com', '88999989', NULL, 'url');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `azure_user`
--
ALTER TABLE `azure_user`
  ADD UNIQUE KEY `aid` (`aid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `image` (`image`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travel_list`
--
ALTER TABLE `travel_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travel_id` (`travel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `travel`
--
ALTER TABLE `travel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `travel_list`
--
ALTER TABLE `travel_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `travel_list` (`id`);

--
-- Constraints for table `travel_list`
--
ALTER TABLE `travel_list`
  ADD CONSTRAINT `travel_list_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`id`),
  ADD CONSTRAINT `travel_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
