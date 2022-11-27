-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 24, 2022 at 07:56 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodr`
--

CREATE TABLE `bloodr` (
  `rId` int(11) NOT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `r_regdate` date DEFAULT NULL,
  `rName` varchar(20) DEFAULT NULL,
  `b_qnty` int(11) DEFAULT NULL,
  `rb_grp` varchar(5) DEFAULT NULL,
  `rs_id` int(11) DEFAULT NULL,
  `dis_id` int(11) DEFAULT NULL,
  `bm_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodr`
--

INSERT INTO `bloodr` (`rId`, `sex`, `age`, `r_regdate`, `rName`, `b_qnty`, `rb_grp`, `rs_id`, `dis_id`, `bm_id`) VALUES
(44, 'M', 23, '0000-00-00', 'Tanmay', 1, 'A+', 793, 10, 6),
(87, 'F', 22, '0000-00-00', 'Swapnil', 2, 'B+', 763, 10, 36),
(88, 'M', 23, '0000-00-00', 'Shohag', 1, 'A+', 760, 10, 47),
(90, 'F', 24, '0000-00-00', 'Farzana', 1, 'O+', 793, 20, 74);

-- --------------------------------------------------------

--
-- Table structure for table `bloods`
--

CREATE TABLE `bloods` (
  `b_group` varchar(5) DEFAULT NULL,
  `sample_no` int(11) NOT NULL,
  `status` varchar(5) DEFAULT NULL,
  `drecog_id` int(11) DEFAULT NULL,
  `bm_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloods`
--

INSERT INTO `bloods` (`b_group`, `sample_no`, `status`, `drecog_id`, `bm_id`) VALUES
('O+', 202, 'Yes', 501, 74),
('A+', 305, 'No', 601, 36),
('A+', 401, 'Yes', 801, 6),
('B+', 405, 'Yes', 801, 47);

-- --------------------------------------------------------

--
-- Table structure for table `bpm`
--

CREATE TABLE `bpm` (
  `bm_id` int(11) NOT NULL,
  `bm_name` varchar(15) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bpm`
--

