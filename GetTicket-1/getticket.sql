-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Jun 08, 2023 at 04:50 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `getticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genreID` int(5) NOT NULL,
  `genre_name` enum('horror','romance','comedy','action') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genreID`, `genre_name`) VALUES
(1, 'horror'),
(3, 'romance'),
(4, 'comedy'),
(5, 'action');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` int(5) NOT NULL,
  `email_adrdess` varchar(20) NOT NULL,
  `phone_nuber` char(12) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pasword` varchar(10) NOT NULL,
  `role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `email_adrdess`, `phone_nuber`, `username`, `pasword`, `role`) VALUES
(1, 'bagass@gmaiil.com', '081200119293', 'bagase', 'bagase', 1),
(2, 'chinta@gmail.com', '081212342345', 'chintaa', 'chintaa', 0),
(3, 'gemaa@gmail.com', '081209876543', 'gemaa', 'gemaa', 0),
(17, 'nugkon@gmail.com', '081312563412', 'nugnug', 'nugnug', 0),
(19, 'gemates@gmail.com', '081517152950', 'gemates', 'gemates', 0),
(21, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movieID` int(5) NOT NULL,
  `genre` int(11) NOT NULL,
  `movie_title` varchar(20) NOT NULL,
  `studio_number` int(11) NOT NULL,
  `genre_name` enum('horror','romance','comedy','action') NOT NULL,
  `movie_duration` time NOT NULL,
  `date_time` time NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movieID`, `genre`, `movie_title`, `studio_number`, `genre_name`, `movie_duration`, `date_time`, `price`) VALUES
(5, 1, 'Titanic', 1, 'romance', '03:14:07', '10:00:00', 50000),
(6, 1, 'the nun', 3, 'horror', '01:35:32', '12:00:00', 50000),
(7, 5, 'mision imposible', 1, 'action', '02:28:02', '14:00:00', 50000),
(8, 4, 'warkop dki', 4, 'comedy', '01:42:50', '16:00:00', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orderID` int(5) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `Judul` varchar(30) NOT NULL,
  `Kursi` int(20) NOT NULL,
  `Jumlah` int(20) NOT NULL,
  `Waktu` time NOT NULL,
  `Harga` int(6) NOT NULL,
  `Total_Harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`orderID`, `Member_ID`, `nama_pembeli`, `Judul`, `Kursi`, `Jumlah`, `Waktu`, `Harga`, `Total_Harga`) VALUES
