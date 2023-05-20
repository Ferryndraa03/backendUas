-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 04:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cash_flow`
--

-- --------------------------------------------------------

--
-- Table structure for table `cash`
--

CREATE TABLE `cash` (
  `id` int(11) NOT NULL,
  `nip` int(11) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `tanggal` varchar(30) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cash`
--

INSERT INTO `cash` (`id`, `nip`, `kategori`, `catatan`, `nominal`, `tanggal`, `createdAt`, `updatedAt`) VALUES
(56, 3302, 'pemasukan', 'jasa desain brosur', '40000', '2023-05-06', '2023-05-06 05:11:01', '2023-05-06 05:11:01'),
(57, 3302, 'pengeluaran', 'jajan', '2000', '2023-05-06', '2023-05-06 05:11:38', '2023-05-06 05:11:38'),
(111, 5505, 'pemasukan', 'rhedrh', '40000', '2023-05-07', '2023-05-07 13:45:57', '2023-05-07 13:46:26'),
(123, 3303, 'pemasukan', 'uang lembur', '200000', 'Mon May 08 2023', '2023-05-08 15:17:33', '2023-05-08 15:17:33'),
(124, 3303, NULL, 'SPP les', '65000', 'Mon May 08 2023', '2023-05-08 15:18:31', '2023-05-08 15:31:55'),
(126, 9909, 'pemasukan', 'rejeki 2', '10000', 'Mon May 08 2023', '2023-05-08 15:35:13', '2023-05-08 15:36:20'),
(128, 3303, 'pengeluaran', 'Beli kado', '700000', 'Mon May 08 2023', '2023-05-09 04:39:42', '2023-05-09 05:05:16'),
(129, 3303, 'pengeluaran', 'Beli kado', '7000', 'Mon May 08 2023', '2023-05-09 04:39:57', '2023-05-09 06:28:01'),
(131, 3303, 'pengeluaran', 'Beli kerupuk', '10000', 'Tue May 09 2023', '2023-05-09 06:25:12', '2023-05-09 06:25:12'),
(132, 2200, 'pemasukan', 'gaji', '2000000', 'Tue May 09 2023', '2023-05-09 11:58:34', '2023-05-09 11:58:34'),
(133, 2200, 'pengeluaran', 'Kirim mamak', '1000000', 'Tue May 09 2023', '2023-05-09 11:59:54', '2023-05-09 11:59:54'),
(134, 2200, NULL, 'tes', '500000', 'Mon May 08 2023', '2023-05-09 12:00:41', '2023-05-09 12:00:41'),
(135, 2200, 'pengeluaran', 'hkmtd', '200000', 'Wed May 10 2023', '2023-05-09 12:01:59', '2023-05-09 12:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nip` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `saldo` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nip`, `nama`, `password`, `saldo`, `createdAt`, `updatedAt`) VALUES
(3, 3302, 'Indra', '$2b$10$OL6f4zeY9X/eufmMmMFiReVMWR00jns6SC.mRHDsIeyK4vX2wVB2m', '38000', '2023-04-27 07:32:22', '2023-05-06 05:11:38'),
(4, 3303, 'Ferry', '$2b$10$NwT3PxWqtUJpZ9Ws6euWTeeSQijZx8bpWGRKK3Qe1znOqjGVMLfbS', '228000', '2023-04-27 07:33:24', '2023-05-09 06:28:01'),
(5, 3304, 'Indra', '123', '0', '2023-04-30 09:21:26', '2023-04-30 09:21:26'),
(6, 3305, 'Cassie', '$2b$05$9eQgoarsmoWTz9rA2hcAbOOK9Q.PmYAQ48JAYNpeb0sUkD98LBNPq', '0', '2023-04-30 07:26:41', '2023-04-30 07:26:41'),
(7, 3306, 'Johny', '$2b$05$0mTjHvtN6DJvLB9TH5mr5eWxLlzGdvHZtXyxhnjJHdIW6GNxxZ36S', '0', '2023-04-30 07:29:53', '2023-04-30 07:29:53'),
(8, 3309, 'Andi', '$2b$05$/UiQBaMBXYEtqfpK6PXJbO07cJ7KuypdrDSd197mX.1eFtCJXo5fS', '', '2023-05-07 13:43:57', '2023-05-07 13:43:57'),
(9, 5505, 'Uni', '$2b$05$sKHiO.MWva9zRqz8upAzo.ffMiQZlky3T1x2W7DDi0RftTCO5qO06', '40000', '2023-05-07 13:45:31', '2023-05-07 13:46:26'),
(10, 9909, 'popol', '$2b$05$DCeF0LDGQng.8xK.OmLb4.Fp9bp9ypAZ/qTmDE2nXfYWjQb2wToDS', '65000', '2023-05-07 15:33:26', '2023-05-08 15:36:20'),
(11, 909, 'Andri', '$2b$05$QBaiUOpvonFwSqO2LIooWe.C/MHyR.rTwYaOttju4mjktKPLuy7KC', '0', '2023-05-08 15:39:03', '2023-05-08 15:39:03'),
(12, 2200, 'Ferryndra', '$2b$05$TvQNj1AkgLmd.GeGAF0UzeKEHwTLenMYDXzwosOzUi/jWxYoilvnW', '300000', '2023-05-09 11:57:40', '2023-05-09 12:01:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cash`
--
ALTER TABLE `cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`nip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cash`
--
ALTER TABLE `cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
