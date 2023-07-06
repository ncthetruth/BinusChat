-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2023 at 03:06 PM
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
-- Database: `binuschat`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `senderid` varchar(255) NOT NULL,
  `receiverid` varchar(255) NOT NULL,
  `messagesend` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `useraccount`
--

CREATE TABLE `useraccount` (
  `NIM` varchar(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Pass` varchar(255) NOT NULL,
  `imagepath` varchar(255) NOT NULL DEFAULT 'default/path'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `useraccount`
--

INSERT INTO `useraccount` (`NIM`, `Email`, `Nama`, `Pass`, `imagepath`) VALUES
('2540127351', 'nicholas.christopher002@binus.ac.id', 'Nicholas Christopher', 'nicho123', 'public/asset/nicho.jpg'),
('2567454221', 'yuigahama.yui@binus.ac.id', 'Yuigahama Yui', 'yui12345', 'public/asset/yui.jpg'),
('2598374615', 'sakura.miko@binus.ac.id', 'Sakura Miko', 'miko1234', 'public/asset/sakuramiko.jpg'),
('admin', 'admin', 'admin', 'admin', 'public/asset/sakuramiko.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD KEY `senderid` (`senderid`),
  ADD KEY `receiverid` (`receiverid`);

--
-- Indexes for table `useraccount`
--
ALTER TABLE `useraccount`
  ADD PRIMARY KEY (`NIM`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`senderid`) REFERENCES `useraccount` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiverid`) REFERENCES `useraccount` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
