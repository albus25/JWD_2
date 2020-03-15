-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2020 at 02:58 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `program6db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE `tbldepartment` (
  `deptID` int(3) NOT NULL,
  `deptName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`deptID`, `deptName`) VALUES
(1, 'Continental'),
(2, 'BSc(I.T.)'),
(3, 'MCA');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

CREATE TABLE `tblemployee` (
  `empID` int(3) NOT NULL,
  `empName` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `deptID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblemployee`
--

INSERT INTO `tblemployee` (`empID`, `empName`, `password`, `designation`, `deptID`) VALUES
(1, 'JohnWick', 'BabaYaga', 'Assassin', 1),
(2, 'Deadpool', 'dead', 'Employee', 2),
(3, 'Albus', 'albus', 'Employee', 2),
(7, 'Harry', '786', 'Employee', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblproject`
--

CREATE TABLE `tblproject` (
  `projectID` int(3) NOT NULL,
  `projectName` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `duration` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblproject`
--

INSERT INTO `tblproject` (`projectID`, `projectName`, `description`, `duration`) VALUES
(1, 'UrbanShiksha', 'Webapplication for e-learners', '1 Month');

-- --------------------------------------------------------

--
-- Table structure for table `tblprojectassign`
--

CREATE TABLE `tblprojectassign` (
  `projectID` int(3) NOT NULL,
  `empID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblprojectassign`
--

INSERT INTO `tblprojectassign` (`projectID`, `empID`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  ADD PRIMARY KEY (`deptID`);

--
-- Indexes for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`empID`),
  ADD KEY `deptID` (`deptID`);

--
-- Indexes for table `tblproject`
--
ALTER TABLE `tblproject`
  ADD PRIMARY KEY (`projectID`);

--
-- Indexes for table `tblprojectassign`
--
ALTER TABLE `tblprojectassign`
  ADD KEY `empID` (`empID`),
  ADD KEY `projectID` (`projectID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  MODIFY `deptID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `empID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblproject`
--
ALTER TABLE `tblproject`
  MODIFY `projectID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD CONSTRAINT `tblemployee_ibfk_1` FOREIGN KEY (`deptID`) REFERENCES `tbldepartment` (`deptID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblprojectassign`
--
ALTER TABLE `tblprojectassign`
  ADD CONSTRAINT `tblprojectassign_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `tblemployee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblprojectassign_ibfk_2` FOREIGN KEY (`projectID`) REFERENCES `tblproject` (`projectID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
