-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2021 at 05:02 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Dr. Jayde Bauch', 'admin@gmail.com', '2021-10-02 11:00:00', '$2y$10$Vf2hpJRnF4g/BTEgcdgUhedC3V7RfcD0mJ9Lnoc4dyp7xV/CNEPFO', 'fkz7pOpjk3', '2021-10-02 11:00:00', '2021-10-02 11:08:57');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(52, 'Ms. Lavinia Nader III', '2021-09-07 04:53:08', '2021-09-07 04:53:08'),
(53, 'Austen Rogahn MD', '2021-09-07 04:53:09', '2021-09-07 04:53:09'),
(54, 'Millie Feest V', '2021-09-07 04:53:09', '2021-09-07 04:53:09'),
(55, 'Davion Quitzon IV', '2021-09-07 04:53:09', '2021-09-07 04:53:09'),
(56, 'Jada Luettgen', '2021-09-07 04:53:09', '2021-09-07 04:53:09'),
(57, 'Delia Koelpin', '2021-09-07 04:53:09', '2021-09-07 04:53:09'),
(58, 'Kiarra Anderson Jr.', '2021-09-07 04:53:09', '2021-09-07 04:53:09'),
(59, 'Ozella Bartell', '2021-09-07 04:53:09', '2021-09-07 04:53:09'),
(60, 'Dr. Florence Metz', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(61, 'Evie Ortiz', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(62, 'Kyleigh Howell', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(63, 'Elda Romaguera', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(64, 'Jasen Waelchi', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(65, 'Mathias Koch', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(66, 'Eveline Zulauf', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(67, 'Nellie Paucek', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(68, 'Precious McCullough', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(69, 'Miss Maria Flatley III', '2021-09-07 04:53:10', '2021-09-07 04:53:10'),
(70, 'Shayna Rogahn', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(71, 'Andre Hirthe', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(72, 'Bertha Langosh', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(73, 'Prof. Roy Farrell', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(74, 'Alexandrine Hagenes II', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(75, 'Dr. Harrison Kihn MD', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(76, 'Clay Crist', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(77, 'Domingo Stroman', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(78, 'Nicolette Gulgowski', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(79, 'Madisen Boyle', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(80, 'Aletha Nicolas', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(81, 'Mr. Alden Ernser', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(82, 'Duane Oberbrunner', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(83, 'Noemi Wiegand', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(84, 'Brain Rohan', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(85, 'Vicky Collier', '2021-09-07 04:53:11', '2021-09-07 04:53:11'),
(92, 'Shakira Erdman', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(93, 'Devin Smith', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(94, 'Dr. Priscilla Marks', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(95, 'Delfina Funk', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(96, 'Prof. Montana Kunde', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(97, 'Van Bahringer', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(98, 'Stefanie Williamson', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(99, 'Mason Dickens', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(100, 'Orlo Schneider III', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(101, 'Mason Crona', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(103, 'HP', '2021-09-12 11:34:17', '2021-09-12 11:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Groceries', NULL, NULL),
(3, 'Electronic Devices', NULL, NULL),
(4, 'Furnitures', NULL, NULL),
(5, 'Sports Items', NULL, NULL),
(7, 'Vehicles', NULL, NULL),
(8, 'Fashions Wear', '2021-09-05 12:44:23', '2021-09-05 12:44:23'),
(9, 'Food Item', '2021-09-05 12:46:41', '2021-09-05 12:46:41'),
(10, 'Baby Items', '2021-09-05 12:47:36', '2021-09-05 12:47:36'),
(11, 'Test', '2021-09-05 13:00:03', '2021-09-05 13:00:03'),
(14, 'Asda', '2021-09-05 13:04:16', '2021-09-07 03:11:54'),
(15, 'Prof. Tobin Orn', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(16, 'Wilfredo Oberbrunner', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(17, 'Jeff Terry', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(18, 'Tod Ziemann MD', '2021-09-07 04:53:12', '2021-09-07 04:53:12'),
(19, 'Jerod Weimann', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(20, 'Matilda Schmidt', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(21, 'Renee Stiedemann II', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(22, 'Matilde Hand', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(23, 'Ms. Roslyn Blanda', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(24, 'Virginia Torp', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(25, 'Orlo Jenkins', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(26, 'Etha Kuhlman', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(27, 'Karley Huel', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(28, 'Mr. Eino Buckridge', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(29, 'Dr. Brook Mitchell MD', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(30, 'Judah Bernier', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(31, 'Miss Desiree O\'Conner', '2021-09-07 04:53:13', '2021-09-07 04:53:13'),
(32, 'Doris Harvey', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(33, 'Adell Johns', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(34, 'Miss Annetta Rice II', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(35, 'Kathleen Rath DVM', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(36, 'Mr. Zander Crona V', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(37, 'Otis Shields V', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(38, 'Ms. Camille Effertz', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(39, 'Ericka Farrell', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(40, 'Alana McGlynn', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(41, 'Jeremie Nolan', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(42, 'Prof. Alfredo Runolfsdottir', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(43, 'Rosamond Walsh', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(44, 'Jeramy Keeling PhD', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(45, 'Ms. Heaven Haag II', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(46, 'Kade Bradtke', '2021-09-07 04:53:14', '2021-09-07 04:53:14'),
(47, 'Dr. Rasheed Luettgen DVM', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(48, 'Percy Schumm', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(49, 'Sigurd Champlin Sr.', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(50, 'Prof. Wilford Franecki', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(53, 'Dr. Sean Tillman MD', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(54, 'Mrs. Rosella Wiegand', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(55, 'Kiera Bosco', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(56, 'Yasmin Tremblay MD', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(57, 'Olin Kautzer', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(58, 'Gustave Trantow', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(59, 'Lonzo Fisher', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(60, 'Dr. Hugh Labadie MD', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(61, 'Forest Swaniawski', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(62, 'Dr. Lisa Rohan I', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(63, 'Brown Mante PhD', '2021-09-07 04:53:15', '2021-09-07 04:53:15'),
(64, 'Jamarcus Friesen', '2021-09-07 04:53:15', '2021-09-07 04:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_08_26_230335_create_categories_table', 1),
(5, '2021_08_26_235114_create_brands_table', 1),
(6, '2021_08_26_235217_create_products_table', 1),
(7, '2021_08_26_235245_create_wish_lists_table', 1),
(8, '2021_08_26_235348_create_orders_table', 1),
(9, '2021_08_26_235410_create_order_items_table', 1),
(10, '2021_08_26_235842_create_admins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `total` double(8,2) NOT NULL,
  `charges` double(20,2) DEFAULT 0.00,
  `sub_total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `comment`, `shipping_address`, `discount`, `status`, `payment_type`, `total`, `charges`, `sub_total`, `created_at`, `updated_at`) VALUES
(36, 2, NULL, '{\"id\":2,\"name\":\"Shahidullah\",\"email\":\"pl@gmail.com\",\"phone\":\"387643333333\",\"address\":\"arrrrrrrr\",\"email_verified_at\":null,\"created_at\":\"2021-08-30T10:32:00.000000Z\",\"updated_at\":\"2021-08-30T10:32:00.000000Z\"}', NULL, 'pending', 'cash_on_delivery', 122.00, 0.00, 122.00, '2021-10-01 11:06:01', '2021-10-01 11:06:01'),
(37, 10, NULL, '{\"id\":10,\"name\":\"Wahida\",\"email\":\"wyeasmin@gmail.com\",\"phone\":\"01663236424234\",\"address\":\"sdgwgdwcwdc\",\"email_verified_at\":null,\"created_at\":\"2021-10-05T17:28:44.000000Z\",\"updated_at\":\"2021-10-05T17:33:40.000000Z\"}', NULL, 'pending', 'card_payment', 122.00, 0.00, 122.00, '2021-10-05 12:41:51', '2021-10-05 12:41:51'),
(38, 10, NULL, '{\"id\":10,\"name\":\"Wahida\",\"email\":\"wyeasmin@gmail.com\",\"phone\":\"01663236424234\",\"address\":\"sdgwgdwcwdc\",\"email_verified_at\":null,\"created_at\":\"2021-10-05T17:28:44.000000Z\",\"updated_at\":\"2021-10-05T17:33:40.000000Z\"}', NULL, 'pending', 'card_payment', 78.00, 0.00, 78.00, '2021-10-05 12:53:38', '2021-10-05 12:53:38'),
(39, 10, NULL, '{\"id\":10,\"name\":\"Wahida\",\"email\":\"wyeasmin@gmail.com\",\"phone\":\"01663236424234\",\"address\":\"sdgwgdwcwdc\",\"email_verified_at\":null,\"created_at\":\"2021-10-05T17:28:44.000000Z\",\"updated_at\":\"2021-10-05T17:33:40.000000Z\"}', NULL, 'pending', 'card_payment', 78.00, 0.00, 78.00, '2021-10-05 12:56:44', '2021-10-05 12:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_price` double(8,2) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_name`, `item_price`, `item_quantity`, `created_at`, `updated_at`) VALUES
(38, 36, 'asds', 122.00, 1, '2021-10-01 11:06:01', '2021-10-01 11:06:01'),
(39, 37, 'asds', 122.00, 1, '2021-10-05 12:41:51', '2021-10-05 12:41:51'),
(40, 38, 'Dolor recusandae Il1', 78.00, 1, '2021-10-05 12:53:38', '2021-10-05 12:53:38'),
(41, 39, 'Dolor recusandae Il1', 78.00, 1, '2021-10-05 12:56:44', '2021-10-05 12:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('Abul@gmail.com', '$2y$10$qg4NVRimLUh1X6HuFLfqlOp7f5oqLUxsjo/bcwwiR1e5NFu6ZTAdu', '2021-10-05 10:48:26'),
('pl@gmail.com', '$2y$10$/NpaFwXARQfWsCkhV/dlhOa2FoMbsetheFzY2CEJ0DyxNu2HgpI8u', '2021-10-05 11:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount_price` double(8,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `price`, `discount_price`, `description`, `image`, `color`, `size`, `quantity`, `created_at`, `updated_at`) VALUES
(53, 57, 101, 'Jaylon Labadie IV', 68.00, 67.00, 'Tempore cumque dolore beatae provident. Fugit natus nostrum repudiandae accusamus perspiciatis dolores. Rem voluptas non eveniet temporibus voluptates.', 'https://lorempixel.com/600/480/?44804', '\"#71ab47\"', '\"md\"', 10, '2021-09-10 14:44:17', '2021-09-10 14:44:17'),
(56, 54, 101, 'Eileen Torp V', 12.00, 11.00, 'Quas ipsam aut molestiae repudiandae occaecati. Aut reprehenderit voluptas et qui expedita. Excepturi corrupti ut enim eum.', 'https://lorempixel.com/600/480/?75836', '\"#a478a5\"', '\"sm\"', 8, '2021-09-10 14:44:17', '2021-09-10 14:44:17'),
(57, 54, 67, 'Sarai Kshlerin I', 32.00, 82.00, 'Minima dignissimos qui et commodi nam fuga. Exercitationem ipsum tempore et. Deleniti nihil esse voluptatibus ipsum sed quae unde.', 'https://lorempixel.com/600/480/?79603', '\"#8e38df\"', '\"sm\"', 6, '2021-09-10 14:44:17', '2021-09-10 14:44:17'),
(58, 64, 60, 'Dorothea Upton', 17.00, 92.00, 'Quod modi consequatur molestias tempora aspernatur quis officiis. Voluptatem ut ea laborum ad. Fuga beatae sunt repudiandae tempore est qui.', 'https://lorempixel.com/600/480/?52572', '\"#a790ac\"', '\"sm\"', 3, '2021-09-10 14:44:17', '2021-09-10 14:44:17'),
(59, 63, 63, 'Chyna Fay', 80.00, 39.00, 'Inventore quam voluptas voluptatem non perspiciatis. Debitis recusandae quos unde porro veritatis iusto.', 'https://lorempixel.com/600/480/?33256', '\"#a34b1b\"', '\"md\"', 8, '2021-09-10 14:44:17', '2021-09-10 14:44:17'),
(60, 42, 65, 'Dr. Adalberto Hickle', 14.00, 92.00, 'Atque voluptates tempore aspernatur ut doloribus. Est nostrum et aut quas et et beatae. Nihil ab ut ipsam aut provident debitis qui doloribus. Fuga labore aut ex distinctio.', 'https://lorempixel.com/600/480/?82001', '\"#6a2095\"', '\"lg\"', 7, '2021-09-10 14:44:17', '2021-09-10 14:44:17'),
(61, 17, 97, 'Floyd Cremin', 97.00, 78.00, 'Quisquam animi amet officia sint ipsa voluptatibus iure. Aut dolores quidem debitis sit. Ut reiciendis vitae eos ab.', 'https://lorempixel.com/600/480/?25181', '\"#059048\"', '\"lg\"', 7, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(62, 59, 60, 'Tierra Kub MD', 34.00, 34.00, 'Dolor est sint velit deserunt. Est odio mollitia rerum id nobis similique quod. Et iusto autem exercitationem dolore consectetur.', 'https://lorempixel.com/600/480/?19823', '\"#77eb89\"', '\"sm\"', 6, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(63, 11, 72, 'Prof. Guy Maggio Jr.', 47.00, 13.00, 'Sint deserunt ducimus ut voluptate. Ducimus sit ipsum quia voluptas. Sed eos qui amet ut deserunt adipisci. Qui harum voluptas aut architecto sequi perspiciatis aut.', 'https://lorempixel.com/600/480/?72034', '\"#5b76dc\"', '\"md\"', 7, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(64, 33, 94, 'Gail Hagenes', 78.00, 57.00, 'Quod nobis modi ut eos earum cumque. Animi commodi excepturi est odio qui autem. Earum sint quo ipsa. Sit consequatur sequi doloremque rerum aut corrupti et.', 'https://lorempixel.com/600/480/?26001', '\"#4baf92\"', '\"lg\"', 5, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(65, 48, 79, 'Leanna Halvorson', 70.00, 93.00, 'Hic iure enim libero ab aliquam. Enim eos aperiam aut excepturi nesciunt. Consequatur omnis rerum tempore illum. Aspernatur laboriosam ab vel odio et repudiandae.', 'https://lorempixel.com/600/480/?77104', '\"#3af3de\"', '\"md\"', 4, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(66, 21, 54, 'Blair Kub PhD', 95.00, 98.00, 'Ex aut non non. Dolore et vero temporibus eum doloremque. Ab ut ut modi ullam ut.', 'https://lorempixel.com/600/480/?95763', '\"#042763\"', '\"lg\"', 8, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(67, 26, 66, 'Candelario Fisher', 45.00, 52.00, 'Minima exercitationem animi perspiciatis aut. Et exercitationem qui id. Doloremque alias earum quibusdam dicta necessitatibus. Necessitatibus excepturi consequatur fugiat cumque.', 'https://lorempixel.com/600/480/?95617', '\"#a51398\"', '\"md\"', 4, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(68, 64, 95, 'Mr. Donato Mueller', 95.00, 91.00, 'Et sint dolor quia facere. Explicabo sit nesciunt optio et et aut hic. Et quo blanditiis quod aliquam quaerat sit. Et perferendis omnis laborum esse qui. Qui in corporis et sunt.', 'https://lorempixel.com/600/480/?28511', '\"#ce05ac\"', '\"sm\"', 4, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(69, 61, 67, 'Giovanna Tremblay', 45.00, 79.00, 'Omnis temporibus non quia dicta. Eos earum adipisci qui aut nihil ratione accusantium. Temporibus tempore est et voluptatum aliquam. Possimus deserunt facere qui.', 'https://lorempixel.com/600/480/?60375', '\"#52e1ac\"', '\"lg\"', 8, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(70, 15, 63, 'Alvena Heaney', 11.00, 42.00, 'Ad minus deserunt perspiciatis dicta culpa quisquam. Sed animi aliquam voluptates eaque fugiat. Impedit debitis beatae ex placeat. Sed odit aut inventore est et culpa assumenda.', 'https://lorempixel.com/600/480/?86637', '\"#0b9e75\"', '\"lg\"', 5, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(71, 45, 96, 'Hildegard Stiedemann', 29.00, 32.00, 'Velit magni et recusandae et culpa rerum libero. Incidunt earum illum et tenetur enim. Sint quia est provident sit non.', 'https://lorempixel.com/600/480/?13878', '\"#c1b7e1\"', '\"sm\"', 6, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(72, 64, 63, 'Miss Elmira Brekke DVM', 82.00, 33.00, 'Nihil delectus fuga possimus. Quam vel quia reprehenderit voluptatem pariatur natus. Earum eos et excepturi eligendi dolor tempore.', 'https://lorempixel.com/600/480/?35416', '\"#327947\"', '\"md\"', 4, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(73, 62, 62, 'Timmothy Runte', 61.00, 96.00, 'Ut fuga qui laborum velit voluptate modi aut libero. Dicta et architecto culpa consectetur qui ab.', 'https://lorempixel.com/600/480/?85175', '\"#a8b580\"', '\"lg\"', 8, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(74, 22, 57, 'Velma Bergnaum', 39.00, 61.00, 'Reprehenderit enim quo delectus officiis. Labore quos qui aut omnis sit nemo a. Ut ut dolores est quis eligendi.', 'https://lorempixel.com/600/480/?90212', '\"#312f2f\"', '\"md\"', 9, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(75, 37, 63, 'Eldon Cruickshank', 34.00, 32.00, 'Aut omnis ut quam consequatur sunt. Et repellat ut totam quam. Unde non necessitatibus odio consequatur quia perferendis veniam.', 'https://lorempixel.com/600/480/?29086', '\"#2a39be\"', '\"sm\"', 7, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(76, 37, 94, 'Amaya Senger', 65.00, 47.00, 'Ut nostrum voluptatem occaecati laboriosam. Deserunt est quos qui aut magni consectetur. Porro dolorem asperiores sequi dolor tenetur facere. Exercitationem ullam est qui dolores impedit impedit.', 'https://lorempixel.com/600/480/?47970', '\"#8ca7bc\"', '\"md\"', 4, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(77, 7, 60, 'Prof. Grady Cummings V', 96.00, 16.00, 'Minus qui quia voluptates laudantium consequuntur rem. Natus consequatur ipsa temporibus quod. Ut at veritatis omnis officia officiis vel. Delectus culpa ut quibusdam voluptatibus.', 'https://lorempixel.com/600/480/?63619', '\"#b9613d\"', '\"lg\"', 5, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(78, 44, 59, 'Ruben Ward DVM', 19.00, 17.00, 'Ut aut consequuntur sed velit. Natus quia quisquam quis deleniti voluptas neque sunt velit. Corrupti autem assumenda dolores et nemo velit.', 'https://lorempixel.com/600/480/?53824', '\"#0f92b7\"', '\"lg\"', 7, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(79, 21, 64, 'Shawn Hermiston DVM', 40.00, 80.00, 'Officia aut et laboriosam repellat nostrum ex nihil. Quis voluptas est necessitatibus non voluptas fugit vero. Qui aperiam veniam pariatur cupiditate modi labore dolores assumenda.', 'https://lorempixel.com/600/480/?55471', '\"#869b5e\"', '\"lg\"', 5, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(80, 50, 79, 'Tina Prosacco', 66.00, 64.00, 'Similique ipsam quos nemo nam. Autem et non rerum facere amet. Omnis sit ducimus iste voluptatem perferendis ut.', 'https://lorempixel.com/600/480/?44694', '\"#bf7a13\"', '\"sm\"', 10, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(81, 5, 79, 'Stacey Vandervort', 88.00, 51.00, 'Id quo explicabo nam aliquam accusamus. Et velit qui id optio aut ut. Quis aut minima sunt et voluptatem dolores eaque voluptatem.', 'https://lorempixel.com/600/480/?14742', '\"#346cc7\"', '\"md\"', 10, '2021-09-10 14:44:18', '2021-09-10 14:44:18'),
(82, 53, 94, 'Prof. Doug Windler', 94.00, 51.00, 'Similique maxime quia sit laboriosam eos est et. Atque est perspiciatis consequatur repellat fuga iste. Iure eligendi debitis ut aut recusandae.', 'https://lorempixel.com/600/480/?32834', '\"#ff9132\"', '\"lg\"', 6, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(83, 42, 64, 'Tyree Turner', 63.00, 41.00, 'In veritatis repudiandae ea enim et rem expedita perferendis. Recusandae molestiae autem aut. Possimus eaque similique voluptatum facere hic deserunt.', 'https://lorempixel.com/600/480/?17032', '\"#f49ac0\"', '\"sm\"', 3, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(84, 53, 101, 'Dr. Keven Windler', 12.00, 99.00, 'Aliquam quidem minima et aut architecto. Id nobis fugiat dolor sunt quia aliquam. Et veritatis aut consequuntur voluptate sit voluptatum esse. Et quis temporibus enim officia quidem voluptatem nihil.', 'https://lorempixel.com/600/480/?22552', '\"#27c643\"', '\"sm\"', 9, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(85, 49, 101, 'Jalyn Rempel', 58.00, 88.00, 'Voluptatum eum aut qui ea ex. Asperiores quo neque magni alias hic repellendus non. Rem similique autem sunt est dolore aut.', 'https://lorempixel.com/600/480/?68813', '\"#ef746b\"', '\"sm\"', 3, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(86, 62, 53, 'Dario Langworth', 79.00, 23.00, 'Quasi repellat earum doloribus delectus. Impedit modi quam iste et vel officia. Ab qui enim laboriosam perspiciatis similique. Similique quod aut quam qui. Explicabo qui provident cupiditate.', 'https://lorempixel.com/600/480/?15077', '\"#bae2d5\"', '\"md\"', 10, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(87, 43, 98, 'Mr. Matteo Torp', 27.00, 62.00, 'Itaque harum inventore accusantium doloribus sint inventore quisquam. Ut voluptatem doloribus nihil neque officia quis.', 'https://lorempixel.com/600/480/?14701', '\"#ef309b\"', '\"sm\"', 2, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(88, 14, 78, 'Kenny Trantow Sr.', 54.00, 34.00, 'Quia expedita aut facilis repellat quas et voluptatibus porro. Ea ea quos nam est. Dolores velit alias dolorem qui totam iste adipisci enim.', 'https://lorempixel.com/600/480/?25174', '\"#d90c5e\"', '\"md\"', 3, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(89, 46, 100, 'Mr. Kurtis Johnston', 68.00, 15.00, 'Autem quia voluptate cum earum. Amet dignissimos sit non fugiat quo qui non et. Non assumenda aliquid beatae consequatur ipsum sed officiis temporibus.', 'https://lorempixel.com/600/480/?97854', '\"#b6cca6\"', '\"lg\"', 2, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(90, 62, 95, 'Sherwood Corkery', 60.00, 16.00, 'Cupiditate quo quisquam provident quas voluptas rerum. Facere ab sit et eos officia maiores. Deleniti quisquam sint ipsam alias in accusamus.', 'https://lorempixel.com/600/480/?19523', '\"#a7f8bf\"', '\"sm\"', 3, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(91, 36, 57, 'Nannie Herman PhD', 57.00, 50.00, 'Fugit omnis quibusdam qui ab recusandae natus. Officiis est est et sed quaerat vitae consequatur. Est fugiat nihil molestias.', 'https://lorempixel.com/600/480/?58660', '\"#9aa304\"', '\"lg\"', 9, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(92, 27, 64, 'Mr. Judah Dooley PhD', 91.00, 31.00, 'Adipisci voluptatem molestias ipsam. Vel quis voluptatem atque quis aut nam. Enim at et soluta exercitationem iste sit. Ut laudantium libero facere facere nobis at aut.', 'https://lorempixel.com/600/480/?58375', '\"#229451\"', '\"lg\"', 7, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(93, 37, 67, 'Dr. Armani Fisher', 13.00, 32.00, 'Sed ut consequatur qui commodi. Consectetur est culpa eveniet ratione inventore id omnis. Eum quo quibusdam qui quasi nemo.', 'https://lorempixel.com/600/480/?69414', '\"#e2e697\"', '\"lg\"', 3, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(94, 40, 63, 'Marlee Borer', 62.00, 71.00, 'Quisquam sit et aliquam veniam repellat nulla. Tenetur molestias vero in suscipit ut odio. Voluptas voluptatem enim quia nesciunt ratione.', 'https://lorempixel.com/600/480/?83235', '\"#668363\"', '\"lg\"', 9, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(95, 31, 77, 'Andres Hodkiewicz MD', 91.00, 97.00, 'Omnis nulla aut commodi quasi qui et quas. Quo atque alias perferendis dolorem quaerat.', 'https://lorempixel.com/600/480/?31083', '\"#7c2031\"', '\"sm\"', 5, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(96, 28, 73, 'Torey Lynch', 22.00, 82.00, 'Reprehenderit perspiciatis fugit quia labore vero provident dignissimos. Et perferendis et accusamus qui ad nulla. Eveniet vel aliquam et quo ipsa voluptas accusamus.', 'https://lorempixel.com/600/480/?25994', '\"#d355ec\"', '\"sm\"', 8, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(97, 26, 55, 'Kendall Mayer Jr.', 26.00, 90.00, 'Deserunt omnis ut voluptatibus qui nisi rem quo. Autem dignissimos rem cupiditate at omnis. Assumenda aut ut quos quibusdam architecto reprehenderit. Id esse quae temporibus.', 'https://lorempixel.com/600/480/?16033', '\"#1af042\"', '\"sm\"', 3, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(98, 48, 93, 'Kellie Orn', 18.00, 20.00, 'Enim cupiditate doloremque quas dolor non autem. Vel autem omnis qui hic consequuntur. Cum nam ex dignissimos ut qui eligendi ratione in.', 'https://lorempixel.com/600/480/?35424', '\"#3b941f\"', '\"sm\"', 6, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(99, 22, 92, 'Betsy Bergstrom', 52.00, 36.00, 'Minus molestias nulla at et saepe omnis. Sapiente non quas quia vitae et impedit. Provident distinctio corporis ipsum aliquam sunt maxime aut. Quo hic reprehenderit enim eius qui omnis sed.', 'https://lorempixel.com/600/480/?45991', '\"#14992d\"', '\"md\"', 2, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(100, 41, 60, 'Dr. Karl Kilback MD', 38.00, 91.00, 'Error aut ratione temporibus harum deleniti enim possimus. Maxime ratione quia beatae non ipsam quasi expedita. Sapiente eum cum omnis corporis vel reprehenderit molestias.', 'https://lorempixel.com/600/480/?14914', '\"#e16442\"', '\"sm\"', 2, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(101, 47, 56, 'Dr. Ludwig Dooley', 100.00, 13.00, 'Consequuntur et tempore laudantium in perferendis possimus qui sed. Dolor aut suscipit in sunt enim id ab. Libero cumque quam facilis dolorum. Molestias voluptatem voluptatum aut iusto sed qui.', 'https://lorempixel.com/600/480/?14770', '\"#dd0829\"', '\"sm\"', 8, '2021-09-10 14:44:19', '2021-09-10 14:44:19'),
(102, 2, 53, 'Nisi maiores veritat', 44.00, 2.00, 'Ut non perspiciatis', 'C:\\xampp\\tmp\\phpD61A.tmp', '\"#000000\"', '\"s\"', 54, '2021-09-12 04:29:13', '2021-09-12 04:29:13'),
(103, 3, 52, 'Eos tempore cupidit', 43.00, 38.00, 'Et aut sit ab id', '1631443132_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"m\"]', 60, '2021-09-12 04:38:52', '2021-09-12 04:38:52'),
(104, 3, 53, 'Non rerum quo minus', 4.00, 47.00, 'Ducimus aut ex volu', '1631455981_marguerite-729510__340.jpg', '[\"#CE2737\"]', '[\"sl\"]', 5, '2021-09-12 08:13:01', '2021-09-12 08:13:01'),
(105, 2, 55, 'Tanisha White', 7.00, 9.00, 'Consequatur sed aut', '1631456472_marguerite-729510__340.jpg', '[\"#007807\"]', '[\"xl\"]', 88, '2021-09-12 08:21:12', '2021-09-12 08:21:12'),
(106, 3, 53, 'In earum sed eiusmod', 22.00, 84.00, 'Dolorum exercitation', '1631464772_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"m\"]', 95, '2021-09-12 10:39:32', '2021-09-12 10:39:32'),
(107, 3, 57, 'Laptop', 12000.00, 100.00, 'Its is amaizing Its is amaizing Its is amaizing Its is amaizing vIts is amaizing Its is amaizing  Its is amaizing Its is amaizing Its is amaizing Its is amaizing', '1631466243_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"m\"]', 2, '2021-09-12 11:04:03', '2021-09-12 11:04:03'),
(108, 3, 53, 'Voluptates laudantiu', 93.00, 42.00, 'Corrupti sint offic', '1631472025_marguerite-729510__340.jpg', '[\"#000000\"]', '[\"s\"]', 69, '2021-09-12 12:40:25', '2021-09-12 12:40:25'),
(109, 2, 52, 'Cody Gould', 75.00, 38.00, 'Saepe ut quibusdam v', '1631472103_marguerite-729510__340.jpg', '[\"#CE2737\"]', '[\"m\"]', 58, '2021-09-12 12:41:43', '2021-09-12 12:41:43'),
(110, 2, 55, 'Wyoming Dalton', 71.00, 92.00, 'Amet at voluptas qu', '1631472180_marguerite-729510__340.jpg', '[\"#CE2737\"]', '[\"m\"]', 82, '2021-09-12 12:43:00', '2021-09-12 12:43:00'),
(111, 3, 58, 'Mari Young', 48.00, 16.00, 'Molestias irure duci', '1631472273_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"s\"]', 14, '2021-09-12 12:44:33', '2021-09-12 12:44:33'),
(112, 2, 53, 'Mollie Kelly', 40.00, 51.00, 'Nisi dolore quia in', '1631473069_marguerite-729510__340.jpg', '[\"#000000\"]', '[\"m\"]', 35, '2021-09-12 12:57:49', '2021-09-12 12:57:49'),
(113, 2, 52, 'Wing Beasley', 18.00, 66.00, 'Est laborum Rerum', '1631473288_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"l\"]', 71, '2021-09-12 13:01:29', '2021-09-12 13:01:29'),
(114, 3, 54, 'Elizabeth Bowman', 38.00, 9.00, 'Veniam labore maxim', '1631473421_marguerite-729510__340.jpg', '[\"#000000\"]', '[\"m\"]', 27, '2021-09-12 13:03:41', '2021-09-12 13:03:41'),
(115, 2, 54, 'Cyrus Olson', 6.00, 39.00, 'Dolor dolorem quia e', '1631473675_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"m\"]', 83, '2021-09-12 13:07:55', '2021-09-12 13:07:55'),
(116, 3, 52, 'Kathleen Huber', 69.00, 33.00, 'Elit laborum Solut', '1631473754_marguerite-729510__340.jpg', '[\"#000000\"]', '[\"l\"]', 90, '2021-09-12 13:09:14', '2021-09-12 13:09:14'),
(117, 3, 53, 'Soluta tempora vel f', 54.00, 61.00, 'Officia explicabo N', '1631473835_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"s\"]', 42, '2021-09-12 13:10:35', '2021-09-12 13:10:35'),
(118, 2, 53, 'Debitis anim autem a', 94.00, 81.00, 'Facere enim quam dol', '1631473915_marguerite-729510__340.jpg', '[\"#CE2737\"]', '[\"l\"]', 42, '2021-09-12 13:11:55', '2021-09-12 13:11:55'),
(119, 2, 53, 'Aperiam voluptatibus', 55.00, 26.00, 'Iusto dolore repudia', '1631480677_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"m\"]', 65, '2021-09-12 15:04:37', '2021-09-12 15:04:37'),
(120, 2, 53, 'Aperiam voluptatibuses', 55.00, 26.00, 'Iusto dolore repudia', '1631480677_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"m\"]', 65, '2021-09-12 15:13:43', '2021-09-12 15:13:43'),
(121, 2, 52, 'Non dolores pariatur', 27.00, 52.00, 'Velit aliquam tempor', '1631486082_Capture.PNG', '[\"#000000\"]', '[\"l\"]', 25, '2021-09-12 16:34:42', '2021-09-12 16:34:42'),
(122, 2, 52, 'Non dolores pariatur', 27.00, 52.00, 'Velit aliquam tempor', '1631486082_Capture.PNG', '[\"#000000\"]', '[\"l\"]', 25, '2021-09-12 16:38:45', '2021-09-12 16:38:45'),
(123, 2, 52, 'Non dolores pariatur', 27.00, 52.00, 'Velit aliquam tempor', '1631487785_marguerite-729510__340.jpg', '[\"#000000\"]', '[\"l\"]', 25, '2021-09-12 17:03:06', '2021-09-12 17:03:06'),
(124, 2, 55, 'Dolor recusandae Il1', 78.00, 96.00, 'Maxime sed assumenda', '1631490913_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"s\"]', 59, '2021-09-12 17:55:13', '2021-09-12 17:55:13'),
(125, 2, 55, 'Dolor recusandae Il1', 78.00, 96.00, 'Maxime sed assumenda', '1631490971_Capture.PNG', '[\"#FFFFFF\"]', '[\"s\"]', 59, '2021-09-12 17:56:12', '2021-09-12 17:56:12'),
(126, 2, 55, 'Dolor recusandae Il1', 78.00, 96.00, 'Maxime sed assumenda', '1631491093_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"s\"]', 59, '2021-09-12 17:58:14', '2021-09-12 17:58:14'),
(127, 2, 55, 'Dolor recusandae Il1', 78.00, 96.00, 'Maxime sed assumenda', '1631491940_Capture.PNG', '[\"#FFFFFF\"]', '[\"s\"]', 59, '2021-09-12 18:12:20', '2021-09-12 18:12:20'),
(128, 2, 55, 'Dolor recusandae Il1', 78.00, 96.00, 'Maxime sed assumenda', '1631492018_marguerite-729510__340.jpg', '[\"#FFFFFF\"]', '[\"s\"]', 59, '2021-09-12 18:13:38', '2021-09-12 18:13:38'),
(129, 5, 57, 'asds', 122.00, 12.00, 'aaaaaaaaaaaa', '1632870476_Capturebarca.PNG', '[\"#dddddd\"]', '[\"m\"]', 2, '2021-09-28 17:07:56', '2021-09-28 17:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Non vero vitae dolor', 'lakam@mailinator.com', 'Non id eius est et r', 'A velit culpa paria', NULL, '$2y$10$tlF6grnvxGphStxvnjWhVOOV9woFC9GNT7f4OCVGI/TFr5srK2CQO', NULL, '2021-08-29 15:54:12', '2021-08-29 15:54:12'),
(2, 'Shahidullah', 'pl@gmail.com', '387643333333', 'arrrrrrrr', NULL, '$2y$10$N3YF8Bj0Nf/CNiMY90R5PeZK9hGueoSm/KqerGPErJlFGThh5Puza', 'GSTxe7NGIvIrL7CuS3GBi3vBq28Z6EVdZhJtnVeh4mnLGQyREViQhLxc6Oqq', '2021-08-30 04:32:00', '2021-10-03 18:55:56'),
(3, 'Sahid', 'sha@gmail.com', '0136534', 'wweqw', NULL, '$2y$10$xCLUCrwDyCFCL91WG/oLUeJhZXM.awvNc.VTZtJM2lvE4ebXJnlhe', NULL, '2021-09-01 12:59:14', '2021-09-01 12:59:14'),
(4, 'Abdul', 'Ab@gmail.com', '01534545', 'plgmail.com', NULL, '$2y$10$l7Vq1DaSd44mDSxeRJNAquDE0nRSKLoWAGBwiVES5MfdK0ayrfnJe', NULL, '2021-09-01 13:08:15', '2021-09-01 13:08:15'),
(5, 'Sak', 'sak@gmail.com', '01714340720', '5/a Ahmmod Nogor , Sopura , Rajshahi', NULL, '$2y$10$9WrkFopsyd2GfEuVolgfu.QroF.2R0tUNtYViV8uGSPSpJLxqGKiu', NULL, '2021-10-01 10:42:22', '2021-10-01 10:42:22'),
(6, 'Asda', 'asda@gmail.com', '072443334', '5/a Ahmmod Nogor , Sopura , Rajshahi', NULL, '$2y$10$n/4EbaNMbg6nUq4wu3WwW.AFIhhDTLmHPMCRhagka/g.tW2GKkCd2', NULL, '2021-10-01 11:07:55', '2021-10-01 11:07:55'),
(7, 'sakura', 'sakura@gmail.com', '454543543566665', 'qewqwqew', NULL, '$2y$10$M1UwvlYJe7mPLjiE5r56HemkmOoiVXT/VxqEBNX7RVzXk0dnpwImm', NULL, '2021-10-01 11:11:23', '2021-10-01 11:11:23'),
(8, 'Abul', 'Abul@gmail.com', '12344523445245', 'wrrsdzsassdssd', NULL, '$2y$10$OsUveDNdlIHMiQjNbrDvvOd.29kvmcYStwQSchLyUS00yNug6Fedu', NULL, '2021-10-01 11:19:49', '2021-10-01 11:19:49'),
(9, 'Adaa', 'Ada@gmail.com', '366452634234242', '5i442/a sdss sgdghs, ts', NULL, '$2y$10$HCVRgaRF1B9iH7iSLzr6R.nR5ASUNleQmf3L5H5gico2Im.fbc3xy', NULL, '2021-10-02 09:35:23', '2021-10-02 09:56:51'),
(10, 'Wahida', 'wyeasmin@gmail.com', '01663236424234', 'sdgwgdwcwdc', NULL, '$2y$10$zSW1JRMlvi1V/o03Ij.cdO4Q/A2g9tjM/Qc2DN9voeoPIcRCupiC.', '3DnrObbfleFmIEvhHKiP93uCIsKbQZxTzUUMn3GZn5wCGipckogXHMwlZJ94', '2021-10-05 11:28:44', '2021-10-05 11:33:40');

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(30, 2, 128, '2021-09-21 06:52:37', '2021-09-21 06:52:37'),
(33, 2, 122, '2021-09-21 07:20:25', '2021-09-21 07:20:25'),
(34, 2, 119, '2021-09-21 07:22:05', '2021-09-21 07:22:05'),
(35, 2, 120, '2021-09-21 07:22:59', '2021-09-21 07:22:59'),
(39, 2, 127, '2021-09-21 09:22:25', '2021-09-21 09:22:25'),
(42, 2, 105, '2021-09-23 12:48:55', '2021-09-23 12:48:55'),
(45, 2, 123, '2021-09-24 13:15:15', '2021-09-24 13:15:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
