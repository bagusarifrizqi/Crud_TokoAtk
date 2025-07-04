-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2025 at 04:24 PM
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
-- Database: `db_toko_atk`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(16) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `jenis`, `harga`, `stok`) VALUES
(1, 'pensil H-Tech C (0.3mm)', 'alat tulis', 25000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `salesd`
--

CREATE TABLE `salesd` (
  `id` int(11) NOT NULL,
  `salesId` int(11) NOT NULL,
  `barangId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesd`
--

INSERT INTO `salesd` (`id`, `salesId`, `barangId`, `qty`, `harga`) VALUES
(1, 1, 1, 4, 25000),
(2, 2, 1, 10, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `salesm`
--

CREATE TABLE `salesm` (
  `id` int(11) NOT NULL,
  `waktu` datetime NOT NULL DEFAULT current_timestamp(),
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesm`
--

INSERT INTO `salesm` (`id`, `waktu`, `username`) VALUES
(1, '2025-07-04 20:27:57', 'admin'),
(2, '2025-07-04 21:03:59', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `stockd`
--

CREATE TABLE `stockd` (
  `id` int(11) NOT NULL,
  `stockId` int(11) NOT NULL,
  `barangId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockd`
--

INSERT INTO `stockd` (`id`, `stockId`, `barangId`, `qty`, `harga`) VALUES
(1, 1, 1, 10, 20000),
(2, 2, 1, 14, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `stockm`
--

CREATE TABLE `stockm` (
  `id` int(11) NOT NULL,
  `waktu` datetime NOT NULL DEFAULT current_timestamp(),
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockm`
--

INSERT INTO `stockm` (`id`, `waktu`, `username`) VALUES
(1, '2025-07-04 20:28:42', 'admin'),
(2, '2025-07-04 21:03:42', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `password` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`) VALUES
(1, 'admin', 'Administrator', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'len', 'molen', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'llen', 'mmolen', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salesd`
--
ALTER TABLE `salesd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salesId` (`salesId`),
  ADD KEY `barangId` (`barangId`);

--
-- Indexes for table `salesm`
--
ALTER TABLE `salesm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockd`
--
ALTER TABLE `stockd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stockId` (`stockId`),
  ADD KEY `barangId` (`barangId`);

--
-- Indexes for table `stockm`
--
ALTER TABLE `stockm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salesd`
--
ALTER TABLE `salesd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salesm`
--
ALTER TABLE `salesm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stockd`
--
ALTER TABLE `stockd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stockm`
--
ALTER TABLE `stockm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `salesd`
--
ALTER TABLE `salesd`
  ADD CONSTRAINT `salesd_ibfk_1` FOREIGN KEY (`salesId`) REFERENCES `salesm` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `salesd_ibfk_2` FOREIGN KEY (`barangId`) REFERENCES `barang` (`id`);

--
-- Constraints for table `stockd`
--
ALTER TABLE `stockd`
  ADD CONSTRAINT `stockd_ibfk_1` FOREIGN KEY (`stockId`) REFERENCES `stockm` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stockd_ibfk_2` FOREIGN KEY (`barangId`) REFERENCES `barang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
