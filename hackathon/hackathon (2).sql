-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2022 at 07:46 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hackathon`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `USN` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `vehicle_number` varchar(15) NOT NULL,
  `capacity` int(11) NOT NULL,
  `phone` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `USN`, `email`, `password`, `vehicle_number`, `capacity`, `phone`) VALUES
(1, 'kjhjkh', 'sapa19is@cmrit.ac.in', 'saswat', 'ghjkdhkja', 3, 1321313);

-- --------------------------------------------------------

--
-- Table structure for table `path`
--

CREATE TABLE `path` (
  `id` int(11) NOT NULL,
  `path_points` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`path_points`)),
  `owner_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `charge-per-km` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `path`
--

INSERT INTO `path` (`id`, `path_points`, `owner_id`, `date`, `charge-per-km`) VALUES
(1, '[\"CMRIT Bus stop\", \"CMRIT Bus stop\", \"Whitefield Club Bus Stop\"]', 1, '2022-01-14 21:42:00', 32),
(3, '[\"Whitefield Club Bus Stop\", \"CMRIT Bus stop\", \"AECS Layout Bus Stop\", \"Halasuru Police Station\"]', 1, '2022-01-08 01:00:00', 20),
(4, '[\"HAL Police Station Bus Stop\", \"Marenahalli Bus Stand\", \"Varthur Bus stop\", \"Halasuru Police Station\"]', 1, '2022-01-08 14:12:00', 15),
(5, '[\"HAL Police Station Bus Stop\", \"Marenahalli Bus Stand\", \"Varthur Bus stop\", \"Halasuru Police Station\"]', 1, '2022-01-09 15:45:00', 32);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL,
  `path_id` int(11) NOT NULL,
  `cost` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `user_id`, `owner_id`, `status`, `path_id`, `cost`) VALUES
(1, 4, 1, 'pending', 3, ''),
(2, 4, 1, 'pending', 3, ''),
(3, 4, 1, 'pending', 3, ''),
(4, 4, 1, 'pending', 3, '136'),
(5, 6, 1, 'pending', 3, '136'),
(6, 6, 1, 'pending', 3, '136'),
(7, 6, 1, 'pending', 3, '136'),
(8, 6, 1, 'pending', 3, '136');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `USN` varchar(11) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `USN`, `phone`) VALUES
(4, 'sapa19is@cmrit.ac.in', 'saswat', '1CR19IS135', '9120408657'),
(5, 'smla19cs@cmrit.ac.in', 'smriti', '1CR19IS134', '12345'),
(6, 'hara19is@cmrit.ac.in', 'hara', '1CR19IS148', '5343545453');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `path`
--
ALTER TABLE `path`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `USN` (`USN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `path`
--
ALTER TABLE `path`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
