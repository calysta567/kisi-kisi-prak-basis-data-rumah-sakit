-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2026 at 03:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rumah_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `spesialisasi` varchar(100) DEFAULT NULL,
  `tarif_konsultasi` decimal(12,2) NOT NULL,
  `status_dokter` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_poli`, `spesialisasi`, `tarif_konsultasi`, `status_dokter`) VALUES
(1, 'Dr. Ahmad', 1, 'Dokter Umum', 100000.00, 'Aktif'),
(2, 'Dr. Bella', 2, 'Dokter Anak', 150000.00, 'Aktif'),
(3, 'Dr. Candra', 3, 'Dokter Gigi', 175000.00, 'Aktif'),
(4, 'Dr. Dimas', 4, 'Dokter Jantung', 250000.00, 'Aktif'),
(5, 'Dr. Eka', 5, 'Dokter Mata', 150000.00, 'Aktif'),
(6, 'Dr. Farah', 6, 'Dokter Kulit', 200000.00, 'Aktif'),
(7, 'Dr. Gilang', 7, 'Dokter Saraf', 225000.00, 'Cuti'),
(8, 'Dr. Hana', 8, 'Dokter THT', 175000.00, 'Aktif'),
(9, 'Dr. Indra', 9, 'Dokter Bedah', 300000.00, 'Aktif'),
(10, 'Dr. Joko', 10, 'Dokter Paru', 200000.00, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `jenis_kunjungan` varchar(30) NOT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `status_kunjungan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `tanggal_kunjungan`, `jenis_kunjungan`, `diagnosis`, `status_kunjungan`) VALUES
(1, 1, 1, '2026-10-01', 'Umum', 'Demam', 'Selesai'),
(2, 2, 2, '2026-10-02', 'Kontrol', 'Alergi', 'Selesai'),
(3, 3, 3, '2026-10-03', 'Umum', 'Sakit gigi', 'Selesai'),
(4, 4, 4, '2026-10-04', 'Darurat', 'Nyeri dada', 'Diperiksa'),
(5, 5, 5, '2026-10-05', 'Umum', 'Mata merah', 'Selesai'),
(6, 6, 6, '2026-10-06', 'Kontrol', 'Iritasi kulit', 'Menunggu'),
(7, 7, 1, '2026-10-07', 'Darurat', 'Sesak napas', 'Batal'),
(8, 8, 2, '2026-10-08', 'Kontrol', 'Pemeriksaan rutin', 'Selesai'),
(9, 9, 3, '2026-10-09', 'Umum', 'Gigi berlubang', 'Selesai'),
(10, 1, 4, '2026-10-10', 'Darurat', 'Gangguan jantung', 'Diperiksa'),
(11, 2, 5, '2026-10-11', 'Umum', 'Pusing', 'Menunggu');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_hp`) VALUES
(1, 'Andi Saputra', 'L', '2000-01-10', 'Bekasi', '081200000001'),
(2, 'Budi Santoso', 'L', '1998-02-15', 'Jakarta', '081200000002'),
(3, 'Citra Lestari', 'P', '2001-03-20', 'Depok', '081200000003'),
(4, 'Dewi Anggraini', 'P', '1999-04-25', 'Bogor', '081200000004'),
(5, 'Eko Pratama', 'L', '1997-05-12', 'Bekasi', '081200000005'),
(6, 'Fitri Amelia', 'P', '2002-06-18', 'Jakarta', '081200000006'),
(7, 'Galih Ramadhan', 'L', '1996-07-22', 'Depok', '081200000007'),
(8, 'Hana Safitri', 'P', '2003-08-14', 'Bogor', '081200000008'),
(9, 'Indra Wijaya', 'L', '2000-09-09', 'Bekasi', '081200000009'),
(10, 'Jihan Putri', 'P', '2001-10-30', 'Jakarta', '081200000010');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_kunjungan` int(11) NOT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `biaya_konsultasi` decimal(12,2) NOT NULL DEFAULT 0.00,
  `biaya_obat` decimal(12,2) NOT NULL DEFAULT 0.00,
  `biaya_laboratorium` decimal(12,2) NOT NULL DEFAULT 0.00,
  `diskon` decimal(12,2) NOT NULL DEFAULT 0.00,
  `metode_bayar` varchar(30) DEFAULT NULL,
  `status_bayar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_kunjungan`, `tanggal_bayar`, `biaya_konsultasi`, `biaya_obat`, `biaya_laboratorium`, `diskon`, `metode_bayar`, `status_bayar`) VALUES
