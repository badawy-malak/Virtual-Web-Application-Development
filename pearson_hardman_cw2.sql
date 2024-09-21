-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2023 at 07:08 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pearson_hardman_cw2`
--

-- --------------------------------------------------------

--
-- Table structure for table `attorney`
--

CREATE TABLE `attorney` (
  `Attorney_National_ID` int(11) NOT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Years_of_experience` int(11) DEFAULT NULL,
  `Attorney_Address` varchar(255) DEFAULT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `Attorney_name` varchar(255) DEFAULT NULL,
  `DateOfBirth` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attorney`
--

INSERT INTO `attorney` (`Attorney_National_ID`, `Gender`, `Years_of_experience`, `Attorney_Address`, `PhoneNo`, `Attorney_name`, `DateOfBirth`) VALUES
(27324012, 'Female', 2, 'alexandria', 1254789362, 'Ganna', '19-9-2019'),
(85910274, 'Male', 7, 'giza', 1251039461, 'Yehya', '10-2-2001'),
(851324012, 'Female', 12, 'cairo', 1254789183, 'Nada', '1-4-2004'),
(859513012, 'Male', 7, 'hurghada', 1251037183, 'Abdullah', '10-10-2010');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `case_type` varchar(255) NOT NULL,
  `case_name` varchar(255) DEFAULT NULL,
  `case_description` varchar(255) DEFAULT NULL,
  `case_ID` int(11) DEFAULT NULL,
  `Attorney_National_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`case_type`, `case_name`, `case_description`, `case_ID`, `Attorney_National_ID`) VALUES
('family', 'Mohamed divorce case', 'An issue between mohamed in the divorce papers and negotiations', 2, 85910274),
('insurance', 'Malaks insurance case', 'An issue occured when malak forgot to renew her insurance', 1, 851324012),
('Murder', 'Mona murder case', 'Mona is being wrongfully accussed of the murder of her neighbour', 4, 859513012),
('Real estate', 'Ahmed real estate case', 'A problem between ahmed and his landlord after a damage occured in the apartment', 3, 27324012);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `Client_National_ID` int(11) NOT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Client_Name` varchar(255) DEFAULT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `Client_Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`Client_National_ID`, `Gender`, `DateOfBirth`, `Client_Name`, `PhoneNo`, `Client_Address`) VALUES
(679473785, 'Male', '2013-05-20', 'ahmed', 1299173942, 'zayed'),
(781648785, 'Female', '2022-05-04', 'Mariam', 1674954832, 'new cairo'),
(851324785, 'Female', '2015-06-17', 'Malak', 1254789632, 'cairo'),
(947393785, 'Male', '2013-11-13', 'Mohamed', 1291681942, 'giza');

-- --------------------------------------------------------

--
-- Table structure for table `communicatewith`
--

