-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               10.3.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for motoshop
CREATE DATABASE IF NOT EXISTS `motoshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `motoshop`;

-- Dumping structure for table motoshop.chudegopy
CREATE TABLE IF NOT EXISTS `chudegopy` (
  `cdgy_ma` int(11) NOT NULL,
  `cdgy_ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cdgy_ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.chudegopy: ~0 rows (approximately)
/*!40000 ALTER TABLE `chudegopy` DISABLE KEYS */;
/*!40000 ALTER TABLE `chudegopy` ENABLE KEYS */;

-- Dumping structure for table motoshop.dondathang
CREATE TABLE IF NOT EXISTS `dondathang` (
  `dh_ma` int(11) NOT NULL AUTO_INCREMENT,
  `dh_ngaylap` datetime NOT NULL,
  `dh_ngaygiao` datetime DEFAULT NULL,
  `dh_noigiao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dh_trangthaithanhtoan` int(11) NOT NULL,
  `httt_ma` int(11) NOT NULL,
  `kh_tendangnhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dh_ma`),
  KEY `dondathang_khachhang_idx` (`kh_tendangnhap`),
  KEY `dondathang_hinhthucthanhtoan_idx` (`httt_ma`),
  CONSTRAINT `dondathang_hinhthucthanhtoan` FOREIGN KEY (`httt_ma`) REFERENCES `hinhthucthanhtoan` (`httt_ma`),
  CONSTRAINT `dondathang_khachhang` FOREIGN KEY (`kh_tendangnhap`) REFERENCES `khachhang` (`kh_tendangnhap`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.dondathang: ~2 rows (approximately)
/*!40000 ALTER TABLE `dondathang` DISABLE KEYS */;
REPLACE INTO `dondathang` (`dh_ma`, `dh_ngaylap`, `dh_ngaygiao`, `dh_noigiao`, `dh_trangthaithanhtoan`, `httt_ma`, `kh_tendangnhap`) VALUES
	(4, '2019-06-11 20:48:10', '2019-06-15 00:00:00', 'Cần Thơ', 0, 1, 'dnpcuong'),
	(5, '2019-06-11 04:48:59', '2019-06-20 00:00:00', 'Cần Thơ', 1, 1, 'dnpcuong');
/*!40000 ALTER TABLE `dondathang` ENABLE KEYS */;

-- Dumping structure for table motoshop.gopy
CREATE TABLE IF NOT EXISTS `gopy` (
  `gy_ma` int(11) NOT NULL,
  `gy_hoten` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_diachi` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_dienthoai` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_tieude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_noidung` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_ngaygopy` datetime DEFAULT NULL,
  `cdgy_ma` int(11) DEFAULT NULL,
  PRIMARY KEY (`gy_ma`),
  KEY `gopy_chudegopy_idx` (`cdgy_ma`),
  CONSTRAINT `gopy_chudegopy` FOREIGN KEY (`cdgy_ma`) REFERENCES `chudegopy` (`cdgy_ma`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.gopy: ~0 rows (approximately)
/*!40000 ALTER TABLE `gopy` DISABLE KEYS */;
/*!40000 ALTER TABLE `gopy` ENABLE KEYS */;

-- Dumping structure for table motoshop.hinhsanpham
CREATE TABLE IF NOT EXISTS `hinhsanpham` (
  `hsp_ma` int(11) NOT NULL AUTO_INCREMENT,
  `hsp_tentaptin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_ma` int(11) NOT NULL,
  PRIMARY KEY (`hsp_ma`),
  KEY `fk_hinhsanpham_sanpham1_idx` (`sp_ma`),
  CONSTRAINT `fk_hinhsanpham_sanpham1` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.hinhsanpham: ~4 rows (approximately)
/*!40000 ALTER TABLE `hinhsanpham` DISABLE KEYS */;
REPLACE INTO `hinhsanpham` (`hsp_ma`, `hsp_tentaptin`, `sp_ma`) VALUES
	(1, 'lon-po-sc-dung-cho-kawasaki-z900492d.jpg', 11),
	(2, 'kawasaki-versys-x-300-abs397x.jpg', 10),
	(3, 'x-adv-750.jpg', 9),
	(4, 'gsxr1000-abs792b.jpg', 6),
	(5, 'v-star-250570b.jpg', 1),
	(6, 'gold-wing-dct.jpg', 8),
	(7, 'cbr650r.jpg', 2),
	(8, 'z1000-abs4770.jpg', 4),
	(9, 'yzf-r1374b.jpg', 5),
	(10, 'shadow-aero.jpg', 3),
	(11, 'd-tracker-150344r.jpg', 7);
/*!40000 ALTER TABLE `hinhsanpham` ENABLE KEYS */;

-- Dumping structure for table motoshop.hinhthucthanhtoan
CREATE TABLE IF NOT EXISTS `hinhthucthanhtoan` (
  `httt_ma` int(11) NOT NULL AUTO_INCREMENT,
  `httt_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`httt_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.hinhthucthanhtoan: ~3 rows (approximately)
/*!40000 ALTER TABLE `hinhthucthanhtoan` DISABLE KEYS */;
REPLACE INTO `hinhthucthanhtoan` (`httt_ma`, `httt_ten`) VALUES
	(1, 'Tiền mặt'),
	(2, 'Chuyển khoản'),
	(3, 'Ship COD');
/*!40000 ALTER TABLE `hinhthucthanhtoan` ENABLE KEYS */;

-- Dumping structure for table motoshop.khachhang
CREATE TABLE IF NOT EXISTS `khachhang` (
  `kh_tendangnhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_matkhau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kh_ten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_gioitinh` int(11) NOT NULL,
  `kh_diachi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kh_dienthoai` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_ngaysinh` int(11) DEFAULT NULL,
  `kh_thangsinh` int(11) DEFAULT NULL,
  `kh_namsinh` int(11) NOT NULL,
  `kh_cmnd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kh_makichhoat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kh_trangthai` int(11) NOT NULL,
  `kh_quantri` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kh_tendangnhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.khachhang: ~5 rows (approximately)
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
REPLACE INTO `khachhang` (`kh_tendangnhap`, `kh_matkhau`, `kh_ten`, `kh_gioitinh`, `kh_diachi`, `kh_dienthoai`, `kh_email`, `kh_ngaysinh`, `kh_thangsinh`, `kh_namsinh`, `kh_cmnd`, `kh_makichhoat`, `kh_trangthai`, `kh_quantri`) VALUES
	('dinhduyvo', 'fcea920f7412b5da7be0cf42b8c93759', 'Vo Dinh Duy', 0, 'Can Tho', '07103.273.34433', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', '', 1, 0),
	('dnpcuong', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Dương Nguyễn Phú Cường', 0, '130 Xô Viết Nghệ Tỉnh', '0915659223', 'phucuong@ctu.edu.vn', 11, 6, 1989, '362209685', '4a5c874f8c4446145989ca515bd158669b0596c6', 1, 0),
	('nta', '123', 'Nguyễn Thị A', 0, 'Số 20 - Phan Đình Phùng', '01234.234.234', 'nta@gmail.com', NULL, NULL, 1990, NULL, NULL, 1, 0),
	('usermoi', 'fcea920f7412b5da7be0cf42b8c93759', 'Nguoi dung moi', 0, 'Can Tho', '07103-273.344', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', '44766fb4dd4e4977e75a9321cbc6413e', 0, 0),
	('vdduy', 'fcea920f7412b5da7be0cf42b8c93759', 'Vo Dinh Duy', 0, 'Can Tho', '0975107705', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', 'â€zcnl82qbuj', 1, 0);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;

-- Dumping structure for table motoshop.khuyenmai
CREATE TABLE IF NOT EXISTS `khuyenmai` (
  `km_ma` int(11) NOT NULL AUTO_INCREMENT,
  `km_ten` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `km_noidung` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `km_tungay` date DEFAULT NULL,
  `km_denngay` date DEFAULT NULL,
  PRIMARY KEY (`km_ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.khuyenmai: ~0 rows (approximately)
/*!40000 ALTER TABLE `khuyenmai` DISABLE KEYS */;
/*!40000 ALTER TABLE `khuyenmai` ENABLE KEYS */;

-- Dumping structure for table motoshop.loaisanpham
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `lsp_ma` int(11) NOT NULL AUTO_INCREMENT,
  `lsp_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lsp_mota` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`lsp_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.loaisanpham: ~4 rows (approximately)
/*!40000 ALTER TABLE `loaisanpham` DISABLE KEYS */;
REPLACE INTO `loaisanpham` (`lsp_ma`, `lsp_ten`, `lsp_mota`) VALUES
	(1, 'Sport bike', 'Dáng thể thao'),
	(2, 'Naked bike', 'Dáng Naked cảm giác lái'),
	(3, 'Cruiser', 'Kiểu phong cách cơ bắp'),
	(4, 'Touring', 'Dành đi phượt trên cung đường dài'),
	(5, 'Scooter', 'Số tự động, nhiều tiện ích công nghệ hiện đại'),
	(6, 'Phụ tùng, phụ kiện, đồ chơi', 'Phụ tùng thay thế và phụ kiện gắn thêm');
/*!40000 ALTER TABLE `loaisanpham` ENABLE KEYS */;

-- Dumping structure for table motoshop.nhasanxuat
CREATE TABLE IF NOT EXISTS `nhasanxuat` (
  `nsx_ma` int(11) NOT NULL AUTO_INCREMENT,
  `nsx_ten` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`nsx_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.nhasanxuat: ~4 rows (approximately)
/*!40000 ALTER TABLE `nhasanxuat` DISABLE KEYS */;
REPLACE INTO `nhasanxuat` (`nsx_ma`, `nsx_ten`) VALUES
	(1, 'Honda'),
	(2, 'Yamaha'),
	(3, 'Suzuki'),
	(4, 'Kawasaki'),
	(5, 'Triumph'),
	(6, 'BMW'),
	(7, 'Ducati');
/*!40000 ALTER TABLE `nhasanxuat` ENABLE KEYS */;

-- Dumping structure for table motoshop.sanpham
CREATE TABLE IF NOT EXISTS `sanpham` (
  `sp_ma` int(11) NOT NULL AUTO_INCREMENT,
  `sp_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sp_gia` decimal(12,2) DEFAULT NULL,
  `sp_giacu` decimal(12,2) DEFAULT NULL,
  `sp_mota_ngan` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `sp_mota_chitiet` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_ngaycapnhat` datetime NOT NULL,
  `sp_soluong` int(11) DEFAULT NULL,
  `lsp_ma` int(11) NOT NULL,
  `nsx_ma` int(11) NOT NULL,
  `km_ma` int(11) DEFAULT NULL,
  PRIMARY KEY (`sp_ma`),
  KEY `sanpham_loaisanpham_idx` (`lsp_ma`),
  KEY `sanpham_nhasanxuat_idx` (`nsx_ma`),
  KEY `sanpham_khuyenmai_idx` (`km_ma`),
  CONSTRAINT `sanpham_khuyenmai` FOREIGN KEY (`km_ma`) REFERENCES `khuyenmai` (`km_ma`),
  CONSTRAINT `sanpham_loaisanpham` FOREIGN KEY (`lsp_ma`) REFERENCES `loaisanpham` (`lsp_ma`),
  CONSTRAINT `sanpham_nhasanxuat` FOREIGN KEY (`nsx_ma`) REFERENCES `nhasanxuat` (`nsx_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.sanpham: ~0 rows (approximately)
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
REPLACE INTO `sanpham` (`sp_ma`, `sp_ten`, `sp_gia`, `sp_giacu`, `sp_mota_ngan`, `sp_mota_chitiet`, `sp_ngaycapnhat`, `sp_soluong`, `lsp_ma`, `nsx_ma`, `km_ma`) VALUES
	(1, 'V STAR 250', 230000000.00, 245600000.00, 'Star 250 là V-Twin duy nhất trong dòng Cruiser nhỏ nhất', 'Động cơ V-Twin làm mát bằng không khí, dung tích 249cc với hành trình dài 66mm, bộ chế hòa khí đơn cao cấp Mikuni 26mm, Phanh đĩa trước, ống xả kép xi chrome', '2012-12-22 11:20:30', 17, 3, 2, NULL),
	(2, 'CBR650R', 262000000.00, 279200000.00, 'CBR650R là TƯƠNG LAI CỦA THỂ THAO HIỆN ĐẠI', 'Động cơ 4 xi lanh thẳng hàng, làm mát bằng chất lỏng, 16 van trục kép Euro4;  Dung tích xi lanh: 649 cc, 95 mã lực, 64 Nm; Phanh đĩa: trước/sau; Phuộc USD 41mm', '2013-01-12 10:04:45', 10, 1, 1, NULL),
	(3, 'Shadow Aero', 425000000.00, 450350000.00, 'PHONG CÁCH TRUYỀN THỐNG, HIỆU SUẤT CÔNG NGHỆ HIỆN ĐẠI', ' Động cơ: Làm mát bằng chất lỏng 52 ° V-Twin;  Dung tích xi lanh: 745cc, 44.9HP, 65N/m; Phanh đĩa trước; ', '2013-01-16 17:13:45', 5, 3, 1, NULL),
	(4, 'Z1000 ABS', 412000000.00, 441200000.00, 'Kawasaki Z1000 ABS ngôn ngữ thiết kế của Sugimio', ' Động cơ: 4-thì, 4-xy lanh, DOHC, 16-valve, làm mát bằng chất lỏng;  Dung tích xi lanh 1,043cc;  Hệ thống nhiên liệu: DFI với 04 ống 38mm hiệu Keihin thân ống, hình oval có dây kéo phụ', '2013-01-16 17:14:55', 10, 2, 4, NULL),
	(5, 'YZF-R1', 680000000.00, 718100000.00, 'Động cơ trục khuỷu chéo có nguồn gốc MotoGP', 'Động cơ: 998cc, DOHC 4 xi-lanh làm mát bằng chất lỏng, 16 van; Phun nhiên liệu với YCC-T và YCC-I; Phuộc ngược 43mm KYB; Phanh đĩa ABS: trước/sau', '2013-01-17 14:18:03', 6, 1, 2, NULL),
	(6, 'GSXR1000 ABS', 680000000.00, 718100000.00, 'GSXR1000 nhôm, "thiết kế nhẹ" bốn phần', 'Động cơ: DTA1 · Làm mát bằng nước · 4 chu kỳ · 4 xi lanh nối tiếp / DOHC Dung tích xi lanh 999cc; 145HP-117 N/m; Phuộc NPX treo điện tử 43mm Öhlins®', '2013-01-17 14:19:10', 25, 1, 3, NULL),
	(7, 'D - Tracker 150', 79000000.00, 87030000.00, 'D-Tracker 150 có thể đi tốt trên mọi kiểu đường.', ' Động cơ: 4 thì, 1 xi-lanh, DOHC, làm mát không khí; Dung tích xi lanh: 144cc, 11,52HP; Phuộc USD 35mm;  Loại khung: Hình ống, bán đôi Treo khung 101 mm', '2013-01-28 10:42:08', 13, 2, 4, NULL),
	(8, 'Gold Wing DCT', 1180000000.00, 1243100000.00, 'Gold Wing nổi tiếng mượt mà và mạnh mẽ', 'Động cơ: 4 thì, 6 xi-lanh, DOHC, làm mát bằng chất lỏng đối ngịch; Dung tích xi lanh: 1.833 cc; 118HP-170Nm; Hệ thống treo: Mono Uni-Trak đôi; Đĩa đôi thủy lực  ABS', '2019-08-02 22:31:57', 3, 4, 1, NULL),
	(9, 'X-ADV 750', 420000000.00, 445100000.00, 'X-AVD 750 Tinh thần tự do phiêu lưu', 'Động cơ: 2 xilanh Song song, 8 van SOHC, làm mát bằng chất lỏng, Euro4; Dung tích xi lanh: 745 cc; 40,3HP-68Nm; Vô cấp CVT; Phanh đía ABS: trước/sau', '2019-08-02 22:44:19', 9, 5, 1, NULL),
	(10, 'VERSYS X 300 ABS', 169000000.00, 181550000.00, 'Sẵn sàng thực hiện bất kỳ cuộc phiêu lưu bất cứ nơi nào', 'Động cơ: 4-thì, 2-xy lanh, DOHC, water-cooled; Dung tích xi lanh: 296cc; \r\nHệ thống nhiên liệu: DFI® w/32mm thân ống; Phanh ABS: trước/sau; Kiểu khung: Tube Diamond', '2019-08-02 22:57:08', 6, 2, 4, NULL),
	(11, 'Lon pô SC', 18000000.00, 18.00, 'Dùng cho Kawasaki Z900', 'Dùng cho Kawasaki Z900', '2019-08-02 23:06:33', 2, 6, 4, NULL);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;

-- Dumping structure for table motoshop.sanpham_dondathang
CREATE TABLE IF NOT EXISTS `sanpham_dondathang` (
  `sp_ma` int(11) NOT NULL,
  `dh_ma` int(11) NOT NULL,
  `sp_dh_soluong` int(11) NOT NULL,
  `sp_dh_dongia` decimal(12,2) NOT NULL,
  PRIMARY KEY (`sp_ma`,`dh_ma`),
  KEY `sanpham_donhang_sanpham_idx` (`sp_ma`),
  KEY `sanpham_donhang_dondathang_idx` (`dh_ma`),
  CONSTRAINT `sanpham_donhang_dondathang` FOREIGN KEY (`dh_ma`) REFERENCES `dondathang` (`dh_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sanpham_donhang_sanpham` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table motoshop.sanpham_dondathang: ~0 rows (approximately)
/*!40000 ALTER TABLE `sanpham_dondathang` DISABLE KEYS */;
REPLACE INTO `sanpham_dondathang` (`sp_ma`, `dh_ma`, `sp_dh_soluong`, `sp_dh_dongia`) VALUES
	(1, 5, 3, 12000000.00),
	(5, 5, 2, 10990000.00),
	(7, 4, 1, 7500000.00);
/*!40000 ALTER TABLE `sanpham_dondathang` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