(1, 1, '2026-10-01', 100000.00, 20000.00, 0.00, 0.00, 'Tunai', 'Lunas'),
(2, 2, '2026-10-02', 150000.00, 30000.00, 0.00, 10000.00, 'Transfer', 'Lunas'),
(3, 3, '2026-10-03', 175000.00, 50000.00, 25000.00, 0.00, 'Asuransi', 'Lunas'),
(4, 4, NULL, 250000.00, 50000.00, 100000.00, 0.00, 'Transfer', 'Belum Lunas'),
(5, 5, '2026-10-05', 150000.00, 25000.00, 0.00, 25000.00, 'Tunai', 'Lunas'),
(6, 6, NULL, 200000.00, 50000.00, 0.00, 0.00, 'Asuransi', 'Belum Lunas'),
(7, 7, NULL, 100000.00, 0.00, 0.00, 0.00, 'Tunai', 'Belum Lunas'),
(8, 8, '2026-10-08', 150000.00, 20000.00, 30000.00, 0.00, 'Transfer', 'Lunas'),
(9, 9, '2026-10-09', 175000.00, 50000.00, 25000.00, 10000.00, 'Asuransi', 'Lunas'),
(10, 10, NULL, 250000.00, 100000.00, 150000.00, 0.00, 'Transfer', 'Belum Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id_poli` int(11) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `lantai` int(11) DEFAULT NULL,
  `status_poli` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `lantai`, `status_poli`) VALUES
