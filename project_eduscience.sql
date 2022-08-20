-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 19, 2022 at 03:54 PM
-- Server version: 10.3.36-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sidodadi_eduscience`
--

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(4) NOT NULL,
  `kode` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `kode`, `keterangan`) VALUES
(1, 'namaapk', 'E-UPTP'),
(2, 'pengembang', 'Tim IT UPT'),
(3, 'versi', '1.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penilaian`
--

CREATE TABLE `tb_penilaian` (
  `id` int(12) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `subtema_id` int(12) DEFAULT NULL,
  `skor` int(4) DEFAULT NULL,
  `benar` int(4) DEFAULT NULL,
  `salah` int(4) DEFAULT NULL,
  `kosong` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_penilaian`
--

INSERT INTO `tb_penilaian` (`id`, `user_id`, `subtema_id`, `skor`, `benar`, `salah`, `kosong`) VALUES
(6, 86, 28, 100, 2, 0, 0),
(7, 86, 27, 0, 0, 1, 0),
(8, 91, 27, 0, 0, 1, 0),
(9, 91, 28, 100, 2, 0, 0),
(10, 92, 27, 100, 1, 0, 0),
(11, 93, 27, 100, 1, 0, 0),
(12, 93, 28, 50, 1, 1, 0),
(14, 97, 27, 100, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pertanyaan`
--

CREATE TABLE `tb_pertanyaan` (
  `id` int(12) NOT NULL,
  `pertanyaan` text DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `penanya_id` int(11) DEFAULT NULL,
  `penjawab_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pertanyaan`
--

INSERT INTO `tb_pertanyaan` (`id`, `pertanyaan`, `jawaban`, `penanya_id`, `penjawab_id`, `created`) VALUES
(7, 'Bagaimana caranya menggunakan aplikasi ini?', 'Bagus', 91, NULL, '2022-08-08 06:11:07'),
(8, 'Bagaimana cara mengakses kuis?', NULL, 92, NULL, '2022-08-08 06:16:33'),
(9, 'Testing', 'Oke', 86, NULL, '2022-08-10 08:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `tb_riwayat_jawaban`
--

CREATE TABLE `tb_riwayat_jawaban` (
  `id` int(12) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `soal_id` int(12) DEFAULT NULL,
  `subtema_id` int(12) DEFAULT NULL,
  `jawaban` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_riwayat_jawaban`
--

INSERT INTO `tb_riwayat_jawaban` (`id`, `user_id`, `soal_id`, `subtema_id`, `jawaban`) VALUES
(11, 86, 21, 28, 'A'),
(12, 86, 22, 28, 'A'),
(13, 86, 20, 27, 'E'),
(14, 91, 20, 27, 'B'),
(15, 91, 21, 28, 'A'),
(16, 91, 22, 28, 'A'),
(17, 92, 20, 27, 'A'),
(18, 93, 20, 27, 'A'),
(19, 93, 21, 28, 'A'),
(20, 93, 22, 28, 'B'),
(23, 97, 20, 27, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id` int(12) NOT NULL,
  `subtema_id` int(12) DEFAULT NULL,
  `soal` tinytext DEFAULT NULL,
  `pil_a` tinytext DEFAULT NULL,
  `pil_b` tinytext DEFAULT NULL,
  `pil_c` tinytext DEFAULT NULL,
  `pil_d` tinytext DEFAULT NULL,
  `pil_e` tinytext DEFAULT NULL,
  `kunci` tinytext DEFAULT NULL,
  `pembuat` int(12) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_soal`
--

INSERT INTO `tb_soal` (`id`, `subtema_id`, `soal`, `pil_a`, `pil_b`, `pil_c`, `pil_d`, `pil_e`, `kunci`, `pembuat`, `created`) VALUES
(20, 27, 'Soal bahan 1', 'A', 'B', 'C', 'D', 'E', 'A', 88, '2022-08-08 06:00:35'),
(21, 28, 'Bahan 2', 'A', 'B', 'C', 'D', 'E', 'A', 88, '2022-08-08 06:01:18'),
(22, 28, 'Bahan ke 2', 'A', 'B', 'C', 'D', 'E', 'A', 88, '2022-08-08 06:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subtema`
--

CREATE TABLE `tb_subtema` (
  `id` int(12) NOT NULL,
  `tema_id` int(12) DEFAULT NULL,
  `deskripsi` tinytext DEFAULT NULL,
  `video` varchar(20) DEFAULT NULL,
  `modul` tinytext DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_subtema`
--

INSERT INTO `tb_subtema` (`id`, `tema_id`, `deskripsi`, `video`, `modul`, `created`) VALUES
(27, 24, 'Bahan 1', 'RkDQfVvEeLk', '10HXS-wffpKjpp8nlgxj0xICWou_mRUCU', '2022-08-08 05:59:57'),
(28, 24, 'Bahan 2', NULL, NULL, '2022-08-08 06:00:03'),
(29, 24, 'Bahan 3', NULL, '1lru9_gKSCFxN66lhhM2Xt1w63O4MBC6k', '2022-08-08 06:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tema`
--

CREATE TABLE `tb_tema` (
  `id` int(12) NOT NULL,
  `kelas` enum('1','2','3','4','5','6') DEFAULT NULL,
  `deskripsi` tinytext DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tema`
--

INSERT INTO `tb_tema` (`id`, `kelas`, `deskripsi`, `created`) VALUES
(24, '1', 'Matematika', '2022-08-08 05:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipe_user`
--

CREATE TABLE `tb_tipe_user` (
  `id` int(1) NOT NULL,
  `deskripsi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tipe_user`
--

INSERT INTO `tb_tipe_user` (`id`, `deskripsi`) VALUES
(1, 'Pelajar'),
(2, 'Relawan'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(12) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` tinytext DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tempat_lahir` tinytext DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `status` int(2) DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `tipe_user` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `email`, `nama`, `tgl_lahir`, `tempat_lahir`, `hp`, `status`, `created`, `foto`, `tipe_user`) VALUES
(1, 'admin', '7c222fb2927d828af22f592134e8932480637c0d', 'admin@bikinkarya.com', 'Admin', '1998-01-29', 'Kabupaten Lumajang', '081231390341', 1, '2021-01-08 14:07:37', '', 3),
(86, 'pelajar', '7c222fb2927d828af22f592134e8932480637c0d', 'pelajar@bikinkarya.com', 'Akun Pelajar]', '2022-08-03', 'Lumajang', '081231390340', 1, '2022-08-07 02:15:20', NULL, 1),
(88, 'relawan', '7c222fb2927d828af22f592134e8932480637c0d', 'relawan@bikinkarya.com', 'Akun Relawan', '2022-08-08', 'Lumajang', '081231390349', 1, '2022-08-07 03:12:46', NULL, 2),
(89, 'fitrahizulfalaq', 'f6e4f4e99cad15970af1f7aff34ecef18cadf693', 'fitrahizulfalaq@gmail.com', 'Fitrah Izul Falaq', '2022-08-08', 'Lumajang', '081231390000', 1, '2022-08-08 03:34:41', NULL, 1),
(90, 'aan', '7c222fb2927d828af22f592134e8932480637c0d', 'fitrah.teps@gmail.com', 'Aan Dzulqornain', '2022-08-01', 'Lumajang', '081231390400', 1, '2022-08-08 03:42:05', NULL, 2),
(91, 'nikolas', '7c222fb2927d828af22f592134e8932480637c0d', 'nikolas@bikinkarya.com', 'Nikolas Saputra', '2022-08-01', 'Malang', '081231390333', 1, '2022-08-08 06:07:47', NULL, 1),
(92, 'andita', 'ea62de0df7909bbdf2f6a2d71ce1d7097fcbfd8e', 'andita.eka@cmlabs.co', 'Andita', '1999-03-26', 'Probolinggo', '082230806862', 1, '2022-08-08 06:09:36', NULL, 1),
(93, 'uunsetiawati', '7c222fb2927d828af22f592134e8932480637c0d', 'uun@bikinkarya.com', 'Uun Setiawati ', '1998-01-29', 'Malang', '081231390321', 1, '2022-08-08 06:37:16', NULL, 1),
(94, 'mardiahafifa', '9856fa00ace7bf9d0f77b5d134f0aa3187470a29', 'mardiaafifa@gmail.com', 'Mardiah Afifa', '2001-03-02', 'Palembang', '08983218935', 1, '2022-08-11 04:59:13', NULL, 2),
(95, 'Mardiah', '9856fa00ace7bf9d0f77b5d134f0aa3187470a29', 'mardiahafifa@gmail.com', 'Mardiah', '2001-03-02', 'Palembang', '081274249134', 1, '2022-08-11 05:12:15', NULL, 1),
(96, 'Anitaseptia', 'fe9b59a632fba3070083353f3b06a8132f88386b', 'anitaseptia743@gmail.com', 'Anita Septia', '2001-09-13', 'Jayaloka', '085783088659', 1, '2022-08-11 06:30:00', NULL, 2),
(97, 'Meilinda', '598353863bcb1154a5e6b132c67f022380eec92f', 'meilinda@fkip.unsri.ac.id', 'Meilinda', '2020-09-15', 'Muara Enim', '081367718552', 1, '2022-08-15 02:02:05', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subtema_id` (`subtema_id`);

--
-- Indexes for table `tb_pertanyaan`
--
ALTER TABLE `tb_pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penanya_id` (`penanya_id`),
  ADD KEY `penjawab_id` (`penjawab_id`);

--
-- Indexes for table `tb_riwayat_jawaban`
--
ALTER TABLE `tb_riwayat_jawaban`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembuat` (`pembuat`),
  ADD KEY `subtema_id` (`subtema_id`);

--
-- Indexes for table `tb_subtema`
--
ALTER TABLE `tb_subtema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tema_id` (`tema_id`);

--
-- Indexes for table `tb_tema`
--
ALTER TABLE `tb_tema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tipe_user`
--
ALTER TABLE `tb_tipe_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipe_user` (`tipe_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_pertanyaan`
--
ALTER TABLE `tb_pertanyaan`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_riwayat_jawaban`
--
ALTER TABLE `tb_riwayat_jawaban`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_subtema`
--
ALTER TABLE `tb_subtema`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tb_tema`
--
ALTER TABLE `tb_tema`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_tipe_user`
--
ALTER TABLE `tb_tipe_user`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD CONSTRAINT `tb_penilaian_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_penilaian_ibfk_2` FOREIGN KEY (`subtema_id`) REFERENCES `tb_subtema` (`id`);

--
-- Constraints for table `tb_pertanyaan`
--
ALTER TABLE `tb_pertanyaan`
  ADD CONSTRAINT `tb_pertanyaan_ibfk_1` FOREIGN KEY (`penanya_id`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_pertanyaan_ibfk_2` FOREIGN KEY (`penjawab_id`) REFERENCES `tb_user` (`id`);

--
-- Constraints for table `tb_riwayat_jawaban`
--
ALTER TABLE `tb_riwayat_jawaban`
  ADD CONSTRAINT `tb_riwayat_jawaban_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`);

--
-- Constraints for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`pembuat`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`subtema_id`) REFERENCES `tb_subtema` (`id`);

--
-- Constraints for table `tb_subtema`
--
ALTER TABLE `tb_subtema`
  ADD CONSTRAINT `tb_subtema_ibfk_1` FOREIGN KEY (`tema_id`) REFERENCES `tb_tema` (`id`);

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`tipe_user`) REFERENCES `tb_tipe_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
