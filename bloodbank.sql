-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2022 at 08:52 AM
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
-- Database: `bloodbank`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `decquan` (IN `rbgname` CHAR(5))   BEGIN
declare rquan int default 350;
declare iquan int default 0;
select quantity into iquan from inventory where bgname=rbgname;
update inventory set quantity=iquan-rquan where bgname=rbgname;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `incquan` (IN `dbgname` CHAR(5))   BEGIN
declare dquan int default 350;
declare iquan int default 0;
select quantity into iquan from inventory where bgname=dbgname;
update inventory set quantity=iquan+dquan where bgname=dbgname;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `doctorname` char(10) DEFAULT NULL,
  `doctoraddress` char(10) DEFAULT NULL,
  `doctorcontact` char(11) DEFAULT NULL,
  `doctorbg` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `doctorname`, `doctoraddress`, `doctorcontact`, `doctorbg`) VALUES
(1, 'chandan', 'ankel', '12345', 'B+'),
(2, 'chinmay', 'jpnagar', '67890', 'B+'),
(3, 'jay', 'jayanagar', '32542', 'A+'),
(4, 'keshav', 'jpnagar', '43232', 'A-'),
(5, 'rahul', 'hosaroad', '32554', 'AB+');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `id` int(11) NOT NULL,
  `name` char(10) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `address` char(10) DEFAULT NULL,
  `date` char(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `contact` char(11) DEFAULT NULL,
  `bg` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`id`, `name`, `gender`, `address`, `date`, `quantity`, `contact`, `bg`) VALUES
(11, 'yuvraj', 'male', 'hosaroad', 'jan12', 1, '54546', 'A+'),
(12, 'pradeep', 'male', 'hosaroad', 'jan12', 2, '54546', 'A+'),
(13, 'upendra', 'male', 'pes', 'march12', 2, '54546', 'AB+'),
(14, 'venkat', 'male', 'btm', 'feb12', 3, '54546', 'B+');

--
-- Triggers `donor`
--
DELIMITER $$
CREATE TRIGGER `updateinvincre` AFTER INSERT ON `donor` FOR EACH ROW BEGIN
DECLARE donbgname char(10) DEFAULT '';
select bg into donbgname from donor WHERE id=new.id;
call incquan(donbgname);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `bgname` char(10) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `bgname`, `quantity`) VALUES
(11, 'A+', -340),
(13, 'AB+', -345),
(14, 'B+', -342);

-- --------------------------------------------------------

--
-- Table structure for table `logindetails`
--

CREATE TABLE `logindetails` (
  `username` char(10) DEFAULT NULL,
  `passwd` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `id` int(11) NOT NULL,
  `receivername` char(10) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `address` char(10) DEFAULT NULL,
  `date` char(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `contact` char(11) DEFAULT NULL,
  `bg` char(5) DEFAULT NULL,
  `doctorname` char(10) DEFAULT NULL,
  `donorid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`id`, `receivername`, `gender`, `address`, `date`, `quantity`, `contact`, `bg`, `doctorname`, `donorid`) VALUES
(21, 'krishna', 'male', 'srinagar', 'jan15', 1, '12345', 'A+', 'Jay', 11),
(22, 'arjun', 'male', 'micolayout', 'jan30', 2, '12345', 'AB+', 'Rahul', 13),
(23, 'krishna', 'male', 'srinagar', 'jan15', 1, '12345', 'B+', 'Chandan', 14);

--
-- Triggers `receiver`
--
DELIMITER $$
CREATE TRIGGER `updateinvdecre` AFTER INSERT ON `receiver` FOR EACH ROW BEGIN
DECLARE recbgname char(10) DEFAULT '';
select bg into recbgname from receiver WHERE id=new.id;
call decquan(recbgname);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3012;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1044;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4005;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2002;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
