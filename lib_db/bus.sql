-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2022 at 09:28 PM
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
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE DATABASE IF NOT EXISTS bus;
USE bus;

CREATE TABLE `admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `from` varchar(50) NOT NULL,
  `to` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`from`, `to`) VALUES
('Mysore', 'Hubballi'),
('Chitradurga', 'Bidar'),
('Bangalore', 'Belgaum'),
('Mangalore', 'Vijaypur'),
('Belgaum', 'Bangalore'),
('Bagalkot', 'Chikmagaluru');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `service` varchar(45) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `seats` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`name`, `phone`, `source`, `destination`, `service`, `date`, `seats`, `amount`) VALUES
('rahul', '7619223679', 'Bangalore', 'Belgaum', 'Rajahamsa AC', '2022-09-15', '2', '1300'),
('', '', 'Bangalore', 'Vijaypur', 'VRL AC', '2022-09-20', '1', '700');

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `service` varchar(50) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `dest` varchar(50) DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `dtime` time DEFAULT NULL,
  `atime` time DEFAULT NULL,
  `seat` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`service`, `source`, `dest`, `fare`, `dtime`, `atime`, `seat`, `date`) VALUES
('Rajahamsa AC', 'Bangalore', 'Belgaum', 650, '21:30:00', '08:00:00', 41, '2022-09-15'),
('VRL AC', 'Bangalore', 'Vijaypur', 700, '01:30:00', '06:00:00', 41, '2022-09-20');


-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seatname` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seatname`, `uname`, `service`, `count`, `id`) VALUES
('A1', 'rahul', 'Rajahamsa AC', 0, 1),
('A2', 'Harsh', 'VRL AC', 0, 2);


-- --------------------------------------------------------

--
-- Table structure for table `seat_names`
--

CREATE TABLE `seat_names` (
  `seatname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seat_names`
--

INSERT INTO `seat_names` (`seatname`) VALUES
('A1'),
('A2'),
('A3'),
('A4'),
('B1'),
('B2'),
('B3'),
('B4'),
('C1'),
('C2'),
('C3'),
('C4'),
('D1'),
('D2'),
('D3'),
('D4');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uname` varchar(50) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `gender` varchar(23) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uname`, `password`, `fname`, `lname`, `phone`, `age`, `state`, `city`, `gender`, `email`) VALUES
('Veeru', '1234', 'Veeru', 'shankar', '01658421', '25','Karnataka','Mangalore', 'Male', 'veeru@gmail.com'),
('Arihant', '1234', 'Arihant', 'hasan', '02164654', '22','Karnataka','Bangalore', 'Male', 'arihant@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`from`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`service`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seatname` (`seatname`),
  ADD KEY `uname` (`uname`),
  ADD KEY `service` (`service`);

--
-- Indexes for table `seat_names`
--
ALTER TABLE `seat_names`
  ADD PRIMARY KEY (`seatname`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uname`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`seatname`) REFERENCES `seat_names` (`seatname`),
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `user` (`uname`),
  ADD CONSTRAINT `seats_ibfk_3` FOREIGN KEY (`service`) REFERENCES `search` (`service`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
