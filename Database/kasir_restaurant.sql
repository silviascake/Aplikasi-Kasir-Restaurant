-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Bulan Mei 2022 pada 17.16
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_restaurant`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailpesan`
--

CREATE TABLE `detailpesan` (
  `id_detail` int(15) NOT NULL,
  `id_menu` int(15) NOT NULL,
  `qty` int(5) NOT NULL,
  `status` varchar(20) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailpesan`
--

INSERT INTO `detailpesan` (`id_detail`, `id_menu`, `qty`, `status`, `total`) VALUES
(1, 6, 2, 'Lunas', 20000),
(2, 5, 1, 'Lunas', 30000),
(3, 8, 1, 'Lunas', 20000),
(4, 6, 1, 'Lunas', 10000),
(5, 8, 4, 'Lunas', 80000),
(6, 1, 2, 'Lunas', 28000),
(7, 2, 5, 'Lunas', 100000),
(8, 3, 1, 'Lunas', 23000),
(9, 5, 4, 'Lunas', 120000),
(10, 8, 3, 'Lunas', 60000),
(11, 9, 3, 'Lunas', 60000),
(12, 8, 3, 'Lunas', 60000),
(13, 9, 3, 'Lunas', 60000),
(14, 8, 2, 'Belum Lunas', 40000),
(15, 9, 1, 'Belum Lunas', 20000);

--
-- Trigger `detailpesan`
--
DELIMITER $$
CREATE TRIGGER `addorder` AFTER INSERT ON `detailpesan` FOR EACH ROW INSERT INTO log_detail(status,waktu,id_detail,id_menu,qty,total)
VALUES ('tambah order',now(),new.id_detail,new.id_menu,new.qty,new.total)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_admin`
--

CREATE TABLE `log_admin` (
  `status` varchar(20) NOT NULL,
  `waktu` date NOT NULL,
  `id_peg` int(11) NOT NULL,
  `nama_peg` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `handphone` int(11) NOT NULL,
  `level` enum('admin','manager','kasir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_admin`
--

INSERT INTO `log_admin` (`status`, `waktu`, `id_peg`, `nama_peg`, `username`, `password`, `handphone`, `level`) VALUES
('ubah data', '2022-03-28', 1, 'silvia', 'admin', '123', 2147483647, 'kasir'),
('ubah data', '2022-03-28', 2, 'ria', 'manager', '123', 2147483647, 'manager'),
('ubah data', '2022-03-28', 1, 'silvia', 'admin', '123', 2147483647, 'kasir'),
('ubah data', '2022-03-28', 3, 'siti', 'kasir', '123', 2147483647, 'kasir'),
('ubah data', '2022-03-28', 1, 'silvia', 'admin', '123', 2147483647, 'admin'),
('ubah data', '2022-03-30', 4, 'ana', 'admin', '123', 2147483647, 'admin'),
('ubah data', '2010-03-30', 1001, 'yuni', 'admin', '123', 0, 'manager'),
('ubah data', '2010-03-30', 4, 'yuni', 'admin', '', 2147483647, 'manager'),
('ubah data', '2010-03-30', 4, 'ana', 'manager', '123', 2147483647, 'manager'),
('ubah data', '2022-03-30', 5, 'ani', '', '123', 2147483647, 'manager'),
('ubah data', '2022-05-20', 6, 'anya', 'kasir', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-20', 6, 'anya', 'kasir', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-20', 6, 'yulia', 'kasir', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-20', 6, 'yulia', 'kasir', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-23', 5, 'anita', 'manager', '1234', 2147483647, 'manager'),
('tambah data', '2022-05-23', 6, 'julia', 'kasir', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-23', 6, 'julia dwi', 'kasirw', '123', 2147483647, 'manager'),
('ubah data', '2022-05-23', 6, 'julia ', 'kasir', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-23', 6, 'julia n', 'kasir r', '1235', 2147483647, 'admin'),
('ubah data', '2022-05-23', 6, 'julia ', 'kasir ', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-23', 6, 'julia ', 'kasir ', '123', 2147483647, 'admin'),
('ubah data', '2022-05-23', 6, 'julia ', 'kasir ', '123', 2147483647, 'kasir'),
('tambah data', '2022-05-24', 7, 'dani', 'manager', '123', 989987678, 'manager'),
('ubah data', '2022-05-24', 7, 'dani', 'manager 1', '123', 989987678, 'admin'),
('ubah data', '2022-05-26', 3, 'siti', 'kasir1', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-26', 6, 'julia ', 'kasir2', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-26', 5, 'anita', 'kasir3', '1234', 2147483647, 'kasir'),
('tambah data', '2022-05-27', 4, 'ana', 'manager', '123', 2147483647, 'manager'),
('tambah data', '2022-05-28', 7, 'dewi', 'kasir', '123', 2147483647, 'kasir'),
('ubah data', '2022-05-28', 7, 'dewi', 'kasir', '123', 2147483647, 'admin'),
('ubah data', '2022-05-28', 7, 'dewi', 'kasir', '123', 2147483647, 'kasir'),
('tambah data', '2022-05-28', 8, 'adinda', 'kasir', '123', 2147483647, 'kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_detail`
--

CREATE TABLE `log_detail` (
  `status` varchar(50) NOT NULL,
  `waktu` date NOT NULL,
  `id_detail` int(15) NOT NULL,
  `id_menu` int(15) NOT NULL,
  `qty` int(15) NOT NULL,
  `total` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_detail`
--

INSERT INTO `log_detail` (`status`, `waktu`, `id_detail`, `id_menu`, `qty`, `total`) VALUES
('tambah order', '2022-05-23', 1, 6, 2, 20000),
('tambah order', '2022-05-23', 2, 5, 1, 30000),
('tambah order', '2022-05-24', 3, 8, 1, 20000),
('tambah order', '2022-05-24', 4, 6, 1, 10000),
('tambah order', '2022-05-24', 5, 8, 4, 80000),
('tambah order', '2022-05-24', 6, 1, 2, 28000),
('tambah order', '2022-05-24', 7, 2, 5, 100000),
('tambah order', '2022-05-24', 8, 3, 1, 23000),
('tambah order', '2022-05-27', 9, 5, 4, 120000),
('tambah order', '2022-05-28', 10, 8, 3, 60000),
('tambah order', '2022-05-28', 11, 9, 3, 60000),
('tambah order', '2022-05-28', 12, 8, 3, 60000),
('tambah order', '2022-05-28', 13, 9, 3, 60000),
('tambah order', '2022-05-28', 14, 7, 1, 9000),
('tambah order', '2022-05-28', 15, 6, 1, 10000),
('tambah order', '2022-05-28', 14, 8, 2, 40000),
('tambah order', '2022-05-28', 15, 9, 1, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_master`
--

CREATE TABLE `log_master` (
  `status` varchar(50) NOT NULL,
  `waktu` date NOT NULL,
  `id_master` int(15) NOT NULL,
  `id_detail` int(15) NOT NULL,
  `id_peg` int(15) NOT NULL,
  `tgl_byr` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_master`
--

INSERT INTO `log_master` (`status`, `waktu`, `id_master`, `id_detail`, `id_peg`, `tgl_byr`) VALUES
('sudah bayar', '2022-05-21', 1, 1, 1, '2022-05-21'),
('sudah bayar', '2022-05-23', 2, 2, 6, '2022-05-23'),
('sudah bayar', '2022-05-24', 3, 4, 1, '2022-05-24'),
('sudah bayar', '2022-05-24', 4, 6, 1, '2022-05-24'),
('sudah bayar', '2022-05-26', 5, 8, 1, '2022-05-26'),
('sudah bayar', '2022-05-27', 6, 9, 3, '2022-05-27'),
('sudah bayar', '2022-05-28', 7, 10, 3, '2022-05-28'),
('sudah bayar', '2022-05-28', 8, 12, 3, '2022-05-28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_menu`
--

CREATE TABLE `log_menu` (
  `status` varchar(50) NOT NULL,
  `waktu` date NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_menu`
--

INSERT INTO `log_menu` (`status`, `waktu`, `nama_menu`, `harga`, `photo`) VALUES
('tambah menu', '2022-03-28', 'Nasi Goreng', 14000, 'D:\\NetBeansProjects 2\\NilaiSiswa_SilviaDwiN.12RPL3\\NilaiSiswa_Silvia12rpl3\\src\\gambar\\Delete.png'),
('tambah menu', '2022-03-28', 'Ayam Goreng', 20000, 'D:\\NetBeansProjects 2\\NilaiSiswa_SilviaDwiN.12RPL3\\NilaiSiswa_Silvia12rpl3\\src\\gambar\\Edit.png'),
('tambah menu', '2022-03-28', 'Ayam Bakar', 23000, 'D:\\NetBeansProjects 2\\NilaiSiswa_SilviaDwiN.12RPL3\\NilaiSiswa_Silvia12rpl3\\src\\gambar\\guru.jpg'),
('tambah menu', '2022-03-28', 'Udang Goreng Asam', 30000, 'D:\\NetBeansProjects 2\\NilaiSiswa_SilviaDwiN.12RPL3\\NilaiSiswa_Silvia12rpl3\\src\\gambar\\Copy.png'),
('update menu', '2022-03-28', 'Udang Goreng ', 30000, 'D:NetBeansProjects 2NilaiSiswa_SilviaDwiN.12RPL3NilaiSiswa_Silvia12rpl3srcgambarCopy.png'),
('tambah menu', '2010-03-30', 'Udang Bakar', 30000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\gambar\\bayar.png'),
('update menu', '2010-03-30', 'Udang Bakar Asam', 30000, 'D:NetBeansProjects 2kasir_cafesilvia12rpl3srcgambarayar.png'),
('tambah menu', '2010-03-30', 'Mie Ayam', 10000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\gambar\\catatan transaksi.png'),
('tambah menu', '2022-03-30', '', 10000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\gambar\\catatan transaksi.png'),
('update menu', '2022-03-30', 'Nasi Goreng', 14000, 'D:NetBeansProjects 2kasir_cafesilvia12rpl3srcmenu\nasi goreng.jpeg'),
('tambah menu', '2022-03-30', '', 14000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\ayam goreng.jpeg'),
('update menu', '2022-03-31', 'Ayam Goreng', 20000, 'D:NetBeansProjects 2kasir_cafesilvia12rpl3srcmenuayam goreng.jpeg'),
('update menu', '2022-03-31', 'Nasi Goreng', 14000, 'D:NetBeansProjects 2kasir_cafesilvia12rpl3srcmenu\nasi goreng.jpeg'),
('update menu', '2022-03-31', 'Ayam Goreng', 20000, 'D:NetBeansProjects 2kasir_cafesilvia12rpl3srcmenuayam goreng.jpeg'),
('update menu', '2022-03-31', 'Ayam Bakar', 23000, 'D:NetBeansProjects 2kasir_cafesilvia12rpl3srcmenuayam bakar.jpg'),
('update menu', '2022-03-31', 'Mie Ayam', 10000, 'D:NetBeansProjects 2kasir_cafesilvia12rpl3srcmenumie ayam.jpg'),
('update menu', '2022-03-31', 'Nasi Goreng', 14000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu'),
('update menu', '2022-03-31', 'Nasi Goreng', 14000, 'D:NetBeansProjects 2kasir_cafesilvia12rpl3srcmenu\nasi goreng.jpeg'),
('tambah menu', '2022-05-18', 'Ayam Bakar', 20000, 'C:\\MAKANAN\\ayam bakar.jpg'),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, 'C:UsersASUSOneDrivePicturesMENU\nasi goreng.jpeg'),
('update menu', '2022-05-18', 'Udang Bakar Asam', 30000, 'C:UsersASUSPicturesMENUudang bakar.jpg'),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, 'C:apk kasirmenu\nasi goreng.jpeg'),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, ''),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, 'C:UsersASUSPicturesMENU\nasi goreng.jpeg'),
('update menu', '2022-05-18', 'Ayam Bakar', 20000, 'C:UsersASUSPicturesMENUayam bakar.jpg'),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, 'D:apk kasirmenu\nasi goreng.jpeg'),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, 'D/apk kasirmenu\r\nasi goreng.jpeg'),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, 'D:/apk kasir/menu\r\nasi goreng.jpeg'),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, 'D:apk kasirmenu\nasi goreng.jpeg'),
('tambah menu', '2022-05-18', 'Nasi Goreng', 14000, 'D:\\apk kasir\\menu\\nasi goreng.jpeg'),
('update menu', '2022-05-18', 'Nasi Goreng', 14000, 'D:apk kasirmenuayam bakar.jpg'),
('update menu', '2022-05-22', 'Udang Bakar Asam', 30000, 'D:apk kasirmenuudang bakar.jpg'),
('tambah menu', '2022-05-22', 'Mie Ayam', 10000, 'D:\\apk kasir\\menu\\mie ayam.jpg'),
('update menu', '2022-05-23', 'Udang Bakar Asam', 30000, 'D:\\apk kasir\\menu\\udang bakar.jpg'),
('update menu', '2022-05-23', 'Nasi Goreng', 14000, 'D:\\apk kasir\\menu\\nasi goreng.jpeg'),
('update menu', '2022-05-23', 'Ayam Goreng', 20000, 'D:\\apk kasir\\menu\\ayam goreng.jpeg'),
('update menu', '2022-05-23', 'Ayam Bakar', 23000, 'D:\\apk kasir\\menu\\ayam bakar.jpg'),
('update menu', '2022-05-23', 'Udang Goreng ', 30000, 'D:\\apk kasir\\menu\\udang goreng.jpeg'),
('update menu', '2022-05-23', 'Udang Bakar Asam', 30000, 'D:\\apk kasir\\menu\\bakso.jpg'),
('update menu', '2022-05-23', 'Udang Bakar Asam', 30000, 'D:\\apk kasir\\menu\\udang bakar.jpg'),
('tambah menu', '2022-05-23', 'Seblak', 9000, 'D:\\apk kasir\\menu\\seblak.jpg'),
('tambah menu', '2022-05-23', 'Steak Ayam', 20000, 'D:\\apk kasir\\menu\\steak ayam.jpg'),
('tambah menu', '2022-05-28', 'Amaricano', 20000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\americano.jpg'),
('update menu', '2022-05-28', 'Americano', 20000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\americano.jpg'),
('update menu', '2022-05-28', 'Nasi Goreng', 14000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\nasi goreng.jpeg'),
('update menu', '2022-05-28', 'Ayam Goreng', 20000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\ayam goreng.jpeg'),
('update menu', '2022-05-28', 'Ayam Bakar', 23000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\ayam bakar.jpg'),
('update menu', '2022-05-28', 'Udang Goreng ', 30000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\udang goreng.jpeg'),
('update menu', '2022-05-28', 'Udang Bakar Asam', 30000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\udang bakar.jpg'),
('update menu', '2022-05-28', 'Mie Ayam', 10000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\mie ayam.jpg'),
('update menu', '2022-05-28', 'Seblak', 9000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\seblak.jpg'),
('update menu', '2022-05-28', 'Steak Ayam', 20000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\steak ayam.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `masterpesan`
--

CREATE TABLE `masterpesan` (
  `id_master` int(15) NOT NULL,
  `id_detail` int(15) NOT NULL,
  `id_peg` int(15) NOT NULL,
  `tgl_byr` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masterpesan`
--

INSERT INTO `masterpesan` (`id_master`, `id_detail`, `id_peg`, `tgl_byr`) VALUES
(1, 1, 1, '2022-05-21'),
(2, 2, 6, '2022-05-23'),
(3, 4, 1, '2022-05-24'),
(4, 6, 1, '2022-05-24'),
(5, 8, 1, '2022-05-26'),
(6, 9, 3, '2022-05-27'),
(7, 10, 3, '2022-05-28'),
(8, 12, 3, '2022-05-28');

--
-- Trigger `masterpesan`
--
DELIMITER $$
CREATE TRIGGER `addbayar` AFTER INSERT ON `masterpesan` FOR EACH ROW INSERT INTO
log_master(status,waktu,id_master,id_detail,id_peg,tgl_byr)
VALUES('sudah bayar',now(),new.id_master,new.id_detail,new.id_peg,new.tgl_byr)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatebayar` AFTER INSERT ON `masterpesan` FOR EACH ROW update detailpesan SET status ='Lunas'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(15) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `harga` int(15) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `harga`, `photo`) VALUES
(1, 'Nasi Goreng', 14000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\nasi goreng.jpeg'),
(2, 'Ayam Goreng', 20000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\ayam goreng.jpeg'),
(3, 'Ayam Bakar', 23000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\ayam bakar.jpg'),
(4, 'Udang Goreng ', 30000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\udang goreng.jpeg'),
(5, 'Udang Bakar Asam', 30000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\udang bakar.jpg'),
(6, 'Mie Ayam', 10000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\mie ayam.jpg'),
(7, 'Seblak', 9000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\seblak.jpg'),
(8, 'Steak Ayam', 20000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\steak ayam.jpg'),
(9, 'Americano', 20000, 'D:\\NetBeansProjects 2\\kasir_cafesilvia12rpl3\\src\\menu\\americano.jpg');

--
-- Trigger `menu`
--
DELIMITER $$
CREATE TRIGGER `tambah` AFTER INSERT ON `menu` FOR EACH ROW INSERT INTO log_menu(status,waktu,nama_menu,harga,photo)
VALUES ('tambah menu',now(),new.nama_menu,new.harga,new.photo)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` AFTER UPDATE ON `menu` FOR EACH ROW INSERT INTO log_menu(status,waktu,nama_menu,harga,photo)
VALUES ('update menu',now(),new.nama_menu,new.harga,new.photo)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_peg` int(15) NOT NULL,
  `nama_peg` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `handphone` varchar(15) NOT NULL,
  `level` enum('admin','kasir','manager') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_peg`, `nama_peg`, `username`, `password`, `handphone`, `level`) VALUES
(1, 'silvia', 'admin', '123', '085667879876', 'admin'),
(2, 'ria', 'manager', '123', '085778765456', 'manager'),
(3, 'siti', 'kasir1', '123', '098776786545', 'kasir'),
(4, 'ana', 'manager', '123', '09877676545', 'manager'),
(5, 'anita', 'kasir3', '1234', '098778765566710', 'kasir'),
(6, 'julia ', 'kasir2', '123', '09899876778', 'kasir'),
(7, 'dewi', 'kasir', '123', '08766567665', 'kasir'),
(8, 'adinda', 'kasir', '123', '09877876567', 'kasir');

--
-- Trigger `pegawai`
--
DELIMITER $$
CREATE TRIGGER `tambah data` AFTER INSERT ON `pegawai` FOR EACH ROW INSERT INTO
log_admin(status,waktu,id_peg,nama_peg,username,password,handphone,level)
VALUES ('tambah data',
now(),new.id_peg,new.nama_peg,new.username,new.password,new.handphone,new.level)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ubah data` AFTER UPDATE ON `pegawai` FOR EACH ROW INSERT INTO
log_admin(status,waktu,id_peg,nama_peg,username,password,handphone,level)
VALUES ('ubah data',
now(),new.id_peg,new.nama_peg,new.username,new.password,new.handphone,new.level)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masterpesan`
--
ALTER TABLE `masterpesan`
  ADD UNIQUE KEY `id_detail` (`id_detail`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_peg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