INSERT INTO `bpm` (`bm_id`, `bm_name`, `sex`) VALUES
(6, 'Deepa', 'F'),
(36, 'Mehrab', 'M'),
(47, 'Urmi', 'F'),
(74, 'Dinar', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `diseaser`
--

CREATE TABLE `diseaser` (
  `drecog_id` int(11) NOT NULL,
  `drecog_name` varchar(15) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diseaser`
--

INSERT INTO `diseaser` (`drecog_id`, `drecog_name`, `sex`) VALUES
(401, 'Jamil', 'M'),
(501, 'Mila', 'F'),
(601, 'Helal', 'M'),
(801, 'Shila', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `dis_id` int(11) NOT NULL,
  `dis_name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`dis_id`, `dis_name`) VALUES
(10, 'Dhaka'),
(20, 'Khulna'),
(30, 'Rajshahi'),
(40, 'Chittagong'),
(50, 'Barishal'),
(60, 'Sylhet'),
(70, 'Rangpur');

-- --------------------------------------------------------

--
-- Table structure for table `donar`
--

CREATE TABLE `donar` (
  `dName` varchar(15) DEFAULT NULL,
  `dId` int(11) NOT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dreg_date` date DEFAULT NULL,
  `rs_id` int(11) DEFAULT NULL,
  `dis_id` int(11) DEFAULT NULL,
  `db_grp` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donar`
--

INSERT INTO `donar` (`dName`, `dId`, `sex`, `age`, `dreg_date`, `rs_id`, `dis_id`, `db_grp`) VALUES
('Nasif', 3, 'M', 23, '0000-00-00', 105, 10, 'A+'),
('Nimi', 7, 'F', 22, '0000-00-00', 104, 10, 'B+'),
('Jenifer', 10, 'F', 22, '0000-00-00', 793, 10, 'O+'),
('Tanzima', 14, 'F', 23, '0000-00-00', 760, 30, 'A+'),
('Kaniz', 16, 'F', 22, '0000-00-00', 740, 30, 'B+');

-- --------------------------------------------------------

--
-- Table structure for table `hos1`
--

CREATE TABLE `hos1` (
  `hId` int(11) NOT NULL,
  `hName` varchar(15) DEFAULT NULL,
  `dis_id` int(11) DEFAULT NULL,
  `bm_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hos1`
--

INSERT INTO `hos1` (`hId`, `hName`, `dis_id`, `bm_id`) VALUES
(910, 'Dhaka Medical', 10, 6),
(920, 'Khula Medical', 20, 36),
(930, 'Rajshahi Hosp.', 30, 74),
(940, 'Chittagong Med', 40, 47);

-- --------------------------------------------------------

--
-- Table structure for table `hos2`
--

CREATE TABLE `hos2` (
  `hId` int(11) DEFAULT NULL,
  `hb_grp` varchar(5) DEFAULT NULL,
  `db_qnty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hos2`
--

INSERT INTO `hos2` (`hId`, `hb_grp`, `db_qnty`) VALUES
(910, 'O+', 30);

-- --------------------------------------------------------

--
-- Table structure for table `reg_staff`
--

CREATE TABLE `reg_staff` (
  `rs_id` int(11) NOT NULL,
  `rs_name` varchar(15) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reg_staff`
--

INSERT INTO `reg_staff` (`rs_id`, `rs_name`, `sex`) VALUES
(104, 'Bushra', 'F'),
(105, 'Arafat', 'M'),
(730, 'Shila', 'F'),
(740, 'Ony', 'M'),
(760, 'Tania', 'F'),
(763, 'Sonia', 'F'),
(793, 'Sushmita', 'F');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodr`
--
ALTER TABLE `bloodr`
  ADD PRIMARY KEY (`rId`),
  ADD KEY `bm_id` (`bm_id`),
  ADD KEY `rs_id` (`rs_id`),
  ADD KEY `dis_id` (`dis_id`);

--
-- Indexes for table `bloods`
--
ALTER TABLE `bloods`
  ADD PRIMARY KEY (`sample_no`),
  ADD KEY `bm_id` (`bm_id`),
  ADD KEY `drecog_id` (`drecog_id`);

--
-- Indexes for table `bpm`
--
ALTER TABLE `bpm`
  ADD PRIMARY KEY (`bm_id`);

--
-- Indexes for table `diseaser`
--
ALTER TABLE `diseaser`
  ADD PRIMARY KEY (`drecog_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`dis_id`);

--
-- Indexes for table `donar`
--
ALTER TABLE `donar`
  ADD PRIMARY KEY (`dId`),
  ADD KEY `rs_id` (`rs_id`),
  ADD KEY `dis_id` (`dis_id`);

--
-- Indexes for table `hos1`
--
ALTER TABLE `hos1`
  ADD PRIMARY KEY (`hId`),
  ADD KEY `bm_id` (`bm_id`),
  ADD KEY `dis_id` (`dis_id`);

--
-- Indexes for table `hos2`
--
ALTER TABLE `hos2`
  ADD KEY `hId` (`hId`);

--
-- Indexes for table `reg_staff`
--
ALTER TABLE `reg_staff`
  ADD PRIMARY KEY (`rs_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloodr`
--
ALTER TABLE `bloodr`
  ADD CONSTRAINT `bloodr_ibfk_1` FOREIGN KEY (`bm_id`) REFERENCES `bpm` (`bm_id`),
  ADD CONSTRAINT `bloodr_ibfk_2` FOREIGN KEY (`rs_id`) REFERENCES `reg_staff` (`rs_id`),
  ADD CONSTRAINT `bloodr_ibfk_3` FOREIGN KEY (`dis_id`) REFERENCES `district` (`dis_id`);

--
-- Constraints for table `bloods`
--
ALTER TABLE `bloods`
  ADD CONSTRAINT `bloods_ibfk_1` FOREIGN KEY (`bm_id`) REFERENCES `bpm` (`bm_id`),
  ADD CONSTRAINT `bloods_ibfk_2` FOREIGN KEY (`drecog_id`) REFERENCES `diseaser` (`drecog_id`);

--
-- Constraints for table `donar`
--
ALTER TABLE `donar`
  ADD CONSTRAINT `donar_ibfk_1` FOREIGN KEY (`rs_id`) REFERENCES `reg_staff` (`rs_id`),
  ADD CONSTRAINT `donar_ibfk_2` FOREIGN KEY (`dis_id`) REFERENCES `district` (`dis_id`);

--
-- Constraints for table `hos1`
--
ALTER TABLE `hos1`
  ADD CONSTRAINT `hos1_ibfk_1` FOREIGN KEY (`bm_id`) REFERENCES `bpm` (`bm_id`),
  ADD CONSTRAINT `hos1_ibfk_2` FOREIGN KEY (`dis_id`) REFERENCES `district` (`dis_id`);

--
-- Constraints for table `hos2`
--
ALTER TABLE `hos2`
  ADD CONSTRAINT `hos2_ibfk_1` FOREIGN KEY (`hId`) REFERENCES `hos1` (`hId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
