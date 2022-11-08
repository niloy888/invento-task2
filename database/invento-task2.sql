-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 07, 2022 at 03:56 PM
-- Server version: 5.7.33
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invento-task2`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2019_12_22_015115_create_short_urls_table', 2),
(6, '2019_12_22_015214_create_short_url_visits_table', 2),
(7, '2020_02_11_224848_update_short_url_table_for_version_two_zero_zero', 2),
(8, '2020_02_12_008432_update_short_url_visits_table_for_version_two_zero_zero', 2),
(9, '2020_04_10_224546_update_short_url_table_for_version_three_zero_zero', 2),
(10, '2020_04_20_009283_update_short_url_table_add_option_to_forward_query_params', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API TOKEN', 'fcf72c80b7d29ecf6998e32ee419097d2a859a658c18030072d901ebcfc45cdd', '[\"*\"]', NULL, NULL, '2022-11-06 12:15:42', '2022-11-06 12:15:42'),
(2, 'App\\Models\\User', 1, 'API TOKEN', '6891c55747e41f678ea4c72cef05cfc425cff996e79ef30542f81fe7a2972cd4', '[\"*\"]', NULL, NULL, '2022-11-06 12:19:14', '2022-11-06 12:19:14'),
(3, 'App\\Models\\User', 1, 'API TOKEN', 'f0a675d73c755bbb58328ed297c629adc69bc6e8dcb0f7b6317e083cdc33636c', '[\"*\"]', NULL, NULL, '2022-11-07 05:04:11', '2022-11-07 05:04:11'),
(4, 'App\\Models\\User', 1, 'API TOKEN', 'c7a60d44b7a0ec21d0563791e75d1892d2b970227825f1bdea05179eb5d530ea', '[\"*\"]', NULL, NULL, '2022-11-07 05:48:00', '2022-11-07 05:48:00'),
(5, 'App\\Models\\User', 1, 'API TOKEN', 'e10ddce63ada6423ec1ededcf1fe05f8087ea5fbe5a153544e6b777ead176f4e', '[\"*\"]', NULL, NULL, '2022-11-07 05:50:27', '2022-11-07 05:50:27'),
(6, 'App\\Models\\User', 1, 'API TOKEN', '839ce0ab68451beb5db4de77167dc2bf48dd9541669b012e5a27046631e82fe5', '[\"*\"]', NULL, NULL, '2022-11-07 07:40:01', '2022-11-07 07:40:01'),
(7, 'App\\Models\\User', 2, 'API TOKEN', '0a95882b40f4d1bd5ae131aace51786c4d4405a97213c5eca09dda97169df64f', '[\"*\"]', NULL, NULL, '2022-11-07 10:19:16', '2022-11-07 10:19:16'),
(8, 'App\\Models\\User', 1, 'API TOKEN', '7bad57d8c64447bf5f8b4a44aabbf44253adcd72590aea6c2b4a380ed7969efc', '[\"*\"]', NULL, NULL, '2022-11-07 10:21:35', '2022-11-07 10:21:35'),
(9, 'App\\Models\\User', 3, 'API TOKEN', '822e5accf494a1c37434d3f2977a7a88612172c256c283c7ae799d8521bf2594', '[\"*\"]', NULL, NULL, '2022-11-07 10:35:45', '2022-11-07 10:35:45'),
(10, 'App\\Models\\User', 3, 'API TOKEN', '9b9a0c448290db0c7eed9eec822e337f3088343cd1b72f43b33941700bff8c46', '[\"*\"]', NULL, NULL, '2022-11-07 10:36:12', '2022-11-07 10:36:12'),
(11, 'App\\Models\\User', 1, 'API TOKEN', '6b1ba065162bfcfaafd6ab8c7fadc9b256a3e41194017b04ed9da71654cd0a0a', '[\"*\"]', NULL, NULL, '2022-11-07 11:34:44', '2022-11-07 11:34:44'),
(12, 'App\\Models\\User', 3, 'API TOKEN', 'deda30e3a36985c9e1271c7091a330baef2e7c5c3d84428aadf0f77ebe727874', '[\"*\"]', NULL, NULL, '2022-11-07 11:36:28', '2022-11-07 11:36:28'),
(13, 'App\\Models\\User', 3, 'API TOKEN', '550f8d1fa52bf2c13a5a142786b0abff85450b0359b93c9d457ebd79171c2b31', '[\"*\"]', NULL, NULL, '2022-11-07 11:37:27', '2022-11-07 11:37:27'),
(14, 'App\\Models\\User', 1, 'API TOKEN', 'c8c6cacf01cc840bdfa2206cd07ac72d58045430c0b0b9b4fc61d62b84867aac', '[\"*\"]', NULL, NULL, '2022-11-07 14:19:19', '2022-11-07 14:19:19'),
(15, 'App\\Models\\User', 1, 'API TOKEN', '85edca91542b60dddaca002d0d3921458dab484d95d00b1f9db73713480b4243', '[\"*\"]', NULL, NULL, '2022-11-07 14:20:40', '2022-11-07 14:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `short_urls`
--

CREATE TABLE `short_urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT '0',
  `destination_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_short_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `single_use` tinyint(1) NOT NULL,
  `forward_query_params` tinyint(1) NOT NULL DEFAULT '0',
  `track_visits` tinyint(1) NOT NULL,
  `redirect_status_code` int(11) NOT NULL DEFAULT '301',
  `track_ip_address` tinyint(1) NOT NULL DEFAULT '0',
  `track_operating_system` tinyint(1) NOT NULL DEFAULT '0',
  `track_operating_system_version` tinyint(1) NOT NULL DEFAULT '0',
  `track_browser` tinyint(1) NOT NULL DEFAULT '0',
  `track_browser_version` tinyint(1) NOT NULL DEFAULT '0',
  `track_referer_url` tinyint(1) NOT NULL DEFAULT '0',
  `track_device_type` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT '2022-11-06 12:30:52',
  `deactivated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `short_urls`
