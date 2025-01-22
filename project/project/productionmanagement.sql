-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 07:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `productionmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employees_id` int(11) NOT NULL,
  `employees_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employees_id`, `employees_name`) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eve'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Henry'),
(9, 'Isabel'),
(10, 'Jack'),
(11, 'Karen'),
(12, 'Leo'),
(13, 'Mary'),
(14, 'Nathan'),
(15, 'Olivia'),
(16, 'Philip'),
(17, 'Quincey'),
(18, 'Rachel'),
(19, 'Susan'),
(20, 'Thomas');

-- --------------------------------------------------------

--
-- Table structure for table `hourlyoutput`
--

CREATE TABLE `hourlyoutput` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `shift` varchar(50) NOT NULL,
  `hour` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `actual` int(11) NOT NULL,
  `backlog` int(11) NOT NULL,
  `trouble` varchar(255) DEFAULT NULL,
  `corrective_action` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hourlyoutput`
--

INSERT INTO `hourlyoutput` (`id`, `project_id`, `employees_id`, `line_id`, `date`, `shift`, `hour`, `target`, `actual`, `backlog`, `trouble`, `corrective_action`) VALUES
(1, 1, 1, 1, '2024-07-01', 'Day Shift', 1, 100, 95, 0, NULL, NULL),
(2, 1, 1, 1, '2024-07-01', 'Day Shift', 2, 100, 98, 0, NULL, NULL),
(3, 1, 1, 1, '2024-07-01', 'Day Shift', 3, 100, 92, 3, 'Machine Malfunction', 'Repaired Machine'),
(4, 1, 1, 1, '2024-07-01', 'Day Shift', 4, 100, 98, 0, NULL, NULL),
(5, 1, 1, 1, '2024-07-01', 'Day Shift', 5, 100, 102, 0, NULL, NULL),
(6, 1, 1, 1, '2024-07-01', 'Day Shift', 6, 100, 99, 0, NULL, NULL),
(7, 1, 1, 1, '2024-07-01', 'Day Shift', 7, 100, 101, 0, NULL, NULL),
(8, 1, 1, 1, '2024-07-01', 'Day Shift', 8, 100, 97, 0, NULL, NULL),
(9, 2, 2, 2, '2024-07-01', 'Day Shift', 1, 80, 78, 0, NULL, NULL),
(10, 2, 2, 2, '2024-07-01', 'Day Shift', 2, 80, 82, 0, NULL, NULL),
(11, 2, 2, 2, '2024-07-01', 'Day Shift', 3, 80, 75, 5, 'Material Issue', 'Replaced Material'),
(12, 2, 2, 2, '2024-07-01', 'Day Shift', 4, 80, 81, 0, NULL, NULL),
(13, 2, 2, 2, '2024-07-01', 'Day Shift', 5, 80, 83, 0, NULL, NULL),
(14, 2, 2, 2, '2024-07-01', 'Day Shift', 6, 80, 79, 0, NULL, NULL),
(15, 2, 2, 2, '2024-07-01', 'Day Shift', 7, 80, 80, 0, NULL, NULL),
(16, 2, 2, 2, '2024-07-01', 'Day Shift', 8, 80, 77, 0, NULL, NULL),
(17, 3, 3, 3, '2024-07-01', 'Day Shift', 1, 120, 118, 0, NULL, NULL),
(18, 3, 3, 3, '2024-07-01', 'Day Shift', 2, 120, 122, 0, NULL, NULL),
(19, 3, 3, 3, '2024-07-01', 'Day Shift', 3, 120, 115, 5, 'Operator Error', 'Provided Training'),
(20, 3, 3, 3, '2024-07-01', 'Day Shift', 4, 120, 121, 0, NULL, NULL),
(21, 3, 3, 3, '2024-07-01', 'Day Shift', 5, 120, 123, 0, NULL, NULL),
(22, 3, 3, 3, '2024-07-01', 'Day Shift', 6, 120, 119, 0, NULL, NULL),
(23, 3, 3, 3, '2024-07-01', 'Day Shift', 7, 120, 120, 0, NULL, NULL),
(24, 3, 3, 3, '2024-07-01', 'Day Shift', 8, 120, 117, 0, NULL, NULL),
(25, 4, 4, 4, '2024-07-01', 'Day Shift', 1, 95, 90, 0, NULL, NULL),
(26, 4, 4, 4, '2024-07-01', 'Day Shift', 2, 95, 92, 0, NULL, NULL),
(27, 4, 4, 4, '2024-07-01', 'Day Shift', 3, 95, 88, 7, 'Machine Setup Issue', 'Adjusted Machine Setup'),
(28, 4, 4, 4, '2024-07-01', 'Day Shift', 4, 95, 91, 0, NULL, NULL),
(29, 4, 4, 4, '2024-07-01', 'Day Shift', 5, 95, 93, 0, NULL, NULL),
(30, 4, 4, 4, '2024-07-01', 'Day Shift', 6, 95, 90, 0, NULL, NULL),
(31, 4, 4, 4, '2024-07-01', 'Day Shift', 7, 95, 92, 0, NULL, NULL),
(32, 4, 4, 4, '2024-07-01', 'Day Shift', 8, 95, 89, 0, NULL, NULL),
(33, 5, 5, 5, '2024-07-01', 'Day Shift', 1, 75, 70, 0, NULL, NULL),
(34, 5, 5, 5, '2024-07-01', 'Day Shift', 2, 75, 72, 0, NULL, NULL),
(35, 5, 5, 5, '2024-07-01', 'Day Shift', 3, 75, 68, 7, 'Power Outage', 'Resumed Production'),
(36, 5, 5, 5, '2024-07-01', 'Day Shift', 4, 75, 71, 0, NULL, NULL),
(37, 5, 5, 5, '2024-07-01', 'Day Shift', 5, 75, 73, 0, NULL, NULL),
(38, 5, 5, 5, '2024-07-01', 'Day Shift', 6, 75, 70, 0, NULL, NULL),
(39, 5, 5, 5, '2024-07-01', 'Day Shift', 7, 75, 72, 0, NULL, NULL),
(40, 5, 5, 5, '2024-07-01', 'Day Shift', 8, 75, 69, 0, NULL, NULL),
(41, 6, 6, 6, '2024-07-01', 'Day Shift', 1, 110, 105, 0, NULL, NULL),
(42, 11, 11, 11, '2024-07-01', 'Day Shift', 3, 70, 60, 10, 'Safety Inspection', 'Completed Safety Inspection'),
(43, 11, 11, 11, '2024-07-01', 'Day Shift', 4, 70, 66, 0, NULL, NULL),
(44, 11, 11, 11, '2024-07-01', 'Day Shift', 5, 70, 69, 0, NULL, NULL),
(45, 11, 11, 11, '2024-07-01', 'Day Shift', 6, 70, 64, 0, NULL, NULL),
(46, 11, 11, 11, '2024-07-01', 'Day Shift', 7, 70, 67, 0, NULL, NULL),
(47, 11, 11, 11, '2024-07-01', 'Day Shift', 8, 70, 62, 0, NULL, NULL),
(48, 12, 12, 12, '2024-07-01', 'Day Shift', 1, 115, 110, 0, NULL, NULL),
(49, 12, 12, 12, '2024-07-01', 'Day Shift', 2, 115, 113, 0, NULL, NULL),
(50, 12, 12, 12, '2024-07-01', 'Day Shift', 3, 115, 105, 10, 'Material Quality Issue', 'Removed Defective Material'),
(51, 12, 12, 12, '2024-07-01', 'Day Shift', 4, 115, 111, 0, NULL, NULL),
(52, 12, 12, 12, '2024-07-01', 'Day Shift', 5, 115, 114, 0, NULL, NULL),
(53, 12, 12, 12, '2024-07-01', 'Day Shift', 6, 115, 109, 0, NULL, NULL),
(54, 12, 12, 12, '2024-07-01', 'Day Shift', 7, 115, 112, 0, NULL, NULL),
(55, 12, 12, 12, '2024-07-01', 'Day Shift', 8, 115, 107, 0, NULL, NULL),
(56, 13, 13, 13, '2024-07-01', 'Day Shift', 1, 102, 95, 0, NULL, NULL),
(57, 13, 13, 13, '2024-07-01', 'Day Shift', 2, 102, 98, 0, NULL, NULL),
(58, 13, 13, 13, '2024-07-01', 'Day Shift', 3, 102, 90, 12, 'Preventive Maintenance', 'Performed Maintenance'),
(59, 13, 13, 13, '2024-07-01', 'Day Shift', 4, 102, 96, 0, NULL, NULL),
(60, 13, 13, 13, '2024-07-01', 'Day Shift', 5, 102, 99, 0, NULL, NULL),
(61, 13, 13, 13, '2024-07-01', 'Day Shift', 6, 102, 94, 0, NULL, NULL),
(62, 13, 13, 13, '2024-07-01', 'Day Shift', 7, 102, 97, 0, NULL, NULL),
(63, 13, 13, 13, '2024-07-01', 'Day Shift', 8, 102, 92, 0, NULL, NULL),
(64, 14, 14, 14, '2024-07-01', 'Day Shift', 1, 82, 75, 0, NULL, NULL),
(65, 14, 14, 14, '2024-07-01', 'Day Shift', 2, 82, 78, 0, NULL, NULL),
(66, 14, 14, 14, '2024-07-01', 'Day Shift', 3, 82, 70, 12, 'Operator Training', 'Provided Additional Training'),
(67, 14, 14, 14, '2024-07-01', 'Day Shift', 4, 82, 76, 0, NULL, NULL),
(68, 14, 14, 14, '2024-07-01', 'Day Shift', 5, 82, 79, 0, NULL, NULL),
(69, 14, 14, 14, '2024-07-01', 'Day Shift', 6, 82, 74, 0, NULL, NULL),
(70, 14, 14, 14, '2024-07-01', 'Day Shift', 7, 82, 77, 0, NULL, NULL),
(71, 14, 14, 14, '2024-07-01', 'Day Shift', 8, 82, 72, 0, NULL, NULL),
(72, 15, 15, 15, '2024-07-01', 'Day Shift', 1, 122, 115, 0, NULL, NULL),
(73, 15, 15, 15, '2024-07-01', 'Day Shift', 2, 122, 118, 0, NULL, NULL),
(74, 15, 15, 15, '2024-07-01', 'Day Shift', 3, 122, 110, 12, 'Tool Adjustment', 'Adjusted Tooling'),
(75, 15, 15, 15, '2024-07-01', 'Day Shift', 4, 122, 116, 0, NULL, NULL),
(76, 15, 15, 15, '2024-07-01', 'Day Shift', 5, 122, 119, 0, NULL, NULL),
(77, 15, 15, 15, '2024-07-01', 'Day Shift', 6, 122, 114, 0, NULL, NULL),
(78, 15, 15, 15, '2024-07-01', 'Day Shift', 7, 122, 117, 0, NULL, NULL),
(79, 15, 15, 15, '2024-07-01', 'Day Shift', 8, 122, 112, 0, NULL, NULL),
(80, 16, 16, 16, '2024-07-01', 'Day Shift', 1, 98, 90, 0, NULL, NULL),
(81, 16, 16, 16, '2024-07-01', 'Day Shift', 2, 98, 93, 0, NULL, NULL),
(82, 16, 16, 16, '2024-07-01', 'Day Shift', 3, 98, 85, 13, 'Environmental Condition', 'Improved Environmental Controls'),
(83, 16, 16, 16, '2024-07-01', 'Day Shift', 4, 98, 91, 0, NULL, NULL),
(84, 16, 16, 16, '2024-07-01', 'Day Shift', 5, 98, 94, 0, NULL, NULL),
(85, 16, 16, 16, '2024-07-01', 'Day Shift', 6, 98, 89, 0, NULL, NULL),
(86, 16, 16, 16, '2024-07-01', 'Day Shift', 7, 98, 92, 0, NULL, NULL),
(87, 16, 16, 16, '2024-07-01', 'Day Shift', 8, 98, 87, 0, NULL, NULL),
(88, 17, 17, 17, '2024-07-01', 'Day Shift', 1, 78, 70, 0, NULL, NULL),
(89, 17, 17, 17, '2024-07-01', 'Day Shift', 2, 78, 73, 0, NULL, NULL),
(90, 17, 17, 17, '2024-07-01', 'Day Shift', 3, 78, 65, 13, 'Material Contamination', 'Discarded Contaminated Material'),
(91, 17, 17, 17, '2024-07-01', 'Day Shift', 4, 78, 71, 0, NULL, NULL),
(92, 17, 17, 17, '2024-07-01', 'Day Shift', 5, 78, 74, 0, NULL, NULL),
(93, 17, 17, 17, '2024-07-01', 'Day Shift', 6, 78, 69, 0, NULL, NULL),
(94, 17, 17, 17, '2024-07-01', 'Day Shift', 7, 78, 72, 0, NULL, NULL),
(95, 17, 17, 17, '2024-07-01', 'Day Shift', 8, 78, 67, 0, NULL, NULL),
(96, 18, 18, 18, '2024-07-01', 'Day Shift', 1, 118, 110, 0, NULL, NULL),
(97, 18, 18, 18, '2024-07-01', 'Day Shift', 2, 118, 113, 0, NULL, NULL),
(98, 18, 18, 18, '2024-07-01', 'Day Shift', 3, 118, 105, 13, 'Equipment Breakdown', 'Repaired Equipment'),
(99, 18, 18, 18, '2024-07-01', 'Day Shift', 4, 118, 111, 0, NULL, NULL),
(100, 18, 18, 18, '2024-07-01', 'Day Shift', 5, 118, 114, 0, NULL, NULL),
(101, 18, 18, 18, '2024-07-01', 'Day Shift', 6, 118, 109, 0, NULL, NULL),
(102, 18, 18, 18, '2024-07-01', 'Day Shift', 7, 118, 112, 0, NULL, NULL),
(103, 18, 18, 18, '2024-07-01', 'Day Shift', 8, 118, 107, 0, NULL, NULL),
(104, 19, 19, 19, '2024-07-01', 'Day Shift', 1, 101, 95, 0, NULL, NULL),
(105, 19, 19, 19, '2024-07-01', 'Day Shift', 2, 101, 98, 0, NULL, NULL),
(106, 19, 19, 19, '2024-07-01', 'Day Shift', 3, 101, 90, 11, 'Process Improvement', 'Implemented Improvements'),
(107, 19, 19, 19, '2024-07-01', 'Day Shift', 4, 101, 96, 0, NULL, NULL),
(108, 19, 19, 19, '2024-07-01', 'Day Shift', 5, 101, 99, 0, NULL, NULL),
(109, 19, 19, 19, '2024-07-01', 'Day Shift', 6, 101, 94, 0, NULL, NULL),
(110, 19, 19, 19, '2024-07-01', 'Day Shift', 7, 101, 97, 0, NULL, NULL),
(111, 19, 19, 19, '2024-07-01', 'Day Shift', 8, 101, 92, 0, NULL, NULL),
(112, 20, 20, 20, '2024-07-01', 'Day Shift', 1, 81, 75, 0, NULL, NULL),
(113, 20, 20, 20, '2024-07-01', 'Day Shift', 2, 81, 78, 0, NULL, NULL),
(114, 20, 20, 20, '2024-07-01', 'Day Shift', 3, 81, 70, 11, 'Safety Incident', 'Investigated and Corrected'),
(115, 20, 20, 20, '2024-07-01', 'Day Shift', 4, 81, 76, 0, NULL, NULL),
(116, 20, 20, 20, '2024-07-01', 'Day Shift', 5, 81, 79, 0, NULL, NULL),
(117, 20, 20, 20, '2024-07-01', 'Day Shift', 6, 81, 74, 0, NULL, NULL),
(118, 20, 20, 20, '2024-07-01', 'Day Shift', 7, 81, 77, 0, NULL, NULL),
(119, 20, 20, 20, '2024-07-01', 'Day Shift', 8, 81, 72, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `machine_id` int(11) NOT NULL,
  `machine_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`machine_id`, `machine_name`) VALUES
