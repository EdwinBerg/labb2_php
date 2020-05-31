-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 31, 2020 at 08:45 PM
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
(6, 'f8'),
(7, 'f10'),
(8, 'f12'),
(9, 'f14'),
(14, 'Motionsgruppen'),
(15, 'Master'),
(16, 'Elite'),
(17, 'Barn');

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
(62, 'Anders'),
(63, 'Alexander'),
(64, 'Andreas'),
(65, 'Axel'),
(66, 'Arne'),
(67, 'Anton'),
(68, 'Adam'),
(69, 'Ali'),
(70, 'Arvid'),
(71, 'Albin'),
(72, 'Alf'),
(73, 'Allan'),
(74, 'Ahmed'),
(75, 'Alfred'),
(76, 'Andre'),
(77, 'Adrian'),
(78, 'Ahmad'),
(79, 'Albert'),
(80, 'August'),
(81, 'Alex'),
(82, 'Alvar'),
(83, 'Alvin'),
(84, 'Artur'),
(85, 'Antonio'),
(86, 'Amir'),
(87, 'Anna'),
(88, 'Anita'),
(89, 'Astrid'),
(90, 'Alice'),
(91, 'Annika'),
(92, 'Amanda'),
(93, 'Ann'),
(94, 'Agneta'),
(95, 'Anette'),
(96, 'Alexandra'),
(97, 'Anneli'),
(98, 'Agnes'),
(99, 'Anne'),
(100, 'Alva'),
(101, 'Alma'),
(102, 'Alicia'),
(103, 'Angelica'),
(104, 'Annie'),
(105, 'Annelie'),
(106, 'Ann-Marie'),
(107, 'Ann-Charlotte'),
(108, 'Annette'),
(109, 'Andrea'),
(110, 'Aina'),
(111, 'Ann-Christin');

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
(34, 62, 1, 1, 1),
(35, 63, 1, 1, 1),
(36, 64, 1, 1, 1),
(37, 65, 1, 1, 2),
(38, 66, 1, 2, 1),
(39, 67, 1, 2, 1),
(40, 68, 1, 2, 2),
(41, 69, 1, 2, 1),
(42, 70, 1, 3, 1),
(43, 71, 1, 3, 1),
(44, 72, 1, 3, 2),
(45, 73, 1, 3, 1),
(46, 74, 1, 4, 1),
(47, 75, 1, 4, 2),
(48, 76, 1, 4, 1),
(49, 77, 1, 4, 1),
(50, 78, 2, 14, 1),
(51, 79, 2, 14, 2),
(52, 80, 2, 14, 1),
(53, 81, 2, 14, 1),
(54, 82, 3, 15, 1),
(55, 83, 3, 15, 1),
(56, 84, 3, 15, 1),
(57, 85, 3, 15, 1),
(58, 86, 3, 16, 1),
(59, 87, 3, 16, 1),
(60, 88, 3, 16, 1),
(61, 89, 3, 16, 1),
(62, 90, 2, 17, 1),
(76, 91, 2, 17, 1),
(77, 92, 2, 17, 1),
(78, 93, 2, 17, 2),
(79, 94, 1, 6, 1),
(80, 95, 1, 6, 1),
(81, 96, 1, 6, 2),
(82, 97, 1, 6, 2),
(83, 98, 1, 7, 2),
(84, 99, 1, 7, 2),
(85, 100, 1, 7, 2),
(86, 101, 1, 7, 1),
(87, 102, 1, 8, 2),
(88, 103, 1, 8, 2),
(89, 104, 1, 8, 2),
(90, 105, 1, 8, 1),
(91, 106, 1, 9, 1),
(92, 107, 1, 9, 1),
(93, 108, 1, 9, 2),
(94, 109, 1, 9, 1),
(95, 110, 1, 9, 2),
(96, 111, 1, 9, 2),
(97, 87, 1, 6, 1),
(98, 88, 1, 8, 1),
(99, 89, 1, 9, 1),
(100, 90, 1, 7, 2),
(101, 91, 1, 6, 2),
(102, 92, 1, 7, 2),
(103, 93, 1, 7, 1),
(104, 94, 1, 6, 1),
(105, 95, 1, 6, 1),
(106, 96, 1, 6, 2),
(107, 97, 1, 6, 2),
(108, 98, 1, 7, 2),
(109, 99, 1, 7, 2),
(110, 100, 1, 7, 2),
(111, 101, 1, 7, 1),
(112, 102, 1, 8, 2),
(113, 103, 1, 8, 2),
(114, 104, 1, 8, 2),
(115, 105, 1, 8, 1),
(116, 106, 1, 9, 1),
(117, 107, 1, 9, 1),
(118, 108, 1, 9, 2),
(119, 109, 1, 9, 1),
(120, 110, 1, 9, 2),
(121, 111, 1, 9, 2),
(122, 87, 1, 6, 1),
(123, 88, 1, 8, 1),
(124, 89, 1, 9, 1),
(125, 90, 1, 7, 2),
(126, 91, 1, 6, 2),
(127, 92, 1, 7, 2),
(128, 93, 1, 7, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medlem`
--
ALTER TABLE `medlem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `pivot`
--
ALTER TABLE `pivot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

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
