-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2021 at 01:43 AM
-- Server version: 8.0.22-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthreport`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodtest`
--

CREATE TABLE `bloodtest` (
  `patientid` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `hb` varchar(45) DEFAULT NULL,
  `wbc` varchar(45) DEFAULT NULL,
  `rbc` varchar(45) DEFAULT NULL,
  `diagnosis` varchar(45) DEFAULT NULL,
  `instructions` varchar(45) DEFAULT NULL,
  `dname` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `bloodtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `cname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(45) NOT NULL,
  `mobno` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `qualification` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `doctor`
--

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `patientid` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `medicine` varchar(45) DEFAULT NULL,
  `dose` varchar(45) DEFAULT NULL,
  `diagnosis` varchar(45) DEFAULT NULL,
  `instructions` varchar(45) DEFAULT NULL,
  `dname` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `prescription`
--

-- --------------------------------------------------------

--
-- Table structure for table `urinetest`
--

CREATE TABLE `urinetest` (
  `patientid` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `blood` varchar(45) NOT NULL,
  `protein` varchar(45) DEFAULT NULL,
  `glucose` varchar(45) DEFAULT NULL,
  `sugar` decimal(4,2) DEFAULT NULL,
  `ph` decimal(4,2) DEFAULT NULL,
  `diagnosis` varchar(45) DEFAULT NULL,
  `instructions` varchar(45) DEFAULT NULL,
  `dname` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `urinetest`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(45) NOT NULL,
  `bdgroup` varchar(45) NOT NULL,
  `mobno` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `user`
--

-- --------------------------------------------------------

--
-- Table structure for table `xray`
--

CREATE TABLE `xray` (
  `patientid` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `testname` varchar(45) NOT NULL,
  `remark1` varchar(45) DEFAULT NULL,
  `remark2` varchar(45) DEFAULT NULL,
  `remark3` varchar(45) DEFAULT NULL,
  `dname` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `xray`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`passwd`,`user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user`,`password`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
