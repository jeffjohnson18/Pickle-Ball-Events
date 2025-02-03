-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 08, 2024 at 06:38 PM
-- Server version: 5.7.39
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ordersapproles`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `customerid` bigint(20) NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `customerid`, `notes`) VALUES
(1, '2024-01-01 00:00:00.000000', 1, 'Customer requested a fast delivery.'),
(3, '2024-01-03 00:00:00.000000', 3, 'This is for a birthday. \n Special message included.'),
(4, '2024-01-05 00:00:00.000000', 4, 'Specific delivery time for after 5 pm'),
(5, '2024-01-05 00:00:00.000000', 5, 'Please use eco-friendly packaging.'),
(7, '2024-01-07 00:00:00.000000', 2, 'Customer requested an expedited shipping.'),
(12, '2024-01-12 00:00:00.000000', 2, 'Customer requested a return label.'),
(15, '2024-01-15 00:00:00.000000', 5, 'Customer requested a price match.'),
(16, '2024-01-16 00:00:00.000000', 1, 'Customer wanted to track the shipment.'),
(18, '2024-01-18 00:00:00.000000', 3, 'Customer requested an extended warranty.');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `user_id`) VALUES
(1, 'ROLE_USER', 1),
(2, 'ROLE_ADMIN', 1),
(3, 'ROLE_USER', 2),
(4, 'ROLE_USER', 3),
(5, 'ROLE_USER', 4),
(6, 'ROLE_USER', 5),
(7, 'ROLE_USER', 13);

-- --------------------------------------------------------

--
-- Table structure for table `SPRING_SESSION`
--

CREATE TABLE `SPRING_SESSION` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `SPRING_SESSION_ATTRIBUTES`
--

CREATE TABLE `SPRING_SESSION_ATTRIBUTES` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `login_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `account_non_expired` tinyint(1) NOT NULL DEFAULT '1',
  `credentials_non_expired` tinyint(1) NOT NULL DEFAULT '1',
  `account_non_locked` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login_name`, `password`, `enabled`, `account_non_expired`, `credentials_non_expired`, `account_non_locked`) VALUES
(1, 'alice', 'password123', 1, 1, 1, 1),
(2, 'bob', 'Iwishtoberichandfamous!', 1, 1, 1, 1),
(3, 'charlie', 'new_password', 1, 1, 1, 1),
(4, 'david', '!%1abc', 1, 1, 1, 1),
(5, 'eve', 'eveeveeveeve', 1, 1, 1, 1),
(13, 'root', '$2a$10$gYc9KmmfsVpCj8ucxzVZO.luP6yGcTEFYorc.qofbKNZHXHj9Piui', 1, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerid` (`customerid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `SPRING_SESSION`
--
ALTER TABLE `SPRING_SESSION`
  ADD PRIMARY KEY (`PRIMARY_ID`),
  ADD UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  ADD KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  ADD KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`);

--
-- Indexes for table `SPRING_SESSION_ATTRIBUTES`
--
ALTER TABLE `SPRING_SESSION_ATTRIBUTES`
  ADD PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `users` (`id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `SPRING_SESSION_ATTRIBUTES`
--
ALTER TABLE `SPRING_SESSION_ATTRIBUTES`
  ADD CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `SPRING_SESSION` (`PRIMARY_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
