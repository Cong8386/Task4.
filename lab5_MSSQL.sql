-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th7 10, 2021 lúc 10:48 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lab5 MSSQL`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `CellularPhone`
--

CREATE TABLE `CellularPhone` (
  `PersonID` int(11) NOT NULL,
  `PersonName` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `CellularPhone`
--

INSERT INTO `CellularPhone` (`PersonID`, `PersonName`) VALUES
(1, 'William Smith');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ContactPhone`
--

CREATE TABLE `ContactPhone` (
  `PersonID` int(11) NOT NULL,
  `Mobile_Number` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contactPhone`
--

CREATE TABLE `contactPhone` (
  `PersonID` int(11) NOT NULL,
  `Mobile_Number` bigint(20) NOT NULL,
  `LandlineNumber` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `contactPhone`
--

INSERT INTO `contactPhone` (`PersonID`, `Mobile_Number`, `LandlineNumber`) VALUES
(101, 983345674, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `LopHoc`
--

CREATE TABLE `LopHoc` (
  `MaLopHoc` int(11) NOT NULL,
  `TenLopHoc` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `MaSinhVien`
--

CREATE TABLE `MaSinhVien` (
  `MaSV` int(11) NOT NULL,
  `TenSV` varchar(40) DEFAULT NULL,
  `MaLopHoc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `SanPham`
--

CREATE TABLE `SanPham` (
  `MaSp` int(11) NOT NULL,
  `TenSP` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `StoreProduct`
--

CREATE TABLE `StoreProduct` (
  `ProductID` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `PriceMoney` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `CellularPhone`
--
ALTER TABLE `CellularPhone`
  ADD PRIMARY KEY (`PersonID`);

--
-- Chỉ mục cho bảng `ContactPhone`
--
ALTER TABLE `ContactPhone`
  ADD PRIMARY KEY (`PersonID`);

--
-- Chỉ mục cho bảng `contactPhone`
--
ALTER TABLE `contactPhone`
  ADD PRIMARY KEY (`PersonID`),
  ADD UNIQUE KEY `Mobile_Number` (`Mobile_Number`),
  ADD UNIQUE KEY `LandlineNumber` (`LandlineNumber`);

--
-- Chỉ mục cho bảng `LopHoc`
--
ALTER TABLE `LopHoc`
  ADD PRIMARY KEY (`MaLopHoc`);

--
-- Chỉ mục cho bảng `MaSinhVien`
--
ALTER TABLE `MaSinhVien`
  ADD PRIMARY KEY (`MaSV`),
  ADD KEY `fk` (`MaLopHoc`);

--
-- Chỉ mục cho bảng `StoreProduct`
--
ALTER TABLE `StoreProduct`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `CellularPhone`
--
ALTER TABLE `CellularPhone`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ContactPhone`
--
ALTER TABLE `ContactPhone`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `StoreProduct`
--
ALTER TABLE `StoreProduct`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `MaSinhVien`
--
ALTER TABLE `MaSinhVien`
  ADD CONSTRAINT `fk` FOREIGN KEY (`MaLopHoc`) REFERENCES `LopHoc` (`MaLopHoc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
