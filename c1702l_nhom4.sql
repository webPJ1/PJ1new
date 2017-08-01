-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2017 at 08:17 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c1702l_nhom4`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_id` int(11) NOT NULL,
  `Customer_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Phone_number` int(11) NOT NULL,
  `Address` text COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Time` datetime NOT NULL,
  `Bill_status_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_status`
--

CREATE TABLE `bill_status` (
  `bill_status_id` int(11) NOT NULL,
  `Bill_status _name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_news`
--

CREATE TABLE `category_news` (
  `category_news_id` int(11) NOT NULL,
  `category_news_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_product`
--

CREATE TABLE `company_product` (
  `company_id` int(11) NOT NULL,
  `Company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_product`
--

INSERT INTO `company_product` (`company_id`, `Company_name`) VALUES
(1, 'Yamaha'),
(2, 'Honda'),
(3, 'Suzuki');

-- --------------------------------------------------------

--
-- Table structure for table `cubic_centimetre`
--

CREATE TABLE `cubic_centimetre` (
  `Cubic_centimetre_id` int(11) NOT NULL,
  `Content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `New_id` int(11) NOT NULL,
  `Title` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `User_id` int(11) NOT NULL,
  `Category_news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `Price_id` int(11) NOT NULL,
  `Price_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_id` int(11) NOT NULL,
  `Product_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Sale` float DEFAULT NULL,
  `Gallery` text COLLATE utf8_unicode_ci NOT NULL,
  `Company_id` int(11) NOT NULL,
  `Cubic_centimetre_id` int(11) NOT NULL,
  `Price_id` int(11) NOT NULL,
  `Product_status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_bill`
--

CREATE TABLE `product_bill` (
  `Bill_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

CREATE TABLE `product_status` (
  `Product_status_id` int(11) NOT NULL,
  `Product_status_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_id` int(11) NOT NULL,
  `User_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Password` int(11) NOT NULL,
  `Name` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_id`),
  ADD KEY `FK_bill_category` (`Bill_status_id`),
  ADD KEY `FK_bill_user` (`User_id`);

--
-- Indexes for table `bill_status`
--
ALTER TABLE `bill_status`
  ADD PRIMARY KEY (`bill_status_id`);

--
-- Indexes for table `category_news`
--
ALTER TABLE `category_news`
  ADD PRIMARY KEY (`category_news_id`);

--
-- Indexes for table `company_product`
--
ALTER TABLE `company_product`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `cubic_centimetre`
--
ALTER TABLE `cubic_centimetre`
  ADD PRIMARY KEY (`Cubic_centimetre_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`New_id`),
  ADD KEY `FK_news_user` (`User_id`),
  ADD KEY `FK_news_category` (`Category_news_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`Price_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_id`),
  ADD KEY `FK_company` (`Company_id`),
  ADD KEY `FK_cubic` (`Cubic_centimetre_id`),
  ADD KEY `FK_price` (`Price_id`),
  ADD KEY `FK_product_status` (`Product_status_id`);

--
-- Indexes for table `product_bill`
--
ALTER TABLE `product_bill`
  ADD PRIMARY KEY (`Bill_id`,`Product_id`),
  ADD KEY `FK_pb1` (`Product_id`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`Product_status_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_bill_category` FOREIGN KEY (`Bill_status_id`) REFERENCES `bill_status` (`bill_status_id`),
  ADD CONSTRAINT `FK_bill_status` FOREIGN KEY (`Bill_status_id`) REFERENCES `bill_status` (`bill_status_id`),
  ADD CONSTRAINT `FK_bill_user` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK_news_category` FOREIGN KEY (`Category_news_id`) REFERENCES `category_news` (`category_news_id`),
  ADD CONSTRAINT `FK_news_user` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_company` FOREIGN KEY (`Company_id`) REFERENCES `company_product` (`company_id`),
  ADD CONSTRAINT `FK_cubic` FOREIGN KEY (`Cubic_centimetre_id`) REFERENCES `cubic_centimetre` (`Cubic_centimetre_id`),
  ADD CONSTRAINT `FK_price` FOREIGN KEY (`Price_id`) REFERENCES `price` (`Price_id`),
  ADD CONSTRAINT `FK_product_status` FOREIGN KEY (`Product_status_id`) REFERENCES `product_status` (`Product_status_id`);

--
-- Constraints for table `product_bill`
--
ALTER TABLE `product_bill`
  ADD CONSTRAINT `FK_pb1` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`),
  ADD CONSTRAINT `FK_pb2` FOREIGN KEY (`Bill_id`) REFERENCES `bill` (`Bill_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