--

INSERT INTO `short_urls` (`id`, `user_id`, `is_private`, `destination_url`, `url_key`, `default_short_url`, `single_use`, `forward_query_params`, `track_visits`, `redirect_status_code`, `track_ip_address`, `track_operating_system`, `track_operating_system_version`, `track_browser`, `track_browser_version`, `track_referer_url`, `track_device_type`, `activated_at`, `deactivated_at`, `created_at`, `updated_at`) VALUES
(41, 1, 1, 'https://www.youtube.com/', 'k4x9e', 'http://127.0.0.1:8000/short/k4x9e', 0, 0, 1, 301, 1, 1, 1, 1, 1, 1, 1, '2022-11-07 13:38:09', '2022-11-08 13:38:09', '2022-11-07 13:38:09', '2022-11-07 13:38:09'),
(42, 1, 0, 'https://www.udemy.com/', 'mNBK4', 'http://127.0.0.1:8000/short/mNBK4', 1, 0, 1, 301, 1, 1, 1, 1, 1, 1, 1, '2022-11-07 14:02:19', '2022-11-08 14:02:19', '2022-11-07 14:02:19', '2022-11-07 14:02:19'),
(46, 4, 1, 'https://www.udemy.com/', 'dNY24', 'http://127.0.0.1:8000/short/dNY24', 1, 0, 1, 301, 1, 1, 1, 1, 1, 1, 1, '2022-11-07 15:38:21', '2022-11-08 15:38:21', '2022-11-07 15:38:21', '2022-11-07 15:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `short_url_visits`
--

CREATE TABLE `short_url_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `short_url_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operating_system` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operating_system_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visited_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `short_url_visits`
--

INSERT INTO `short_url_visits` (`id`, `short_url_id`, `ip_address`, `operating_system`, `operating_system_version`, `browser`, `browser_version`, `referer_url`, `device_type`, `visited_at`, `created_at`, `updated_at`) VALUES
(38, 41, '127.0.0.1', 'Windows', '10.0', 'Chrome', '107.0.0.0', NULL, 'desktop', '2022-11-07 13:38:33', '2022-11-07 13:38:33', '2022-11-07 13:38:33'),
(39, 41, '127.0.0.1', 'Windows', '10.0', 'Chrome', '107.0.0.0', NULL, 'desktop', '2022-11-07 13:58:11', '2022-11-07 13:58:11', '2022-11-07 13:58:11'),
(40, 41, '127.0.0.1', 'Windows', '10.0', 'Firefox', '106.0', NULL, 'desktop', '2022-11-07 13:58:55', '2022-11-07 13:58:55', '2022-11-07 13:58:55'),
(41, 41, '127.0.0.1', 'Windows', '10.0', 'Firefox', '106.0', NULL, 'desktop', '2022-11-07 13:59:19', '2022-11-07 13:59:19', '2022-11-07 13:59:19'),
(42, 42, '127.0.0.1', 'Windows', '10.0', 'Chrome', '107.0.0.0', NULL, 'desktop', '2022-11-07 14:02:26', '2022-11-07 14:02:26', '2022-11-07 14:02:26'),
(47, 46, '127.0.0.1', 'Windows', '10.0', 'Chrome', '107.0.0.0', 'http://127.0.0.1:8000/private_urls', 'desktop', '2022-11-07 15:38:28', '2022-11-07 15:38:28', '2022-11-07 15:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `is_admin`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'user', 'user@email.com', NULL, '$2y$10$3AHgbVNC53nEwgppOS/DrO39m3VXwyDIE7Mzq6RK14oCw/27ANIwe', NULL, '2022-11-06 12:15:19', '2022-11-06 12:15:19'),
(2, 0, 'niloy', 'niloy@email.com', NULL, '$2y$10$5LCSG05HWDS2HZNHtulVWeuR.Oi3x3V3Y3wquNKVcmiZGjg9jXOLO', NULL, '2022-11-07 10:19:03', '2022-11-07 10:19:03'),
(3, 1, 'admin', 'admin@email.com', NULL, '$2y$10$KdqxH9g.hKHfUt3ZLWF7QOmS3FuziyvLW7ydyRQAful1AVaVACGG.', NULL, '2022-11-07 10:35:38', '2022-11-07 10:35:38'),
(4, 0, 'niloy2', 'niloy2@email.com', NULL, '$2y$10$bEm3BPayJLZuglyFLGv8U.cyZxEawEP2LUXVbQSnPKq6UxF1LbpsC', NULL, '2022-11-07 15:34:27', '2022-11-07 15:34:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `short_urls_url_key_unique` (`url_key`);

--
-- Indexes for table `short_url_visits`
--
ALTER TABLE `short_url_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `short_url_visits_short_url_id_foreign` (`short_url_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

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
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `short_urls`
--
ALTER TABLE `short_urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `short_url_visits`
--
ALTER TABLE `short_url_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `short_url_visits`
--
ALTER TABLE `short_url_visits`
  ADD CONSTRAINT `short_url_visits_short_url_id_foreign` FOREIGN KEY (`short_url_id`) REFERENCES `short_urls` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