(5, 0, 'Gema', 'Titanic', 1, 1, '10:00:00', 50000, 50000),
(6, 0, 'tes', 'Titanic', 2, 1, '10:00:00', 50000, 50000),
(7, 0, 'bagas', 'the nun', 1, 1, '12:00:00', 50000, 50000),
(8, 0, 'gemgem', 'warkop dki', 1, 1, '16:00:00', 50000, 50000),
(9, 0, 'Gema ', 'the nun', 15, 10, '12:00:00', 50000, 500000),
(10, 0, 'Gema', 'the nun', 3, 1, '12:00:00', 50000, 50000),
(11, 0, 'gema', 'the nun', 3, 1, '12:00:00', 50000, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheduleID` int(5) NOT NULL,
  `date_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleID`, `date_time`) VALUES
(1, '10:00:00'),
(2, '12:00:00'),
(3, '14:00:00'),
(4, '16:00:00'),
(5, '18:00:00'),
(6, '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `seatID` int(5) NOT NULL,
  `seat_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seatID`, `seat_number`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

CREATE TABLE `studio` (
  `studioID` int(5) NOT NULL,
  `studio_number` int(11) NOT NULL,
  `movie_name` enum('titanic','the nun','mision imposible','warkop dki') NOT NULL,
  `movieID` int(11) NOT NULL,
  `seatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studio`
--

INSERT INTO `studio` (`studioID`, `studio_number`, `movie_name`, `movieID`, `seatID`) VALUES
(1, 1, 'mision imposible', 7, 1),
(2, 1, 'mision imposible', 7, 2),
(3, 1, 'mision imposible', 7, 3),
(4, 1, 'mision imposible', 7, 4),
(5, 1, 'mision imposible', 7, 5),
(6, 1, 'mision imposible', 7, 6),
(7, 1, 'mision imposible', 7, 7),
(8, 1, 'mision imposible', 7, 8),
(9, 1, 'mision imposible', 7, 9),
(10, 1, 'mision imposible', 7, 10),
(11, 1, 'mision imposible', 7, 11),
(12, 1, 'mision imposible', 7, 12),
(13, 1, 'mision imposible', 7, 13),
(14, 1, 'mision imposible', 7, 14),
(15, 1, 'mision imposible', 7, 15),
(16, 1, 'mision imposible', 7, 16),
(17, 1, 'mision imposible', 7, 17),
(18, 1, 'mision imposible', 7, 17),
(19, 1, 'mision imposible', 7, 18),
(20, 1, 'mision imposible', 7, 19),
(21, 1, 'mision imposible', 7, 20),
(22, 2, 'titanic', 5, 1),
(23, 2, 'titanic', 5, 2),
(24, 2, 'titanic', 5, 3),
(25, 2, 'titanic', 5, 4),
(26, 2, 'titanic', 5, 6),
(27, 2, 'titanic', 5, 7),
(28, 2, 'titanic', 5, 8),
(29, 2, 'titanic', 5, 9),
(30, 2, 'titanic', 5, 10),
(31, 2, 'titanic', 6, 11),
(32, 2, 'titanic', 5, 12),
(33, 2, 'titanic', 5, 13),
(34, 2, 'titanic', 5, 14),
(35, 2, 'titanic', 5, 15),
(36, 2, 'titanic', 5, 16),
(37, 2, 'titanic', 5, 17),
(38, 2, 'titanic', 5, 18),
(39, 2, 'titanic', 5, 19),
(40, 2, 'titanic', 5, 20),
(41, 3, 'the nun', 6, 1),
(42, 3, 'the nun', 6, 2),
(43, 3, 'the nun', 6, 3),
(44, 3, 'the nun', 6, 4),
(45, 3, 'the nun', 6, 5),
(47, 3, 'the nun', 6, 6),
(48, 3, 'the nun', 6, 7),
(49, 3, 'the nun', 6, 8),
(50, 3, 'the nun', 6, 9),
(51, 3, 'the nun', 6, 10),
(52, 3, 'the nun', 6, 11),
(53, 3, 'the nun', 6, 11),
(54, 3, 'the nun', 6, 12),
(55, 3, 'the nun', 6, 13),
(56, 3, 'the nun', 6, 14),
(57, 3, 'the nun', 6, 15),
(58, 3, 'the nun', 6, 16),
(59, 3, 'the nun', 6, 17),
(60, 3, 'the nun', 6, 18),
(61, 3, 'the nun', 6, 19),
(62, 3, 'the nun', 6, 20),
(64, 4, 'warkop dki', 8, 1),
(65, 4, 'warkop dki', 8, 2),
(66, 4, 'warkop dki', 8, 3),
(67, 4, 'warkop dki', 8, 4),
(68, 4, 'warkop dki', 8, 5),
(69, 4, 'warkop dki', 8, 6),
(70, 4, 'warkop dki', 8, 7),
(71, 4, 'warkop dki', 8, 8),
(72, 4, 'warkop dki', 8, 9),
(73, 4, 'warkop dki', 8, 10),
(74, 4, 'warkop dki', 8, 11),
(75, 4, 'warkop dki', 8, 12),
(76, 4, 'warkop dki', 8, 13),
(77, 4, 'warkop dki', 8, 14),
(78, 4, 'warkop dki', 8, 15),
(79, 4, 'warkop dki', 8, 16),
(80, 4, 'warkop dki', 8, 17),
(81, 4, 'warkop dki', 8, 18),
(82, 4, 'warkop dki', 8, 19),
(83, 4, 'warkop dki', 8, 20);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticketID` int(5) NOT NULL,
  `movieID` int(11) NOT NULL,
  `studioID` int(11) NOT NULL,
  `seatID` int(11) NOT NULL,
  `scheduleID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movieID`),
  ADD KEY `genre` (`genre`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `Member_ID` (`Member_ID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleID`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seatID`);

--
-- Indexes for table `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`studioID`),
  ADD KEY `movieID` (`movieID`),
  ADD KEY `seatID` (`seatID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticketID`),
  ADD UNIQUE KEY `movieID` (`movieID`),
  ADD UNIQUE KEY `studioID` (`studioID`),
  ADD UNIQUE KEY `seatID` (`seatID`),
  ADD KEY `scheduleID` (`scheduleID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `orderID_2` (`orderID`),
  ADD KEY `orderID_3` (`orderID`),
  ADD KEY `Member_ID` (`Member_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `MemberID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movieID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `orderID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `seatID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `studio`
--
ALTER TABLE `studio`
  MODIFY `studioID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticketID` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `genre` (`genreID`);

--
-- Constraints for table `studio`
--
ALTER TABLE `studio`
  ADD CONSTRAINT `studio_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`),
  ADD CONSTRAINT `studio_ibfk_2` FOREIGN KEY (`seatID`) REFERENCES `seat` (`seatID`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`studioID`) REFERENCES `studio` (`studioID`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`seatID`) REFERENCES `seat` (`seatID`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`scheduleID`) REFERENCES `schedule` (`scheduleID`),
  ADD CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`orderID`) REFERENCES `order_detail` (`orderID`),
  ADD CONSTRAINT `ticket_ibfk_6` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`MemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