(1, 'Machine A'),
(2, 'Machine B'),
(3, 'Machine C'),
(4, 'Machine D'),
(5, 'Machine E'),
(6, 'Machine F'),
(7, 'Machine G'),
(8, 'Machine H'),
(9, 'Machine I'),
(10, 'Machine J'),
(11, 'Machine K'),
(12, 'Machine L'),
(13, 'Machine M'),
(14, 'Machine N'),
(15, 'Machine O'),
(16, 'Machine P'),
(17, 'Machine Q'),
(18, 'Machine R'),
(19, 'Machine S'),
(20, 'Machine T');

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `operation_id` int(11) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `step_number` int(11) NOT NULL,
  `operation_name` varchar(255) NOT NULL,
  `operation_type` varchar(255) NOT NULL,
  `count_unit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`operation_id`, `serial_number`, `step_number`, `operation_name`, `operation_type`, `count_unit`) VALUES
(1, 'PO001', 1, 'Assembly_1', 'Assembly', 10),
(2, 'PO001', 2, 'Testing_1', 'Testing', 5),
(3, 'PO001', 3, 'Packaging_1', 'Packaging', 1),
(4, 'PO002', 1, 'Assembly_2', 'Assembly', 15),
(5, 'PO002', 2, 'Testing_2', 'Testing', 8),
(6, 'PO002', 3, 'Packaging_2', 'Packaging', 1),
(7, 'PO003', 1, 'Assembly_3', 'Assembly', 20),
(8, 'PO003', 2, 'Testing_3', 'Testing', 10),
(9, 'PO003', 3, 'Packaging_3', 'Packaging', 1),
(10, 'PO004', 1, 'Assembly_4', 'Assembly', 12),
(11, 'PO004', 2, 'Testing_4', 'Testing', 6),
(12, 'PO004', 3, 'Packaging_4', 'Packaging', 1),
(13, 'PO005', 1, 'Assembly_5', 'Assembly', 18),
(14, 'PO005', 2, 'Testing_5', 'Testing', 9),
(15, 'PO005', 3, 'Packaging_5', 'Packaging', 1),
(16, 'PO006', 1, 'Assembly_6', 'Assembly', 25),
(17, 'PO006', 2, 'Testing_6', 'Testing', 12),
(18, 'PO006', 3, 'Packaging_6', 'Packaging', 1),
(19, 'PO007', 1, 'Assembly_7', 'Assembly', 14),
(20, 'PO007', 2, 'Testing_7', 'Testing', 7),
(21, 'PO007', 3, 'Packaging_7', 'Packaging', 1),
(22, 'PO008', 1, 'Assembly_8', 'Assembly', 20),
(23, 'PO008', 2, 'Testing_8', 'Testing', 10),
(24, 'PO008', 3, 'Packaging_8', 'Packaging', 1),
(25, 'PO009', 1, 'Assembly_9', 'Assembly', 28),
(26, 'PO009', 2, 'Testing_9', 'Testing', 14),
(27, 'PO009', 3, 'Packaging_9', 'Packaging', 1),
(28, 'PO010', 1, 'Assembly_10', 'Assembly', 16),
(29, 'PO010', 2, 'Testing_10', 'Testing', 8),
(30, 'PO010', 3, 'Packaging_10', 'Packaging', 1),
(31, 'PO011', 1, 'Assembly_11', 'Assembly', 22),
(32, 'PO011', 2, 'Testing_11', 'Testing', 11),
(33, 'PO011', 3, 'Packaging_11', 'Packaging', 1),
(34, 'PO012', 1, 'Assembly_12', 'Assembly', 30),
(35, 'PO012', 2, 'Testing_12', 'Testing', 15),
(36, 'PO012', 3, 'Packaging_12', 'Packaging', 1),
(37, 'PO013', 1, 'Assembly_13', 'Assembly', 18),
(38, 'PO013', 2, 'Testing_13', 'Testing', 9),
(39, 'PO013', 3, 'Packaging_13', 'Packaging', 1),
(40, 'PO014', 1, 'Assembly_14', 'Assembly', 24),
(41, 'PO014', 2, 'Testing_14', 'Testing', 12),
(42, 'PO014', 3, 'Packaging_14', 'Packaging', 1),
(43, 'PO015', 1, 'Assembly_15', 'Assembly', 32),
(44, 'PO015', 2, 'Testing_15', 'Testing', 16),
(45, 'PO015', 3, 'Packaging_15', 'Packaging', 1),
(46, 'PO016', 1, 'Assembly_16', 'Assembly', 20),
(47, 'PO016', 2, 'Testing_16', 'Testing', 10),
(48, 'PO016', 3, 'Packaging_16', 'Packaging', 1),
(49, 'PO017', 1, 'Assembly_17', 'Assembly', 26),
(50, 'PO017', 2, 'Testing_17', 'Testing', 13),
(51, 'PO017', 3, 'Packaging_17', 'Packaging', 1),
(52, 'PO018', 1, 'Assembly_18', 'Assembly', 34),
(53, 'PO018', 2, 'Testing_18', 'Testing', 17),
(54, 'PO018', 3, 'Packaging_18', 'Packaging', 1),
(55, 'PO019', 1, 'Assembly_19', 'Assembly', 22),
(56, 'PO019', 2, 'Testing_19', 'Testing', 11),
(57, 'PO019', 3, 'Packaging_19', 'Packaging', 1),
(58, 'PO020', 1, 'Assembly_20', 'Assembly', 28),
(59, 'PO020', 2, 'Testing_20', 'Testing', 14),
(60, 'PO020', 3, 'Packaging_20', 'Packaging', 1);

-- --------------------------------------------------------

--
-- Table structure for table `performance_data`
--

CREATE TABLE `performance_data` (
  `performance_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `ideal_cycle_time` float NOT NULL,
  `actual_run_time` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `performance_data`
