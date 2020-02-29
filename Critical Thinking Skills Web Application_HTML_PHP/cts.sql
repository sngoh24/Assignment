-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2019 at 06:03 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cts`
--

-- --------------------------------------------------------

--
-- Table structure for table `ans`
--

CREATE TABLE `ans` (
  `id` int(10) NOT NULL,
  `quesID` int(10) NOT NULL,
  `type` int(10) NOT NULL,
  `feedback+` varchar(128) DEFAULT NULL,
  `feedback-` varchar(128) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ans`
--

INSERT INTO `ans` (`id`, `quesID`, `type`, `feedback+`, `feedback-`, `createdOn`) VALUES
(1, 1, 3, NULL, NULL, '2019-05-04 02:57:54'),
(2, 2, 3, NULL, NULL, '2019-05-04 02:57:54'),
(3, 3, 3, NULL, NULL, '2019-05-04 03:00:56'),
(4, 3, 3, NULL, NULL, '2019-05-04 03:00:56'),
(5, 4, 5, NULL, NULL, '2019-05-04 03:02:13'),
(6, 5, 1, NULL, NULL, '2019-05-04 03:02:13'),
(7, 6, 4, NULL, NULL, '2019-05-04 03:03:52'),
(8, 7, 5, NULL, NULL, '2019-05-04 03:03:52'),
(9, 7, 2, NULL, NULL, '2019-05-04 03:04:21'),
(10, 8, 4, NULL, NULL, '2019-05-04 03:04:21'),
(11, 8, 4, NULL, NULL, '2019-05-04 03:04:32'),
(12, 8, 4, NULL, NULL, '2019-05-04 03:04:32'),
(13, 8, 4, NULL, NULL, '2019-05-04 03:04:42'),
(14, 8, 4, NULL, NULL, '2019-05-04 03:04:42'),
(15, 9, 4, NULL, NULL, '2019-05-04 03:05:17'),
(16, 9, 4, NULL, NULL, '2019-05-04 03:05:17'),
(17, 10, 5, NULL, NULL, '2019-05-04 03:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `ans_type`
--

CREATE TABLE `ans_type` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ans_type`
--

INSERT INTO `ans_type` (`id`, `name`, `type`) VALUES
(1, 'checkbox', 'checkbox'),
(2, 'file', 'file'),
(3, 'number', 'number'),
(4, 'radiobutton', 'radio'),
(5, 'textbox', 'text');

-- --------------------------------------------------------

--
-- Table structure for table `ans_type_checkbox`
--

CREATE TABLE `ans_type_checkbox` (
  `id` int(10) NOT NULL,
  `ansID` int(10) NOT NULL,
  `name` varchar(32) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `noOfAns` int(10) NOT NULL DEFAULT '1' COMMENT 'number of the correct answer',
  `ans` int(10) NOT NULL DEFAULT '0' COMMENT '0: incorrect, 1: correct',
  `score` int(10) NOT NULL DEFAULT '0',
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ans_type_checkbox`
--

INSERT INTO `ans_type_checkbox` (`id`, `ansID`, `name`, `label`, `value`, `noOfAns`, `ans`, `score`, `updatedOn`) VALUES
(1, 6, 'certA', NULL, 'A', 2, 0, 0, '2019-05-21 00:22:37'),
(2, 6, 'certB', NULL, 'B', 2, 0, 0, '2019-05-21 03:01:55'),
(3, 6, 'certC', NULL, 'C', 2, 1, 5, '2019-05-21 03:01:55'),
(4, 6, 'certD', NULL, 'D', 2, 1, 5, '2019-05-21 03:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `ans_type_file`
--

CREATE TABLE `ans_type_file` (
  `id` int(10) NOT NULL,
  `ansID` int(10) NOT NULL,
  `name` varchar(32) NOT NULL,
  `label` varchar(64) DEFAULT NULL,
  `type` varchar(10) DEFAULT 'any' COMMENT 'file types',
  `size` int(100) NOT NULL DEFAULT '10',
  `noOfFile` int(10) NOT NULL DEFAULT '1',
  `ans` varchar(128) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ans_type_file`
--

INSERT INTO `ans_type_file` (`id`, `ansID`, `name`, `label`, `type`, `size`, `noOfFile`, `ans`, `score`, `updatedOn`) VALUES
(1, 9, 'stickF', 'File', 'png', 10, 1, 'ansQ7.png', 0, '2019-05-18 07:43:09');

-- --------------------------------------------------------

--
-- Table structure for table `ans_type_number`
--

CREATE TABLE `ans_type_number` (
  `id` int(10) NOT NULL,
  `ansID` int(10) NOT NULL,
  `name` varchar(32) NOT NULL,
  `label` varchar(64) DEFAULT NULL,
  `minlength` int(10) DEFAULT NULL,
  `maxlength` int(10) DEFAULT NULL,
  `step` int(10) NOT NULL DEFAULT '1',
  `ans` int(10) NOT NULL DEFAULT '0',
  `score` int(10) NOT NULL DEFAULT '0',
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ans_type_number`
--

INSERT INTO `ans_type_number` (`id`, `ansID`, `name`, `label`, `minlength`, `maxlength`, `step`, `ans`, `score`, `updatedOn`) VALUES
(1, 1, 'candles', NULL, 0, 10, 1, 7, 5, '2019-05-19 08:08:19'),
(2, 2, 'handshaking', NULL, 0, 60, 1, 187, 5, '2019-05-21 00:21:47'),
(3, 3, 'birds', 'Number of birds', 0, 100, 1, 62, 0, '2019-05-19 06:44:20'),
(4, 4, 'turtles', 'Number of turtles', 0, 100, 1, 38, 0, '2019-05-19 06:44:21');

-- --------------------------------------------------------

--
-- Table structure for table `ans_type_radiobutton`
--

CREATE TABLE `ans_type_radiobutton` (
  `id` int(10) NOT NULL,
  `ansID` int(10) NOT NULL,
  `name` varchar(32) NOT NULL,
  `label` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `ans` int(10) NOT NULL DEFAULT '0',
  `score` int(10) NOT NULL DEFAULT '0',
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ans_type_radiobutton`
--

INSERT INTO `ans_type_radiobutton` (`id`, `ansID`, `name`, `label`, `value`, `ans`, `score`, `updatedOn`) VALUES
(1, 7, 'box', NULL, 'Gold box', 1, 5, '2019-05-21 02:01:45'),
(2, 7, 'box', NULL, 'Silver box', 0, 0, '2019-05-09 03:50:19'),
(3, 7, 'box', NULL, 'Red box', 0, 0, '2019-05-09 03:50:19'),
(4, 10, 'A', 'A', 'Dancer', 0, 0, '2019-05-09 03:50:19'),
(5, 10, 'A', 'A', 'Fortune Teller', 1, 5, '2019-05-21 02:01:40'),
(6, 10, 'A', 'A', 'Novelist', 0, 0, '2019-05-09 03:50:19'),
(7, 10, 'A', 'A', 'TV host', 0, 0, '2019-05-09 03:50:19'),
(8, 11, 'B', 'B', 'Dancer', 0, 0, '2019-05-09 03:50:19'),
(9, 11, 'B', 'B', 'Fortune Teller', 0, 0, '2019-05-09 03:50:19'),
(10, 11, 'B', 'B', 'Novelist', 1, 5, '2019-05-21 02:01:40'),
(11, 11, 'B', 'B', 'TV host', 0, 0, '2019-05-09 03:50:19'),
(12, 12, 'C', 'C', 'Dancer', 1, 5, '2019-05-21 02:01:40'),
(13, 12, 'C', 'C', 'Fortune Teller', 0, 0, '2019-05-09 03:50:19'),
(14, 12, 'C', 'C', 'Novelist', 0, 0, '2019-05-09 03:50:19'),
(15, 12, 'C', 'C', 'TV host', 0, 0, '2019-05-09 03:50:19'),
(16, 13, 'D', 'D', 'Dancer', 0, 0, '2019-05-15 14:26:05'),
(17, 13, 'D', 'D', 'Fortune Teller', 0, 0, '2019-05-09 03:50:19'),
(18, 13, 'D', 'D', 'Novelist', 0, 0, '2019-05-09 03:50:19'),
(19, 13, 'D', 'D', 'TV host', 1, 5, '2019-05-21 02:01:40'),
(20, 14, 'marry', 'D will marry Mr. P', 'True', 0, 0, '2019-05-09 03:50:19'),
(21, 14, 'marry', 'D will marry Mr. P', 'False', 1, 5, '2019-05-21 02:01:40'),
(22, 15, 'time', 'Time now', 'Morning', 1, 5, '2019-05-18 07:35:21'),
(23, 15, 'time', 'Time now', 'Afternoon', 0, 0, '2019-05-18 07:35:31'),
(24, 16, 'brother', 'Elder brother', 'The fat one', 1, 5, '2019-05-09 03:50:57'),
(25, 16, 'brother', 'Elder brother', 'The thin one', 0, 0, '2019-05-09 03:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `ans_type_textbox`
--

CREATE TABLE `ans_type_textbox` (
  `id` int(10) NOT NULL,
  `ansID` int(10) NOT NULL,
  `name` varchar(32) NOT NULL,
  `label` varchar(64) DEFAULT NULL,
  `length` int(10) NOT NULL DEFAULT '20',
  `type` int(10) DEFAULT NULL,
  `ans` varchar(64) DEFAULT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ans_type_textbox`
--

INSERT INTO `ans_type_textbox` (`id`, `ansID`, `name`, `label`, `length`, `type`, `ans`, `score`, `updatedOn`) VALUES
(1, 5, 'math2467', NULL, 10, NULL, '7^2 = 49', 5, '2019-05-21 02:01:53'),
(2, 8, 'sticksT', 'Answer', 100, NULL, NULL, 5, '2019-05-20 04:15:16'),
(3, 17, 'door', NULL, 100, NULL, 'Which door will lead to death?', 5, '2019-05-21 00:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(10) NOT NULL,
  `type` int(5) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `message` varchar(514) NOT NULL,
  `lastUpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdatedBy` varchar(64) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` varchar(64) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `type`, `name`, `email`, `message`, `lastUpdatedOn`, `lastUpdatedBy`, `createdOn`, `createdBy`, `status`) VALUES
(1, 1, 'dhfhv', 'gjb@gk.hhv', 'gjgb', '2019-05-26 13:20:04', 'dhfhv', '2019-05-25 07:33:54', 'dhfhv', 2),
(2, 1, 'hfhf', 'hgjg@gubhk.bb', 'tufyhb', '2019-05-26 14:47:40', 'hfhf', '2019-05-25 07:34:06', 'hfhf', 2),
(3, 1, 'test', 'test@gmail.com', 'test', '2019-05-26 13:21:51', 'admin', '2019-05-26 13:21:51', 'admin', 1),
(4, 1, 'test2', 'test2@gmail.com', 'test2', '2019-05-26 13:22:51', 'admin', '2019-05-26 13:22:51', 'admin', 1),
(5, 3, 'test4', 'tet@gmail.com', 'test', '2019-05-26 16:58:07', 'admin', '2019-05-26 13:23:05', 'admin', 2),
(6, 7, 'test5', 'test5@gmail.com', 'test5', '2019-05-26 13:23:24', 'admin', '2019-05-26 13:23:24', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `message_status`
--

CREATE TABLE `message_status` (
  `id` int(2) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_status`
--

INSERT INTO `message_status` (`id`, `name`) VALUES
(0, 'Closed'),
(1, 'Opened'),
(2, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `message_type`
--

CREATE TABLE `message_type` (
  `id` int(10) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_type`
--

INSERT INTO `message_type` (`id`, `name`) VALUES
(1, 'General Enquiry / Feedback'),
(2, 'I need more information'),
(3, 'I would like to write a guest post for CreativeBrain'),
(4, 'I would like permission to reproduce some content'),
(5, 'I\'ve found a problem with the content'),
(6, 'I\'ve found a broken link or other technical problem'),
(7, 'I would like to advertise with CreativeBrain');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id` int(10) NOT NULL,
  `matricNo` varchar(10) NOT NULL,
  `university` int(2) NOT NULL,
  `faculty` int(2) NOT NULL,
  `course` int(2) NOT NULL,
  `yearOfStudy` int(11) NOT NULL,
  `gender` int(2) NOT NULL,
  `age` int(5) NOT NULL,
  `ethnic` int(5) NOT NULL,
  `nationality` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`id`, `matricNo`, `university`, `faculty`, `course`, `yearOfStudy`, `gender`, `age`, `ethnic`, `nationality`, `email`, `createdOn`) VALUES
(1, 'CIB170041', 1, 1, 2, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(2, 'CIC170047', 1, 1, 3, 2, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(3, 'CIC170022', 1, 1, 3, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(4, 'CIB170053', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:46:20'),
(5, 'CIB170125', 1, 1, 2, 2, 1, 3, 2, 1, '', '2019-05-21 03:47:29'),
(6, 'CIB170037', 1, 1, 2, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(7, 'CIB170028', 1, 1, 2, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(8, 'CIB170004', 1, 1, 2, 2, 1, 2, 1, 1, '', '2019-05-20 23:12:29'),
(9, 'CIB170033', 1, 1, 2, 2, 1, 2, 1, 1, '', '2019-05-20 23:12:29'),
(10, 'CIB170102', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:47:21'),
(11, 'CIB170111', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:46:38'),
(12, 'CIB170106', 1, 1, 2, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(13, 'CIB160040', 1, 1, 2, 3, 2, 3, 1, 1, '', '2019-05-21 03:46:42'),
(14, 'CIB160171', 1, 1, 2, 3, 2, 3, 1, 1, '', '2019-05-21 03:47:16'),
(15, 'CIB160081', 1, 1, 2, 3, 1, 3, 2, 1, '', '2019-05-21 03:46:40'),
(16, 'CIB160037', 1, 1, 2, 3, 2, 3, 3, 1, '', '2019-05-21 03:47:27'),
(17, 'CIC170031', 1, 1, 3, 2, 1, 2, 1, 1, '', '2019-05-20 23:12:29'),
(18, 'CIB170021', 1, 1, 2, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(19, 'CIB160007', 1, 1, 2, 3, 2, 3, 2, 1, '', '2019-05-21 03:47:18'),
(20, 'CIA180005', 1, 1, 1, 1, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(21, 'CIB160001', 1, 1, 2, 3, 2, 3, 1, 1, '', '2019-05-21 03:46:51'),
(22, 'CIB170012', 1, 1, 2, 2, 1, 3, 2, 1, '', '2019-05-21 03:46:46'),
(23, 'CEB150076', 1, 1, 2, 4, 2, 3, 2, 1, '', '2019-05-21 03:46:33'),
(24, 'CIB160084', 1, 1, 2, 3, 1, 3, 1, 1, '', '2019-05-21 03:46:14'),
(25, 'CIC170050', 1, 1, 3, 2, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(26, 'CIA170089', 1, 1, 1, 2, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(27, 'CIA170042', 1, 1, 1, 2, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(28, 'CIA170108', 1, 1, 1, 2, 2, 2, 3, 1, '', '2019-05-20 23:12:29'),
(29, 'CIB180108', 1, 1, 2, 1, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(30, 'CIB170097', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:45:50'),
(31, 'CIB170030', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:44:03'),
(32, 'CIC160064', 1, 1, 3, 3, 2, 3, 1, 1, '', '2019-05-21 03:47:23'),
(33, 'CIC160036', 1, 1, 3, 3, 1, 3, 1, 1, '', '2019-05-21 03:45:50'),
(34, 'CIC160006', 1, 1, 3, 3, 2, 3, 1, 1, '', '2019-05-21 03:45:50'),
(35, 'CIC170025', 1, 1, 3, 2, 2, 3, 2, 1, '', '2019-05-21 03:45:50'),
(36, 'CIC170005', 1, 1, 3, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(37, 'CIB170056', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:46:12'),
(38, 'CIB180190', 1, 1, 2, 1, 2, 2, 3, 1, '', '2019-05-20 23:12:29'),
(39, 'CIA170031', 1, 1, 1, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(40, 'CIA170027', 1, 1, 1, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(41, 'CIA170059', 1, 1, 1, 2, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(42, 'CIA170018', 1, 1, 1, 1, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(43, 'CIA170037', 1, 1, 1, 2, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(44, 'CIA170057', 1, 1, 1, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(45, 'CIC160015', 1, 1, 3, 3, 1, 3, 1, 1, '', '2019-05-21 03:46:09'),
(46, 'CIC160040', 1, 1, 3, 3, 1, 3, 1, 1, '', '2019-05-21 03:46:06'),
(47, 'CIB170019', 1, 1, 2, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(48, 'CIB170113', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:46:31'),
(49, 'CIB170110', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:46:53'),
(50, 'CIC160022', 1, 1, 3, 3, 2, 3, 2, 1, '', '2019-05-21 03:46:56'),
(51, 'CIB170107', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:46:35'),
(52, 'CIC170020', 1, 1, 3, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(53, 'CIA160174', 1, 1, 1, 3, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(54, 'CIC170057', 1, 1, 3, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(55, 'CIC170054', 1, 1, 3, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(56, 'CIC170019', 1, 1, 3, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(57, 'CIC170017', 1, 1, 3, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(58, 'CIB170174', 1, 1, 2, 4, 1, 3, 2, 1, '', '2019-05-21 03:46:03'),
(59, 'CIC170012', 1, 1, 3, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(60, 'CIB170116', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:45:50'),
(61, 'CIA180045', 1, 1, 1, 1, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(62, 'CIB170126', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:45:50'),
(63, 'CIC150030', 1, 1, 3, 4, 2, 3, 1, 1, '', '2019-05-21 03:45:50'),
(64, 'CIB180028', 1, 1, 2, 1, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(65, 'CIB170039', 1, 1, 2, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(66, 'CIB170073', 1, 1, 2, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(67, 'CIB170038', 1, 1, 2, 2, 1, 2, 2, 1, '', '2019-05-20 23:12:29'),
(68, 'CIB170095', 1, 1, 2, 2, 2, 3, 1, 1, '', '2019-05-21 03:46:17'),
(69, 'CIA170095', 1, 1, 1, 2, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(70, 'CIB170003', 1, 1, 2, 2, 2, 2, 1, 1, '', '2019-05-20 23:12:29'),
(71, 'CIB170114', 1, 1, 2, 2, 2, 3, 2, 1, '', '2019-05-21 03:47:25'),
(72, 'CIC170023', 1, 1, 3, 2, 2, 2, 2, 1, '', '2019-05-20 23:12:29'),
(73, 'CIB160177', 1, 1, 2, 3, 2, 3, 1, 1, '', '2019-05-21 03:46:28'),
(74, 'wif1770000', 1, 1, 2, 2, 1, 1, 3, 3, 'sn@gnaf.com', '2019-05-27 02:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `participant_age`
--

CREATE TABLE `participant_age` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_age`
--

INSERT INTO `participant_age` (`id`, `name`) VALUES
(1, 'Below 18 Years'),
(2, '18-21 Years'),
(3, '22-25 Years'),
(4, 'Above 25 Years');

-- --------------------------------------------------------

--
-- Table structure for table `participant_course`
--

CREATE TABLE `participant_course` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_course`
--

INSERT INTO `participant_course` (`id`, `name`) VALUES
(1, 'Bachelor of Accounting'),
(2, 'Bachelor of Business Administration'),
(3, 'Bachelor of Finance'),
(4, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `participant_ethnic`
--

CREATE TABLE `participant_ethnic` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_ethnic`
--

INSERT INTO `participant_ethnic` (`id`, `name`) VALUES
(1, 'Malay'),
(2, 'Chinese'),
(3, 'Indian'),
(4, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `participant_faculty`
--

CREATE TABLE `participant_faculty` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_faculty`
--

INSERT INTO `participant_faculty` (`id`, `name`) VALUES
(1, 'Faculty of Business and Administration'),
(2, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `participant_gender`
--

CREATE TABLE `participant_gender` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_gender`
--

INSERT INTO `participant_gender` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `participant_nation`
--

CREATE TABLE `participant_nation` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_nation`
--

INSERT INTO `participant_nation` (`id`, `name`) VALUES
(1, 'Malaysian'),
(2, 'Chinese (China)'),
(3, 'Indonesian'),
(4, 'Pakistani'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `participant_result`
--

CREATE TABLE `participant_result` (
  `id` int(11) NOT NULL,
  `participantid` int(10) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `GPA` decimal(4,2) DEFAULT NULL,
  `CGPA` decimal(4,2) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_result`
--

INSERT INTO `participant_result` (`id`, `participantid`, `type`, `year`, `sem`, `GPA`, `CGPA`, `createdOn`) VALUES
(1, 1, 1, 2017, 2, '3.89', '3.58', '2019-05-20 23:22:08'),
(2, 2, 1, 2017, 2, '3.96', '3.98', '2019-05-20 23:22:08'),
(3, 3, 1, 2017, 2, '4.00', '3.94', '2019-05-20 23:22:08'),
(4, 4, 1, 2017, 2, '3.71', '3.70', '2019-05-20 23:22:08'),
(5, 5, 1, 2017, 1, '3.42', '3.30', '2019-05-20 23:22:08'),
(6, 6, 1, 2017, 2, '3.83', '3.77', '2019-05-20 23:22:08'),
(7, 7, 1, 2017, 2, '3.78', '3.83', '2019-05-20 23:22:08'),
(8, 8, 1, 2017, 2, '3.60', '3.50', '2019-05-20 23:22:08'),
(9, 9, 1, 2017, 2, '3.55', '3.40', '2019-05-20 23:22:08'),
(10, 10, 1, 2017, 1, '3.50', '3.37', '2019-05-20 23:22:08'),
(11, 11, 1, 2017, 2, '3.57', '3.32', '2019-05-20 23:22:08'),
(12, 12, 1, 2017, 2, '3.33', '3.33', '2019-05-20 23:22:08'),
(13, 13, 1, 2017, 2, '3.51', '3.19', '2019-05-20 23:22:08'),
(14, 14, 1, 2017, 2, '3.31', '3.17', '2019-05-20 23:22:08'),
(15, 15, 1, 2017, 2, '3.68', '3.80', '2019-05-20 23:22:08'),
(16, 16, 1, 2017, 2, '3.45', '3.30', '2019-05-20 23:22:08'),
(17, 17, 1, 2017, 2, '3.80', '3.93', '2019-05-20 23:22:08'),
(18, 18, 1, 2017, 2, '3.58', '3.76', '2019-05-20 23:22:08'),
(19, 19, 1, 2017, 1, '3.56', '3.18', '2019-05-20 23:22:08'),
(20, 21, 1, 2018, 1, '3.20', '3.00', '2019-05-20 23:22:08'),
(21, 22, 1, 2017, 2, '3.91', '3.88', '2019-05-20 23:22:08'),
(22, 23, 1, 2017, 2, '3.69', '3.69', '2019-05-20 23:22:08'),
(23, 24, 1, 2017, 2, '2.90', '3.00', '2019-05-20 23:22:08'),
(24, 25, 1, 2017, 2, '2.95', '3.07', '2019-05-20 23:22:08'),
(25, 26, 1, 2017, 2, '3.59', '3.43', '2019-05-20 23:22:08'),
(26, 27, 1, 2018, 1, '3.57', '3.40', '2019-05-20 23:22:08'),
(27, 28, 1, 2018, 1, '4.00', '4.00', '2019-05-20 23:22:08'),
(28, 30, 1, 2017, 2, '3.82', '3.50', '2019-05-20 23:22:08'),
(29, 31, 1, 2017, 2, '3.71', '3.50', '2019-05-20 23:22:08'),
(30, 32, 1, 2017, 1, '2.60', '2.80', '2019-05-20 23:22:08'),
(31, 33, 1, 2017, 2, '3.00', '3.00', '2019-05-20 23:22:08'),
(32, 34, 1, 2017, 2, '2.81', '3.19', '2019-05-20 23:22:08'),
(33, 35, 1, 2017, 2, '3.85', '3.62', '2019-05-20 23:22:08'),
(34, 36, 1, 2017, 2, '3.86', '3.92', '2019-05-20 23:22:08'),
(35, 37, 1, 2017, 2, '3.79', '3.83', '2019-05-20 23:22:08'),
(36, 39, 1, 2017, 2, '3.53', '3.42', '2019-05-20 23:22:08'),
(37, 40, 1, 2017, 2, '3.63', '3.45', '2019-05-20 23:22:08'),
(38, 41, 1, 2017, 2, '3.67', '3.73', '2019-05-20 23:22:08'),
(39, 43, 1, 2017, 2, '2.70', '3.25', '2019-05-20 23:22:08'),
(40, 44, 1, 2017, 2, '3.67', '3.58', '2019-05-20 23:22:08'),
(41, 45, 1, 2017, 2, '3.10', '3.33', '2019-05-20 23:22:08'),
(42, 46, 1, 2017, 2, '3.00', '3.18', '2019-05-20 23:22:08'),
(43, 47, 1, 2017, 2, '3.30', '3.40', '2019-05-20 23:22:08'),
(44, 48, 1, 2017, 1, '3.21', '3.40', '2019-05-20 23:22:08'),
(45, 49, 1, 2017, 2, '3.96', '3.89', '2019-05-20 23:22:08'),
(46, 50, 1, 2017, 1, '3.57', '3.63', '2019-05-20 23:22:08'),
(47, 51, 1, 2017, 2, '3.64', '3.56', '2019-05-20 23:22:08'),
(48, 52, 1, 2017, 2, '3.91', '3.74', '2019-05-20 23:22:08'),
(49, 53, 1, 2018, 1, '3.50', '3.34', '2019-05-20 23:22:08'),
(50, 54, 1, 2017, 2, '3.85', '3.75', '2019-05-20 23:22:08'),
(51, 55, 1, 2017, 1, '3.50', '3.50', '2019-05-20 23:22:08'),
(52, 56, 1, 2017, 2, '3.80', '3.80', '2019-05-20 23:22:08'),
(53, 57, 1, 2017, 2, '3.80', '3.80', '2019-05-20 23:22:08'),
(54, 58, 1, 2018, 2, '4.00', '3.96', '2019-05-20 23:22:08'),
(55, 59, 1, 2017, 2, '3.91', '3.82', '2019-05-20 23:22:08'),
(56, 60, 1, 2017, 2, '3.30', '3.60', '2019-05-20 23:22:08'),
(57, 62, 1, 2017, 2, '3.76', '3.80', '2019-05-20 23:22:08'),
(58, 63, 1, 2017, 2, '4.00', '2.83', '2019-05-20 23:22:08'),
(59, 65, 1, 2017, 2, '3.45', '3.59', '2019-05-20 23:22:08'),
(60, 66, 1, 2017, 2, '3.33', '3.47', '2019-05-20 23:22:08'),
(61, 67, 1, 2017, 2, '3.64', '3.72', '2019-05-20 23:22:08'),
(62, 68, 1, 2017, 2, '3.05', '3.50', '2019-05-20 23:22:08'),
(63, 69, 1, 2017, 2, '3.68', '3.75', '2019-05-20 23:22:08'),
(64, 70, 1, 2017, 1, '2.74', '2.71', '2019-05-20 23:22:08'),
(65, 71, 1, 2017, 2, '3.59', '3.73', '2019-05-20 23:22:08'),
(66, 72, 1, 2017, 2, '3.85', '3.74', '2019-05-20 23:22:08'),
(67, 73, 1, 2017, 2, '3.00', '3.00', '2019-05-20 23:22:08'),
(68, 1, 2, 2018, 1, '3.16', '3.44', '2019-05-20 23:22:08'),
(69, 2, 2, 2018, 1, '3.11', '3.37', '2019-05-20 23:22:08'),
(70, 3, 2, 2018, 1, '3.98', '3.96', '2019-05-20 23:22:08'),
(71, 4, 2, 2018, 1, '3.69', '3.72', '2019-05-20 23:22:08'),
(72, 5, 2, 2018, 1, '3.02', '3.05', '2019-05-20 23:22:08'),
(73, 6, 2, 2018, 1, '3.71', '3.69', '2019-05-20 23:22:08'),
(74, 7, 2, 2018, 1, '3.89', '3.90', '2019-05-20 23:22:08'),
(75, 8, 2, 2018, 1, '3.23', '3.30', '2019-05-20 23:22:08'),
(76, 9, 2, 2018, 1, '3.33', '3.36', '2019-05-20 23:22:08'),
(77, 10, 2, 2018, 1, '3.34', '3.40', '2019-05-20 23:22:08'),
(78, 11, 2, 2018, 2, '3.34', '3.37', '2019-05-20 23:22:08'),
(79, 12, 2, 2018, 2, '3.57', '3.60', '2019-05-20 23:22:08'),
(80, 13, 2, 2018, 1, '3.43', '3.07', '2019-05-20 23:22:08'),
(81, 14, 2, 2018, 1, '3.47', '3.52', '2019-05-20 23:22:08'),
(82, 15, 2, 2018, 1, '3.78', '3.70', '2019-05-20 23:22:08'),
(83, 16, 2, 2018, 1, '3.50', '3.47', '2019-05-20 23:22:08'),
(84, 17, 2, 2018, 2, '3.84', '3.94', '2019-05-20 23:22:08'),
(85, 18, 2, 2018, 2, '3.63', '3.68', '2019-05-20 23:22:08'),
(86, 19, 2, 2018, 2, '3.65', '3.47', '2019-05-20 23:22:08'),
(87, 20, 2, 2018, 1, '3.53', '3.73', '2019-05-20 23:22:08'),
(88, 21, 2, 2018, 1, '4.00', '4.00', '2019-05-20 23:22:08'),
(89, 22, 2, 2018, 1, '3.89', '3.85', '2019-05-20 23:22:08'),
(90, 23, 2, 2018, 1, '3.78', '3.72', '2019-05-20 23:22:08'),
(91, 24, 2, 2018, 1, '2.98', '3.00', '2019-05-20 23:22:08'),
(92, 25, 2, 2018, 1, '2.50', '2.78', '2019-05-20 23:22:08'),
(93, 26, 2, 2018, 1, '3.75', '3.60', '2019-05-20 23:22:08'),
(94, 27, 2, 2017, 2, '3.30', '3.30', '2019-05-20 23:22:08'),
(95, 28, 2, 2018, 1, '4.00', '4.00', '2019-05-20 23:22:08'),
(96, 29, 2, 2018, 1, '3.60', '3.60', '2019-05-20 23:22:08'),
(97, 30, 2, 2018, 1, '3.79', '3.56', '2019-05-20 23:22:08'),
(98, 31, 2, 2018, 2, '3.89', '3.63', '2019-05-20 23:22:08'),
(99, 32, 2, 2018, 1, '2.76', '2.78', '2019-05-20 23:22:08'),
(100, 33, 2, 2018, 1, '3.01', '2.98', '2019-05-20 23:22:08'),
(101, 34, 2, 2018, 1, '2.89', '3.02', '2019-05-20 23:22:08'),
(102, 35, 2, 2018, 1, '3.92', '3.81', '2019-05-20 23:22:08'),
(103, 36, 2, 2018, 2, '3.94', '3.91', '2019-05-20 23:22:08'),
(104, 37, 2, 2018, 1, '3.82', '3.40', '2019-05-20 23:22:08'),
(105, 38, 2, 2018, 1, '4.00', '4.00', '2019-05-20 23:22:08'),
(106, 39, 2, 2018, 2, '3.64', '3.58', '2019-05-20 23:22:08'),
(107, 40, 2, 2018, 2, '3.43', '3.36', '2019-05-20 23:22:08'),
(108, 41, 2, 2018, 1, '3.59', '3.68', '2019-05-20 23:22:08'),
(109, 42, 2, 2017, 2, '3.47', '3.54', '2019-05-20 23:22:08'),
(110, 43, 2, 2018, 1, '3.45', '3.36', '2019-05-20 23:22:08'),
(111, 44, 2, 2018, 1, '3.56', '3.57', '2019-05-20 23:22:08'),
(112, 45, 2, 2018, 1, '3.23', '3.15', '2019-05-20 23:22:08'),
(113, 46, 2, 2018, 1, '3.17', '3.21', '2019-05-20 23:22:08'),
(114, 47, 2, 2018, 2, '3.43', '3.36', '2019-05-20 23:22:08'),
(115, 48, 2, 2018, 2, '3.19', '3.36', '2019-05-20 23:22:08'),
(116, 49, 2, 2018, 2, '3.87', '3.88', '2019-05-20 23:22:08'),
(117, 50, 2, 2018, 2, '3.47', '3.51', '2019-05-20 23:22:08'),
(118, 51, 2, 2018, 1, '3.54', '3.56', '2019-05-20 23:22:08'),
(119, 52, 2, 2018, 1, '3.97', '3.83', '2019-05-20 23:22:08'),
(120, 53, 2, 2018, 2, '3.45', '3.20', '2019-05-20 23:22:08'),
(121, 54, 2, 2018, 1, '3.67', '3.63', '2019-05-20 23:22:08'),
(122, 55, 2, 2018, 1, '3.48', '3.49', '2019-05-20 23:22:08'),
(123, 56, 2, 2018, 1, '3.80', '3.80', '2019-05-20 23:22:08'),
(124, 57, 2, 2018, 1, '3.75', '3.76', '2019-05-20 23:22:08'),
(125, 58, 2, 2018, 1, '3.88', '3.92', '2019-05-20 23:22:08'),
(126, 59, 2, 2018, 1, '3.73', '3.79', '2019-05-20 23:22:08'),
(127, 60, 2, 2018, 1, '3.57', '3.59', '2019-05-20 23:22:08'),
(128, 61, 2, 2018, 2, '4.00', '4.00', '2019-05-20 23:22:08'),
(129, 62, 2, 2018, 1, '3.80', '3.80', '2019-05-20 23:22:08'),
(130, 63, 2, 2018, 1, '3.58', '3.42', '2019-05-20 23:22:08'),
(131, 64, 2, 2018, 1, '3.68', '3.68', '2019-05-20 23:22:08'),
(132, 65, 2, 2017, 1, '3.54', '3.55', '2019-05-20 23:22:08'),
(133, 66, 2, 2018, 1, '3.25', '3.36', '2019-05-20 23:22:08'),
(134, 67, 2, 2018, 1, '3.63', '3.70', '2019-05-20 23:22:08'),
(135, 68, 2, 2018, 1, '3.45', '3.47', '2019-05-20 23:22:08'),
(136, 69, 2, 2018, 1, '3.57', '3.63', '2019-05-20 23:22:08'),
(137, 70, 2, 2018, 1, '2.89', '2.83', '2019-05-20 23:22:08'),
(138, 71, 2, 2018, 1, '3.69', '3.70', '2019-05-20 23:22:08'),
(139, 72, 2, 2018, 1, '3.89', '3.75', '2019-05-20 23:22:08'),
(140, 73, 2, 2018, 1, '2.89', '2.91', '2019-05-20 23:22:08'),
(141, 74, 1, 2016, 1, '3.00', '3.00', '2019-05-27 02:17:18'),
(142, 74, 2, 2019, 2, '33.00', '3.00', '2019-05-27 02:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `participant_result_course`
--

CREATE TABLE `participant_result_course` (
  `id` int(16) NOT NULL,
  `participantid` int(10) NOT NULL,
  `type` int(10) NOT NULL,
  `year` int(10) NOT NULL,
  `sem` int(5) NOT NULL,
  `courseCode` varchar(8) NOT NULL,
  `courseName` varchar(255) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_result_course`
--

INSERT INTO `participant_result_course` (`id`, `participantid`, `type`, `year`, `sem`, `courseCode`, `courseName`, `grade`, `createdOn`) VALUES
(1, 1, 1, 2017, 2, 'CIA1001', 'Introductory Accounting', 'A', '2019-05-20 23:34:07'),
(2, 1, 1, 2017, 2, 'CIB1001', 'Management', 'A', '2019-05-20 23:34:07'),
(3, 1, 1, 2017, 2, 'CID1001', 'Management Information Systems', 'A', '2019-05-20 23:34:07'),
(4, 1, 1, 2017, 2, 'CIX1002', 'Principles of Macroeconomics', 'B+', '2019-05-20 23:34:07'),
(5, 1, 1, 2017, 2, 'CIX1004', 'Quantitative Analysis For Business', 'A', '2019-05-20 23:34:07'),
(6, 1, 1, 2017, 2, 'GIG1002', 'Ethnic Relations', 'A', '2019-05-20 23:34:07'),
(7, 1, 1, 2017, 2, 'GIG1005', 'Social Engagement', 'A+', '2019-05-20 23:34:07'),
(8, 2, 1, 2017, 2, 'CIB1001', 'MANAGEMENT', 'A', '2019-05-20 23:34:07'),
(9, 2, 1, 2017, 2, 'CIX1002', 'PRINCIPLES OF MACROECONOMICS', 'A', '2019-05-20 23:34:07'),
(10, 2, 1, 2017, 2, 'CIX1003', 'BUSINESS STATISTICS', 'A-', '2019-05-20 23:34:07'),
(11, 2, 1, 2017, 2, 'CIX2001', 'FINANICIAL MANAGEMENT', 'A', '2019-05-20 23:34:07'),
(12, 2, 1, 2017, 2, 'GIG1004', 'INFORMATION LITERACY', 'A+', '2019-05-20 23:34:07'),
(13, 2, 1, 2017, 2, 'GIG1005', 'SOCIAL ENGAGEMENT', 'A+', '2019-05-20 23:34:07'),
(14, 2, 1, 2017, 2, 'GLT1015', 'ADVACED PROFESSIONAL WRITING', 'A-', '2019-05-20 23:34:07'),
(15, 2, 1, 2017, 2, 'CIB1001', 'MANAGEMENT', 'A', '2019-05-20 23:34:07'),
(16, 2, 1, 2017, 2, 'CIX1002', 'PRINCIPLES OF MACROECONOMICS', 'A', '2019-05-20 23:34:07'),
(17, 2, 1, 2017, 2, 'CIX1003', 'BUSINESS STATISTICS', 'A-', '2019-05-20 23:34:07'),
(18, 2, 1, 2017, 2, 'CIX2001', 'FINANICIAL MANAGEMENT', 'A', '2019-05-20 23:34:07'),
(19, 2, 1, 2017, 2, 'GIG1004', 'INFORMATION LITERACY', 'A+', '2019-05-20 23:34:07'),
(20, 2, 1, 2017, 2, 'GIG1005', 'SOCIAL ENGAGEMENT', 'A+', '2019-05-20 23:34:07'),
(21, 2, 1, 2017, 2, 'GLT1015', 'ADVACED PROFESSIONAL WRITING', 'A-', '2019-05-20 23:34:07'),
(22, 21, 1, 2018, 1, 'CIB1001', '', 'A-', '2019-05-20 23:34:07'),
(23, 21, 1, 2018, 1, 'CIB2001', '', 'A', '2019-05-20 23:34:07'),
(24, 21, 1, 2018, 1, 'CIX1003', '', 'B+', '2019-05-20 23:34:07'),
(25, 21, 1, 2018, 1, 'CIX1005', '', 'A-', '2019-05-20 23:34:07'),
(26, 21, 1, 2018, 1, 'GIG1005', '', 'A', '2019-05-20 23:34:07'),
(27, 21, 1, 2018, 1, 'CIA1001', '', 'A-', '2019-05-20 23:34:07'),
(28, 27, 1, 2018, 1, 'CIA2003', '', 'B+', '2019-05-20 23:34:07'),
(29, 27, 1, 2018, 1, 'CIA2004', '', 'A-', '2019-05-20 23:34:07'),
(30, 27, 1, 2018, 1, 'CIX2001', '', 'B+', '2019-05-20 23:34:07'),
(31, 27, 1, 2018, 1, 'CIA2007', '', 'A', '2019-05-20 23:34:07'),
(32, 27, 1, 2018, 1, 'GIG1002', 'Ethnic Relations', 'A', '2019-05-20 23:34:07'),
(33, 27, 1, 2018, 1, 'CIX1004', '', 'A-', '2019-05-20 23:34:07'),
(34, 27, 1, 2018, 1, 'CIA2005', '', 'A-', '2019-05-20 23:34:07'),
(35, 28, 1, 2018, 1, 'CIA1001', 'INTRODUCTORY ACCOUNTING', 'A+', '2019-05-20 23:34:07'),
(36, 28, 1, 2018, 1, 'CIA1004', 'COST ACCOUNTING', 'A+', '2019-05-20 23:34:07'),
(37, 28, 1, 2018, 1, 'CIA2008', 'COMPANY LAW', 'A+', '2019-05-20 23:34:07'),
(38, 28, 1, 2018, 1, 'CIX2001', 'FINANCIAL MANAGEMENT', 'A+', '2019-05-20 23:34:07'),
(39, 28, 1, 2018, 1, 'CIA3005', 'ADVANCED AUDITING', 'A+', '2019-05-20 23:34:07'),
(40, 53, 1, 2018, 1, 'GIG1001', 'TITAS', 'A', '2019-05-20 23:34:07'),
(41, 53, 1, 2018, 1, 'CIA2004', 'AUDITING PRINCIPLES', 'A', '2019-05-20 23:34:07'),
(42, 53, 1, 2018, 1, 'CIA1001', 'INTRODUCTORY ACCOUNTING', 'A-', '2019-05-20 23:34:07'),
(43, 53, 1, 2018, 1, 'GIG1004', 'INFORMATION SKILLS', 'A-', '2019-05-20 23:34:07'),
(44, 53, 1, 2018, 1, 'CIX1001', 'PRINCIPLES OF MICROECONOMICS', 'B', '2019-05-20 23:34:07'),
(45, 1, 2, 2018, 1, 'CIB2001', 'Organizational Behavior', 'B+', '2019-05-20 23:34:07'),
(46, 1, 2, 2018, 1, 'CIB2002', 'Business Law', 'B-', '2019-05-20 23:34:07'),
(47, 1, 2, 2018, 1, 'CID2001', 'Operations Management', 'B', '2019-05-20 23:34:07'),
(48, 1, 2, 2018, 1, 'CIX2001', 'Financial Management', 'B-', '2019-05-20 23:34:07'),
(49, 1, 2, 2018, 1, 'GIG1004', 'Information Literacy', 'A', '2019-05-20 23:34:07'),
(50, 1, 2, 2018, 1, 'GKR1010', 'Basic Harmony Singing', 'A', '2019-05-20 23:34:07'),
(51, 1, 2, 2018, 1, 'GLT1009', 'Mastering English VI', 'B', '2019-05-20 23:34:07'),
(52, 2, 2, 2018, 1, 'CIA2007', 'COMMERCIAL  LAW', 'A-', '2019-05-20 23:34:07'),
(53, 2, 2, 2018, 1, 'CIC2001', 'BASIC COPORATE FINANCE', 'A-', '2019-05-20 23:34:07'),
(54, 2, 2, 2018, 1, 'CIC2003', 'ISLAMIC FINANCIAL SYSTEM', 'B+', '2019-05-20 23:34:07'),
(55, 2, 2, 2018, 1, 'CIC2004', 'INVESTMENT MANAGEMENT', 'A-', '2019-05-20 23:34:07'),
(56, 2, 2, 2018, 1, 'CIC2005', 'ECONOMETRICS', 'B+', '2019-05-20 23:34:07'),
(57, 2, 2, 2018, 1, 'CIC2006', 'GLOBAL FINANCE', 'B+', '2019-05-20 23:34:07'),
(58, 2, 2, 2018, 1, 'CIC2009', 'TRESURY MANAGEMENT', 'A-', '2019-05-20 23:34:07'),
(59, 21, 2, 2018, 1, 'CIB1001', 'Management', 'A+', '2019-05-20 23:34:07'),
(60, 21, 2, 2018, 1, 'CIB2001', 'Organizational Behavior', 'A+', '2019-05-20 23:34:07'),
(61, 21, 2, 2018, 1, 'CIB3001', 'Business Ethics', 'A+', '2019-05-20 23:34:07'),
(62, 21, 2, 2018, 1, 'CIB3002', 'Strategic Management', 'A+', '2019-05-20 23:34:07'),
(63, 21, 2, 2018, 1, 'CIX1001', 'Microeconomics', 'A+', '2019-05-20 23:34:07'),
(64, 21, 2, 2018, 1, 'CIX1002', 'Macroeconomics', 'A+', '2019-05-20 23:34:07'),
(65, 21, 2, 2018, 1, 'CIX1003', 'Business Statics', 'A+', '2019-05-20 23:34:07'),
(66, 28, 2, 2018, 1, 'CIA1001', 'INTRODUCTORY ACCOUNTING', 'A+', '2019-05-20 23:34:07'),
(67, 28, 2, 2018, 1, 'CIA1004', 'COST ACCOUNTING', 'A+', '2019-05-20 23:34:07'),
(68, 28, 2, 2018, 1, 'CIA2008', 'COMPANY LAW', 'A+', '2019-05-20 23:34:07'),
(69, 28, 2, 2018, 1, 'CIX2001', 'FINANCIAL MANAGEMENT', 'A+', '2019-05-20 23:34:07'),
(70, 28, 2, 2018, 1, 'CIA3005', 'ADVNCED AUDITING', 'A+', '2019-05-20 23:34:07'),
(71, 38, 2, 2018, 1, 'GIG1004', 'Information Skills', 'A+', '2019-05-20 23:34:07'),
(72, 38, 2, 2018, 1, 'CIX1001', 'Principles of Microeconomics', 'A+', '2019-05-20 23:34:07'),
(73, 38, 2, 2018, 1, 'CIA1001', 'Introductory Accounting', 'A+', '2019-05-20 23:34:07'),
(74, 38, 2, 2018, 1, 'CIX1005', 'Business Communication: A Critical Thinking Approach', 'A+', '2019-05-25 06:44:47'),
(75, 38, 2, 2018, 1, 'GIG1001', 'TITAS', 'A+', '2019-05-25 06:44:47'),
(76, 38, 2, 2018, 1, 'GIG1003', 'The Basic Culture of Entrepreneurship', 'A+', '2019-05-25 06:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `participant_result_course_type`
--

CREATE TABLE `participant_result_course_type` (
  `id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_result_course_type`
--

INSERT INTO `participant_result_course_type` (`id`, `name`) VALUES
(1, 'Past Year'),
(2, 'This Year');

-- --------------------------------------------------------

--
-- Table structure for table `participant_university`
--

CREATE TABLE `participant_university` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_university`
--

INSERT INTO `participant_university` (`id`, `name`) VALUES
(1, 'University of Malaya'),
(2, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `participant_yearstudy`
--

CREATE TABLE `participant_yearstudy` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_yearstudy`
--

INSERT INTO `participant_yearstudy` (`id`, `name`) VALUES
(1, 'First Year'),
(2, 'Second Year'),
(3, 'Third Year'),
(4, 'Forth Year'),
(5, 'Fifth Year and above');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(8) NOT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `score` int(8) DEFAULT NULL,
  `avgScore` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `title`, `image`, `score`, `avgScore`, `status`) VALUES
(1, 'There was a power failure in the house. Mrs. Lim lighted up 10 candles. After sometime, four candles were blown out by the wind. Later, another three candles were blown out. How many candles remained on the following day?', 'candles.png', 5, '0.34', 1),
(2, 'There are 20 people who love to solve puzzles. They met to solve puzzles together. Among them, three are friends (i.e., already known each other). During their first face-to-face meeting, they shook hands with each other (with unknowns only) except for the three who were already known to each other. \r\nQuestion: How many handshaking took place in this meeting?', 'handshake.png', 5, '0.34', 1),
(3, 'There are altogether 100 birds and turtles. The total number of legs is 276. \r\nQuestion: How many birds and turtles are there, respectively?', 'turtlebird.png', 10, '3.22', 1),
(4, 'Move the following numbers to make them equal, mathematically. Write your answer below.\r\n	2      4     =     6     7', '2467.png', 5, '0.14', 1),
(5, 'There are four (4) students: A, B, C, and D. They are discussing about their academic results. A says: If I get distinction, then B also gets distinction. B says: If I get distinction, then C also gets distinction. C says: If I get distinction, then D also gets distinction. All the four students are telling the truth. However, among these four students, only two students get distinctions. Who are the two students who got distinctions?', 'cert.png', 10, '4.08', 1),
(6, 'There are three (3) boxes: a gold box, a silver box, and a red box. On top of each of the boxes, there is a sentence. In one of these three boxes, only one box contains a photo. The sentence on the gold box says: The photo is not inside the silver box. The sentence on the silver box says: The photo is not inside this box. The sentence on the red box says: The photo is inside this box. Among these three sentences, at least one sentence is true, and at least one sentence is false. \r\nQuestion: Which box contains the photo?', 'boxes.png', 5, '3.49', 1),
(7, 'Two thin wooden sticks take one (1) hour to complete burning, respectively. What is the method you will use to measure 15 minutes of burning time? Describe briefly and draw diagram(s) to illustrate your answer.', 'stick.png', 5, '0.00', 1),
(8, 'There are four people: A, B, C, and D. They are predicting the future career for each other: dancer, fortune teller, novelist, and TV host.  Based on their statements given below, only the statement given by the fortune teller is true.\r\nA: B will absolutely never become a dancer.\r\nB: C will become a fortune teller.\r\nC: D will never become a TV host.\r\nD: I&apos;ll marry Mr. P\r\nQuestion: What are the respective career of A, B, C, and D, and will D marry Mr. P?', 'crystalball.png', 25, '1.30', 1),
(9, 'There are two brothers, one of whom is fat and the other is thin. The elder brother will tell the truth in the morning, and will tell lie in the afternoon. The younger brother will be the reverse (i.e., tells lie in the morning, and tells the truth in the afternoon).\r\nOne man asked these two brothers: Who is the elder brother?\r\nThe fat one said: I&apos;m the elder brother.\r\nThe thin one also said: I&apos;m the elder brother.\r\nThe man asked again: What is the time now?\r\nThe fat one said: Almost noon.\r\nThe thin one also said: Already noon.\r\n\r\nQuestion: What is the time now (morning or afternoon), and who is the elder brother (the fat one or the thin one)?', 'brother.png', 10, '2.98', 1),
(10, 'In a room, there are two men. One tells the truth and the other tells lie. You&apos;re in the room, and you want to leave the room from one of the exits (doors). There is a lion behind one of the exit. The other exit is safe. What is the question (ONE question ONLY) you will ask one of the men to know which is the safe exit?', 'twodoors.png', 5, '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(2) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `participantid` int(10) NOT NULL,
  `duration` decimal(11,2) NOT NULL,
  `totalScore` int(10) NOT NULL DEFAULT '0',
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `participantid`, `duration`, `totalScore`, `updatedOn`, `createdOn`) VALUES
(1, 1, '66.58', 30, '2019-05-21 02:53:50', '0000-00-00 00:00:00'),
(2, 2, '24.62', 45, '2019-05-21 02:53:50', '0000-00-00 00:00:00'),
(3, 3, '23.40', 25, '2019-05-21 02:53:50', '0000-00-00 00:00:00'),
(4, 4, '32.07', 20, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(5, 5, '21.75', 15, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(6, 6, '21.65', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(7, 7, '33.15', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(8, 8, '41.07', 30, '2019-05-21 02:53:35', '0000-00-00 00:00:00'),
(9, 9, '41.75', 5, '2019-05-21 02:44:55', '0000-00-00 00:00:00'),
(10, 10, '42.40', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(11, 11, '42.27', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(12, 12, '31.95', 45, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(13, 13, '23.88', 20, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(14, 14, '41.48', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(15, 15, '49.20', 50, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(16, 16, '57.82', 15, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(17, 17, '38.77', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(18, 18, '22.78', 30, '2019-05-21 02:52:38', '0000-00-00 00:00:00'),
(19, 19, '20.60', 15, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(20, 20, '54.47', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(21, 21, '33.43', 10, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(22, 22, '25.28', 55, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(23, 23, '42.67', 25, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(24, 24, '34.35', 20, '2019-05-21 02:53:36', '0000-00-00 00:00:00'),
(25, 25, '33.55', 20, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(26, 26, '40.97', 20, '2019-05-21 02:52:23', '0000-00-00 00:00:00'),
(27, 27, '80.52', 10, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(28, 28, '17.15', 20, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(29, 29, '19.52', 55, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(30, 30, '10.33', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(31, 31, '17.37', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(32, 32, '26.73', 20, '2019-05-21 02:53:37', '0000-00-00 00:00:00'),
(33, 33, '33.92', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(34, 34, '42.35', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(35, 35, '45.42', 40, '2019-05-21 02:53:37', '0000-00-00 00:00:00'),
(36, 36, '32.33', 45, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(37, 37, '21.92', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(38, 38, '39.92', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(39, 39, '62.05', 20, '2019-05-21 02:52:23', '0000-00-00 00:00:00'),
(40, 40, '32.18', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(41, 41, '32.03', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(42, 42, '21.80', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(43, 43, '24.90', 30, '2019-05-21 02:53:37', '0000-00-00 00:00:00'),
(44, 44, '21.70', 45, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(45, 45, '21.93', 25, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(46, 46, '32.27', 25, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(47, 47, '31.97', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(48, 48, '31.48', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(49, 49, '30.25', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(50, 50, '21.58', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(51, 51, '77.88', 30, '2019-05-21 02:53:38', '0000-00-00 00:00:00'),
(52, 52, '30.57', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(53, 53, '31.48', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(54, 54, '22.25', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(55, 55, '20.47', 30, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(56, 56, '28.10', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(57, 57, '22.35', 20, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(58, 58, '23.35', 55, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(59, 59, '21.88', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(60, 60, '41.70', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(61, 61, '34.68', 30, '2019-05-21 02:53:38', '0000-00-00 00:00:00'),
(62, 62, '61.62', 30, '2019-05-21 02:53:38', '0000-00-00 00:00:00'),
(63, 63, '60.03', 50, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(64, 64, '41.70', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(65, 65, '37.58', 25, '2019-05-21 02:53:38', '0000-00-00 00:00:00'),
(66, 66, '40.38', 35, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(67, 67, '30.90', 45, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(68, 68, '41.90', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(69, 69, '24.42', 15, '2019-05-21 02:53:38', '0000-00-00 00:00:00'),
(70, 70, '63.13', 35, '2019-05-21 02:53:39', '0000-00-00 00:00:00'),
(71, 71, '62.72', 40, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(72, 72, '26.57', 10, '2019-05-21 02:53:51', '0000-00-00 00:00:00'),
(73, 73, '79.55', 40, '2019-05-21 02:53:39', '0000-00-00 00:00:00'),
(74, 74, '0.20', 0, '2019-05-27 02:17:33', '2019-05-27 02:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `test_answer`
--

CREATE TABLE `test_answer` (
  `id` int(10) NOT NULL,
  `testID` int(10) NOT NULL,
  `ansID` int(10) NOT NULL,
  `ans` varchar(520) NOT NULL,
  `score` int(10) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_answer`
--

INSERT INTO `test_answer` (`id`, `testID`, `ansID`, `ans`, `score`, `createdOn`) VALUES
(1, 1, 1, '3', 0, '2019-05-21 02:44:27'),
(2, 2, 1, '0', 0, '2019-05-21 02:44:27'),
(3, 3, 1, '3', 0, '2019-05-21 02:44:27'),
(4, 4, 1, '3', 0, '2019-05-21 02:44:27'),
(5, 5, 1, '0', 0, '2019-05-21 02:44:27'),
(6, 6, 1, '7', 5, '2019-05-21 02:44:55'),
(7, 7, 1, '7', 5, '2019-05-21 02:44:55'),
(8, 8, 1, '0', 0, '2019-05-21 02:44:27'),
(9, 9, 1, '7', 5, '2019-05-21 02:44:55'),
(10, 10, 1, '7', 5, '2019-05-21 02:44:55'),
(11, 11, 1, '0', 0, '2019-05-21 02:44:27'),
(12, 12, 1, '0', 0, '2019-05-21 02:44:27'),
(13, 13, 1, '0', 0, '2019-05-21 02:44:27'),
(14, 14, 1, '4', 0, '2019-05-21 02:44:27'),
(15, 15, 1, '3', 0, '2019-05-21 02:44:27'),
(16, 16, 1, '3', 0, '2019-05-21 02:44:27'),
(17, 17, 1, '3', 0, '2019-05-21 02:44:27'),
(18, 18, 1, '3', 0, '2019-05-21 02:44:27'),
(19, 19, 1, '3', 0, '2019-05-21 02:44:27'),
(20, 20, 1, '0', 0, '2019-05-21 02:44:27'),
(21, 21, 1, '3', 0, '2019-05-21 02:44:27'),
(22, 22, 1, '6', 0, '2019-05-21 02:44:27'),
(23, 23, 1, '0', 0, '2019-05-21 02:44:27'),
(24, 24, 1, '3', 0, '2019-05-21 02:44:27'),
(25, 25, 1, '3', 0, '2019-05-21 02:44:27'),
(26, 26, 1, '3', 0, '2019-05-21 02:44:27'),
(27, 27, 1, '4', 0, '2019-05-21 02:44:27'),
(28, 28, 1, '2', 0, '2019-05-21 02:44:27'),
(29, 29, 1, '0', 0, '2019-05-21 02:44:27'),
(30, 30, 1, '3', 0, '2019-05-21 02:44:27'),
(31, 31, 1, '0', 0, '2019-05-21 02:44:27'),
(32, 32, 1, '3', 0, '2019-05-21 02:44:27'),
(33, 33, 1, '3', 0, '2019-05-21 02:44:27'),
(34, 34, 1, '0', 0, '2019-05-21 02:44:27'),
(35, 35, 1, '3', 0, '2019-05-21 02:44:27'),
(36, 36, 1, '3', 0, '2019-05-21 02:44:27'),
(37, 37, 1, '7', 5, '2019-05-21 02:44:55'),
(38, 38, 1, '3', 0, '2019-05-21 02:44:27'),
(39, 39, 1, '3', 0, '2019-05-21 02:44:27'),
(40, 40, 1, '3', 0, '2019-05-21 02:44:27'),
(41, 41, 1, '3', 0, '2019-05-21 02:44:27'),
(42, 42, 1, '3', 0, '2019-05-21 02:44:27'),
(43, 43, 1, '3', 0, '2019-05-21 02:44:27'),
(44, 44, 1, '3', 0, '2019-05-21 02:44:27'),
(45, 45, 1, '3', 0, '2019-05-21 02:44:27'),
(46, 46, 1, '3', 0, '2019-05-21 02:44:27'),
(47, 47, 1, '3', 0, '2019-05-21 02:44:27'),
(48, 48, 1, '3', 0, '2019-05-21 02:44:27'),
(49, 49, 1, '3', 0, '2019-05-21 02:44:27'),
(50, 50, 1, '3', 0, '2019-05-21 02:44:27'),
(51, 51, 1, '3', 0, '2019-05-21 02:44:27'),
(52, 52, 1, '3', 0, '2019-05-21 02:44:27'),
(53, 53, 1, '3', 0, '2019-05-21 02:44:27'),
(54, 54, 1, '3', 0, '2019-05-21 02:44:27'),
(55, 55, 1, '3', 0, '2019-05-21 02:44:27'),
(56, 56, 1, '3', 0, '2019-05-21 02:44:27'),
(57, 57, 1, '4', 0, '2019-05-21 02:44:27'),
(58, 58, 1, '3', 0, '2019-05-21 02:44:27'),
(59, 59, 1, '3', 0, '2019-05-21 02:44:27'),
(60, 60, 1, '3', 0, '2019-05-21 02:44:27'),
(61, 61, 1, '3', 0, '2019-05-21 02:44:27'),
(62, 62, 1, '3', 0, '2019-05-21 02:44:27'),
(63, 63, 1, '3', 0, '2019-05-21 02:44:27'),
(64, 64, 1, '3', 0, '2019-05-21 02:44:27'),
(65, 65, 1, '3', 0, '2019-05-21 02:44:27'),
(66, 66, 1, '3', 0, '2019-05-21 02:44:27'),
(67, 67, 1, '3', 0, '2019-05-21 02:44:27'),
(68, 68, 1, '3', 0, '2019-05-21 02:44:27'),
(69, 69, 1, '3', 0, '2019-05-21 02:44:27'),
(70, 70, 1, '3', 0, '2019-05-21 02:44:27'),
(71, 71, 1, '0', 0, '2019-05-21 02:44:27'),
(72, 72, 1, '0', 0, '2019-05-21 02:44:27'),
(73, 73, 1, '3', 0, '2019-05-21 02:44:27'),
(74, 1, 2, '352', 0, '2019-05-21 02:44:27'),
(75, 2, 2, '4913', 0, '2019-05-21 02:44:27'),
(76, 3, 2, '20', 0, '2019-05-21 02:44:27'),
(77, 4, 2, '8000', 0, '2019-05-21 02:44:27'),
(78, 5, 2, '20', 0, '2019-05-21 02:44:27'),
(79, 6, 2, '17', 0, '2019-05-21 02:44:27'),
(80, 7, 2, '17', 0, '2019-05-21 02:44:27'),
(81, 8, 2, '51', 0, '2019-05-21 02:44:27'),
(82, 9, 2, '51', 0, '2019-05-21 02:44:27'),
(83, 10, 2, '17', 0, '2019-05-21 02:44:27'),
(84, 11, 2, '60', 0, '2019-05-21 02:44:27'),
(85, 12, 2, '51', 0, '2019-05-21 02:44:27'),
(86, 13, 2, '20', 0, '2019-05-21 02:44:27'),
(87, 14, 2, '17', 0, '2019-05-21 02:44:27'),
(88, 15, 2, '187', 5, '2019-05-21 02:51:11'),
(89, 16, 2, '179', 0, '2019-05-21 02:44:27'),
(90, 17, 2, '190', 0, '2019-05-21 02:44:27'),
(91, 18, 2, '187', 5, '2019-05-21 02:51:11'),
(92, 19, 2, '179', 0, '2019-05-21 02:44:27'),
(93, 20, 2, '374', 0, '2019-05-21 02:44:27'),
(94, 21, 2, '332', 0, '2019-05-21 02:44:27'),
(95, 22, 2, '57', 0, '2019-05-21 02:44:27'),
(96, 23, 2, '57', 0, '2019-05-21 02:44:27'),
(97, 24, 2, '4913', 0, '2019-05-21 02:44:27'),
(98, 25, 2, '60', 0, '2019-05-21 02:44:27'),
(99, 26, 2, '57', 0, '2019-05-21 02:44:27'),
(100, 27, 2, '196', 0, '2019-05-21 02:44:27'),
(101, 28, 2, '164', 0, '2019-05-21 02:44:27'),
(102, 29, 2, '4913', 0, '2019-05-21 02:44:27'),
(103, 30, 2, '4913', 0, '2019-05-21 02:44:27'),
(104, 31, 2, '60', 0, '2019-05-21 02:44:27'),
(105, 32, 2, '57', 0, '2019-05-21 02:44:27'),
(106, 33, 2, '17', 0, '2019-05-21 02:44:27'),
(107, 34, 2, '179', 0, '2019-05-21 02:44:27'),
(108, 35, 2, '4913', 0, '2019-05-21 02:44:27'),
(109, 36, 2, '17', 0, '2019-05-21 02:44:27'),
(110, 37, 2, '17', 0, '2019-05-21 02:44:27'),
(111, 38, 2, '2575', 0, '2019-05-21 02:44:27'),
(112, 39, 2, '190', 0, '2019-05-21 02:44:27'),
(113, 40, 2, '1000', 0, '2019-05-21 02:44:27'),
(114, 41, 2, '400', 0, '2019-05-21 02:44:27'),
(115, 42, 2, '2575', 0, '2019-05-21 02:44:27'),
(116, 43, 2, '187', 5, '2019-05-21 02:51:11'),
(117, 44, 2, '180', 0, '2019-05-21 02:44:27'),
(118, 45, 2, '17', 0, '2019-05-21 02:44:27'),
(119, 46, 2, '170', 0, '2019-05-21 02:44:27'),
(120, 47, 2, '187', 5, '2019-05-21 02:51:11'),
(121, 48, 2, '20', 0, '2019-05-21 02:44:27'),
(122, 49, 2, '51', 0, '2019-05-21 02:44:27'),
(123, 50, 2, '60', 0, '2019-05-21 02:44:27'),
(124, 51, 2, '170', 0, '2019-05-21 02:44:27'),
(125, 52, 2, '170', 0, '2019-05-21 02:44:27'),
(126, 53, 2, '23', 0, '2019-05-21 02:44:27'),
(127, 54, 2, '51', 0, '2019-05-21 02:44:27'),
(128, 55, 2, '17', 0, '2019-05-21 02:44:27'),
(129, 56, 2, '170', 0, '2019-05-21 02:44:27'),
(130, 57, 2, '188', 0, '2019-05-21 02:44:27'),
(131, 58, 2, '60', 0, '2019-05-21 02:44:28'),
(132, 59, 2, '170', 0, '2019-05-21 02:44:28'),
(133, 60, 2, '20', 0, '2019-05-21 02:44:28'),
(134, 61, 2, '196', 0, '2019-05-21 02:44:28'),
(135, 62, 2, '196', 0, '2019-05-21 02:44:28'),
(136, 63, 2, '60', 0, '2019-05-21 02:44:28'),
(137, 64, 2, '17', 0, '2019-05-21 02:44:28'),
(138, 65, 2, '163', 0, '2019-05-21 02:44:28'),
(139, 66, 2, '200', 0, '2019-05-21 02:44:28'),
(140, 67, 2, '17', 0, '2019-05-21 02:44:28'),
(141, 68, 2, '20', 0, '2019-05-21 02:44:28'),
(142, 69, 2, '192', 0, '2019-05-21 02:44:28'),
(143, 70, 2, '180', 0, '2019-05-21 02:44:28'),
(144, 71, 2, '60', 0, '2019-05-21 02:44:28'),
(145, 72, 2, '17', 0, '2019-05-21 02:44:28'),
(146, 73, 2, '187', 5, '2019-05-21 02:51:11'),
(147, 1, 3, '38', 0, '2019-05-21 02:44:28'),
(148, 2, 3, '62', 5, '2019-05-21 02:51:33'),
(149, 3, 3, '62', 5, '2019-05-21 02:51:33'),
(150, 4, 3, '62', 5, '2019-05-21 02:51:33'),
(151, 5, 3, '60', 0, '2019-05-21 02:44:28'),
(152, 6, 3, '62', 5, '2019-05-21 02:51:33'),
(153, 7, 3, '62', 5, '2019-05-21 02:51:33'),
(154, 8, 3, '62', 5, '2019-05-21 02:51:33'),
(155, 9, 3, '50', 0, '2019-05-21 02:44:28'),
(156, 10, 3, '62', 5, '2019-05-21 02:51:33'),
(157, 11, 3, '62', 5, '2019-05-21 02:51:33'),
(158, 12, 3, '62', 5, '2019-05-21 02:51:33'),
(159, 13, 3, '64', 0, '2019-05-21 02:44:28'),
(160, 14, 3, '62', 5, '2019-05-21 02:51:33'),
(161, 15, 3, '38', 0, '2019-05-21 02:44:28'),
(162, 16, 3, '50', 0, '2019-05-21 02:44:28'),
(163, 17, 3, '62', 5, '2019-05-21 02:51:33'),
(164, 18, 3, '62', 5, '2019-05-21 02:51:33'),
(165, 19, 3, '50', 0, '2019-05-21 02:44:28'),
(166, 20, 3, '62', 5, '2019-05-21 02:51:33'),
(167, 21, 3, '120', 0, '2019-05-21 02:44:28'),
(168, 22, 3, '62', 5, '2019-05-21 02:51:33'),
(169, 23, 3, '63', 0, '2019-05-21 02:44:28'),
(170, 24, 3, '50', 0, '2019-05-21 02:44:28'),
(171, 25, 3, '30', 0, '2019-05-21 02:44:28'),
(172, 26, 3, '62', 5, '2019-05-21 02:51:33'),
(173, 27, 3, '120', 0, '2019-05-21 02:44:28'),
(174, 28, 3, '120', 0, '2019-05-21 02:44:28'),
(175, 29, 3, '62', 5, '2019-05-21 02:51:33'),
(176, 30, 3, '62', 5, '2019-05-21 02:51:33'),
(177, 31, 3, '50', 0, '2019-05-21 02:44:28'),
(178, 32, 3, '60', 0, '2019-05-21 02:44:28'),
(179, 33, 3, '52', 0, '2019-05-21 02:44:28'),
(180, 34, 3, '70', 0, '2019-05-21 02:44:28'),
(181, 35, 3, '62', 5, '2019-05-21 02:51:33'),
(182, 36, 3, '62', 5, '2019-05-21 02:51:33'),
(183, 37, 3, '60', 0, '2019-05-21 02:44:28'),
(184, 38, 3, '62', 5, '2019-05-21 02:51:33'),
(185, 39, 3, '62', 5, '2019-05-21 02:51:33'),
(186, 40, 3, '62', 5, '2019-05-21 02:51:33'),
(187, 41, 3, '62', 5, '2019-05-21 02:51:33'),
(188, 42, 3, '62', 5, '2019-05-21 02:51:33'),
(189, 43, 3, '60', 0, '2019-05-21 02:44:28'),
(190, 44, 3, '62', 5, '2019-05-21 02:51:33'),
(191, 45, 3, '81', 0, '2019-05-21 02:44:28'),
(192, 46, 3, '66', 0, '2019-05-21 02:44:28'),
(193, 47, 3, '65', 0, '2019-05-21 02:44:28'),
(194, 48, 3, '62', 5, '2019-05-21 02:51:33'),
(195, 49, 3, '62', 5, '2019-05-21 02:51:33'),
(196, 50, 3, '62', 5, '2019-05-21 02:51:33'),
(197, 51, 3, '62', 5, '2019-05-21 02:51:33'),
(198, 52, 3, '62', 5, '2019-05-21 02:51:33'),
(199, 53, 3, '62', 5, '2019-05-21 02:51:33'),
(200, 54, 3, '62', 5, '2019-05-21 02:51:33'),
(201, 55, 3, '62', 5, '2019-05-21 02:51:33'),
(202, 56, 3, '62', 5, '2019-05-21 02:51:33'),
(203, 57, 3, '80', 0, '2019-05-21 02:44:28'),
(204, 58, 3, '62', 5, '2019-05-21 02:51:33'),
(205, 59, 3, '62', 5, '2019-05-21 02:51:33'),
(206, 60, 3, '62', 5, '2019-05-21 02:51:33'),
(207, 61, 3, '62', 5, '2019-05-21 02:51:33'),
(208, 62, 3, '62', 5, '2019-05-21 02:51:33'),
(209, 63, 3, '62', 5, '2019-05-21 02:51:34'),
(210, 64, 3, '62', 5, '2019-05-21 02:51:34'),
(211, 65, 3, '62', 5, '2019-05-21 02:51:34'),
(212, 66, 3, '62', 5, '2019-05-21 02:51:34'),
(213, 67, 3, '62', 5, '2019-05-21 02:51:34'),
(214, 68, 3, '62', 5, '2019-05-21 02:51:34'),
(215, 69, 3, '62', 5, '2019-05-21 02:51:34'),
(216, 70, 3, '62', 5, '2019-05-21 02:51:34'),
(217, 71, 3, '62', 5, '2019-05-21 02:51:34'),
(218, 72, 3, '52', 0, '2019-05-21 02:44:28'),
(219, 73, 3, '28', 0, '2019-05-21 02:44:28'),
(220, 1, 4, '62', 0, '2019-05-21 02:44:28'),
(221, 2, 4, '38', 5, '2019-05-21 02:51:33'),
(222, 3, 4, '38', 5, '2019-05-21 02:51:33'),
(223, 4, 4, '38', 5, '2019-05-21 02:51:33'),
(224, 5, 4, '40', 0, '2019-05-21 02:44:28'),
(225, 6, 4, '38', 5, '2019-05-21 02:51:33'),
(226, 7, 4, '38', 5, '2019-05-21 02:51:33'),
(227, 8, 4, '38', 5, '2019-05-21 02:51:33'),
(228, 9, 4, '50', 0, '2019-05-21 02:44:28'),
(229, 10, 4, '38', 5, '2019-05-21 02:51:33'),
(230, 11, 4, '38', 5, '2019-05-21 02:51:33'),
(231, 12, 4, '38', 5, '2019-05-21 02:51:33'),
(232, 13, 4, '32', 0, '2019-05-21 02:44:28'),
(233, 14, 4, '38', 5, '2019-05-21 02:51:33'),
(234, 15, 4, '50', 0, '2019-05-21 02:44:28'),
(235, 16, 4, '50', 0, '2019-05-21 02:44:28'),
(236, 17, 4, '38', 5, '2019-05-21 02:51:33'),
(237, 18, 4, '38', 5, '2019-05-21 02:51:33'),
(238, 19, 4, '50', 0, '2019-05-21 02:44:28'),
(239, 20, 4, '38', 5, '2019-05-21 02:51:33'),
(240, 21, 4, '16', 0, '2019-05-21 02:44:28'),
(241, 22, 4, '38', 5, '2019-05-21 02:51:33'),
(242, 23, 4, '37', 0, '2019-05-21 02:44:28'),
(243, 24, 4, '50', 0, '2019-05-21 02:44:28'),
(244, 25, 4, '70', 0, '2019-05-21 02:44:28'),
(245, 26, 4, '38', 5, '2019-05-21 02:51:33'),
(246, 27, 4, '32', 0, '2019-05-21 02:44:28'),
(247, 28, 4, '14', 0, '2019-05-21 02:44:28'),
(248, 29, 4, '38', 5, '2019-05-21 02:51:33'),
(249, 30, 4, '38', 5, '2019-05-21 02:51:33'),
(250, 31, 4, '50', 0, '2019-05-21 02:44:28'),
(251, 32, 4, '40', 0, '2019-05-21 02:44:28'),
(252, 33, 4, '48', 0, '2019-05-21 02:44:28'),
(253, 34, 4, '30', 0, '2019-05-21 02:44:28'),
(254, 35, 4, '38', 5, '2019-05-21 02:51:33'),
(255, 36, 4, '38', 5, '2019-05-21 02:51:33'),
(256, 37, 4, '40', 0, '2019-05-21 02:44:28'),
(257, 38, 4, '38', 5, '2019-05-21 02:51:33'),
(258, 39, 4, '38', 5, '2019-05-21 02:51:33'),
(259, 40, 4, '38', 5, '2019-05-21 02:51:33'),
(260, 41, 4, '38', 5, '2019-05-21 02:51:33'),
(261, 42, 4, '38', 5, '2019-05-21 02:51:33'),
(262, 43, 4, '40', 0, '2019-05-21 02:44:28'),
(263, 44, 4, '38', 5, '2019-05-21 02:51:33'),
(264, 45, 4, '19', 0, '2019-05-21 02:44:28'),
(265, 46, 4, '34', 0, '2019-05-21 02:44:28'),
(266, 47, 4, '36', 0, '2019-05-21 02:44:28'),
(267, 48, 4, '38', 5, '2019-05-21 02:51:33'),
(268, 49, 4, '38', 5, '2019-05-21 02:51:33'),
(269, 50, 4, '38', 5, '2019-05-21 02:51:33'),
(270, 51, 4, '38', 5, '2019-05-21 02:51:33'),
(271, 52, 4, '38', 5, '2019-05-21 02:51:33'),
(272, 53, 4, '38', 5, '2019-05-21 02:51:33'),
(273, 54, 4, '38', 5, '2019-05-21 02:51:33'),
(274, 55, 4, '38', 5, '2019-05-21 02:51:33'),
(275, 56, 4, '28', 0, '2019-05-21 02:44:28'),
(276, 57, 4, '80', 0, '2019-05-21 02:44:28'),
(277, 58, 4, '38', 5, '2019-05-21 02:51:33'),
(278, 59, 4, '38', 5, '2019-05-21 02:51:33'),
(279, 60, 4, '38', 5, '2019-05-21 02:51:33'),
(280, 61, 4, '38', 5, '2019-05-21 02:51:33'),
(281, 62, 4, '38', 5, '2019-05-21 02:51:33'),
(282, 63, 4, '38', 5, '2019-05-21 02:51:34'),
(283, 64, 4, '38', 5, '2019-05-21 02:51:34'),
(284, 65, 4, '38', 5, '2019-05-21 02:51:34'),
(285, 66, 4, '38', 5, '2019-05-21 02:51:34'),
(286, 67, 4, '38', 5, '2019-05-21 02:51:34'),
(287, 68, 4, '38', 5, '2019-05-21 02:51:34'),
(288, 69, 4, '32', 0, '2019-05-21 02:44:28'),
(289, 70, 4, '38', 5, '2019-05-21 02:51:34'),
(290, 71, 4, '38', 5, '2019-05-21 02:51:34'),
(291, 72, 4, '48', 0, '2019-05-21 02:44:28'),
(292, 73, 4, '72', 0, '2019-05-21 02:44:28'),
(293, 1, 5, '4,2=7,6', 0, '2019-05-21 02:44:28'),
(294, 2, 5, '6 x 7 = 42', 0, '2019-05-21 02:44:28'),
(295, 3, 5, '7^2 = 49', 0, '2019-05-21 02:44:28'),
(296, 4, 5, '6 x 7 = 42', 0, '2019-05-21 02:44:28'),
(297, 5, 5, '7 x 6 = 42', 0, '2019-05-21 02:44:28'),
(298, 6, 5, '6 * 7 = 42', 0, '2019-05-21 02:44:28'),
(299, 7, 5, '6 X 7 = 42', 0, '2019-05-21 02:44:28'),
(300, 8, 5, '2 4 = 6 7', 0, '2019-05-21 02:44:28'),
(301, 9, 5, '6 x 7 = 42', 0, '2019-05-21 02:44:28'),
(302, 10, 5, '7 ^2 = 49', 5, '2019-05-21 02:52:05'),
(303, 11, 5, '6x7=42', 0, '2019-05-21 02:44:28'),
(304, 12, 5, '7 ^ 2 = 49', 5, '2019-05-21 02:52:05'),
(305, 13, 5, '2 x 4 = 6 + 7', 0, '2019-05-21 02:44:28'),
(306, 14, 5, '6(7) = 42', 0, '2019-05-21 02:44:28'),
(307, 15, 5, '2467', 0, '2019-05-21 02:44:28'),
(308, 16, 5, '0=0', 0, '2019-05-21 02:44:28'),
(309, 17, 5, '24/=67', 0, '2019-05-21 02:44:28'),
(310, 18, 5, '74 = 74', 0, '2019-05-21 02:44:28'),
(311, 19, 5, '0=0', 0, '2019-05-21 02:44:28'),
(312, 20, 5, 'Don\'t know', 0, '2019-05-21 02:44:28'),
(313, 21, 5, ' 4 6 = 4 2', 0, '2019-05-21 02:44:28'),
(314, 22, 5, '7 - 4  6/2', 0, '2019-05-21 02:44:28'),
(315, 23, 5, '2 4 = 6 7', 0, '2019-05-21 02:44:28'),
(316, 24, 5, '7 x 6 = 42', 0, '2019-05-21 02:44:28'),
(317, 25, 5, '6/2 = 7 - 4', 0, '2019-05-21 02:44:28'),
(318, 26, 5, '4 - 2 = 9 - 7', 0, '2019-05-21 02:44:28'),
(319, 27, 5, '2 4 = 6 7', 0, '2019-05-21 02:44:28'),
(320, 28, 5, '2  4 = 6 7', 0, '2019-05-21 02:44:28'),
(321, 29, 5, '7 - 2 = 9 - 4', 0, '2019-05-21 02:44:28'),
(322, 30, 5, '6/2 = 7 - 4', 0, '2019-05-21 02:44:28'),
(323, 31, 5, '2 4 = 6 7', 0, '2019-05-21 02:44:28'),
(324, 32, 5, '2 4 = 6 7', 0, '2019-05-21 02:44:28'),
(325, 33, 5, '2 4 = 6 7', 0, '2019-05-21 02:44:28'),
(326, 34, 5, '7 - 2 + 4 = 9', 0, '2019-05-21 02:44:28'),
(327, 35, 5, '7 ^ 2 = 49', 0, '2019-05-21 02:44:28'),
(328, 36, 5, '49 = 7 ^ 2', 0, '2019-05-21 02:44:28'),
(329, 37, 5, '6 - 2 = 4', 0, '2019-05-21 02:44:28'),
(330, 38, 5, '2467=', 0, '2019-05-21 02:44:28'),
(331, 39, 5, '2467', 0, '2019-05-21 02:44:28'),
(332, 40, 5, '6=247', 0, '2019-05-21 02:44:28'),
(333, 41, 5, '2467', 0, '2019-05-21 02:44:28'),
(334, 42, 5, '2467=', 0, '2019-05-21 02:44:28'),
(335, 43, 5, '6 / 2 = 7 - 4', 0, '2019-05-21 02:44:28'),
(336, 44, 5, '6/2 = 7-4', 0, '2019-05-21 02:44:28'),
(337, 45, 5, '6/2=7-4', 0, '2019-05-21 02:44:28'),
(338, 46, 5, '7 - 4 = 6/2', 0, '2019-05-21 02:44:28'),
(339, 47, 5, '6 x 7 = 42', 0, '2019-05-21 02:44:28'),
(340, 48, 5, '7^2 = 49', 0, '2019-05-21 02:44:28'),
(341, 49, 5, '7-4=6/2', 0, '2019-05-21 02:44:28'),
(342, 50, 5, '7-4=6/2', 0, '2019-05-21 02:44:28'),
(343, 51, 5, '7^2 = 49', 0, '2019-05-21 02:44:28'),
(344, 52, 5, '7-4=6/2', 0, '2019-05-21 02:44:28'),
(345, 53, 5, '6/2=7-4', 0, '2019-05-21 02:44:28'),
(346, 54, 5, '6/2=7-4', 0, '2019-05-21 02:44:28'),
(347, 55, 5, '6/2=7-4 ', 0, '2019-05-21 02:44:28'),
(348, 56, 5, '7-4=6/2', 0, '2019-05-21 02:44:28'),
(349, 57, 5, '2 4 = 6 7 ', 0, '2019-05-21 02:44:28'),
(350, 58, 5, '7-4=6/2', 0, '2019-05-21 02:44:28'),
(351, 59, 5, '6/2 = 7-4', 0, '2019-05-21 02:44:28'),
(352, 60, 5, '7-4 = 6/ 2', 0, '2019-05-21 02:44:28'),
(353, 61, 5, '2 6 = 4 7 ', 0, '2019-05-21 02:44:28'),
(354, 62, 5, '2 6 = 4 7 ', 0, '2019-05-21 02:44:28'),
(355, 63, 5, '6 / 2 = 7 - 4', 0, '2019-05-21 02:44:28'),
(356, 64, 5, '7-4 = 6/2', 0, '2019-05-21 02:44:28'),
(357, 65, 5, '2 4 = 6 7 ', 0, '2019-05-21 02:44:28'),
(358, 66, 5, '6 / 2 = 7 - 4', 0, '2019-05-21 02:44:28'),
(359, 67, 5, '7-4=6/2', 0, '2019-05-21 02:44:28'),
(360, 68, 5, '6 / 2= 7-4', 0, '2019-05-21 02:44:28'),
(361, 69, 5, '2 6 = 4 7 ', 0, '2019-05-21 02:44:28'),
(362, 70, 5, '7-4=6/2', 0, '2019-05-21 02:44:28'),
(363, 71, 5, '6/ 2 = 7 - 4', 0, '2019-05-21 02:44:28'),
(364, 72, 5, '6 / 2 = 7 - 4', 0, '2019-05-21 02:44:28'),
(365, 73, 5, '26=74', 0, '2019-05-21 02:44:28'),
(366, 1, 6, 'C', 5, '2019-05-21 02:52:23'),
(367, 2, 6, 'A', 0, '2019-05-21 02:44:28'),
(368, 3, 6, 'B', 0, '2019-05-21 02:44:28'),
(369, 4, 6, 'A', 0, '2019-05-21 02:44:28'),
(370, 5, 6, 'A', 0, '2019-05-21 02:44:28'),
(371, 6, 6, 'C', 5, '2019-05-21 02:52:23'),
(372, 7, 6, 'A', 0, '2019-05-21 02:44:28'),
(373, 8, 6, 'C', 5, '2019-05-21 02:52:23'),
(374, 9, 6, 'A', 0, '2019-05-21 02:44:28'),
(375, 10, 6, 'C', 5, '2019-05-21 02:52:23'),
(376, 11, 6, 'B', 0, '2019-05-21 02:44:28'),
(377, 12, 6, 'A', 0, '2019-05-21 02:44:28'),
(378, 13, 6, 'A', 0, '2019-05-21 02:44:28'),
(379, 14, 6, 'C', 5, '2019-05-21 02:52:23'),
(380, 15, 6, 'C', 5, '2019-05-21 02:52:23'),
(381, 16, 6, 'C', 5, '2019-05-21 02:52:23'),
(382, 17, 6, 'C', 5, '2019-05-21 02:52:23'),
(383, 18, 6, 'C', 5, '2019-05-21 02:52:23'),
(384, 19, 6, 'C', 5, '2019-05-21 02:52:23'),
(385, 20, 6, 'C', 5, '2019-05-21 02:52:23'),
(386, 21, 6, 'B', 0, '2019-05-21 02:44:28'),
(387, 22, 6, 'C', 5, '2019-05-21 02:52:23'),
(388, 23, 6, 'C', 5, '2019-05-21 02:52:23'),
(389, 24, 6, 'C', 5, '2019-05-21 02:52:23'),
(390, 25, 6, 'C', 5, '2019-05-21 02:52:23'),
(391, 26, 6, 'C', 5, '2019-05-21 02:52:23'),
(392, 27, 6, 'B', 0, '2019-05-21 02:44:28'),
(393, 28, 6, 'C', 5, '2019-05-21 02:52:23'),
(394, 29, 6, 'C', 5, '2019-05-21 02:52:23'),
(395, 30, 6, 'C', 5, '2019-05-21 02:52:23'),
(396, 31, 6, 'B', 0, '2019-05-21 02:44:28'),
(397, 32, 6, 'C', 5, '2019-05-21 02:52:23'),
(398, 33, 6, 'C', 5, '2019-05-21 02:52:23'),
(399, 34, 6, 'A', 0, '2019-05-21 02:44:28'),
(400, 35, 6, 'A', 0, '2019-05-21 02:44:28'),
(401, 36, 6, 'C', 5, '2019-05-21 02:52:23'),
(402, 37, 6, 'C', 5, '2019-05-21 02:52:23'),
(403, 38, 6, 'C', 5, '2019-05-21 02:52:23'),
(404, 39, 6, 'C', 5, '2019-05-21 02:52:23'),
(405, 40, 6, 'C', 5, '2019-05-21 02:52:23'),
(406, 41, 6, 'C', 5, '2019-05-21 02:52:23'),
(407, 42, 6, 'C', 5, '2019-05-21 02:52:23'),
(408, 43, 6, 'C', 5, '2019-05-21 02:52:23'),
(409, 44, 6, 'C', 5, '2019-05-21 02:52:23'),
(410, 45, 6, 'C', 5, '2019-05-21 02:52:23'),
(411, 46, 6, 'C', 5, '2019-05-21 02:52:23'),
(412, 47, 6, 'C', 5, '2019-05-21 02:52:23'),
(413, 48, 6, 'C', 5, '2019-05-21 02:52:23'),
(414, 49, 6, 'C', 5, '2019-05-21 02:52:23'),
(415, 50, 6, 'C', 5, '2019-05-21 02:52:23'),
(416, 51, 6, 'C', 5, '2019-05-21 02:52:23'),
(417, 52, 6, 'C', 5, '2019-05-21 02:52:23'),
(418, 53, 6, 'C', 5, '2019-05-21 02:52:23'),
(419, 54, 6, 'C', 5, '2019-05-21 02:52:23'),
(420, 55, 6, 'C', 5, '2019-05-21 02:52:23'),
(421, 56, 6, 'C', 5, '2019-05-21 02:52:23'),
(422, 57, 6, 'B', 0, '2019-05-21 02:44:28'),
(423, 58, 6, 'C', 5, '2019-05-21 02:52:23'),
(424, 59, 6, 'C', 5, '2019-05-21 02:52:23'),
(425, 60, 6, 'C', 5, '2019-05-21 02:52:23'),
(426, 61, 6, 'B', 0, '2019-05-21 02:44:28'),
(427, 62, 6, 'B', 0, '2019-05-21 02:44:28'),
(428, 63, 6, 'C', 5, '2019-05-21 02:52:23'),
(429, 64, 6, 'C', 5, '2019-05-21 02:52:23'),
(430, 65, 6, 'B', 0, '2019-05-21 02:44:28'),
(431, 66, 6, 'C', 5, '2019-05-21 02:52:23'),
(432, 67, 6, 'C', 5, '2019-05-21 02:52:23'),
(433, 68, 6, 'C', 5, '2019-05-21 02:52:23'),
(434, 69, 6, 'B', 0, '2019-05-21 02:44:28'),
(435, 70, 6, 'C', 5, '2019-05-21 02:52:23'),
(436, 71, 6, 'B', 0, '2019-05-21 02:44:28'),
(437, 72, 6, 'A', 0, '2019-05-21 02:44:28'),
(438, 73, 6, 'C', 5, '2019-05-21 02:52:23'),
(439, 1, 6, 'D', 5, '2019-05-21 02:52:23'),
(440, 2, 6, 'B', 0, '2019-05-21 02:44:28'),
(441, 3, 6, 'C', 5, '2019-05-21 02:52:23'),
(442, 4, 6, 'B', 0, '2019-05-21 02:44:28'),
(443, 5, 6, 'D', 5, '2019-05-21 02:52:23'),
(444, 6, 6, 'D', 5, '2019-05-21 02:52:23'),
(445, 7, 6, 'B', 0, '2019-05-21 02:44:28'),
(446, 8, 6, 'D', 5, '2019-05-21 02:52:23'),
(447, 9, 6, 'B', 0, '2019-05-21 02:44:28'),
(448, 10, 6, 'D', 5, '2019-05-21 02:52:23'),
(449, 11, 6, 'C', 5, '2019-05-21 02:52:23'),
(450, 12, 6, 'D', 5, '2019-05-21 02:52:23'),
(451, 13, 6, 'B', 0, '2019-05-21 02:44:28'),
(452, 14, 6, 'D', 5, '2019-05-21 02:52:23'),
(453, 15, 6, 'D', 5, '2019-05-21 02:52:23'),
(454, 16, 6, 'D', 5, '2019-05-21 02:52:23'),
(455, 17, 6, 'D', 5, '2019-05-21 02:52:23'),
(456, 18, 6, 'D', 5, '2019-05-21 02:52:23'),
(457, 19, 6, 'D', 5, '2019-05-21 02:52:23'),
(458, 20, 6, 'D', 5, '2019-05-21 02:52:23'),
(459, 21, 6, 'C', 5, '2019-05-21 02:52:23'),
(460, 22, 6, 'D', 5, '2019-05-21 02:52:23'),
(461, 23, 6, 'D', 5, '2019-05-21 02:52:23'),
(462, 24, 6, 'D', 5, '2019-05-21 02:52:23'),
(463, 25, 6, 'D', 5, '2019-05-21 02:52:23'),
(464, 26, 6, 'D', 5, '2019-05-21 02:52:23'),
(465, 27, 6, 'D', 5, '2019-05-21 02:52:23'),
(466, 28, 6, 'D', 5, '2019-05-21 02:52:23'),
(467, 29, 6, 'D', 5, '2019-05-21 02:52:23'),
(468, 30, 6, 'D', 5, '2019-05-21 02:52:23'),
(469, 31, 6, 'C', 5, '2019-05-21 02:52:23'),
(470, 32, 6, 'D', 5, '2019-05-21 02:52:23'),
(471, 33, 6, 'D', 5, '2019-05-21 02:52:23'),
(472, 34, 6, 'D', 5, '2019-05-21 02:52:23'),
(473, 35, 6, 'D', 5, '2019-05-21 02:52:23'),
(474, 36, 6, 'D', 5, '2019-05-21 02:52:23'),
(475, 37, 6, 'D', 5, '2019-05-21 02:52:23'),
(476, 38, 6, 'D', 5, '2019-05-21 02:52:23'),
(477, 39, 6, 'D', 5, '2019-05-21 02:52:23'),
(478, 40, 6, 'D', 5, '2019-05-21 02:52:23'),
(479, 41, 6, 'D', 5, '2019-05-21 02:52:23'),
(480, 42, 6, 'D', 5, '2019-05-21 02:52:23'),
(481, 43, 6, 'D', 5, '2019-05-21 02:52:23'),
(482, 44, 6, 'D', 5, '2019-05-21 02:52:23'),
(483, 45, 6, 'D', 5, '2019-05-21 02:52:23'),
(484, 46, 6, 'D', 5, '2019-05-21 02:52:23'),
(485, 47, 6, 'D', 5, '2019-05-21 02:52:23'),
(486, 48, 6, 'D', 5, '2019-05-21 02:52:23'),
(487, 49, 6, 'D', 5, '2019-05-21 02:52:23'),
(488, 50, 6, 'D', 5, '2019-05-21 02:52:23'),
(489, 51, 6, 'D', 5, '2019-05-21 02:52:23'),
(490, 52, 6, 'D', 5, '2019-05-21 02:52:23'),
(491, 53, 6, 'D', 5, '2019-05-21 02:52:23'),
(492, 54, 6, 'D', 5, '2019-05-21 02:52:23'),
(493, 55, 6, 'D', 5, '2019-05-21 02:52:23'),
(494, 56, 6, 'D', 5, '2019-05-21 02:52:23'),
(495, 57, 6, 'D', 5, '2019-05-21 02:52:23'),
(496, 58, 6, 'D', 5, '2019-05-21 02:52:23'),
(497, 59, 6, 'D', 5, '2019-05-21 02:52:23'),
(498, 60, 6, 'D', 5, '2019-05-21 02:52:23'),
(499, 61, 6, 'D', 5, '2019-05-21 02:52:23'),
(500, 62, 6, 'D', 5, '2019-05-21 02:52:23'),
(501, 63, 6, 'D', 5, '2019-05-21 02:52:23'),
(502, 64, 6, 'D', 5, '2019-05-21 02:52:23'),
(503, 65, 6, 'D', 5, '2019-05-21 02:52:23'),
(504, 66, 6, 'D', 5, '2019-05-21 02:52:23'),
(505, 67, 6, 'D', 5, '2019-05-21 02:52:23'),
(506, 68, 6, 'D', 5, '2019-05-21 02:52:23'),
(507, 69, 6, 'D', 5, '2019-05-21 02:52:23'),
(508, 70, 6, 'D', 5, '2019-05-21 02:52:23'),
(509, 71, 6, 'D', 5, '2019-05-21 02:52:23'),
(510, 72, 6, 'B', 0, '2019-05-21 02:44:28'),
(511, 73, 6, 'D', 5, '2019-05-21 02:52:23'),
(512, 1, 7, 'Gold box', 5, '2019-05-21 02:52:37'),
(513, 2, 7, 'Gold box', 5, '2019-05-21 02:52:37'),
(514, 3, 7, 'Gold box', 5, '2019-05-21 02:52:37'),
(515, 4, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(516, 5, 7, 'Gold box', 5, '2019-05-21 02:52:37'),
(517, 6, 7, 'Gold box', 5, '2019-05-21 02:52:37'),
(518, 7, 7, 'Gold box', 5, '2019-05-21 02:52:37'),
(519, 8, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(520, 9, 7, 'Red box', 0, '2019-05-21 02:44:28'),
(521, 10, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(522, 11, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(523, 12, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(524, 13, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(525, 14, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(526, 15, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(527, 16, 7, 'Red box', 0, '2019-05-21 02:44:28'),
(528, 17, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(529, 18, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(530, 19, 7, 'Red box', 0, '2019-05-21 02:44:28'),
(531, 20, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(532, 21, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(533, 22, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(534, 23, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(535, 24, 7, 'Red box', 0, '2019-05-21 02:44:28'),
(536, 25, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(537, 26, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(538, 27, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(539, 28, 7, 'Red box', 0, '2019-05-21 02:44:28'),
(540, 29, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(541, 30, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(542, 31, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(543, 32, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(544, 33, 7, 'Red box', 0, '2019-05-21 02:44:28'),
(545, 34, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(546, 35, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(547, 36, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(548, 37, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(549, 38, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(550, 39, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(551, 40, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(552, 41, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(553, 42, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(554, 43, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(555, 44, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(556, 45, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(557, 46, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(558, 47, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(559, 48, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(560, 49, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(561, 50, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(562, 51, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(563, 52, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(564, 53, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(565, 54, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(566, 55, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(567, 56, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(568, 57, 7, 'Red box', 0, '2019-05-21 02:44:28'),
(569, 58, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(570, 59, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(571, 60, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(572, 61, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(573, 62, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(574, 63, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(575, 64, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(576, 65, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(577, 66, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(578, 67, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(579, 68, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(580, 69, 7, 'Silver box', 0, '2019-05-21 02:44:28'),
(581, 70, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(582, 71, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(583, 72, 7, 'Red box', 0, '2019-05-21 02:44:28'),
(584, 73, 7, 'Gold box', 5, '2019-05-21 02:52:38'),
(585, 1, 8, 'Break each stick into 4 parts and burn only 1 part of the each stick.', 0, '2019-05-21 02:44:28'),
(586, 2, 8, 'break a stick into quarter and burn it', 0, '2019-05-21 02:44:28'),
(587, 3, 8, 'break the stick into half and burn it on both ends', 0, '2019-05-21 02:44:28'),
(588, 4, 8, 'cut the stick into half and half and burn it', 0, '2019-05-21 02:44:28'),
(589, 5, 8, 'cut the stick into 4 and burn them', 0, '2019-05-21 02:44:28'),
(590, 6, 8, 'Break the stick into quarter', 0, '2019-05-21 02:44:28'),
(591, 7, 8, 'cut the stick into four . then, burn them and record the time taken', 0, '2019-05-21 02:44:28'),
(592, 8, 8, 'Cut stick into quarters and light them up', 0, '2019-05-21 02:44:28'),
(593, 9, 8, 'cut the stick into half then light it up', 0, '2019-05-21 02:44:28'),
(594, 10, 8, 'burn the stick after cutting into 4', 0, '2019-05-21 02:44:28'),
(595, 11, 8, 'burn the stick on both ends and burn one on one end. then burn the other end of the another stick', 0, '2019-05-21 02:44:28'),
(596, 12, 8, 'Mark the stick into four equal parts and burn them until there is one part left', 0, '2019-05-21 02:44:28'),
(597, 13, 8, 'mark 4 equal parts and burn when first mark is reached', 0, '2019-05-21 02:44:28'),
(598, 14, 8, '-', 0, '2019-05-21 02:44:28'),
(599, 15, 8, 'break one into two, burn that, it is 15 minutes', 0, '2019-05-21 02:44:28'),
(600, 16, 8, 'Half of one wooden will be equal to 15mins', 0, '2019-05-21 02:44:28'),
(601, 17, 8, 'burn one of the stick till half', 0, '2019-05-21 02:44:28'),
(602, 18, 8, 'burn half of a wooden stick', 0, '2019-05-21 02:44:28'),
(603, 19, 8, 'Half of one wooden will be equal to 15mins', 0, '2019-05-21 02:44:28'),
(604, 20, 8, 'Divide the stick into two, so one part will take 15 minutes to burn', 0, '2019-05-21 02:44:28'),
(605, 21, 8, 'Break the candle into 4', 0, '2019-05-21 02:44:28'),
(606, 22, 8, 'cut into two and burn from the beginning of all the sticks', 0, '2019-05-21 02:44:28'),
(607, 23, 8, 'burn both in the middle', 0, '2019-05-21 02:44:28'),
(608, 24, 8, 'cut it into four and burn it ', 0, '2019-05-21 02:44:28'),
(609, 25, 8, 'cut into two and burn it in the middle of the sticks', 0, '2019-05-21 02:44:28'),
(610, 26, 8, 'cut the wooden sticks into four equally, and burn it', 0, '2019-05-21 02:44:28'),
(611, 27, 8, 'Break them into 4', 0, '2019-05-21 02:44:28'),
(612, 28, 8, 'Break the candles to four pieces', 0, '2019-05-21 02:44:28'),
(613, 29, 8, 'burn in 1/4 of the sticks', 0, '2019-05-21 02:44:28'),
(614, 30, 8, 'cross the sticks and burn in the intersection point', 0, '2019-05-21 02:44:28'),
(615, 31, 8, 'use stopwatch', 0, '2019-05-21 02:44:28'),
(616, 32, 8, 'cut it into four sticks and burn ', 0, '2019-05-21 02:44:28'),
(617, 33, 8, '-', 0, '2019-05-21 02:44:28'),
(618, 34, 8, '-', 0, '2019-05-21 02:44:28'),
(619, 35, 8, 'cut into half and burn in the same time', 0, '2019-05-21 02:44:28'),
(620, 36, 8, 'burn the sticks in the same time after breaking each stick into half', 0, '2019-05-21 02:44:28'),
(621, 37, 8, '-', 0, '2019-05-21 02:44:28'),
(622, 38, 8, 'burn half of one stick', 0, '2019-05-21 02:44:28'),
(623, 39, 8, 'burn half of the stick', 0, '2019-05-21 02:44:28'),
(624, 40, 8, 'half of a stick = 15 mins', 0, '2019-05-21 02:44:28'),
(625, 41, 8, '15mins =  half of a stick...burn till half', 0, '2019-05-21 02:44:28'),
(626, 42, 8, 'burn half of one stick', 0, '2019-05-21 02:44:28'),
(627, 43, 8, 'idk', 0, '2019-05-21 02:44:28'),
(628, 44, 8, 'i dont know', 0, '2019-05-21 02:44:28'),
(629, 45, 8, 'Cut the stick into 4 equal length. ', 0, '2019-05-21 02:44:28'),
(630, 46, 8, 'Burn stick until quarter', 0, '2019-05-21 02:44:28'),
(631, 47, 8, '...', 0, '2019-05-21 02:44:28'),
(632, 48, 8, 'break the stick into 4. burn them. record the time', 0, '2019-05-21 02:44:28'),
(633, 49, 8, 'cut sticks into half then half and burn them.', 0, '2019-05-21 02:44:28'),
(634, 50, 8, '0 minutes – Light stick 1 on both sides and stick 2 on one side.\n30 minutes – Stick 1 will be burnt out. Light the other end of stick 2.\n45 minutes – Stick 2 will be burnt out.', 0, '2019-05-21 02:44:28'),
(635, 51, 8, 'burn a stick from both side(stick1). and other stick(stick2) only one side. once stick1 is completely burnt, stop second stick to burn and start burning that stick from both side. it will again take another 15 mins. so total you can complete it in 45 mins.', 0, '2019-05-21 02:44:28'),
(636, 52, 8, 'for 1 n half hour - burn the first stick and by the time it burnt completely then start burning the second stick from both the ends - total time is 1 n half an hour - for first stick 1 hour and second stick half an hour.', 0, '2019-05-21 02:44:28'),
(637, 53, 8, 'For a. 1/2 hour: Burn both sides of a stick (say Stick1), so it would be done burning in 30 min \n\nNow, if you needed to have 1 and 1/2 hours, then simply start burning the next stick (say Stick2), after the first stick (Stick1) is done/burnt. ', 0, '2019-05-21 02:44:28'),
(638, 54, 8, 'cut the stick to four small parts and burn. record time', 0, '2019-05-21 02:44:28'),
(639, 55, 8, 'i am not sure', 0, '2019-05-21 02:44:28'),
(640, 56, 8, 'mark the stick by quarter. burn until the mark', 0, '2019-05-21 02:44:28'),
(641, 57, 8, 'break into 4', 0, '2019-05-21 02:44:28'),
(642, 58, 8, 'just burn the stick', 0, '2019-05-21 02:44:28'),
(643, 59, 8, 'burn two sticks together on both ends.', 0, '2019-05-21 02:44:28'),
(644, 60, 8, 'measure 4 equal parts and mark. burn until the mark drawn', 0, '2019-05-21 02:44:28'),
(645, 61, 8, 'The stick must be broken into 4', 0, '2019-05-21 02:44:28'),
(646, 62, 8, 'The stick must be broken into 4', 0, '2019-05-21 02:44:28'),
(647, 63, 8, 'i dont know...', 0, '2019-05-21 02:44:28'),
(648, 64, 8, 'use a stopwatch and just burn the stick', 0, '2019-05-21 02:44:28'),
(649, 65, 8, 'Take the stick and break them into 4 equal pieces and then burn them', 0, '2019-05-21 02:44:28'),
(650, 66, 8, 'burn after cutting sticks into quarter', 0, '2019-05-21 02:44:28'),
(651, 67, 8, 'cut stick into four of equal length and burn them.', 0, '2019-05-21 02:44:28'),
(652, 68, 8, 'which door will the other guy tell me if i ask him which door leads to freedom?', 0, '2019-05-21 02:44:28'),
(653, 69, 8, 'Break the stick into 4 pieces and burn one of it', 0, '2019-05-21 02:44:28'),
(654, 70, 8, 'burn the sticks after breaking it into four parts', 0, '2019-05-21 02:44:28'),
(655, 71, 8, 'cut stick into 4 of same length and burn them', 0, '2019-05-21 02:44:28'),
(656, 72, 8, 'idk', 0, '2019-05-21 02:44:28'),
(657, 73, 8, 'Burn alf of a stick', 0, '2019-05-21 02:44:28'),
(658, 1, 9, '', 0, '2019-05-21 02:44:28'),
(659, 2, 9, '', 0, '2019-05-21 02:44:28'),
(660, 3, 9, '', 0, '2019-05-21 02:44:28'),
(661, 4, 9, '', 0, '2019-05-21 02:44:28'),
(662, 5, 9, '', 0, '2019-05-21 02:44:28'),
(663, 6, 9, '', 0, '2019-05-21 02:44:28'),
(664, 7, 9, '', 0, '2019-05-21 02:44:29'),
(665, 8, 9, '', 0, '2019-05-21 02:44:29'),
(666, 9, 9, '', 0, '2019-05-21 02:44:29'),
(667, 10, 9, '', 0, '2019-05-21 02:44:29'),
(668, 11, 9, '', 0, '2019-05-21 02:44:29'),
(669, 12, 9, '', 0, '2019-05-21 02:44:29'),
(670, 13, 9, '', 0, '2019-05-21 02:44:29'),
(671, 14, 9, '', 0, '2019-05-21 02:44:29'),
(672, 15, 9, '', 0, '2019-05-21 02:44:29'),
(673, 16, 9, '', 0, '2019-05-21 02:44:29'),
(674, 17, 9, '', 0, '2019-05-21 02:44:29'),
(675, 18, 9, '', 0, '2019-05-21 02:44:29'),
(676, 19, 9, '', 0, '2019-05-21 02:44:29'),
(677, 20, 9, '', 0, '2019-05-21 02:44:29'),
(678, 21, 9, '', 0, '2019-05-21 02:44:29'),
(679, 22, 9, '', 0, '2019-05-21 02:44:29'),
(680, 23, 9, '', 0, '2019-05-21 02:44:29'),
(681, 24, 9, '', 0, '2019-05-21 02:44:29'),
(682, 25, 9, '', 0, '2019-05-21 02:44:29'),
(683, 26, 9, '', 0, '2019-05-21 02:44:29'),
(684, 27, 9, '', 0, '2019-05-21 02:44:29'),
(685, 28, 9, '', 0, '2019-05-21 02:44:29'),
(686, 29, 9, '', 0, '2019-05-21 02:44:29'),
(687, 30, 9, '', 0, '2019-05-21 02:44:29'),
(688, 31, 9, '', 0, '2019-05-21 02:44:29'),
(689, 32, 9, '', 0, '2019-05-21 02:44:29'),
(690, 33, 9, '', 0, '2019-05-21 02:44:29'),
(691, 34, 9, '', 0, '2019-05-21 02:44:29'),
(692, 35, 9, '', 0, '2019-05-21 02:44:29'),
(693, 36, 9, '', 0, '2019-05-21 02:44:29'),
(694, 37, 9, '', 0, '2019-05-21 02:44:29'),
(695, 38, 9, '', 0, '2019-05-21 02:44:29'),
(696, 39, 9, '', 0, '2019-05-21 02:44:29'),
(697, 40, 9, '', 0, '2019-05-21 02:44:29'),
(698, 41, 9, '', 0, '2019-05-21 02:44:29'),
(699, 42, 9, '', 0, '2019-05-21 02:44:29'),
(700, 43, 9, '', 0, '2019-05-21 02:44:29'),
(701, 44, 9, '', 0, '2019-05-21 02:44:29'),
(702, 45, 9, '', 0, '2019-05-21 02:44:29'),
(703, 46, 9, '', 0, '2019-05-21 02:44:29'),
(704, 47, 9, '', 0, '2019-05-21 02:44:29'),
(705, 48, 9, '', 0, '2019-05-21 02:44:29'),
(706, 49, 9, '', 0, '2019-05-21 02:44:29'),
(707, 50, 9, '', 0, '2019-05-21 02:44:29'),
(708, 51, 9, '', 0, '2019-05-21 02:44:29'),
(709, 52, 9, '', 0, '2019-05-21 02:44:29'),
(710, 53, 9, '', 0, '2019-05-21 02:44:29'),
(711, 54, 9, '', 0, '2019-05-21 02:44:29'),
(712, 55, 9, '', 0, '2019-05-21 02:44:29'),
(713, 56, 9, '', 0, '2019-05-21 02:44:29'),
(714, 57, 9, '', 0, '2019-05-21 02:44:29'),
(715, 58, 9, '', 0, '2019-05-21 02:44:29'),
(716, 59, 9, '', 0, '2019-05-21 02:44:29'),
(717, 60, 9, '', 0, '2019-05-21 02:44:29'),
(718, 61, 9, '', 0, '2019-05-21 02:44:29'),
(719, 62, 9, '', 0, '2019-05-21 02:44:29'),
(720, 63, 9, '', 0, '2019-05-21 02:44:29'),
(721, 64, 9, '', 0, '2019-05-21 02:44:29'),
(722, 65, 9, '', 0, '2019-05-21 02:44:29'),
(723, 66, 9, '', 0, '2019-05-21 02:44:29'),
(724, 67, 9, '', 0, '2019-05-21 02:44:29'),
(725, 68, 9, '', 0, '2019-05-21 02:44:29'),
(726, 69, 9, '', 0, '2019-05-21 02:44:29'),
(727, 70, 9, '', 0, '2019-05-21 02:44:29'),
(728, 71, 9, '', 0, '2019-05-21 02:44:29'),
(729, 72, 9, '', 0, '2019-05-21 02:44:29'),
(730, 73, 9, '', 0, '2019-05-21 02:44:29'),
(731, 1, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(732, 2, 10, 'Fortune Teller', 5, '2019-05-21 02:53:35'),
(733, 3, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(734, 4, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(735, 5, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(736, 6, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(737, 7, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(738, 8, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(739, 9, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(740, 10, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(741, 11, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(742, 12, 10, 'Fortune Teller', 5, '2019-05-21 02:53:36'),
(743, 13, 10, 'Fortune Teller', 5, '2019-05-21 02:53:36'),
(744, 14, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(745, 15, 10, 'Fortune Teller', 5, '2019-05-21 02:53:36'),
(746, 16, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(747, 17, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(748, 18, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(749, 19, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(750, 20, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(751, 21, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(752, 22, 10, 'Fortune Teller', 5, '2019-05-21 02:53:36'),
(753, 23, 10, 'Fortune Teller', 5, '2019-05-21 02:53:36'),
(754, 24, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(755, 25, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(756, 26, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(757, 27, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(758, 28, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(759, 29, 10, 'Fortune Teller', 5, '2019-05-21 02:53:37'),
(760, 30, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(761, 31, 10, 'Fortune Teller', 5, '2019-05-21 02:53:37'),
(762, 32, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(763, 33, 10, 'Fortune Teller', 5, '2019-05-21 02:53:37'),
(764, 34, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(765, 35, 10, 'Fortune Teller', 5, '2019-05-21 02:53:37'),
(766, 36, 10, 'Fortune Teller', 5, '2019-05-21 02:53:37'),
(767, 37, 10, 'Fortune Teller', 5, '2019-05-21 02:53:37'),
(768, 38, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(769, 39, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(770, 40, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(771, 41, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(772, 42, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(773, 43, 10, 'Fortune Teller', 5, '2019-05-21 02:53:37'),
(774, 44, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(775, 45, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(776, 46, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(777, 47, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(778, 48, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(779, 49, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(780, 50, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(781, 51, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(782, 52, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(783, 53, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(784, 54, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(785, 55, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(786, 56, 10, 'Fortune Teller', 5, '2019-05-21 02:53:38'),
(787, 57, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(788, 58, 10, 'Fortune Teller', 5, '2019-05-21 02:53:38'),
(789, 59, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(790, 60, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(791, 61, 10, 'Fortune Teller', 5, '2019-05-21 02:53:38'),
(792, 62, 10, 'Fortune Teller', 5, '2019-05-21 02:53:38'),
(793, 63, 10, 'Fortune Teller', 5, '2019-05-21 02:53:38'),
(794, 64, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(795, 65, 10, 'Fortune Teller', 5, '2019-05-21 02:53:38'),
(796, 66, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(797, 67, 10, 'Fortune Teller', 5, '2019-05-21 02:53:38'),
(798, 68, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(799, 69, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(800, 70, 10, 'Novelist', 0, '2019-05-21 02:44:29'),
(801, 71, 10, 'TV host', 0, '2019-05-21 02:44:29'),
(802, 72, 10, 'Dancer', 0, '2019-05-21 02:44:29'),
(803, 73, 10, 'Fortune Teller', 5, '2019-05-21 02:53:39'),
(804, 1, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(805, 2, 11, 'Novelist', 5, '2019-05-21 02:53:35'),
(806, 3, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(807, 4, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(808, 5, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(809, 6, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(810, 7, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(811, 8, 11, 'Novelist', 5, '2019-05-21 02:53:35'),
(812, 9, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(813, 10, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(814, 11, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(815, 12, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(816, 13, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(817, 14, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(818, 15, 11, 'Novelist', 5, '2019-05-21 02:53:36'),
(819, 16, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(820, 17, 11, 'Novelist', 5, '2019-05-21 02:53:36'),
(821, 18, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(822, 19, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(823, 20, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(824, 21, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(825, 22, 11, 'Novelist', 5, '2019-05-21 02:53:36'),
(826, 23, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(827, 24, 11, 'Novelist', 5, '2019-05-21 02:53:36'),
(828, 25, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(829, 26, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(830, 27, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(831, 28, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(832, 29, 11, 'Novelist', 5, '2019-05-21 02:53:37'),
(833, 30, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(834, 31, 11, 'Novelist', 5, '2019-05-21 02:53:37'),
(835, 32, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(836, 33, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(837, 34, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(838, 35, 11, 'Novelist', 5, '2019-05-21 02:53:37'),
(839, 36, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(840, 37, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(841, 38, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(842, 39, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(843, 40, 11, 'Novelist', 5, '2019-05-21 02:53:37'),
(844, 41, 11, 'Novelist', 5, '2019-05-21 02:53:37'),
(845, 42, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(846, 43, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(847, 44, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(848, 45, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(849, 46, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(850, 47, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(851, 48, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(852, 49, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(853, 50, 11, 'Novelist', 5, '2019-05-21 02:53:37'),
(854, 51, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(855, 52, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(856, 53, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(857, 54, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(858, 55, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(859, 56, 11, 'Novelist', 5, '2019-05-21 02:53:38'),
(860, 57, 11, 'Novelist', 5, '2019-05-21 02:53:38'),
(861, 58, 11, 'Novelist', 5, '2019-05-21 02:53:38'),
(862, 59, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(863, 60, 11, 'Novelist', 5, '2019-05-21 02:53:38'),
(864, 61, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(865, 62, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(866, 63, 11, 'Novelist', 5, '2019-05-21 02:53:38'),
(867, 64, 11, 'Novelist', 5, '2019-05-21 02:53:38'),
(868, 65, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(869, 66, 11, 'Dancer', 0, '2019-05-21 02:44:29'),
(870, 67, 11, 'TV host', 0, '2019-05-21 02:44:29'),
(871, 68, 11, 'Novelist', 5, '2019-05-21 02:53:38'),
(872, 69, 11, 'Novelist', 5, '2019-05-21 02:53:38'),
(873, 70, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(874, 71, 11, 'Novelist', 5, '2019-05-21 02:53:39'),
(875, 72, 11, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(876, 73, 11, 'Novelist', 5, '2019-05-21 02:53:39'),
(877, 1, 12, 'Dancer', 5, '2019-05-21 02:53:35'),
(878, 2, 12, 'Dancer', 5, '2019-05-21 02:53:35'),
(879, 3, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(880, 4, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(881, 5, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(882, 6, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(883, 7, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(884, 8, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(885, 9, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(886, 10, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(887, 11, 12, 'Dancer', 5, '2019-05-21 02:53:36'),
(888, 12, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(889, 13, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(890, 14, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(891, 15, 12, 'Dancer', 5, '2019-05-21 02:53:36'),
(892, 16, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(893, 17, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(894, 18, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(895, 19, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(896, 20, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(897, 21, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(898, 22, 12, 'Dancer', 5, '2019-05-21 02:53:36'),
(899, 23, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(900, 24, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(901, 25, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(902, 26, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(903, 27, 12, 'TRUE', 0, '2019-05-21 02:44:29'),
(904, 28, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(905, 29, 12, 'Dancer', 5, '2019-05-21 02:53:37'),
(906, 30, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(907, 31, 12, 'Dancer', 5, '2019-05-21 02:53:37'),
(908, 32, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(909, 33, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(910, 34, 12, 'Dancer', 5, '2019-05-21 02:53:37'),
(911, 35, 12, 'Dancer', 5, '2019-05-21 02:53:37'),
(912, 36, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(913, 37, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(914, 38, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(915, 39, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(916, 40, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(917, 41, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(918, 42, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(919, 43, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(920, 44, 12, 'Dancer', 5, '2019-05-21 02:53:37'),
(921, 45, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(922, 46, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(923, 47, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(924, 48, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(925, 49, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(926, 50, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(927, 51, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(928, 52, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(929, 53, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(930, 54, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(931, 55, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(932, 56, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(933, 57, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(934, 58, 12, 'Dancer', 5, '2019-05-21 02:53:38'),
(935, 59, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(936, 60, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(937, 61, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(938, 62, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(939, 63, 12, 'Dancer', 5, '2019-05-21 02:53:38'),
(940, 64, 12, 'TV host', 0, '2019-05-21 02:44:29'),
(941, 65, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(942, 66, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(943, 67, 12, 'Dancer', 5, '2019-05-21 02:53:38'),
(944, 68, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(945, 69, 12, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(946, 70, 12, 'Dancer', 5, '2019-05-21 02:53:39'),
(947, 71, 12, 'Dancer', 5, '2019-05-21 02:53:39'),
(948, 72, 12, 'Novelist', 0, '2019-05-21 02:44:29'),
(949, 73, 12, 'Dancer', 5, '2019-05-21 02:53:39'),
(950, 1, 13, 'TV host', 5, '2019-05-21 02:53:35'),
(951, 2, 13, 'TV host', 5, '2019-05-21 02:53:35'),
(952, 3, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(953, 4, 13, 'Novelist', 0, '2019-05-21 02:44:29'),
(954, 5, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(955, 6, 13, 'TV host', 5, '2019-05-21 02:53:35'),
(956, 7, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(957, 8, 13, 'TV host', 5, '2019-05-21 02:53:35'),
(958, 9, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(959, 10, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(960, 11, 13, 'TV host', 5, '2019-05-21 02:53:36'),
(961, 12, 13, 'TV host', 5, '2019-05-21 02:53:36'),
(962, 13, 13, 'TV host', 5, '2019-05-21 02:53:36'),
(963, 14, 13, 'TV host', 5, '2019-05-21 02:53:36'),
(964, 15, 13, 'TV host', 5, '2019-05-21 02:53:36'),
(965, 16, 13, 'TRUE', 0, '2019-05-21 02:44:29'),
(966, 17, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(967, 18, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(968, 19, 13, 'TRUE', 0, '2019-05-21 02:44:29'),
(969, 20, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(970, 21, 13, 'FALSE', 0, '2019-05-21 02:44:29'),
(971, 22, 13, 'TV host', 5, '2019-05-21 02:53:36'),
(972, 23, 13, 'Novelist', 0, '2019-05-21 02:44:29'),
(973, 24, 13, 'TV host', 5, '2019-05-21 02:53:36'),
(974, 25, 13, 'TV host', 5, '2019-05-21 02:53:36'),
(975, 26, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(976, 27, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(977, 28, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(978, 29, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(979, 30, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(980, 31, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(981, 32, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(982, 33, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(983, 34, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(984, 35, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(985, 36, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(986, 37, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(987, 38, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(988, 39, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(989, 40, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(990, 41, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(991, 42, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(992, 43, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(993, 44, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(994, 45, 13, 'TV host', 5, '2019-05-21 02:53:37'),
(995, 46, 13, 'Novelist', 0, '2019-05-21 02:44:29'),
(996, 47, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(997, 48, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(998, 49, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(999, 50, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(1000, 51, 13, 'TV host', 5, '2019-05-21 02:53:38'),
(1001, 52, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(1002, 53, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29');
INSERT INTO `test_answer` (`id`, `testID`, `ansID`, `ans`, `score`, `createdOn`) VALUES
(1003, 54, 13, 'Novelist', 0, '2019-05-21 02:44:29'),
(1004, 55, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(1005, 56, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(1006, 57, 13, 'TV host', 5, '2019-05-21 02:53:38'),
(1007, 58, 13, 'TV host', 5, '2019-05-21 02:53:38'),
(1008, 59, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(1009, 60, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(1010, 61, 13, 'TV host', 5, '2019-05-21 02:53:38'),
(1011, 62, 13, 'TV host', 5, '2019-05-21 02:53:38'),
(1012, 63, 13, 'TV host', 5, '2019-05-21 02:53:38'),
(1013, 64, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(1014, 65, 13, 'TV host', 5, '2019-05-21 02:53:38'),
(1015, 66, 13, 'Novelist', 0, '2019-05-21 02:44:29'),
(1016, 67, 13, 'Novelist', 0, '2019-05-21 02:44:29'),
(1017, 68, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(1018, 69, 13, 'Dancer', 0, '2019-05-21 02:44:29'),
(1019, 70, 13, 'TV host', 5, '2019-05-21 02:53:39'),
(1020, 71, 13, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(1021, 72, 13, 'TV host', 5, '2019-05-21 02:53:39'),
(1022, 73, 13, 'TV host', 5, '2019-05-21 02:53:39'),
(1023, 1, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1024, 2, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1025, 3, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1026, 4, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1027, 5, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1028, 6, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1029, 7, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1030, 8, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1031, 9, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1032, 10, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1033, 11, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1034, 12, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1035, 13, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1036, 14, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1037, 15, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1038, 16, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1039, 17, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1040, 18, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1041, 19, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1042, 20, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1043, 21, 14, 'Dancer', 0, '2019-05-21 02:44:29'),
(1044, 22, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1045, 23, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1046, 24, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1047, 25, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1048, 26, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1049, 27, 14, 'Fortune Teller', 0, '2019-05-21 02:44:29'),
(1050, 28, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1051, 29, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1052, 30, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1053, 31, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1054, 32, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1055, 33, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1056, 34, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1057, 35, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1058, 36, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1059, 37, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1060, 38, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1061, 39, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1062, 40, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1063, 41, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1064, 42, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1065, 43, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1066, 44, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1067, 45, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1068, 46, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1069, 47, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1070, 48, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1071, 49, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1072, 50, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1073, 51, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1074, 52, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1075, 53, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1076, 54, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1077, 55, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1078, 56, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1079, 57, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1080, 58, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1081, 59, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1082, 60, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1083, 61, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1084, 62, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1085, 63, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1086, 64, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1087, 65, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1088, 66, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1089, 67, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1090, 68, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1091, 69, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1092, 70, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1093, 71, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1094, 72, 14, 'TRUE', 0, '2019-05-21 02:44:29'),
(1095, 73, 14, 'FALSE', 0, '2019-05-21 02:44:29'),
(1096, 1, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1097, 2, 15, 'Morning', 5, '2019-05-21 02:53:50'),
(1098, 3, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1099, 4, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1100, 5, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1101, 6, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1102, 7, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1103, 8, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1104, 9, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1105, 10, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1106, 11, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1107, 12, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1108, 13, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1109, 14, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1110, 15, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1111, 16, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1112, 17, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1113, 18, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1114, 19, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1115, 20, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1116, 21, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1117, 22, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1118, 23, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1119, 24, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1120, 25, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1121, 26, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1122, 27, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1123, 28, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1124, 29, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1125, 30, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1126, 31, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1127, 32, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1128, 33, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1129, 34, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1130, 35, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1131, 36, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1132, 37, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1133, 38, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1134, 39, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1135, 40, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1136, 41, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1137, 42, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1138, 43, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1139, 44, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1140, 45, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1141, 46, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1142, 47, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1143, 48, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1144, 49, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1145, 50, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1146, 51, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1147, 52, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1148, 53, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1149, 54, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1150, 55, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1151, 56, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1152, 57, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1153, 58, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1154, 59, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1155, 60, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1156, 61, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1157, 62, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1158, 63, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1159, 64, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1160, 65, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1161, 66, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1162, 67, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1163, 68, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1164, 69, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1165, 70, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1166, 71, 15, 'Morning', 5, '2019-05-21 02:53:51'),
(1167, 72, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1168, 73, 15, 'Afternoon', 0, '2019-05-21 02:44:29'),
(1169, 1, 16, 'The fat one', 5, '2019-05-21 02:53:50'),
(1170, 2, 16, 'The fat one', 5, '2019-05-21 02:53:50'),
(1171, 3, 16, 'The fat one', 5, '2019-05-21 02:53:50'),
(1172, 4, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1173, 5, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1174, 6, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1175, 7, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1176, 8, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1177, 9, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1178, 10, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1179, 11, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1180, 12, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1181, 13, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1182, 14, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1183, 15, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1184, 16, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1185, 17, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1186, 18, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1187, 19, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1188, 20, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1189, 21, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1190, 22, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1191, 23, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1192, 24, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1193, 25, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1194, 26, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1195, 27, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1196, 28, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1197, 29, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1198, 30, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1199, 31, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1200, 32, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1201, 33, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1202, 34, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1203, 35, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1204, 36, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1205, 37, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1206, 38, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1207, 39, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1208, 40, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1209, 41, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1210, 42, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1211, 43, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1212, 44, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1213, 45, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1214, 46, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1215, 47, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1216, 48, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1217, 49, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1218, 50, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1219, 51, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1220, 52, 16, 'The thin one', 0, '2019-05-21 02:44:29'),
(1221, 53, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1222, 54, 16, 'The thin one', 0, '2019-05-21 02:44:30'),
(1223, 55, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1224, 56, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1225, 57, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1226, 58, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1227, 59, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1228, 60, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1229, 61, 16, 'The thin one', 0, '2019-05-21 02:44:30'),
(1230, 62, 16, 'The thin one', 0, '2019-05-21 02:44:30'),
(1231, 63, 16, 'The thin one', 0, '2019-05-21 02:44:30'),
(1232, 64, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1233, 65, 16, 'The thin one', 0, '2019-05-21 02:44:30'),
(1234, 66, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1235, 67, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1236, 68, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1237, 69, 16, 'The thin one', 0, '2019-05-21 02:44:30'),
(1238, 70, 16, 'The thin one', 0, '2019-05-21 02:44:30'),
(1239, 71, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1240, 72, 16, 'The fat one', 5, '2019-05-21 02:53:51'),
(1241, 73, 16, 'The thin one', 0, '2019-05-21 02:44:30'),
(1242, 1, 17, 'Which one of you is telling truth?', 0, '2019-05-21 02:44:30'),
(1243, 2, 17, 'Is the exit behind you safe?', 0, '2019-05-21 02:44:30'),
(1244, 3, 17, 'Is the lion behind your door?', 0, '2019-05-21 02:44:30'),
(1245, 4, 17, 'is it safe to exit from your door?', 0, '2019-05-21 02:44:30'),
(1246, 5, 17, 'are you standing in front of a lion?', 0, '2019-05-21 02:44:30'),
(1247, 6, 17, 'Are standing in front of a safe exit?', 0, '2019-05-21 02:44:30'),
(1248, 7, 17, 'Is the lion behind your exit?', 0, '2019-05-21 02:44:30'),
(1249, 8, 17, 'Is the exit behind you unsafe?', 0, '2019-05-21 02:44:30'),
(1250, 9, 17, 'is it safe if i leave this exit?', 0, '2019-05-21 02:44:30'),
(1251, 10, 17, 'Is there a lion behind your door?', 0, '2019-05-21 02:44:30'),
(1252, 11, 17, 'Is the lion behind the other exit?', 0, '2019-05-21 02:44:30'),
(1253, 12, 17, 'Is there a lion behind the other exit?', 0, '2019-05-21 02:44:30'),
(1254, 13, 17, 'Are you a liar?', 0, '2019-05-21 02:44:30'),
(1255, 14, 17, 'Which way will the other man point to me?', 0, '2019-05-21 02:44:30'),
(1256, 15, 17, 'if i were to ask which exit is safe, what would you say?', 0, '2019-05-21 02:44:30'),
(1257, 16, 17, 'Which is the exit?', 0, '2019-05-21 02:44:30'),
(1258, 17, 17, 'where is the exit?', 0, '2019-05-21 02:44:30'),
(1259, 18, 17, 'which room has the lion in it?', 0, '2019-05-21 02:44:30'),
(1260, 19, 17, 'Which is the exit?', 0, '2019-05-21 02:44:30'),
(1261, 20, 17, 'Will you get out of this room through the door you that exit ?', 0, '2019-05-21 02:44:30'),
(1262, 21, 17, 'Which door is safe? ', 0, '2019-05-21 02:44:30'),
(1263, 22, 17, 'Which door will you exit?', 0, '2019-05-21 02:44:30'),
(1264, 23, 17, 'Which door will you suggest to enter?', 0, '2019-05-21 02:44:30'),
(1265, 24, 17, 'is lion behind you?', 0, '2019-05-21 02:44:30'),
(1266, 25, 17, 'Is the exit behind you safe enough?', 0, '2019-05-21 02:44:30'),
(1267, 26, 17, 'is the exit safe?', 0, '2019-05-21 02:44:30'),
(1268, 27, 17, 'Where is the lion', 0, '2019-05-21 02:44:30'),
(1269, 28, 17, 'Which is safe ', 0, '2019-05-21 02:44:30'),
(1270, 29, 17, 'Can you exit the door behind you?', 0, '2019-05-21 02:44:30'),
(1271, 30, 17, 'which is the safe exit', 0, '2019-05-21 02:44:30'),
(1272, 31, 17, 'is the door a safe exit?', 0, '2019-05-21 02:44:30'),
(1273, 32, 17, 'is the door safe?', 0, '2019-05-21 02:44:30'),
(1274, 33, 17, '-', 0, '2019-05-21 02:44:30'),
(1275, 34, 17, 'Which one will you suggest to enter', 0, '2019-05-21 02:44:30'),
(1276, 35, 17, 'is the lion in the door behind you?', 0, '2019-05-21 02:44:30'),
(1277, 36, 17, 'Which door will you enter?', 0, '2019-05-21 02:44:30'),
(1278, 37, 17, 'is it a safe exit?', 0, '2019-05-21 02:44:30'),
(1279, 38, 17, 'who is lying?', 0, '2019-05-21 02:44:30'),
(1280, 39, 17, 'where is the exit?', 0, '2019-05-21 02:44:30'),
(1281, 40, 17, 'if it is this door will i be safe?', 0, '2019-05-21 02:44:30'),
(1282, 41, 17, 'where is the exit?', 0, '2019-05-21 02:44:30'),
(1283, 42, 17, 'who is lying?', 0, '2019-05-21 02:44:30'),
(1284, 43, 17, 'If i ask which door is safe, which door the other guard will point to?', 0, '2019-05-21 02:44:30'),
(1285, 44, 17, 'Can u go out with me?', 0, '2019-05-21 02:44:30'),
(1286, 45, 17, 'lion is behind which door?', 0, '2019-05-21 02:44:30'),
(1287, 46, 17, 'which door is safe?', 0, '2019-05-21 02:44:30'),
(1288, 47, 17, 'which door will the other guy tell me is safe', 0, '2019-05-21 02:44:30'),
(1289, 48, 17, 'what is the color of my shirt?', 0, '2019-05-21 02:44:30'),
(1290, 49, 17, 'if i ask the other guy, where would he point to?', 0, '2019-05-21 02:44:30'),
(1291, 50, 17, 'is the other guard telling truth that the door he stands in front of is safe?', 0, '2019-05-21 02:44:30'),
(1292, 51, 17, 'which door will the other guy point to if i ask him which door is safe?', 0, '2019-05-21 02:44:30'),
(1293, 52, 17, 'Can you go out with me to the safe exit?', 0, '2019-05-21 02:44:30'),
(1294, 53, 17, 'Do u tell truth or lie?', 0, '2019-05-21 02:44:30'),
(1295, 54, 17, 'Do u think there is another animal behind the door?', 0, '2019-05-21 02:44:30'),
(1296, 55, 17, 'Can you leave this room with any exit?', 0, '2019-05-21 02:44:30'),
(1297, 56, 17, 'Are u standing in front of a unsafe door?', 0, '2019-05-21 02:44:30'),
(1298, 57, 17, 'where is the lion', 0, '2019-05-21 02:44:30'),
(1299, 58, 17, 'can u lead me the way?', 0, '2019-05-21 02:44:30'),
(1300, 59, 17, 'can u go first?', 0, '2019-05-21 02:44:30'),
(1301, 60, 17, 'Is the other man telling truth?', 0, '2019-05-21 02:44:30'),
(1302, 61, 17, 'Which door should I use?', 0, '2019-05-21 02:44:30'),
(1303, 62, 17, 'Which door should I use?', 0, '2019-05-21 02:44:30'),
(1304, 63, 17, 'if one of u can follow me, which exit u wanna use', 0, '2019-05-21 02:44:30'),
(1305, 64, 17, 'if u were me, which door will u pick?', 0, '2019-05-21 02:44:30'),
(1306, 65, 17, 'Wwhich dooe is safe?', 0, '2019-05-21 02:44:30'),
(1307, 66, 17, 'if i ask the door to freedom, which door the other guard will lead me to?', 0, '2019-05-21 02:44:30'),
(1308, 67, 17, 'if u were the one who wanna escape, will u go through the door on the right side?', 0, '2019-05-21 02:44:30'),
(1309, 68, 17, 'which door is safe?', 0, '2019-05-21 02:44:30'),
(1310, 69, 17, 'Where is the lion?', 0, '2019-05-21 02:44:30'),
(1311, 70, 17, 'which door is safe?', 0, '2019-05-21 02:44:30'),
(1312, 71, 17, 'Does the other man tell truth?', 0, '2019-05-21 02:44:30'),
(1313, 72, 17, 'If you were me, which door will u choose?', 0, '2019-05-21 02:44:30'),
(1314, 73, 17, 'Where is the safe exit?', 0, '2019-05-21 02:44:30'),
(1315, 74, 1, '', 0, '2019-05-27 02:17:33'),
(1316, 74, 2, '', 0, '2019-05-27 02:17:33'),
(1317, 74, 3, '', 0, '2019-05-27 02:17:33'),
(1318, 74, 4, '', 0, '2019-05-27 02:17:33'),
(1319, 74, 5, '', 0, '2019-05-27 02:17:33'),
(1320, 74, 7, 'Silver box', 0, '2019-05-27 02:17:33'),
(1321, 74, 8, 'jhkjsfa', 0, '2019-05-27 02:17:33'),
(1322, 74, 17, '', 0, '2019-05-27 02:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `test_answer_file`
--

CREATE TABLE `test_answer_file` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `error` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(100) NOT NULL DEFAULT 'abc123$',
  `privileges` int(8) DEFAULT NULL,
  `lastloggedin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastloggedout` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` varchar(64) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `privileges`, `lastloggedin`, `lastloggedout`, `createdOn`, `createdBy`, `status`) VALUES
(1, 'admin', '$2y$10$m3v4jOGlg.dVT/tALcOsV.xi0XoWcpgOnxjlUdlEr/qDw1UTW7M9m', NULL, '2019-05-27 02:17:42', '2019-05-21 02:23:45', '0000-00-00 00:00:00', '', 1),
(2, 'staff001', '$2y$10$9befzPNOuhQ/5bxUtsiOqu28HAPutLF617K/4tEg3LRsaHklyD9lu', NULL, '0000-00-00 00:00:00', '2019-05-21 02:23:45', '0000-00-00 00:00:00', '', 1),
(3, 'staff002', '$2y$10$YF0HCZGxHxN8V9ax3OS1ZeSrlFU2igrno7Bx8xtJE6ALPrkIh8SOS', NULL, '0000-00-00 00:00:00', '2019-05-21 13:43:06', '0000-00-00 00:00:00', '', 1),
(4, 'staff003', '$2y$10$43ccQBZbK91NtQg9bEKmL.8u8.VwG4S71RWaKwd1qXjNV0RxYzuK6', NULL, '0000-00-00 00:00:00', '2019-05-21 13:43:06', '0000-00-00 00:00:00', '', 1),
(5, 'staff004', '$2y$10$lEYiV20bMtuFthzY8GuVf.VE3nAqSWVFCArxxWK3rQD4seQG2ZAJm', NULL, '0000-00-00 00:00:00', '2019-05-26 16:11:04', '2019-05-26 16:11:04', 'admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ans`
--
ALTER TABLE `ans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FOREIGN_quesid` (`quesID`) USING BTREE,
  ADD KEY `FOREIGN_inputTypeid` (`type`);

--
-- Indexes for table `ans_type`
--
ALTER TABLE `ans_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ans_type_checkbox`
--
ALTER TABLE `ans_type_checkbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CB_ansID` (`ansID`) USING BTREE;

--
-- Indexes for table `ans_type_file`
--
ALTER TABLE `ans_type_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_File_ansid` (`ansID`) USING BTREE;

--
-- Indexes for table `ans_type_number`
--
ALTER TABLE `ans_type_number`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Num_ansid` (`ansID`) USING BTREE;

--
-- Indexes for table `ans_type_radiobutton`
--
ALTER TABLE `ans_type_radiobutton`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Radio_ansid` (`ansID`) USING BTREE;

--
-- Indexes for table `ans_type_textbox`
--
ALTER TABLE `ans_type_textbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_text_ansid` (`ansID`) USING BTREE;

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Msg_status` (`status`),
  ADD KEY `FK_Msg_type` (`type`);

--
-- Indexes for table `message_status`
--
ALTER TABLE `message_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_type`
--
ALTER TABLE `message_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_age` (`age`),
  ADD KEY `FK_course` (`course`),
  ADD KEY `FK_ethnic` (`ethnic`),
  ADD KEY `FK_nation` (`nationality`),
  ADD KEY `FK_uni` (`university`),
  ADD KEY `FK_gender` (`gender`),
  ADD KEY `FK_yearstudy` (`yearOfStudy`),
  ADD KEY `FK_faculty` (`faculty`);

--
-- Indexes for table `participant_age`
--
ALTER TABLE `participant_age`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_course`
--
ALTER TABLE `participant_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_ethnic`
--
ALTER TABLE `participant_ethnic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_faculty`
--
ALTER TABLE `participant_faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_gender`
--
ALTER TABLE `participant_gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_nation`
--
ALTER TABLE `participant_nation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_result`
--
ALTER TABLE `participant_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_result_participant` (`participantid`);

--
-- Indexes for table `participant_result_course`
--
ALTER TABLE `participant_result_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_course_participant` (`participantid`),
  ADD KEY `FK_course_type` (`type`);

--
-- Indexes for table `participant_result_course_type`
--
ALTER TABLE `participant_result_course_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_university`
--
ALTER TABLE `participant_university`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_yearstudy`
--
ALTER TABLE `participant_yearstudy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_ques_status` (`status`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_test_participant` (`participantid`);

--
-- Indexes for table `test_answer`
--
ALTER TABLE `test_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_test` (`testID`),
  ADD KEY `FK_ans` (`ansID`);

--
-- Indexes for table `test_answer_file`
--
ALTER TABLE `test_answer_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ans`
--
ALTER TABLE `ans`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ans_type`
--
ALTER TABLE `ans_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ans_type_checkbox`
--
ALTER TABLE `ans_type_checkbox`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ans_type_file`
--
ALTER TABLE `ans_type_file`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ans_type_number`
--
ALTER TABLE `ans_type_number`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ans_type_radiobutton`
--
ALTER TABLE `ans_type_radiobutton`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ans_type_textbox`
--
ALTER TABLE `ans_type_textbox`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `message_status`
--
ALTER TABLE `message_status`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `participant_result`
--
ALTER TABLE `participant_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `participant_result_course`
--
ALTER TABLE `participant_result_course`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `participant_result_course_type`
--
ALTER TABLE `participant_result_course_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `test_answer`
--
ALTER TABLE `test_answer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1323;

--
-- AUTO_INCREMENT for table `test_answer_file`
--
ALTER TABLE `test_answer_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ans`
--
ALTER TABLE `ans`
  ADD CONSTRAINT `FOREIGN_inputTypeid` FOREIGN KEY (`type`) REFERENCES `ans_type` (`id`),
  ADD CONSTRAINT `FOREIGN_quesid` FOREIGN KEY (`quesID`) REFERENCES `question` (`id`);

--
-- Constraints for table `ans_type_checkbox`
--
ALTER TABLE `ans_type_checkbox`
  ADD CONSTRAINT `FK_CB_ansID` FOREIGN KEY (`ansID`) REFERENCES `ans` (`id`);

--
-- Constraints for table `ans_type_file`
--
ALTER TABLE `ans_type_file`
  ADD CONSTRAINT `FK_File_typeid` FOREIGN KEY (`ansID`) REFERENCES `ans` (`id`);

--
-- Constraints for table `ans_type_number`
--
ALTER TABLE `ans_type_number`
  ADD CONSTRAINT `FK_Num_typeid` FOREIGN KEY (`ansID`) REFERENCES `ans` (`id`);

--
-- Constraints for table `ans_type_radiobutton`
--
ALTER TABLE `ans_type_radiobutton`
  ADD CONSTRAINT `FK_Radio_typeid` FOREIGN KEY (`ansID`) REFERENCES `ans` (`id`);

--
-- Constraints for table `ans_type_textbox`
--
ALTER TABLE `ans_type_textbox`
  ADD CONSTRAINT `FK_Text_typeid` FOREIGN KEY (`ansID`) REFERENCES `ans` (`id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_Msg_status` FOREIGN KEY (`status`) REFERENCES `message_status` (`id`),
  ADD CONSTRAINT `FK_Msg_type` FOREIGN KEY (`type`) REFERENCES `message_type` (`id`);

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_age` FOREIGN KEY (`age`) REFERENCES `participant_age` (`id`),
  ADD CONSTRAINT `FK_course` FOREIGN KEY (`course`) REFERENCES `participant_course` (`id`),
  ADD CONSTRAINT `FK_ethnic` FOREIGN KEY (`ethnic`) REFERENCES `participant_ethnic` (`id`),
  ADD CONSTRAINT `FK_faculty` FOREIGN KEY (`faculty`) REFERENCES `participant_faculty` (`id`),
  ADD CONSTRAINT `FK_gender` FOREIGN KEY (`gender`) REFERENCES `participant_gender` (`id`),
  ADD CONSTRAINT `FK_nation` FOREIGN KEY (`nationality`) REFERENCES `participant_nation` (`id`),
  ADD CONSTRAINT `FK_uni` FOREIGN KEY (`university`) REFERENCES `participant_university` (`id`),
  ADD CONSTRAINT `FK_yearstudy` FOREIGN KEY (`yearOfStudy`) REFERENCES `participant_yearstudy` (`id`);

--
-- Constraints for table `participant_result`
--
ALTER TABLE `participant_result`
  ADD CONSTRAINT `FK_result_participant` FOREIGN KEY (`participantid`) REFERENCES `participant` (`id`);

--
-- Constraints for table `participant_result_course`
--
ALTER TABLE `participant_result_course`
  ADD CONSTRAINT `FK_course_participant` FOREIGN KEY (`participantid`) REFERENCES `participant` (`id`),
  ADD CONSTRAINT `FK_course_type` FOREIGN KEY (`type`) REFERENCES `participant_result_course_type` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_ques_status` FOREIGN KEY (`status`) REFERENCES `status` (`id`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `FK_test_participant` FOREIGN KEY (`participantid`) REFERENCES `participant` (`id`);

--
-- Constraints for table `test_answer`
--
ALTER TABLE `test_answer`
  ADD CONSTRAINT `FK_ans` FOREIGN KEY (`ansID`) REFERENCES `ans` (`id`),
  ADD CONSTRAINT `FK_test` FOREIGN KEY (`testID`) REFERENCES `test` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_status` FOREIGN KEY (`status`) REFERENCES `status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