CREATE TABLE `communicatewith` (
  `Client_National_ID` int(11) NOT NULL,
  `Attorney_National_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `communicatewith`
--

INSERT INTO `communicatewith` (`Client_National_ID`, `Attorney_National_ID`) VALUES
(679473785, 27324012),
(781648785, 859513012),
(851324785, 851324012),
(947393785, 85910274);

-- --------------------------------------------------------

--
-- Table structure for table `filer`
--

CREATE TABLE `filer` (
  `Client_National_ID` int(11) NOT NULL,
  `case_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filer`
--

INSERT INTO `filer` (`Client_National_ID`, `case_ID`) VALUES
(679473785, 3),
(781648785, 4),
(851324785, 1),
(947393785, 2);

-- --------------------------------------------------------

--
-- Table structure for table `law_case`
--

CREATE TABLE `law_case` (
  `case_ID` int(11) NOT NULL,
  `case_status` varchar(255) DEFAULT NULL,
  `case_name` varchar(255) DEFAULT NULL,
  `Attorney_National_ID` int(11) DEFAULT NULL,
  `Client_National_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `law_case`
--

INSERT INTO `law_case` (`case_ID`, `case_status`, `case_name`, `Attorney_National_ID`, `Client_National_ID`) VALUES
(1, 'In progress', 'Malaks insurance case', 851324012, 851324785),
(2, 'In progress', 'Mohamed divorce case', 85910274, 947393785),
(3, 'Files', 'Ahmed real estate case', 27324012, 679473785),
(4, 'complete', 'Mariam murder case', 859513012, 781648785);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_ID` int(11) NOT NULL,
  `payment_amount` varchar(255) DEFAULT NULL,
  `payment_date` varchar(255) DEFAULT NULL,
  `Attorney_National_ID` int(11) DEFAULT NULL,
  `Client_National_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_ID`, `payment_amount`, `payment_date`, `Attorney_National_ID`, `Client_National_ID`) VALUES
(1, '200', '2010-01-01', 851324012, 851324785),
(2, '3000', '2001-03-05', 85910274, 947393785),
(3, '1500', '2012-08-07', 27324012, 679473785),
(4, '10000', '1991-03-03', 859513012, 781648785);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attorney`
--
ALTER TABLE `attorney`
  ADD PRIMARY KEY (`Attorney_National_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`case_type`),
  ADD KEY `fk_Case_has_Category` (`case_ID`),
  ADD KEY `fk_Attorney_specialize_Category` (`Attorney_National_ID`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Client_National_ID`);

--
-- Indexes for table `communicatewith`
--
ALTER TABLE `communicatewith`
  ADD PRIMARY KEY (`Client_National_ID`,`Attorney_National_ID`),
  ADD KEY `fk_Attorney_communicateWith_Client` (`Attorney_National_ID`);

--
-- Indexes for table `filer`
--
ALTER TABLE `filer`
  ADD PRIMARY KEY (`Client_National_ID`,`case_ID`),
  ADD KEY `fk_case_File_Client` (`case_ID`);

--
-- Indexes for table `law_case`
--
ALTER TABLE `law_case`
  ADD PRIMARY KEY (`case_ID`),
  ADD KEY `fk_Attorney_handel_Case` (`Attorney_National_ID`),
  ADD KEY `fk_clieny_file_Case` (`Client_National_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_ID`),
  ADD KEY `fk_Attorney_receives_Payment` (`Attorney_National_ID`),
  ADD KEY `fk_Client_Pays_Payment` (`Client_National_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_Attorney_specialize_Category` FOREIGN KEY (`Attorney_National_ID`) REFERENCES `attorney` (`Attorney_National_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Case_has_Category` FOREIGN KEY (`case_ID`) REFERENCES `law_case` (`case_ID`) ON DELETE CASCADE;

--
-- Constraints for table `communicatewith`
--
ALTER TABLE `communicatewith`
  ADD CONSTRAINT `fk_Attorney_communicateWith_Client` FOREIGN KEY (`Attorney_National_ID`) REFERENCES `attorney` (`Attorney_National_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Client_communicateWith_Attorney` FOREIGN KEY (`Client_National_ID`) REFERENCES `client` (`Client_National_ID`) ON DELETE CASCADE;

--
-- Constraints for table `filer`
--
ALTER TABLE `filer`
  ADD CONSTRAINT `fk_Client_File_Case` FOREIGN KEY (`Client_National_ID`) REFERENCES `client` (`Client_National_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_case_File_Client` FOREIGN KEY (`case_ID`) REFERENCES `law_case` (`case_ID`) ON DELETE CASCADE;

--
-- Constraints for table `law_case`
--
ALTER TABLE `law_case`
  ADD CONSTRAINT `fk_Attorney_handel_Case` FOREIGN KEY (`Attorney_National_ID`) REFERENCES `attorney` (`Attorney_National_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_clieny_file_Case` FOREIGN KEY (`Client_National_ID`) REFERENCES `client` (`Client_National_ID`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_Attorney_receives_Payment` FOREIGN KEY (`Attorney_National_ID`) REFERENCES `attorney` (`Attorney_National_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Client_Pays_Payment` FOREIGN KEY (`Client_National_ID`) REFERENCES `client` (`Client_National_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
