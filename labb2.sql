-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 31, 2020 at 11:55 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labb2`
--

-- --------------------------------------------------------

--
-- Table structure for table `avgift`
--

CREATE TABLE `avgift` (
  `id` int(11) NOT NULL,
  `avgift` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `avgift`
--

INSERT INTO `avgift` (`id`, `avgift`) VALUES
(1, 'Betald'),
(2, 'Ej betald');

-- --------------------------------------------------------

--
-- Table structure for table `lag`
--

CREATE TABLE `lag` (
  `id` int(11) NOT NULL,
  `lag` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `lag`
--

INSERT INTO `lag` (`id`, `lag`) VALUES
(1, 'p8'),
(2, 'p10'),
(3, 'p12'),
(4, 'p14'),
(5, 'p16'),
(6, 'f8'),
(7, 'f10'),
(8, 'f12'),
(9, 'f14'),
(10, 'f16');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `email` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `medlemsavgift` int(11) NOT NULL,
  `sport` varchar(30) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `email`, `name`, `password`, `admin_id`, `medlemsavgift`, `sport`) VALUES
(1, 'admin@hotmail.com', 'Göran', 'admin123', 1, 0, ''),
(4, 'test@hotmail.com', 'Gunnar', 'gunnar123', 0, 0, 'fotboll'),
(5, 'edwin.berg@hotmail.com', 'Edwin', 'edwin123', 0, 0, 'skidor'),
(6, 'oscar.ogge@hotmail.com', 'Oscar', 'oscar123', 0, 350, 'gymnastik'),
(7, 'nara.nartek@hotmail.com', 'Nara', 'nara123', 0, 350, 'skidor'),
(8, 'magnus@hotmail.com', 'Magnus', 'magnus123', 0, 250, 'fotboll');

-- --------------------------------------------------------

--
-- Table structure for table `medlem`
--

CREATE TABLE `medlem` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `medlem`
--

INSERT INTO `medlem` (`id`, `name`) VALUES
(1, 'Jon'),
(3, 'Karl'),
(4, 'Oscar'),
(5, 'Edwin'),
(6, 'Ogge'),
(7, 'Eddan'),
(8, 'Lucas'),
(9, 'Liam'),
(10, 'William'),
(11, 'Elias'),
(12, 'Noah'),
(13, 'Hugo'),
(14, 'Oliver'),
(15, 'Adam'),
(16, 'Mattias'),
(17, 'Tom'),
(18, 'Alice'),
(19, 'Olivia'),
(20, 'Astrid'),
(21, 'Maja'),
(22, 'Vera'),
(23, 'Ebba'),
(24, 'Ella'),
(25, 'Wilma'),
(26, 'Alma'),
(27, 'Johanna'),
(28, 'Malin'),
(29, 'Lilly'),
(30, 'Jesper'),
(31, 'Jasmina'),
(32, 'Ida'),
(33, 'Annie'),
(34, 'Hanna'),
(35, 'Josefin'),
(36, 'Tilda'),
(37, 'Elin'),
(38, 'Doris'),
(39, 'Andrea'),
(40, 'Zigge'),
(41, 'Janna'),
(42, 'Frida'),
(43, 'Bella'),
(44, 'Sara'),
(45, 'Clas'),
(46, 'Kennet'),
(47, 'Kent'),
(48, 'Kevin'),
(49, 'Jonas'),
(50, 'Berra'),
(51, 'Jakob');

-- --------------------------------------------------------

--
-- Table structure for table `pivot`
--

CREATE TABLE `pivot` (
  `id` int(11) NOT NULL,
  `medlem_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL,
  `lag_id` int(11) NOT NULL,
  `avgift_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `pivot`
--

INSERT INTO `pivot` (`id`, `medlem_id`, `sport_id`, `lag_id`, `avgift_id`) VALUES
(1, 1, 1, 5, 1),
(3, 3, 1, 2, 1),
(4, 4, 3, 3, 2),
(5, 5, 2, 4, 2),
(6, 6, 3, 5, 1),
(7, 7, 3, 3, 1),
(8, 21, 1, 9, 1),
(9, 37, 2, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `sport` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `sport`) VALUES
(1, 'fotboll'),
(2, 'skidor'),
(3, 'gymnastik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lag`
--
ALTER TABLE `lag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `medlem`
--
ALTER TABLE `medlem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pivot`
--
ALTER TABLE `pivot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Contrait name` (`medlem_id`),
  ADD KEY `Contrait name2` (`lag_id`),
  ADD KEY `Contrait name3` (`sport_id`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lag`
--
ALTER TABLE `lag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medlem`
--
ALTER TABLE `medlem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `pivot`
--
ALTER TABLE `pivot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pivot`
--
ALTER TABLE `pivot`
  ADD CONSTRAINT `Contrait name` FOREIGN KEY (`medlem_id`) REFERENCES `medlem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Contrait name2` FOREIGN KEY (`lag_id`) REFERENCES `lag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Contrait name3` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