(1, 'Poli Umum', 1, 'Aktif'),
(2, 'Poli Anak', 2, 'Aktif'),
(3, 'Poli Gigi', 2, 'Aktif'),
(4, 'Poli Jantung', 3, 'Aktif'),
(5, 'Poli Mata', 3, 'Aktif'),
(6, 'Poli Kulit', 2, 'Aktif'),
(7, 'Poli Saraf', 3, 'Aktif'),
(8, 'Poli THT', 2, 'Aktif'),
(9, 'Poli Bedah', 4, 'Aktif'),
(10, 'Poli Paru', 4, 'Nonaktif');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_dokter_kunjungan`
-- (See below for the actual view)
--
CREATE TABLE `view_dokter_kunjungan` (
`id_dokter` int(11)
,`nama_dokter` varchar(100)
,`spesialisasi` varchar(100)
,`nama_poli` varchar(100)
,`id_kunjungan` int(11)
,`status_kunjungan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_keterangan_diskon`
-- (See below for the actual view)
--
CREATE TABLE `view_keterangan_diskon` (
`id_pembayaran` int(11)
,`id_kunjungan` int(11)
,`tanggal_bayar` date
,`biaya_konsultasi` decimal(12,2)
,`biaya_obat` decimal(12,2)
,`biaya_laboratorium` decimal(12,2)
,`diskon` decimal(12,2)
,`metode_bayar` varchar(30)
,`status_bayar` varchar(20)
,`keterangan_diskon` varchar(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_klasifikasi_biaya`
-- (See below for the actual view)
--
CREATE TABLE `view_klasifikasi_biaya` (
`id_pembayaran` int(11)
,`id_kunjungan` int(11)
,`total_biaya` decimal(15,2)
,`klasifikasi_biaya` varchar(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_kunjungan_pasien`
-- (See below for the actual view)
--
CREATE TABLE `view_kunjungan_pasien` (
`id_pasien` int(11)
,`nama_pasien` varchar(100)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`tanggal_kunjungan` date
,`jenis_kunjungan` varchar(30)
,`diagnosis` varchar(200)
,`status_kunjungan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan_pemeriksaan`
-- (See below for the actual view)
--
CREATE TABLE `view_laporan_pemeriksaan` (
`nama_pasien` varchar(100)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`tanggal_kunjungan` date
,`diagnosis` varchar(200)
,`total_sebelum_diskon` decimal(14,2)
,`diskon` decimal(12,2)
,`total_setelah_diskon` decimal(15,2)
,`metode_bayar` varchar(30)
,`status_pembayaran` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_prioritas_pelayanan`
-- (See below for the actual view)
--
CREATE TABLE `view_prioritas_pelayanan` (
`id_kunjungan` int(11)
,`id_pasien` int(11)
,`id_dokter` int(11)
,`jenis_kunjungan` varchar(30)
,`status_kunjungan` varchar(30)
,`prioritas_pelayanan` varchar(17)
);

-- --------------------------------------------------------

--
-- Structure for view `view_dokter_kunjungan`
--
DROP TABLE IF EXISTS `view_dokter_kunjungan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dokter_kunjungan`  AS SELECT `d`.`id_dokter` AS `id_dokter`, `d`.`nama_dokter` AS `nama_dokter`, `d`.`spesialisasi` AS `spesialisasi`, `po`.`nama_poli` AS `nama_poli`, `k`.`id_kunjungan` AS `id_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan` FROM ((`dokter` `d` join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) left join `kunjungan` `k` on(`d`.`id_dokter` = `k`.`id_dokter`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_keterangan_diskon`
--
DROP TABLE IF EXISTS `view_keterangan_diskon`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_keterangan_diskon`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`tanggal_bayar` AS `tanggal_bayar`, `pembayaran`.`biaya_konsultasi` AS `biaya_konsultasi`, `pembayaran`.`biaya_obat` AS `biaya_obat`, `pembayaran`.`biaya_laboratorium` AS `biaya_laboratorium`, `pembayaran`.`diskon` AS `diskon`, `pembayaran`.`metode_bayar` AS `metode_bayar`, `pembayaran`.`status_bayar` AS `status_bayar`, if(`pembayaran`.`diskon` > 0,'Mendapat Diskon','Tidak Mendapat Diskon') AS `keterangan_diskon` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Structure for view `view_klasifikasi_biaya`
--
DROP TABLE IF EXISTS `view_klasifikasi_biaya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_klasifikasi_biaya`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`biaya_konsultasi`+ `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` AS `total_biaya`, if(`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` < 100000,'Ekonomis',if(`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` < 300000,'Menengah','Premium')) AS `klasifikasi_biaya` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Structure for view `view_kunjungan_pasien`
--
DROP TABLE IF EXISTS `view_kunjungan_pasien`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kunjungan_pasien`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `d`.`nama_dokter` AS `nama_dokter`, `po`.`nama_poli` AS `nama_poli`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`jenis_kunjungan` AS `jenis_kunjungan`, `k`.`diagnosis` AS `diagnosis`, `k`.`status_kunjungan` AS `status_kunjungan` FROM (((`kunjungan` `k` join `pasien` `p` on(`k`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_laporan_pemeriksaan`
--
DROP TABLE IF EXISTS `view_laporan_pemeriksaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_pemeriksaan`  AS SELECT `p`.`nama_pasien` AS `nama_pasien`, `d`.`nama_dokter` AS `nama_dokter`, `po`.`nama_poli` AS `nama_poli`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`diagnosis` AS `diagnosis`, coalesce(`pb`.`biaya_konsultasi`,0) + coalesce(`pb`.`biaya_obat`,0) + coalesce(`pb`.`biaya_laboratorium`,0) AS `total_sebelum_diskon`, `pb`.`diskon` AS `diskon`, CASE WHEN `pb`.`id_pembayaran` is null THEN NULL ELSE `pb`.`biaya_konsultasi`+ `pb`.`biaya_obat` + `pb`.`biaya_laboratorium` - `pb`.`diskon` END AS `total_setelah_diskon`, `pb`.`metode_bayar` AS `metode_bayar`, CASE WHEN `pb`.`id_pembayaran` is null THEN 'Belum Ada Pembayaran' ELSE `pb`.`status_bayar` END AS `status_pembayaran` FROM ((((`kunjungan` `k` join `pasien` `p` on(`k`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) left join `pembayaran` `pb` on(`k`.`id_kunjungan` = `pb`.`id_kunjungan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_prioritas_pelayanan`
--
DROP TABLE IF EXISTS `view_prioritas_pelayanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_prioritas_pelayanan`  AS SELECT `kunjungan`.`id_kunjungan` AS `id_kunjungan`, `kunjungan`.`id_pasien` AS `id_pasien`, `kunjungan`.`id_dokter` AS `id_dokter`, `kunjungan`.`jenis_kunjungan` AS `jenis_kunjungan`, `kunjungan`.`status_kunjungan` AS `status_kunjungan`, if(`kunjungan`.`status_kunjungan` = 'Batal','Tidak Dilayani',if(`kunjungan`.`jenis_kunjungan` = 'Darurat' and `kunjungan`.`status_kunjungan` <> 'Batal','Prioritas Tinggi',if(`kunjungan`.`jenis_kunjungan` = 'Kontrol' and `kunjungan`.`status_kunjungan` = 'Selesai','Kontrol Selesai','Pelayanan Reguler'))) AS `prioritas_pelayanan` FROM `kunjungan` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `id_kunjungan` (`id_kunjungan`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id_kunjungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id_poli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`);

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
