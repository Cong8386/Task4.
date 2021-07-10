-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th7 09, 2021 lúc 01:09 PM
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
-- Cơ sở dữ liệu: `BookLibrary`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Book`
--

CREATE TABLE `Book` (
  `BookCode` int(11) NOT NULL,
  `BookTitle` varchar(100) NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Edition` int(11) DEFAULT NULL,
  `Bookprice` float DEFAULT NULL,
  `Copies` int(11) DEFAULT NULL
) ;

--
-- Đang đổ dữ liệu cho bảng `Book`
--

INSERT INTO `Book` (`BookCode`, `BookTitle`, `Author`, `Edition`, `Bookprice`, `Copies`) VALUES
(1, 'Day con lam giau ', 'Jack Dempsey', 384, 129, 50),
(2, 'Việt Bắc', 'Tố Hữu', 395, 89, 68),
(3, 'Dế Mèn Phiêu Liêu Ký ', 'TÔ Hoài', 109, 72, 48);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `IssueDetails`
--

CREATE TABLE `IssueDetails` (
  `BookCode` int(11) NOT NULL,
  `MemberCode` int(11) NOT NULL,
  `IssueDate` datetime DEFAULT NULL,
  `returndate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `IssueDetails`
--

INSERT INTO `IssueDetails` (`BookCode`, `MemberCode`, `IssueDate`, `returndate`) VALUES
(1, 1, '2021-07-09 00:00:00', '2021-07-15 00:00:00'),
(2, 2, '2021-07-01 00:00:00', '2021-07-07 00:00:00'),
(3, 3, '2021-07-11 00:00:00', '2021-07-18 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Member`
--

CREATE TABLE `Member` (
  `MemberCode` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Member`
--

INSERT INTO `Member` (`MemberCode`, `Name`, `Address`, `PhoneNumber`) VALUES
(1, 'Ngô Doãn Công', 'Hoài Đức -Hà Nội', 968659073),
(2, 'Phan Văn Đức', 'Cầu Diễn -Hà Nội', 384608249),
(3, 'Trần Văn Tuấn', 'Đan Phượng - Hoài Đức ', 968668659);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`BookCode`);

--
-- Chỉ mục cho bảng `IssueDetails`
--
ALTER TABLE `IssueDetails`
  ADD PRIMARY KEY (`MemberCode`,`BookCode`);

--
-- Chỉ mục cho bảng `Member`
--
ALTER TABLE `Member`
  ADD PRIMARY KEY (`MemberCode`),
  ADD UNIQUE KEY `rangbuoc_duynhat` (`PhoneNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