--

INSERT INTO `performance_data` (`performance_id`, `record_id`, `ideal_cycle_time`, `actual_run_time`) VALUES
(1, 1, 0.1, 0.11),
(2, 2, 0.12, 0.13),
(3, 3, 0.08, 0.09),
(4, 4, 0.1, 0.12),
(5, 5, 0.15, 0.16),
(6, 6, 0.09, 0.1),
(7, 7, 0.11, 0.13),
(8, 8, 0.14, 0.15),
(9, 9, 0.07, 0.08),
(10, 10, 0.1, 0.11),
(11, 11, 0.16, 0.17),
(12, 12, 0.08, 0.09),
(13, 13, 0.12, 0.14),
(14, 14, 0.15, 0.16),
(15, 15, 0.06, 0.07),
(16, 16, 0.1, 0.12),
(17, 17, 0.18, 0.19),
(18, 18, 0.07, 0.08),
(19, 19, 0.13, 0.15),
(20, 20, 0.16, 0.17);

-- --------------------------------------------------------

--
-- Table structure for table `productionlines`
--

CREATE TABLE `productionlines` (
  `line_id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL,
  `process` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productionlines`
--

INSERT INTO `productionlines` (`line_id`, `line_name`, `process`) VALUES
(1, 'Assembly Line 1', 'Assembly'),
(2, 'Assembly Line 2', 'Assembly'),
(3, 'Testing Line', 'Testing'),
(4, 'Packaging Line', 'Packaging'),
(5, 'Finishing Line', 'Finishing'),
(6, 'Inspection Line', 'Inspection'),
(7, 'Machining Line', 'Machining'),
(8, 'Welding Line', 'Welding'),
(9, 'Painting Line', 'Painting'),
(10, 'Molding Line', 'Molding'),
(11, 'Cutting Line', 'Cutting'),
(12, 'Polishing Line', 'Polishing'),
(13, 'Heat Treatment Line', 'Heat Treatment'),
(14, 'Plating Line', 'Plating'),
(15, 'Cleaning Line', 'Cleaning'),
(16, 'Deburring Line', 'Deburring'),
(17, 'Grinding Line', 'Grinding'),
(18, 'Drilling Line', 'Drilling'),
(19, 'Stamping Line', 'Stamping'),
(20, 'Forging Line', 'Forging');

-- --------------------------------------------------------

--
-- Table structure for table `productionorder`
--

CREATE TABLE `productionorder` (
  `serial_number` varchar(50) NOT NULL,
  `route_id` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `create_date` date NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productionorder`
--

INSERT INTO `productionorder` (`serial_number`, `route_id`, `release_date`, `create_date`, `quantity`) VALUES
('PO001', 1, '2024-07-01', '2024-06-25', 1000),
('PO002', 2, '2024-07-02', '2024-06-26', 800),
('PO003', 3, '2024-07-03', '2024-06-27', 1200),
('PO004', 1, '2024-07-04', '2024-06-28', 950),
('PO005', 2, '2024-07-05', '2024-06-29', 750),
('PO006', 3, '2024-07-06', '2024-06-30', 1100),
('PO007', 1, '2024-07-07', '2024-07-01', 1050),
('PO008', 2, '2024-07-08', '2024-07-02', 850),
('PO009', 3, '2024-07-09', '2024-07-03', 1250),
('PO010', 1, '2024-07-10', '2024-07-04', 900),
('PO011', 2, '2024-07-11', '2024-07-05', 700),
('PO012', 3, '2024-07-12', '2024-07-06', 1150),
('PO013', 1, '2024-07-13', '2024-07-07', 1020),
('PO014', 2, '2024-07-14', '2024-07-08', 820),
('PO015', 3, '2024-07-15', '2024-07-09', 1220),
('PO016', 1, '2024-07-16', '2024-07-10', 980),
('PO017', 2, '2024-07-17', '2024-07-11', 780),
('PO018', 3, '2024-07-18', '2024-07-12', 1180),
('PO019', 1, '2024-07-19', '2024-07-13', 1010),
('PO020', 2, '2024-07-20', '2024-07-14', 810);

-- --------------------------------------------------------

--
-- Table structure for table `production_record`
--

CREATE TABLE `production_record` (
  `record_id` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `production_date` date NOT NULL,
  `total_cycles` int(11) NOT NULL,
  `good_units` int(11) NOT NULL,
  `rejected_units` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_record`
--

INSERT INTO `production_record` (`record_id`, `machine_id`, `shift_id`, `production_date`, `total_cycles`, `good_units`, `rejected_units`) VALUES
(1, 1, 1, '2024-07-01', 1000, 950, 50),
(2, 2, 2, '2024-07-01', 800, 780, 20),
(3, 3, 3, '2024-07-01', 1200, 1180, 20),
(4, 4, 1, '2024-07-02', 950, 900, 50),
(5, 5, 2, '2024-07-02', 750, 720, 30),
(6, 6, 3, '2024-07-02', 1100, 1080, 20),
(7, 7, 1, '2024-07-03', 1050, 1000, 50),
(8, 8, 2, '2024-07-03', 850, 820, 30),
(9, 9, 3, '2024-07-03', 1250, 1200, 50),
(10, 10, 1, '2024-07-04', 900, 850, 50),
(11, 11, 2, '2024-07-04', 700, 680, 20),
(12, 12, 3, '2024-07-04', 1150, 1120, 30),
(13, 13, 1, '2024-07-05', 1020, 980, 40),
(14, 14, 2, '2024-07-05', 820, 790, 30),
(15, 15, 3, '2024-07-05', 1220, 1180, 40),
(16, 16, 1, '2024-07-06', 980, 940, 40),
(17, 17, 2, '2024-07-06', 780, 750, 30),
(18, 18, 3, '2024-07-06', 1180, 1140, 40),
(19, 19, 1, '2024-07-07', 1010, 960, 50),
(20, 20, 2, '2024-07-07', 810, 780, 30);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`, `project_no`) VALUES
(1, 'Project Alpha', 'P001'),
(2, 'Project Beta', 'P002'),
(3, 'Project Gamma', 'P003'),
(4, 'Project Delta', 'P004'),
(5, 'Project Epsilon', 'P005'),
(6, 'Project Zeta', 'P006'),
(7, 'Project Eta', 'P007'),
(8, 'Project Theta', 'P008'),
(9, 'Project Iota', 'P009'),
(10, 'Project Kappa', 'P010'),
(11, 'Project Lambda', 'P011'),
(12, 'Project Mu', 'P012'),
(13, 'Project Nu', 'P013'),
(14, 'Project Xi', 'P014'),
(15, 'Project Omicron', 'P015'),
(16, 'Project Pi', 'P016'),
(17, 'Project Rho', 'P017'),
(18, 'Project Sigma', 'P018'),
(19, 'Project Tau', 'P019'),
(20, 'Project Upsilon', 'P020'),
(21, 'Project Alpha', 'P001'),
(22, 'Project Beta', 'P002'),
(23, 'Project Gamma', 'P003'),
(24, 'Project Delta', 'P004'),
(25, 'Project Epsilon', 'P005'),
(26, 'Project Zeta', 'P006'),
(27, 'Project Eta', 'P007'),
(28, 'Project Theta', 'P008'),
(29, 'Project Iota', 'P009'),
(30, 'Project Kappa', 'P010'),
(31, 'Project Lambda', 'P011'),
(32, 'Project Mu', 'P012'),
(33, 'Project Nu', 'P013'),
(34, 'Project Xi', 'P014'),
(35, 'Project Omicron', 'P015'),
(36, 'Project Pi', 'P016'),
(37, 'Project Rho', 'P017'),
(38, 'Project Sigma', 'P018'),
(39, 'Project Tau', 'P019'),
(40, 'Project Upsilon', 'P020');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `shift_id` int(11) NOT NULL,
  `shift_name` varchar(50) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`shift_id`, `shift_name`, `start_time`, `end_time`) VALUES
(1, 'Day Shift', '07:00:00', '15:00:00'),
(2, 'Evening Shift', '15:00:00', '23:00:00'),
(3, 'Night Shift', '23:00:00', '07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Editor','User') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `created_at`) VALUES
(4, 'admin', '$2y$10$T6hr/h/l/e/yYQ4b8a5uO.qL1x/2Y/Y1.7p0tZ.3.Q3...', 'Admin', '2025-01-15 18:38:47'),
(5, 'editor', '$2y$10$T6hr/h/l/e/yYQ4b8a5uO.qL1x/2Y/Y1.7p0tZ.3.Q3...', 'Editor', '2025-01-15 18:38:47'),
(6, 'user', '$2y$10$T6hr/h/l/e/yYQ4b8a5uO.qL1x/2Y/Y1.7p0tZ.3.Q3...', 'User', '2025-01-15 18:38:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employees_id`);

--
-- Indexes for table `hourlyoutput`
--
ALTER TABLE `hourlyoutput`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `employees_id` (`employees_id`),
  ADD KEY `line_id` (`line_id`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`machine_id`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`operation_id`),
  ADD KEY `serial_number` (`serial_number`);

--
-- Indexes for table `performance_data`
--
ALTER TABLE `performance_data`
  ADD PRIMARY KEY (`performance_id`),
  ADD KEY `record_id` (`record_id`);

--
-- Indexes for table `productionlines`
--
ALTER TABLE `productionlines`
  ADD PRIMARY KEY (`line_id`);

--
-- Indexes for table `productionorder`
--
ALTER TABLE `productionorder`
  ADD PRIMARY KEY (`serial_number`);

--
-- Indexes for table `production_record`
--
ALTER TABLE `production_record`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `machine_id` (`machine_id`),
  ADD KEY `shift_id` (`shift_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employees_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `hourlyoutput`
--
ALTER TABLE `hourlyoutput`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `machines`
--
ALTER TABLE `machines`
  MODIFY `machine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `operation`
--
ALTER TABLE `operation`
  MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `performance_data`
--
ALTER TABLE `performance_data`
  MODIFY `performance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `productionlines`
--
ALTER TABLE `productionlines`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `production_record`
--
ALTER TABLE `production_record`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hourlyoutput`
--
ALTER TABLE `hourlyoutput`
  ADD CONSTRAINT `hourlyoutput_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `hourlyoutput_ibfk_2` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`employees_id`),
  ADD CONSTRAINT `hourlyoutput_ibfk_3` FOREIGN KEY (`line_id`) REFERENCES `productionlines` (`line_id`);

--
-- Constraints for table `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `productionorder` (`serial_number`);

--
-- Constraints for table `performance_data`
--
ALTER TABLE `performance_data`
  ADD CONSTRAINT `performance_data_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `production_record` (`record_id`);

--
-- Constraints for table `production_record`
--
ALTER TABLE `production_record`
  ADD CONSTRAINT `production_record_ibfk_1` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`machine_id`),
  ADD CONSTRAINT `production_record_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`shift_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
