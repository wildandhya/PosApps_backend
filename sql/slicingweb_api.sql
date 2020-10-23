-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2020 at 08:20 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slicingweb_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'Drink'),
(2, 'Food');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `cashier` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `menu_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `invoice`, `cashier`, `date`, `menu_id`, `amount`) VALUES
(1, '1', 2, '2020-09-09 16:39:53', 0, 1000),
(9, '1', 2, '2020-09-09 16:57:22', NULL, 3000),
(10, '1', 2, '2020-09-09 16:59:46', NULL, 3000),
(11, '2', 2, '2020-09-09 17:05:15', NULL, 3000),
(12, '2', 1, '2020-09-09 17:07:18', NULL, 3000),
(14, '2', 1, '2020-09-10 13:15:00', NULL, 2000),
(17, '4', 1, '2020-09-10 13:17:24', NULL, 2000),
(18, '1', 1, '2020-09-10 13:29:35', NULL, 2000),
(29, '2', 1, '2020-09-10 13:37:15', NULL, 1111),
(31, '2', 2, '2020-09-20 06:32:38', NULL, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level`) VALUES
(1, 'Cashier'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `invoice_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `menu` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `menu`, `category_id`, `price`, `image`, `create_at`, `update_at`) VALUES
(6, 'Mie Goreng Aceh', 2, 20000, 'http://localhost:8000/images/1600058602731-image.jpg', '2020-08-07 03:51:02', '0000-00-00 00:00:00'),
(7, 'Mie Kuah Kari Ayam', 2, 18000, 'http://localhost:8000/images/1600058628402-image.jpg', '2020-08-07 03:52:23', '0000-00-00 00:00:00'),
(8, 'Mie Goreng Original', 2, 25000, 'http://localhost:8000/images/1600058763884-image.jpg', '2020-08-07 03:52:26', '0000-00-00 00:00:00'),
(9, 'Mie Goreng Ayam Geprek', 2, 25000, 'http://localhost:8000/images/1600058701228-image.jpg', '2020-08-07 03:54:04', '0000-00-00 00:00:00'),
(29, 'mamamia', 1, 2000, 'http://localhost:8000/images/1603436212174-image.jpg', '2020-10-23 06:56:53', '2020-10-23 06:56:53'),
(30, 'empire', 2, 20000, 'http://localhost:8000/images/1603436798169-image.jpg', '2020-10-23 07:06:39', '2020-10-23 07:06:39'),
(31, 'kaka', 2, 20008, 'http://localhost:8000/images/1603437765188-image.jpg', '2020-10-23 07:22:46', '2020-10-23 07:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `level_id`, `image`) VALUES
(1, 'wildan', '', '$2b$10$cr/lUp.xf1I14UHQOjb/rece8nz7WQT8YoBSz6CDXIsnEyl0B/pTi', 1, ''),
(2, 'pevita', 'pevita@gmail.com', '$2b$10$aXuRuVQgJLXqusriDS6txOSQeAM9DrERa1Ot6m.er.3gi0G3Bm.L6', 2, ''),
(3, 'pacar pevita', '', '$2b$10$Y08mLPqsLtsbgLFyIgOXf..ZcJOhHUTbUtfKIUXuYVgBRAQLJe23K', 3, ''),
(4, 'mia', '', '$2b$10$eCv3KFP3STnuQUFrVZqzH.6ZApgS1hnxgexNbBIVAchmqrdOoLgSW', 2, ''),
(5, 'willy', '', '$2b$10$v6LNo0vIHpXNwU72v8CBiet1cntcOrkBlLVkc/njuZubsuR9DrIhe', 1, ''),
(6, 'willly', '', '$2b$10$5X0xu0bLOVpY.L4XcYCx3eMyLaVSJYQ9Q6bzaw1h2eMTo91emla66', 1, ''),
(7, 'will', '', '$2b$10$YmfHj98GDEaoQwex5t1H../oibdS8QEuDxzKbcVpkdEN9AkpkHyhO', 2, ''),
(8, 'jafar', '', '$2b$10$1pbWnHGcb3FmfBzUs1jeS.f5/9Nc/4LAIly3bcw0EC3rY2tlB35mi', 2, ''),
(9, 'dadan', '', '$2b$10$Fyb3iS.MrixBJaEYaL09n.9yvP5A4JF4p3PIUe03XUZzX.QkaazMi', 0, ''),
(10, 'ariel', '', '$2b$10$qpz83veLSGL836yzcH0qV.m7l9N529a0M5Q.CQ.ra2TyzSrEl5dmK', 0, ''),
(11, 'dadang', '', '$2b$10$L5PPr7Kud5CBNLC8G11YF..uNwVUjMcuJ9reJJ2S8AhUCsV7MpJ0C', 0, ''),
(12, 'farhan', 'farhan@gmail.com', '$2b$10$uLb8G7NaVPzlapB/Nt73eeCRdc7peZceFgMCrkUqdZj2xnkj8dP6K', 0, ''),
(13, 'abrar', 'abrar@gmail.com', '$2b$10$nhA99hLm9czQBRKNUiUQEe7zF7KsJclQkMn/S4FHrNd3yW7uFj1NS', 0, ''),
(14, 'kizam', 'kizam@gmail.com', '$2b$10$W9oM29A/Ey1wr44SM2tuQuZxFjchAbblam75rAbgCR7UknoCq82Zy', 0, ''),
(15, 'wildan dhya', 'wildan@gmail.com', '$2b$10$msxorZPc/k1Q4OqME8GnruNOkS2mYE6Qp9oWp5m5m1N7HxwdYj88e', 0, ''),
(16, 'sadam', 'sadam@gmail.com', '$2b$10$QmO0wfmcp2lWpIoO3hw5SesT4JtDDh2I0859KDo4gZPYqDDSIhyqK', 0, ''),
(17, 'dhya', 'dhya@gmail.com', '$2b$10$946Ak0/wcyLQ83ZLOHjF/uWp3zx6oGGh0CJN0vOUD/JWqdPmXKnvq', 2, ''),
(18, 'ulhaq', 'ulhaq@gmail.com', '$2b$10$Kc2/A89gbr4cq7rM9j9EUucN/m4iKwsXytenLltTXMnZgSIeFcq5m', 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD UNIQUE KEY `invoice_id` (`invoice_id`),
  ADD UNIQUE KEY `menu_id` (`menu_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
