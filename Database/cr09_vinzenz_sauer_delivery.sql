-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2020 at 12:01 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_vinzenz_sauer_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_address_id`) VALUES
(1, 'Cornelia Krumrey', 1),
(2, 'Britta Lhotzky', 2),
(3, 'Dominik Frömming', 3),
(4, 'Erika Neeb', 4),
(5, 'Yannick Münz', 5),
(6, 'Alena Siebeck', 6),
(7, 'Maria Steglich', 7),
(8, 'Monique Kasper', 8),
(9, 'Christiane Knott', 9),
(10, 'Ingo Bollich', 10);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `customer_address_id` int(11) NOT NULL,
  `customer_street` varchar(50) NOT NULL,
  `customer_number` int(20) NOT NULL,
  `customer_zip` int(4) NOT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`customer_address_id`, `customer_street`, `customer_number`, `customer_zip`, `customer_city`, `customer_country`) VALUES
(1, 'Universitätsring ', 12, 1010, 'Wien', 'Austria'),
(2, 'Türkenstraße ', 25, 1090, 'Wien', 'Austria'),
(3, 'Ungargasse ', 8, 1030, 'Wien', 'Austria'),
(4, 'Sportklubstraße ', 4, 1020, 'Wien', 'Austria'),
(5, 'Große Mohrengasse', 2, 1020, 'Wien', 'Austria'),
(6, 'Mortarapl. ', 8, 1200, 'Wien', 'Austria'),
(7, 'Schüttaustraße ', 8, 1220, 'Wien', 'Austria'),
(8, 'Engerthstr. ', 8, 1020, 'Wien', 'Austria'),
(9, 'Schmalzhofgasse ', 16, 1060, 'Wien', 'Austria'),
(10, 'Lerchenfelder Str. ', 36, 1070, 'Wien', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_deliver`
--

CREATE TABLE `deposit_deliver` (
  `deposit_deliver_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(50) DEFAULT NULL,
  `employee_department` varchar(50) DEFAULT NULL,
  `post_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`, `employee_department`, `post_office_id`) VALUES
(1, 'Celina Zellner', 'IT', 1),
(2, 'Wilma Kafka', 'Buchhaltung', 2),
(3, 'Sonja Faulenbach', 'HR', 3),
(4, 'Karsten Baack', 'Verkauf', 4),
(5, 'Elena Aleithe', 'Marketing', 5),
(6, 'Hildegard Auth', 'Verkauf', 6),
(7, 'Fabienne Biesenkamp', 'IT', 7),
(8, 'Erika Wittmann', 'Postbote', 8),
(9, 'Bettina Holste', 'Postbote', 9),
(10, 'Bruno Geppert', 'Postbote', 10);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `process_system_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `weight`, `size`, `process_system_id`) VALUES
(1, 212, 20, 1),
(2, 2969, 30, 2),
(3, 642, 50, 3),
(4, 2541, 20, 4),
(5, 4194, 100, 5),
(6, 4345, 50, 6),
(7, 166, 30, 7),
(8, 3478, 100, 8),
(9, 1721, 30, 9),
(10, 2793, 20, 10);

-- --------------------------------------------------------

--
-- Table structure for table `post_office`
--

CREATE TABLE `post_office` (
  `post_office_id` int(11) NOT NULL,
  `opening_hours` varchar(50) DEFAULT NULL,
  `fk_post_office_location_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_office`
--

INSERT INTO `post_office` (`post_office_id`, `opening_hours`, `fk_post_office_location_id`, `package_id`) VALUES
(1, '07:00–22:00', 1, 1),
(2, '07:00–18:30', 2, 2),
(3, '08:00–18:00', 3, 3),
(4, '08:00–18:00', 4, 4),
(5, '08:00–18:00', 5, 5),
(6, '08:00–18:00', 6, 6),
(7, '08:00–18:00', 7, 7),
(8, '08:30–19:00', 8, 8),
(9, '08:00–18:00', 9, 9),
(10, '08:00–18:00', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `post_office_location`
--

CREATE TABLE `post_office_location` (
  `post_office_location_id` int(11) NOT NULL,
  `post_street` varchar(50) DEFAULT NULL,
  `post_number` int(20) DEFAULT NULL,
  `post_zip` int(4) DEFAULT NULL,
  `post_city` varchar(50) DEFAULT NULL,
  `post_country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_office_location`
--

INSERT INTO `post_office_location` (`post_office_location_id`, `post_street`, `post_number`, `post_zip`, `post_city`, `post_country`) VALUES
(1, 'Fleischmarkt ', 19, 1010, 'Wien', 'Austria'),
(2, 'Weintraubengasse ', 22, 1020, 'Wien', 'Austria'),
(3, 'Jahngasse ', 35, 1050, 'Wien', 'Austria'),
(4, 'Maria-Treu-Gasse ', 4, 1080, 'Wien', 'Austria'),
(5, 'Speisinger Str.', 41, 1130, 'Wien', 'Austria'),
(6, 'Hetzgasse ', 35, 1030, 'Wien', 'Austria'),
(7, 'Felbigergasse ', 37, 1140, 'Wien', 'Austria'),
(8, 'Sandleitengasse ', 41, 1160, 'Wien', 'Austria'),
(9, 'Krugerstraße ', 13, 1010, 'Wien', 'Austria'),
(10, 'Gersthofer Str. ', 73, 1180, 'Wien', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `processing_system`
--

CREATE TABLE `processing_system` (
  `process_system_id` int(11) NOT NULL,
  `receive_date` date DEFAULT NULL,
  `receive_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processing_system`
--

INSERT INTO `processing_system` (`process_system_id`, `receive_date`, `receive_time`) VALUES
(1, '2020-03-03', '11:39:47'),
(2, '2020-02-11', '12:38:44'),
(3, '2020-03-05', '06:45:01'),
(4, '2020-02-10', '06:30:42'),
(5, '2020-03-13', '06:10:02'),
(6, '2020-02-05', '07:05:10'),
(7, '2020-01-23', '08:12:58'),
(8, '2020-01-08', '09:45:45'),
(9, '2020-02-05', '09:45:01'),
(10, '2020-03-04', '06:15:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_address_id` (`customer_address_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_address_id`);

--
-- Indexes for table `deposit_deliver`
--
ALTER TABLE `deposit_deliver`
  ADD PRIMARY KEY (`deposit_deliver_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `post_office_id` (`post_office_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `process_system_id` (`process_system_id`);

--
-- Indexes for table `post_office`
--
ALTER TABLE `post_office`
  ADD PRIMARY KEY (`post_office_id`),
  ADD KEY `post_office_location_id` (`fk_post_office_location_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `post_office_location`
--
ALTER TABLE `post_office_location`
  ADD PRIMARY KEY (`post_office_location_id`);

--
-- Indexes for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`process_system_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_address_id`) REFERENCES `customer_address` (`customer_address_id`);

--
-- Constraints for table `deposit_deliver`
--
ALTER TABLE `deposit_deliver`
  ADD CONSTRAINT `deposit_deliver_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `deposit_deliver_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`post_office_id`) REFERENCES `post_office` (`post_office_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`process_system_id`) REFERENCES `processing_system` (`process_system_id`);

--
-- Constraints for table `post_office`
--
ALTER TABLE `post_office`
  ADD CONSTRAINT `post_office_ibfk_1` FOREIGN KEY (`fk_post_office_location_id`) REFERENCES `post_office_location` (`post_office_location_id`),
  ADD CONSTRAINT `post_office_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
