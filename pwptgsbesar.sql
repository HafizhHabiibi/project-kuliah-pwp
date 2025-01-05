-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 05, 2025 at 08:02 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwptgsbesar`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('18430ca01244');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(80) NOT NULL,
  `role` varchar(10) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `role`, `email`, `password_hash`) VALUES
(1, 'hafizh', 'admin', 'hafizhhabiibi13@gmail.com', 'scrypt:32768:8:1$IhpTSJhZOL3PqVYn$d08ce0df3b842b9240405d95128728918215a97e95d6763a7fc9e093dd6bb89a5b9b1c2985563366c72453cfec6aad6811f0edf4d787132ae23fa4ada0fb8a7d'),
(3, 'riri', 'user', 'riri123@gmail.com', 'scrypt:32768:8:1$O6og59P5cOh3ddiC$bf3d779050f4601ceb25ed7f6483ac18a15da63249c447e690c516b51741720a9a0b404c285335704de4fc708e0ba871f7089aea33e91cf963214176277173ea'),
(4, 'admin', 'admin', 'admin123@gmail.com', 'scrypt:32768:8:1$5n9ptvI87zApw2LR$e4e6f2fc83c50c32c576c68e631253d3db0aeda31b663b37f97ef7dc0d0072848ca99b42eba08f098120a1687941dcbd6548b226eacbc2c358de3f3cd6a9fe67'),
(6, 'admin2', 'admin', 'admin2@gmail.com', 'scrypt:32768:8:1$FjAgRbEAGUpt1FBl$601dcedba8eb21d607dcba1da88f71a3ea587d9b606a3ec48705445bb6378e26d5594adc4e52f5bb750e070267721c5afec01b38ee2db7c6c2466f25b49ae72c'),
(8, 'mimi', 'user', 'mimi123@gmail.com', 'scrypt:32768:8:1$27799pagcSHFdDAU$89516563865495442eca93af0ed92d67f3bd5836e95845213f9a06b604b4915f24101d64fb78f6ed7941e1831a999846256d3a7ff8a4841a084219fbacfec7f6'),
(10, 'ciko', 'user', 'ciko123@gmail.com', 'scrypt:32768:8:1$HdYTZigBUVMetlX7$604d9d5253d37ab9033537579a485aea80638cafbe6e136250dd07b17f758a05f97e0abce89435538b3ced8ed167221c3b4b61c465ec15faf852966a6ea0f0c3'),
(12, 'ciki', 'user', 'ciki123@gmail.com', 'scrypt:32768:8:1$KyTWFqKyADqO1IW3$7d756b2347a5920112ca9797b0cdd187bcc2196fda8b32246ef3c56be5386bd8fe0d18ee08eb87cb3313c3494e4cd7375012f3b77f1969327f51e361ef1c0dcd'),
(15, 'test', 'admin', 'test123@gmail.com', 'scrypt:32768:8:1$dlMpWUYvY6WMZGec$85f5d4d1ef3ebec86b3285fd39c35b7917f0f6c21624ef0b526c10ed17095931603cab764294a7661577606c181ccf2e7e5b8ef8501a1d128107d21de66b0916');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
