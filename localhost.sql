-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 28, 2020 at 11:14 AM
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
-- Database: `animals`
--
CREATE DATABASE IF NOT EXISTS `animals` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `animals`;
--
-- Database: `labb1`
--
CREATE DATABASE IF NOT EXISTS `labb1` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `labb1`;

-- --------------------------------------------------------

--
-- Table structure for table `correct_direction`
--

CREATE TABLE `correct_direction` (
  `id` int(11) NOT NULL,
  `direction` varchar(30) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table 2`
--

CREATE TABLE `table 2` (
  `COL 1` varchar(7) DEFAULT NULL,
  `COL 2` varchar(10) DEFAULT NULL,
  `COL 3` varchar(11) DEFAULT NULL,
  `COL 4` varchar(10) DEFAULT NULL,
  `COL 5` varchar(8) DEFAULT NULL,
  `COL 6` varchar(10) DEFAULT NULL,
  `COL 7` varchar(11) DEFAULT NULL,
  `COL 8` varchar(10) DEFAULT NULL,
  `COL 9` varchar(11) DEFAULT NULL,
  `COL 10` varchar(8) DEFAULT NULL,
  `COL 11` varchar(11) DEFAULT NULL,
  `COL 12` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table 2`
--

INSERT INTO `table 2` (`COL 1`, `COL 2`, `COL 3`, `COL 4`, `COL 5`, `COL 6`, `COL 7`, `COL 8`, `COL 9`, `COL 10`, `COL 11`, `COL 12`) VALUES
('forward', ' turn_left', ' turn_right', ' turn_left', ' forward', ' turn_left', ' turn_right', ' turn_left', ' turn_right', ' forward', ' turn_right', ' turn_left  ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `correct_direction`
--
ALTER TABLE `correct_direction`
  ADD PRIMARY KEY (`id`);
--
-- Database: `labb2`
--
CREATE DATABASE IF NOT EXISTS `labb2` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `labb2`;

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `zoo`
--
CREATE DATABASE IF NOT EXISTS `zoo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `zoo`;

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `specimens` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`id`, `name`, `category`, `specimens`) VALUES
(1, 'Elefant', 'Däggdjur', 2),
(2, 'Myrslok', 'Däggdjur', 3),
(3, 'Myskanka', 'Fågel', 127),
(4, 'Tanganyikacidklid', 'Fisk', 200),
(5, 'Komodovaran', 'reptil', 4),
(6, 'Blåval', 'Däggdjur', 1),
(7, 'Vombat', 'Däggdjur', 12),
(8, 'Kapybara', 'Däggdjur', 17),
(9, 'Skata', 'Fågel', 2),
(10, 'Ekoxe', 'Insekt', 2),
(11, 'Träbock', 'insekt', 11),
(12, 'Kammussla', 'Blötdjur', 4),
(13, 'Mört', 'Fisk', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
