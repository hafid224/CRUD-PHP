-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2022 at 03:16 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_brg` varchar(4) NOT NULL,
  `nama_brg` varchar(20) NOT NULL,
  `jenis_brg` varchar(20) NOT NULL,
  `harga_beli` varchar(10) NOT NULL,
  `harga_jual` varchar(10) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `jumlah` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `jenis_brg`, `harga_beli`, `harga_jual`, `supplier`, `jumlah`) VALUES
('A001', 'Penggaris 20 cm', 'ATK', '1500', '2000', 'PT. Joyko', '100'),
('A003', 'Penghapus', 'ATK', '1500', '2500', 'PT. Joyko', '85'),
('A004', 'Jangka', 'ATK', '1500', '2000', 'PT. Joyko', '90'),
('M001', 'Roti tiramitsu', 'Snack', '1500', '2000', 'PT. Mentari', '60'),
('M002', 'Milo', 'Minuman', '3000', '3500', 'PT. Mentari', '45');

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `hapus_barang` AFTER DELETE ON `barang` FOR EACH ROW BEGIN
INSERT INTO log_barang (id_brg, keterangan, waktu) VALUES (old.id_brg, 'hapus barang', now());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_barang`
--

CREATE TABLE `log_barang` (
  `id_log` int(4) NOT NULL,
  `id_brg` varchar(4) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `jumlah` varchar(3) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_barang`
--

INSERT INTO `log_barang` (`id_log`, `id_brg`, `keterangan`, `jumlah`, `waktu`) VALUES
(18, 'A002', 'Restok', '5', '2022-04-23 11:59:10'),
(19, 'A002', 'Edit data', '40', '2022-04-23 12:00:13'),
(20, 'A002', 'hapus barang', '', '2022-04-23 12:18:46'),
(21, 'M001', 'Edit data', '60', '2022-04-23 13:08:36'),
(22, 'M001', 'Edit data', '60', '2022-04-23 13:09:17'),
(23, 'A003', 'Restok', '5', '2022-04-23 13:10:56'),
(24, 'A001', 'Restok', '9', '2022-04-24 15:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(4) NOT NULL,
  `nama_pelanggan` varchar(40) NOT NULL,
  `jk` varchar(1) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jk`, `alamat`) VALUES
(102, 'Bachdim', 'L', 'Jl. Pegangsaan no.78'),
(103, 'koriah', 'P', 'Jl. Pegangsaan no.99');

-- --------------------------------------------------------

--
-- Table structure for table `suplai`
--

CREATE TABLE `suplai` (
  `id_transaksi` int(4) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `id_brg` varchar(4) NOT NULL,
  `nama_brg` varchar(20) NOT NULL,
  `jenis_brg` varchar(20) NOT NULL,
  `harga_beli` varchar(10) NOT NULL,
  `harga_jual` varchar(10) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `jumlah` varchar(3) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suplai`
--

INSERT INTO `suplai` (`id_transaksi`, `keterangan`, `id_brg`, `nama_brg`, `jenis_brg`, `harga_beli`, `harga_jual`, `supplier`, `jumlah`, `waktu`) VALUES
(793, 'Barang masuk', 'A001', 'Penggaris', 'ATK', '1500', '2000', 'PT. Joyko', '80', '2022-04-23 00:00:00'),
(794, 'Barang masuk', 'M001', 'Roti cokelat', 'Snack', '1500', '2000', 'PT. Mentari', '30', '2022-04-23 00:00:00'),
(795, 'Barang masuk', 'A002', 'Buku', 'ATK', '2000', '2500', 'PT. Joyko', '9', '2022-04-23 00:00:00'),
(798, 'restok', '111', 'Pulpen', 'ATK', '1000', '1500', 'PT. Joyko', '13', '2022-04-23 04:46:49'),
(799, 'Barang masuk', 'A003', 'Penghapus', 'ATK', '1500', '2500', 'PT. Joyko', '80', '2022-04-23 00:00:00'),
(800, 'Barang masuk', 'A004', 'Jangka', 'ATK', '1500', '2000', 'PT. Joyko', '90', '2022-04-23 13:14:47'),
(801, 'Barang masuk', 'M002', 'Milo', 'Minuman', '3000', '3500', 'PT. Mentari', '45', '2022-04-24 15:32:35');

--
-- Triggers `suplai`
--
DELIMITER $$
CREATE TRIGGER `Trigger_suplai` AFTER INSERT ON `suplai` FOR EACH ROW BEGIN
INSERT INTO barang (id_brg, nama_brg, jenis_brg, harga_beli, harga_jual, supplier, jumlah) VALUES (new.id_brg, new.nama_brg, new.jenis_brg, new.harga_beli, new.harga_jual, new.supplier, new.jumlah);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transksi`
--

CREATE TABLE `transksi` (
  `id_jual` int(4) NOT NULL,
  `id_pelanggan` int(4) NOT NULL,
  `id_brg` varchar(4) NOT NULL,
  `jumlah` varchar(3) NOT NULL,
  `harga_jual` varchar(10) NOT NULL,
  `Total` varchar(10) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transksi`
--

INSERT INTO `transksi` (`id_jual`, `id_pelanggan`, `id_brg`, `jumlah`, `harga_jual`, `Total`, `waktu`) VALUES
(5, 102, 'A001', '2', '2000', '0', '2022-04-23 15:57:15'),
(6, 102, 'A001', '2', '2000', '4000', '2022-04-23 15:58:37');

--
-- Triggers `transksi`
--
DELIMITER $$
CREATE TRIGGER `trigger_transaksi` AFTER INSERT ON `transksi` FOR EACH ROW BEGIN
UPDATE barang SET jumlah=jumlah-new.jumlah
where id_brg=NEW.id_brg;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `log_barang`
--
ALTER TABLE `log_barang`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `suplai`
--
ALTER TABLE `suplai`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `transksi`
--
ALTER TABLE `transksi`
  ADD PRIMARY KEY (`id_jual`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_brg` (`id_brg`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_barang`
--
ALTER TABLE `log_barang`
  MODIFY `id_log` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `suplai`
--
ALTER TABLE `suplai`
  MODIFY `id_transaksi` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=802;

--
-- AUTO_INCREMENT for table `transksi`
--
ALTER TABLE `transksi`
  MODIFY `id_jual` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transksi`
--
ALTER TABLE `transksi`
  ADD CONSTRAINT `transksi_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transksi_ibfk_3` FOREIGN KEY (`id_brg`) REFERENCES `barang` (`id_brg`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
