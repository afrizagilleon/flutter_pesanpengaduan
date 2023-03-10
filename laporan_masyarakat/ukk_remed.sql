-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 10, 2023 at 10:22 AM
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
-- Database: `ukk_remed`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `stat` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id_log`, `id_user`, `stat`, `datetime`) VALUES
(1, 4, 'user dibuat', '2023-03-10 15:35:10'),
(2, 1, 'Membuat laporan', '2023-03-10 15:37:56'),
(3, 5, 'user dibuat', '2023-03-10 15:58:53'),
(4, 1, 'Membuat laporan', '2023-03-10 16:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id_report` int(11) NOT NULL,
  `content` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id_report`, `content`, `datetime`, `id_user`) VALUES
(1, 'Percobaan kita ya ges yaa', '2023-03-10 12:48:29', 1),
(2, 'Percobaan ke 2 ges', '2023-03-10 12:51:42', 1),
(3, 'Orang keren selalu mencoba yang terbaik', '2023-03-10 14:28:53', 2),
(4, 'Mantapp jiwa', '2023-03-10 14:32:54', 2),
(5, 'Terjadi kecelakaan yang membawa rezeki', '2023-03-10 15:37:56', 1),
(6, 'Baiklah', '2023-03-10 16:01:01', 1);

--
-- Triggers `report`
--
DELIMITER $$
CREATE TRIGGER `user_report_add` BEFORE INSERT ON `report` FOR EACH ROW INSERT INTO log (id_user, stat) VALUES (new.id_user, 'Membuat laporan')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `phone` varchar(13) NOT NULL,
  `level` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `phone`, `level`) VALUES
(1, 'Orang Budiman', 'mantapjiwa', '080394343', 'user'),
(2, 'Orang Mantap', 'siapbos', '349032', 'user'),
(3, 'Admin Ganteng', 'siapp', '34903223', 'admin'),
(4, 'Orang Tampan', 'sangattampan', '34903223', 'admin'),
(5, 'Orang Tampan2', 'huhuhaha', '', 'user');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `user_daftar` AFTER INSERT ON `user` FOR EACH ROW INSERT INTO log (id_user ,stat) VALUES (new.id_user,'user dibuat')
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `log_fk0` (`id_user`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id_report`),
  ADD KEY `report_fk0` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id_report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_fk0` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_fk0` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
