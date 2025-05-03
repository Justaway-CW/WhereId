-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2025 at 04:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projek_skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tour_object_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_27_174839_create_provinces_table', 1),
(6, '2024_03_27_174932_create_tour_types_table', 1),
(7, '2024_04_01_085920_create_tour_objects_table', 2),
(8, '2024_04_01_092524_drop_table_tour_object', 3),
(9, '2024_04_01_092614_create_tour_objects_table', 4),
(10, '2024_04_01_093649_add_photo_to_tour_object_table', 5),
(11, '2024_04_02_095525_drop_table_tour_objects', 6),
(12, '2024_04_02_095601_create_tour_objects_table', 7),
(13, '2024_04_05_105601_add_column_bio_and_image_to_users_table', 8),
(15, '2024_04_05_123221_create_user_favourite_table', 9),
(17, '2024_04_07_110111_add_role_to_users_table', 10),
(18, '2024_04_15_114613_change_image_on_tour_objects_table', 11),
(19, '2024_04_15_115719_add_image_column', 12),
(21, '2024_04_18_130014_create_tourobject_comment_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `keyname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `keyname`, `name`, `capital`, `created_at`, `updated_at`) VALUES
(1, 'nanggroe_aceh_darussalam', 'Nanggroe Aceh Darussalam', 'Banda Aceh', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(2, 'sumatera_utara', 'Sumatera Utara', 'Medan', '2024-03-27 17:00:00', '2024-04-15 09:39:15'),
(3, 'sumatera_selatan', 'Sumatera Selatan', 'Palembang', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(4, 'sumatera_barat', 'Sumatera Barat', 'Padang', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(5, 'bengkulu', 'Bengkulu', 'Bengkulu', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(6, 'riau', 'Riau', 'Pekanbaru', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(7, 'kepulauan_riau', 'Kepulauan Riau', 'Tanjung Pinang', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(8, 'jambi', 'Jambi', 'Jambi', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(9, 'lampung', 'Lampung', 'Bandar Lampung', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(10, 'bangka_belitung', 'Bangka Belitung', 'Pangkal Pinang', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(11, 'kalimantan_barat', 'Kalimantan Barat', 'Pontianak', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(12, 'kalimantan_timur', 'Kalimantan Timur', 'Samarinda', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(13, 'kalimantan_selatan', 'Kalimantan Selatan', 'Banjarbaru', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(14, 'kalimantan_tengah', 'Kalimantan Tengah', 'Palangkaraya', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(15, 'kalimantan_utara', 'Kalimantan Utara', 'Tanjung Selor', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(16, 'banten', 'Banten', 'Serang', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(17, 'dki_jakarta', 'DKI Jakarta', 'Jakarta', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(18, 'jawa_barat', 'Jawa Barat', 'Bandung', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(19, 'jawa_tengah', 'Jawa Tengah', 'Semarang', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(20, 'daerah_istimewa_yogyakarta', 'Daerah Istimewa Yogyakarta', 'Yogyakarta', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(21, 'jawa_timur', 'Jawa Timur', 'Surabaya', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(22, 'bali', 'Bali', 'Denpasar', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(23, 'nusa_tenggara_timur', 'Nusa Tenggara Timur', 'Kupang', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(24, 'nusa_tenggara_barat', 'Nusa Tenggara Barat', 'Mataram', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(25, 'gorontalo', 'Gorontalo', 'Gorontalo', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(26, 'sulawesi_barat', 'Sulawesi Barat', 'Mamuju', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(27, 'sulawesi_tengah', 'Sulawesi Tengah', 'Palu', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(28, 'sulawesi_utara', 'Sulawesi Utara', 'Manado', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(29, 'sulawesi_tenggara', 'Sulawesi Tenggara', 'Kendari', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(30, 'sulawesi_selatan', 'Sulawesi Selatan', 'Makassar', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(31, 'maluku_utara', 'Maluku Utara', 'Sofifi', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(32, 'maluku', 'Maluku', 'Ambon', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(33, 'papua_barat', 'Papua Barat', 'Manokwari', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(34, 'papua', 'Papua', 'Jayapura', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(35, 'papua_tengah', 'Papua Tengah', 'Nabire', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(36, 'papua_pegunungan', 'Papua Pegunungan', 'Jayawijaya', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(37, 'papua_selatan', 'Papua Selatan', 'Merauke', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(38, 'papua_barat_daya', 'Papua Barat Daya', 'Sorong', '2024-03-27 17:00:00', '2024-03-27 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tour_objects`
--

CREATE TABLE `tour_objects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tour_type_id` bigint(20) UNSIGNED NOT NULL,
  `province_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `distance` double(8,2) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `rating` double(8,2) UNSIGNED NOT NULL,
  `review` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tour_objects`
--

INSERT INTO `tour_objects` (`id`, `tour_type_id`, `province_id`, `description`, `location`, `note`, `name`, `distance`, `price`, `rating`, `review`, `created_at`, `updated_at`, `image`) VALUES
(1, 2, 1, 'Mosque', 'Jl. Moh. Jam No.1, Kp. Baru, Kec. Baiturrahman, Kota Banda Aceh, Aceh', NULL, 'Baiturrahman Grand Mosque', 1.10, 0, 4.89, 26985, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Baiturrahman Grand Mosque.jpg'),
(2, 2, 1, 'Museum', 'Jl. Sultan Iskandar Muda No.3, Sukaramai, Kec. Baiturrahman, Kota Banda Aceh, Aceh 23116', NULL, 'Aceh Tsunami Museum', 1.70, 5000, 4.57, 11962, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(3, 1, 1, 'Beach', 'F6PG+5HQ Pantai Lampuuk, Meunasah Lambaro, Kec. Lhoknga, Kabupaten Aceh Besar, Aceh 23371', NULL, 'Lampuuk Beach', 16.80, 0, 4.59, 441, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(4, 2, 1, 'Tourist attraction', 'Punge Blang Cut, Jaya Baru, Banda Aceh City, Aceh 23116', NULL, 'PLTD Apung 1', 2.00, 0, 4.59, 8779, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'PLTD Apung 1.jpg'),
(5, 2, 1, 'Tourist attraction', 'Jl. Kenari 1 No.3, Lampulo, Kec. Kuta Alam, Kota Banda Aceh, Aceh 23127', NULL, 'Boat at Desa Lampulo', 3.90, 0, 4.00, 180, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Boat at Desa Lampulo.jpg'),
(6, 2, 1, 'Museum', 'Jl. Sultan Mahmudsyah No.10, Peuniti, Kec. Baiturrahman, Kota Banda Aceh, Aceh 23116', NULL, 'Aceh State Museum', 1.00, 5000, 4.59, 2144, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(7, 1, 1, 'Beach', 'H75P+W42, Ulee Lheue, Meuraxa, Banda Aceh City, Aceh', NULL, 'Ulee Lheue Beach', 5.50, 0, 4.40, 3676, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ulee Lheue Beach.jpg'),
(8, 3, 1, 'Restaurant', 'G8WP+222, Blang Cut, Lueng Bata, Banda Aceh City, Aceh 23127', NULL, 'Sate Matang D\'Wan', 2.40, 45000, 4.50, 1366, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(9, 3, 1, 'Restaurant', 'H84C+4XX, Jl. Teungku Angkasa, Kuta Alam, Kec. Kuta Alam, Kota Banda Aceh, Aceh 24415', NULL, 'Banda Seafood', 1.70, 85000, 4.19, 1511, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(10, 3, 1, 'Restaurant', 'Jl. Teuku Umar No.51, Seutui, Kec. Baiturrahman, Kota Banda Aceh, Aceh 23116', NULL, 'Canai Mamak', 1.70, 30000, 4.38, 2537, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Canai Mamak.jpg'),
(11, 3, 1, 'Restaurant', 'Jl. T. Panglima Polem No.81 82Peunayong, Peunayong, Kusalam, Kota Banda Aceh, Aceh 23121', NULL, 'Mie Razali', 1.80, 30000, 4.28, 5178, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mie Razali.jpg'),
(12, 3, 1, 'Restaurant', '0708, Lamglumpang, Kec. Ulee Kareng, Kota Banda Aceh, Aceh 23117', NULL, 'Solong Coffee', 4.50, 20000, 4.40, 3204, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Solong Coffee.jpg'),
(13, 1, 1, 'Lake', 'Danau, Central Aceh Regency, Aceh', NULL, 'Lake Laut Tawar', 326.00, 5000, 4.59, 365, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(14, 1, 1, 'Island', 'V7H5+Q96 Pulau Rubiah, Iboih, Sukakarya, Kota Sabang, Aceh 24411', 'Ferry from Banda Aceh is needed', 'Rubiah Island', 50.00, 0, 4.36, 407, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(15, 1, 1, 'Tourist attraction', 'Iboih, Sukakarya, Sabang City, Aceh', 'Ferry from Banda Aceh is needed', 'Iboih Beach', 50.00, 0, 4.54, 2772, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Iboih Beach.jpg'),
(16, 2, 1, 'Tourist attraction', 'W648+CP7, Iboih, Sukakarya, Sabang City, Aceh 24411', 'Ferry from Banda Aceh is needed', 'Monument 0 km Indonesia', 60.00, 0, 4.55, 6653, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(17, 1, 1, 'Tourist attraction', 'Takengon, Ulu Nuih, Bebesen, Ulu Nuih, Kec. Bebesen, Kabupaten Aceh Tengah, Aceh 24475', NULL, 'Pantan Terong', 310.00, 0, 4.50, 3091, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pantan Terong.jpg'),
(18, 1, 2, NULL, 'H833+XVQ, Jl. Sigura - Gura, Tangga, Kec. Aek Songsongan, Kabupaten Asahan, Sumatera Utara 21274', NULL, 'Ponot Waterfall', 242.00, 20000, 4.40, 1069, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(19, 2, 2, NULL, 'Turpuk Sihotang, Harian, Samosir Regency, North Sumatra 22396', NULL, 'Bukit Sibeabea', 181.00, 5000, 4.60, 1966, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(20, 1, 2, NULL, 'Bukit Lawang, Indah Jl. Orangutan, Timbang Lawan, Kec. Bohorok, Kabupaten Langkat, Sumatera Utara 20774', 'Hiring local guide/tour is recommended.', 'Bukit Lawang Jungle', 85.00, 0, 4.79, 604, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(21, 2, 2, NULL, 'Jl. Gn. Pusuk Buhit No.1, Karo, Kec. Siantar Sel., Kota Pematang Siantar, Sumatera Utara 21131', NULL, 'Vihara Avalokitsvara - Statue of Dewi Kwan Im', 129.00, 0, 4.58, 1614, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(22, 1, 2, NULL, 'RVMW+XCP, Sidamanik, Simalungun Regency, North Sumatra 21171', 'Trekking is required to reach the attraction point.', 'Bah Biak Sidamanik Waterfall', 157.00, 0, 4.20, 1391, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(23, 1, 2, NULL, '6GQ4+59J, Gunung Sibayak, Jaranguda, Kec. Merdeka, Kabupaten Karo, Sumatera Utara 20354', NULL, 'Mount Sibayak', 62.00, 0, 4.61, 1452, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mount Sibayak.jpg'),
(24, 1, 2, NULL, 'Puncak, Gundaling I, Kec. Berastagi, Kabupaten Karo, Sumatera Utara', NULL, 'Gundaling Hill', 67.00, 4000, 4.38, 2428, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(25, 3, 2, NULL, 'Jl. Gundaling, Tambak Lau Mulgap I, Kec. Berastagi, Kabupaten Karo, Sumatera Utara 22152', 'Prices may vary depending on what you buy.', 'Berastagi Fruit Market', 63.00, 20000, 4.30, 12625, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(26, 2, 2, 'Built in 1895, restored home of famous businessman Tjong A Fie, offering a gallery & guided tours.', 'Jl. Jend. Ahmad Yani No.105, Kesawan, Kec. Medan Bar., Kota Medan, Sumatera Utara 20111', NULL, 'Tjong A Fie\'s Mansion', 3.30, 35000, 4.50, 3619, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(27, 2, 2, 'Built in 2005, this Indo-Mogul-style Catholic temple is dedicated to Our Lady of Good Health', 'Jl. Taman Sakura Indah Jl. Sakura III No.7-10, Tj. Selamat, Kec. Medan Tuntungan, Kota Medan, Sumatera Utara 20135', NULL, 'Marian Shrine of Annai Velangkanni', 11.30, 0, 4.78, 4639, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(28, 2, 2, NULL, 'Jl. Mahkamah No.74c, RT.02, Mesjid, Kec. Medan Kota, Kota Medan, Sumatera Utara 20212', NULL, 'Al-Mashun Grand Mosque', 3.90, 0, 4.61, 2144, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Al-Mashun Grand Mosque.jpg'),
(29, 2, 2, 'Large Buddhist temple complex featuring ornate Chinese architecture, gardens & a vegetarian cafe.', 'Komplek Perumahan Cemara Asri No. 8, Jl. Cemara Asri Boulevard Raya No.Utara, Medan Estate, Kec. Percut Sei Tuan, Kabupaten Deli Serdang, Sumatera Utara 20371', NULL, 'Maha Vihara Maitreya', 8.90, 0, 4.69, 4453, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Maha Vihara Maitreya.jpg'),
(30, 1, 2, NULL, 'Berastagi, Gundaling II, Berastagi, Karo Regency, North Sumatra', NULL, 'Brastagi Highland', 64.50, 0, 4.00, 161, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(31, 2, 2, NULL, 'A U R, Medan Maimun, Medan City, North Sumatra 20212', NULL, 'Maimun Palace', 3.70, 10000, 3.50, 769, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(32, 2, 2, 'Detailed displays of taxidermied animals in their natural habitats, plus a cafe & gift shop', 'Jl. S. Parman No.309, Petisah Hulu, Kec. Medan Baru, Kota Medan, Sumatera Utara 20152', NULL, 'Rahmat International Wildlife Museum & Gallery', 2.60, 50000, 4.58, 2844, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(33, 1, 2, 'Massive volcanic crater lake amid tranquil mountain scenery, with nearby amenities like restaurants.', 'North Sumatra', NULL, 'Lake Toba', 163.00, 0, 4.59, 7277, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(34, 1, 2, 'Scenic 394-ft.-high waterfall & lake in the heart of a pine forest, accessed by a manmade pathway', 'Pengambaten, Merek, Karo Regency, North Sumatra 22173', NULL, 'Sipiso Piso Waterfall', 99.00, 7500, 4.53, 3338, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(35, 1, 2, 'Landmark, gilded Buddhist temple, a replica of Yangon\'s Shwedagon Pagoda, set amid verdant gardens.', 'Jl. Barusjahe, Dolat Rayat, Kec. Dolat Rayat, Kabupaten Karo, Sumatera Utara 22171', 'Entry fee is voluntary', 'Lumbini Natural Park', 59.00, 0, 4.39, 3907, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(36, 3, 2, NULL, 'Jl. Putri Hijau Kelurahan No.10, Kesawan, Kec. Medan Bar., Kota Medan, Sumatera Utara 20111', NULL, 'Marriott Café', 0.60, 250000, 4.50, 249, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(37, 3, 2, NULL, 'MVG3+RQG, Jl. Lkr. Tuktuk, Tuktuk Siadong, Simanindo, Kabupaten Samosir, Sumatera Utara 22395', NULL, 'Jenny\'s Restaurant', 162.00, 100000, 4.40, 791, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(38, 3, 2, NULL, 'Jl. Komp. Multatuli Indah Jl. H. Misbah No.45 Blok CC, Hamdan, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20151', NULL, 'TheBites Brownies', 3.00, 90000, 5.00, 5185, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(39, 3, 2, NULL, 'Jl. Selat Panjang No.7, Ps. Baru, Kec. Medan Kota, Kota Medan, Sumatera Utara 20212', NULL, 'Mie Tiong Sim Selat Panjang', 3.50, 40000, 4.36, 1907, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(40, 3, 2, 'Relaxed, enduring bakery & restaurant featuring Western & Asian dishes.', 'Jl. Jend. Ahmad Yani No.92 A-B, Kesawan, Kec. Medan Bar., Kota Medan, Sumatera Utara 20212', NULL, 'Tip Top Restaurant', 2.20, 60000, 4.35, 6114, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(41, 3, 2, NULL, 'Jl. K.H. Wahid Hasyim No.30-32, Babura, Kec. Medan Baru, Kota Medan, Sumatera Utara 20153', NULL, 'Durian Ucok', 2.60, 80000, 4.47, 12745, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(42, 3, 2, 'A shop that sells various types of typical Medan sponge cake, with various flavors and toppings, cheese and chocolate.', 'Jl. Razak No.7C, Sekip, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20111', NULL, 'Bolu Meranti', 1.00, 120000, 4.40, 4021, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(43, 3, 2, NULL, 'Jl. Pemandian No.94, Kec. Balige, Sumatera Utara 22312', NULL, 'Damar Toba', 224.00, 1100000, 4.71, 2541, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(44, 3, 2, NULL, 'JW Marriott Medan, Jl. Putri Hijau No.10, Kota Medan, Sumatera Utara 20111', NULL, 'Jade Chinese Restaurant', 0.60, 250000, 4.50, 358, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Jade Chinese Restaurant.jpg'),
(45, 3, 2, NULL, 'Jl. Karo No.20, Petisah Tengah, Kec. Medan Petisah, Kota Medan, Sumatera Utara 20112', NULL, 'Macehat Coffee', 0.60, 35000, 4.50, 3452, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Macehat Coffee.jpg'),
(46, 3, 2, NULL, 'Jl. Setia Budi No.17 D, Sei Sikambing B, Kec. Medan Sunggal, Kota Medan, Sumatera Utara 20122', NULL, 'Mi Aceh Titi Bobrok', 4.20, 35000, 4.29, 9967, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(47, 3, 2, NULL, 'Jl. Kol. Sugiono No.31, A U R, Kec. Medan Maimun, Kota Medan, Sumatera Utara 20212', NULL, 'Wajir Seafood', 2.50, 110000, 4.49, 12117, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(48, 1, 3, NULL, '34XX+9XP, Talang Tinggi, Muara Payang, Lahat Regency, South Sumatra 31592', NULL, 'Lawang Agung Waterfall', 308.00, 0, 4.32, 57, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(49, 1, 3, NULL, 'Padang, Merapi Selatan, Lahat Regency, South Sumatra', NULL, 'Serelo Hill', 222.00, 10000, 4.62, 108, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(50, 1, 3, NULL, 'Bedegung, Tanjung Agung, Muara Enim Regency, South Sumatra', NULL, 'Curup Tenang Waterfall', 238.00, 5000, 4.33, 123, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(51, 1, 3, NULL, 'W8GC+VMR, Perahu Dipo, Dempo Selatan, Pagar Alam City, South Sumatra 31521', NULL, 'Lematang Waterfall', 276.00, 5000, 4.28, 192, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(52, 1, 3, 'Volcano offering challenging mountain climbs & picturesque views of the city & tea plantations', 'Dempio Makmur, Pagar Alam Utara, Pagar Alam City, South Sumatra', NULL, 'Mount Dempo', 296.00, 0, 4.59, 862, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(53, 2, 3, 'Mosque with a green & red pagoda, plus architectural influences from many Asian cultures.', 'XQGJ+J6P, 15 Ulu, Seberang Ulu I, Palembang City, South Sumatra 30267', NULL, 'Cheng Ho Mosque', 8.60, 0, 4.80, 4412, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Cheng Ho Mosque.jpg'),
(54, 1, 3, 'Shady space with food stalls & a jogging track, set beside an artificial lake with a fountain.', 'Jl. Tasik, Talang Semut, Kec. Bukit Kecil, Kota Palembang, Sumatera Selatan 30121', NULL, 'Kambang Iwak Besak Park', 4.70, 0, 4.49, 11604, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(55, 2, 3, 'Fort, historical museum & hangout spot near the river, with palm trees & Ampera Bridge views.', '2Q55+FM4, Jl. Sultan Mahmud Badarudin, 19 Ilir, Kec. Bukit Kecil, Kota Palembang, Sumatera Selatan 30113', NULL, 'Benteng Kuto Besak', 3.90, 5000, 4.48, 9362, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(56, 2, 3, NULL, 'XQX3+CW9, 3-4 Ulu, Seberang Ulu I, Palembang City, South Sumatra 30124', NULL, 'Baba Ong Boen Tjit House', 5.20, 5000, 4.70, 66, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(57, 2, 3, NULL, 'Jl. Moh. Amin, Gandus, Kec. Gandus, Kota Palembang, Sumatera Selatan 30149', NULL, 'Al-Qur\'an Al-Akbar', 12.00, 20000, 4.59, 5122, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(58, 2, 3, 'Verdant, tree-filled Island on the in a smaal delta of Musi River with a 9-story pagoda.', '1 Ilir, Ilir Timur II, Palembang City, South Sumatra', 'It is recommended to go here by boat for the best experience.', 'Kemaro Island', 6.30, 0, 4.17, 841, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(59, 2, 3, 'Large 1700s mosque featuring a Chinese-style tower, carved timbers & a colorful domed ceiling.', 'Jl. Jend. Sudirman, 19 Ilir, Kec. Bukit Kecil, Kota Palembang, Sumatera Selatan 30111', NULL, 'Great Mosque of Palembang', 3.30, 0, 4.80, 15520, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(60, 2, 3, NULL, 'Jl. KH Wahid Hasyim No.1053, 5 Ulu, Kecamatan Seberang Ulu I, Kota Palembang, Sumatera Selatan 30153', NULL, 'Ampera Bridge', 3.70, 0, 4.18, 1127, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(61, 2, 3, NULL, 'Jl. Kb. Kacang 29 No.13 8, RT.8/RW.4, Kb. Kacang, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10240', NULL, 'Zainal Songket', 6.00, 0, 4.57, 296, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(62, 3, 3, NULL, 'Jl. Dr. M. Isa No.1051, RT.028/RW.006, Duku, Kec. Ilir Tim. II, Kota Palembang, Sumatera Selatan 30111', NULL, 'La Vita Bella Casual Dining Palembang', 1.30, 90000, 4.53, 351, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(63, 3, 3, NULL, '3Q44+2JF, Jalan, Pipa Jaya, Kemuning, Palembang City, South Sumatra 30127', NULL, 'Pempek Cik Tasya', 6.00, 35000, 4.38, 716, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(64, 3, 3, NULL, 'Jl. Mesjid Lama No.144, 17 Ilir, Kec. Ilir Tim. I, Kota Palembang, Sumatera Selatan 30122', NULL, 'Mie Terang Bulan', 2.80, 65000, 4.50, 606, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(65, 3, 3, NULL, 'Jl. Dempo Luar No.410A, 15 Ilir, Kec. Ilir Tim. I, Kota Palembang, Sumatera Selatan 30111', NULL, 'Bakmi Aloi', 2.20, 65000, 4.59, 2872, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(66, 3, 3, NULL, 'Jl. Jend. Sudirman No.597A, 18 Ilir, Kec. Ilir Tim. I, Kota Palembang, Sumatera Selatan 30121', NULL, 'Martabak HAR', 4.10, 25000, 4.45, 3234, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Martabak HAR.jpg'),
(67, 3, 3, NULL, 'Jl. KH. Ahmad Dahlan No.2, 26 Ilir, Kec. Bukit Kecil, Kota Palembang, Sumatera Selatan 30136', NULL, 'Mie Celor 26 Ilir H Syafei', 4.50, 35000, 4.16, 371, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(68, 3, 3, NULL, 'Jl. Letda Abdul Rozak No.23, Duku, Kec. Ilir Tim. II, Kota Palembang, Sumatera Selatan 30114', NULL, 'Lo Mie Taksam', 1.40, 65000, 4.60, 1356, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(69, 3, 3, NULL, 'Jl. Mayor Ruslan No.966, 20 Ilir D. I, Kec. Ilir Tim. I, Kota Palembang, Sumatera Selatan 30114', NULL, 'Rumah Makan Sarinande Tempo Doeloe', 2.60, 90000, 4.50, 2180, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(70, 3, 3, NULL, 'Jl. Demang Lebar Daun No.1, Demang Lebar Daun, Kec. Ilir Bar. I, Kota Palembang, Sumatera Selatan 30137', NULL, 'Rumah Makan Sri Melayu', 6.50, 115000, 4.39, 4769, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(71, 3, 3, NULL, '2Q54+QH6, Jl. Merdeka, 22 Ilir, Kec. Bukit Kecil, Kota Palembang, Sumatera Selatan 30113', NULL, 'Pempek Saga Sudi Mampir', 4.10, 35000, 4.28, 2314, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(72, 3, 3, NULL, 'Komplek Benteng Kuto Besar, Jl. Rumah Bari, 19 Ilir, Kec. Bukit Kecil, Kota Palembang, Sumatera Selatan 30113', NULL, 'River Side Restaurant', 4.20, 85000, 4.37, 8614, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(73, 3, 3, NULL, 'Jl. Angkatan 45 No.18, Lorok Pakjo, Kec. Ilir Bar. I, Kota Palembang, Sumatera Selatan 30137', NULL, 'Rumah Makan Pindang Musi Rawas', 5.80, 60000, 4.48, 5746, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(74, 1, 3, NULL, 'South Sumatra', NULL, 'Musi River', 4.00, 0, 4.40, 1195, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(75, 2, 4, 'Stately 17th-century palace of the former Pagaruyung Kingdom amid lush hills & landscape.', 'GJHC+FHJ, Jl. Sutan Alam Bagagarsyah, Pagaruyung, Kec. Tj. Emas, Kabupaten Tanah Datar, Sumatera Barat 27281', 'This place has a different entry fee for international tourist.', 'Pagaruyung Palace', 104.00, 15000, 4.70, 16567, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(76, 1, 4, 'Vast views of volcanoes & a forested valley, plus access to a nearby network of WWII bunkers.', 'Taman Jl. Panorama, Kayu Kubu, Kec. Guguk Panjang, Kota Bukittinggi, Sumatera Barat 26136', NULL, 'Sianok Valley', 89.80, 15000, 4.60, 2392, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(77, 1, 4, '2,891-meter active volcano with a hiking trail offering views from the summit of nearby towns.', 'Pasie Laweh, Sungai Tarab, Tanah Datar Regency, West Sumatra', NULL, 'Mount Marapi', 101.00, 10000, 4.50, 797, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(78, 2, 4, 'Popular city-center attraction with an imposing 1926 clock tower in a charming park setting.', 'Benteng Pasar Atas, Guguk Panjang, Bukittinggi City, West Sumatra 26136', NULL, 'Bukittinggi Clock Tower', 89.80, 10000, 4.69, 55166, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bukittinggi Clock Tower.jpg'),
(79, 1, 4, 'Large, scenic lake in a volcanic caldera, popular for water sports & surrounded by fishing villages.', 'Tanjung Raya, Agam Regency, West Sumatra', NULL, 'Lake Maninjau', 113.00, 0, 4.47, 1676, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lake Maninjau.jpg'),
(80, 2, 4, 'Grand Islamic prayer & study center with a 4-pointed roof modeled on traditional tribal houses.', '39G6+7XG, Jl. Khatib Sulaiman, Alai Parak Kopi, Kec. Padang Utara, Kota Padang, Sumatera Barat 25173', NULL, 'Grand Mosque of West Sumatra', 2.80, 0, 4.80, 20700, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Grand Mosque of West Sumatra.jpg'),
(81, 1, 4, 'Tropical World Heritage Site with volcanoes covering over 5,300 sq. miles & Sumatran tiger habitat.', '4GV5+46M, Lubuk Minturun, Kec. Koto Tangah, Kota Padang, Sumatera Barat 25586', 'This place has a different entry fee for international tourist.', 'Kerinci Seblat National Park', 68.90, 5000, 4.40, 3425, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(82, 1, 4, 'Scenic valley with waterfalls cascading from steep sandstone cliffs surrounded by paddy fields.', 'VMX8+X9M, Tarantang, Harau, Lima Puluh Kota Regency, West Sumatra 26271', NULL, 'Harau Canyon', 134.00, 10000, 4.50, 2187, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(83, 1, 4, 'Cascade rushing over a sheer, tree-clad cliff by the road, with vendors selling snacks & souvenirs.', 'G88Q+H93, Singgalang, Sepuluh Koto, Tanah Datar Regency, West Sumatra 27282', NULL, 'Anai Valley Waterfall', 61.60, 25000, 4.47, 5489, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Anai Valley Waterfall.jpg'),
(84, 2, 4, 'The Japanese built this underground network of tunnels during their occupation in WWII.', 'M9R8+W22, Jl. Panorama, Bukit Cangang Kayu Ramang, Kec. Guguk Panjang, Kota Bukittinggi, Sumatera Barat 26138', NULL, 'Japanese Cave', 89.80, 15000, 4.49, 7462, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(85, 1, 4, 'Busy swimming spot with mountain views, boat trips to nearby islands & legendary stone sculptures.', '2965+293, Air Manis, Padang Selatan, Padang City, West Sumatra', NULL, 'Air Manis Beach', 6.80, 10000, 4.13, 2594, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(86, 1, 4, NULL, 'Jl. Samudera No.66, Olo, Kec. Padang Bar., Kota Padang, Sumatera Barat 25117', NULL, 'Pantai Padang Taplau', 1.70, 0, 3.92, 415, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pantai Padang Taplau.jpg'),
(87, 1, 4, '67-sq.-mi. volcanic lake, surrounded by hills, that is a haven for rare bilih fish.', 'X Koto Singkarak, Solok Regency, West Sumatra', NULL, 'Lake Singkarak', 84.00, 10000, 4.54, 1956, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(88, 2, 4, 'State-run museum exploring regional history & culture in a traditional spire-roofed building.', 'Jl. Diponegoro No.10, Belakang Tangsi, Kec. Padang Bar., Kota Padang, Sumatera Barat 25114', NULL, 'Museum Adityawarman', 1.70, 5000, 4.39, 3403, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Museum Adityawarman.jpg'),
(89, 3, 4, NULL, 'Jl. Khatib Sulaiman No.99, Ulak Karang Sel., Kec. Padang Utara, Kota Padang, Sumatera Barat', NULL, 'RM Lamun Ombak', 4.70, 30000, 4.57, 6390, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Lamun Ombak.jpg'),
(90, 3, 4, NULL, 'Jl. Samudera No.24, Purus, Kec. Padang Bar., Kota Padang, Sumatera Barat 25115', NULL, 'Rumah Makan Fuja', 2.00, 50000, 4.28, 3122, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Fuja.jpg'),
(91, 3, 4, NULL, 'Jl. Ahmad Yani No.142, Benteng Ps. Atas, Kec. Guguk Panjang, Kota Bukittinggi, Sumatera Barat 26136', NULL, 'Turret Cafe', 90.30, 60000, 4.50, 154, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(92, 3, 4, NULL, 'Jl. Sutan Syahrir No.250, Silaing Bawah, Kec. Padang Panjang Bar., Kota Padang Panjang, Sumatera Barat 27118', NULL, 'Sate Padang Mak Syukur', 68.80, 40000, 4.39, 6234, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(93, 3, 4, 'Fashionable throwback for a variety of durian ice flavors, satay & classic local food.', 'Jl. Hos. Cokroaminoto No.31B, Kp. Pd., Kec. Padang Bar., Kota Padang, Sumatera Barat', NULL, 'Es Durian Ganti Nan Lamo', 1.50, 90000, 4.38, 3553, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Es Durian Ganti Nan Lamo.jpg'),
(94, 3, 4, NULL, 'Jl. Ahmad Yani No.105, Benteng Ps. Atas, Kec. Guguk Panjang, Kota Bukittinggi, Sumatera Barat 26136', NULL, 'Bedudal Cafe', 90.10, 110000, 4.50, 395, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(95, 3, 4, NULL, 'Jl. Sudirman No.8, Tarok Dipo, Kec. Guguk Panjang, Kota Bukittinggi, Sumatera Barat 26138', NULL, 'Simpang Raya', 88.60, 60000, 4.48, 3158, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(96, 3, 4, 'Compact marketplace food stand offering traditional Padang dishes such as steamed rice & seafood.', 'Jl. Pemuda Los Lambuang Wisata, Benteng Pasar Atas, Guguk Panjang, Bukittinggi City, West Sumatra 26136', NULL, 'Nasi Kapau Uni Lis', 89.80, 30000, 4.19, 1585, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(97, 1, 4, NULL, 'R9P3+QXW, Pinang River, Koto XI Tarusan, South Pesisir Regency, West Sumatra', NULL, 'Pamutusan', 39.50, 15000, 4.60, 677, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(98, 1, 4, NULL, 'Kampung Batu Dalam, Danau Kembar, Solok Regency, West Sumatra 27371', NULL, 'Bukit Cambai', 62.00, 10000, 4.30, 108, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(99, 2, 5, 'Star-shaped former British fort once used by the French, Dutch, Japanese & Indonesian militaries.', 'Jl. Benteng, Kebun Keling, Kec. Tlk. Segara, Kota Bengkulu, Bengkulu 38116', NULL, 'Fort Marlborough', 1.40, 5000, 4.59, 9882, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Fort Marlborough.png'),
(100, 1, 5, NULL, 'Enggano, North Bengkulu Regency, Bengkulu', 'Taking a ferry or small airplane is required to reach this place.', 'Enggano Island', 200.00, 0, 4.41, 244, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Enggano Island.jpg'),
(101, 1, 5, 'Low-key destination for activities like swimming, sunbathing & surfing, plus sunset views.', '57P8+VX7, Jl. Jalur BIM, Penurunan, Kec. Ratu Samban, Kota Bengkulu, Bengkulu', NULL, 'Panjang Beach', 4.30, 0, 4.30, 479, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Panjang Beach.jpg'),
(102, 1, 5, NULL, 'Jalan Lintas Barat, Linau, Maje, Kabupaten Kaur, Bengkulu 38963', NULL, 'Linau Bintuhan Beach', 224.00, 0, 4.50, 675, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Linau Bintuhan Beach.jpg'),
(103, 1, 5, NULL, 'Merpas, Nasal, Kaur Regency, Bengkulu', NULL, 'Laguna Beach', 245.00, 15000, 4.52, 212, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(104, 2, 5, 'Exhibits at the former home of President Sukarno, celebrated leader in the fight for independence.', 'Jl. Soekarno Hatta No.8, Anggut Atas, Kec. Gading Cemp., Kota Bengkulu, Bengkulu 38222', NULL, 'Rumah Pengasingan Bung Karno', 1.10, 3000, 4.68, 4655, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Pengasingan Bung Karno.png'),
(105, 1, 5, NULL, 'Jalan Pesisir Pantai Panjang, Pondok Kelapa, Ps. Pedati, Kec. Pd. Klp., Kabupaten Bengkulu Tengah, Bengkulu 38121', NULL, 'Pantai Sungai Suci', 10.50, 5000, 4.46, 368, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(106, 2, 5, NULL, 'Jl. Fatmawati No.10, Penurunan, Kec. Ratu Samban, Kota Bengkulu, Bengkulu 38222', NULL, 'Rumah Ibu Fatmawati Soekarno', 1.00, 3000, 4.58, 1208, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Ibu Fatmawati Soekarno.jpg'),
(107, 1, 5, NULL, 'Bengkulu City, Bengkulu', NULL, 'Dendam Tak Sudah Lake', 6.80, 3000, 4.14, 336, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(108, 2, 5, NULL, '6743+V7R, Jl. Rejamat, Ps. Jitra, Kec. Tlk. Segara, Kota Bengkulu, Bengkulu 38113', NULL, 'The British Cemetery', 0.90, 5000, 3.99, 60, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(109, 1, 5, NULL, 'Cawang Baru, Curup Timur, Rejang Lebong Regency, Bengkulu 39119', NULL, 'Suban Hot Springs', 88.40, 10000, 4.29, 2063, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(110, 3, 5, NULL, 'Pantai Berkas, Jl. Pariwisata, Ps. Berkas, Kec. Tlk. Segara, Kota Bengkulu, Bengkulu', NULL, 'Sembam Ikan Marola', 1.80, 65000, 4.29, 2232, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sembam Ikan Marola.jpg'),
(111, 3, 5, NULL, 'Jl. Sedap Malam No.26a, Nusa Indah, Kec. Ratu Agung, Kota Bengkulu, Bengkulu', NULL, 'Pindang 77', 2.90, 90000, 4.30, 1017, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pindang 77.jpg'),
(112, 3, 5, NULL, '57MC+QPF, Nusa Indah, Ratu Agung, Bengkulu City, Bengkulu', NULL, 'Kampoeng Pesisir', 4.10, 110000, 4.48, 342, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(113, 3, 5, NULL, 'Jl. H. Adam Malik, Cemp. Permai, Kec. Gading Cemp., Kota Bengkulu, Bengkulu 38211', NULL, 'Sumpit Mas Restaurant', 7.80, 40000, 4.51, 875, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(114, 3, 5, NULL, '6723+F9G Pantai Berkas, Jl. Pariwisata, Pasar Berkas, Teluk Segara, Bengkulu City, Bengkulu', NULL, 'Rumah Makan Kerapu', 1.90, 45000, 4.12, 182, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Kerapu.jpg'),
(115, 1, 6, NULL, 'R39H+R79 80km dari, Tj. Belit, Kec. Kampar Kiri Hulu, Kabupaten Kampar, Riau 28471', NULL, 'Batu Dinding Waterfalls', 103.00, 10000, 4.57, 129, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(116, 1, 6, NULL, '98MC+2X, Lubuk Ambacang, Hulu Kuantan, Kuantan Singingi Regency, Riau', NULL, '7 Layers Waterfalls', 174.00, 5000, 4.29, 66, '2025-05-01 17:00:00', '2025-05-01 17:00:00', '7 Layers Waterfalls.jpg'),
(117, 1, 6, NULL, 'Danau Raja, Kp. Dagang, Kec. Rengat, Kabupaten Indragiri Hulu, Riau 29319', NULL, 'Danau Raja', 195.00, 15000, 4.29, 1739, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Danau Raja.jpg'),
(118, 1, 6, NULL, 'Bangun Purba Timur Jaya, Bangun Purba, Rokan Hulu Regency, Riau 28558', NULL, 'Aek Matua Waterfall', 172.00, 10000, 4.24, 260, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(119, 1, 6, 'Protected area of lowland rainforest sheltering rare Sumatran elephants, tigers & orangutans.', '3FG9+X98, Rantau Langsat, Batang Gangsal, Indragiri Hulu Regency, Riau 29355', 'Has a different price for international tourist', 'Bukit Tigapuluh National Park', 246.00, 5000, 4.10, 4039, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bukit Tigapuluh National Park.jpg'),
(120, 2, 6, 'Built in 1968, this large mosque features 10 domes, 4 minarets & room for 4,500 worshipers.', 'Jl. Hangtuah, Sumahilang, Kec. Pekanbaru Kota, Kota Pekanbaru, Riau 28156', NULL, 'An-Nur Grand Mosque', 2.50, 0, 4.79, 8745, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'An-Nur Grand Mosque.jpg'),
(121, 2, 6, NULL, 'Jl. Jend. Sudirman No.462, Jadirejo, Kec. Sukajadi, Kota Pekanbaru, Riau 28126', NULL, 'HS Soeman Library', 1.50, 0, 4.50, 746, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'HS Soeman Library.jpg'),
(122, 2, 6, 'Moorish-style, 19th-century palace with antiques like a rare musical instrument & a sultan\'s throne.', 'sri indrapura, Kp. Dalam, Kec. Siak, Kabupaten Siak, Riau 28773', NULL, 'Siak Palace', 106.00, 10000, 4.60, 8764, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(123, 2, 6, NULL, 'Jl. Imam Munandar, Tengkerang Tim., Kec. Tenayan Raya, Kota Pekanbaru, Riau', NULL, 'Alam Mayang', 7.60, 20000, 4.41, 469, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(124, 2, 6, NULL, '8JPR+CQ9, Muara Takus, XIII Koto Kampar, Kampar Regency, Riau 28453', NULL, 'Muara Takus', 108.00, 15000, 4.38, 1164, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(125, 2, 6, NULL, 'Jl. Jend. Sudirman No.482, Jadirejo, Kec. Sukajadi, Kota Pekanbaru, Riau 28121', NULL, 'Ar-Rahman Grand Mosque', 0.60, 0, 4.78, 1372, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ar-Rahman Grand Mosque.jpg'),
(126, 3, 6, NULL, 'Jl. Riau No.41a, Padang Terubuk, Kec. Senapelan, Kota Pekanbaru, Riau 28155', NULL, 'Sop Ikan Kian Wee', 4.20, 40000, 4.48, 1265, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(127, 3, 6, NULL, 'Jl. Sekuntum Raya, Delima, Kec. Tampan, Kota Pekanbaru, Riau 28292', NULL, 'RM Raso Situjuah', 6.60, 65000, 4.50, 1723, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(128, 3, 6, NULL, 'Jl. HOS. Cokroaminoto No.16, Sukaramai, Kec. Pekanbaru Kota, Kota Pekanbaru, Riau 28155', NULL, 'Rumah Makan Kota Buana', 2.80, 40000, 4.49, 1894, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Kota Buana.jpg'),
(129, 3, 6, NULL, 'Jl. Jend. Sudirman No.202, Tengkerang Tengah, Kec. Marpoyan Damai, Kota Pekanbaru, Riau 28126', NULL, 'RM Pondok Gurih', 3.80, 75000, 4.28, 1472, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Pondok Gurih.jpg'),
(130, 3, 6, NULL, 'Jl. Kaharuddin Nst No.1, Simpang Tiga, Kec. Marpoyan Damai, Kota Pekanbaru, Riau 28284', NULL, 'Pondok Patin H.M. Yunus', 6.30, 125000, 4.38, 3219, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(131, 3, 6, NULL, 'Jl. Jend. Sudirman No.321, Bintan, Kec. Dumai Kota, Kota Dumai, Riau 28826', NULL, 'Rumah Makan Pak Datuk', 158.00, 75000, 4.10, 2213, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(132, 3, 6, NULL, 'Jalan Senapelan No 22 A-B-C, Kampung Bandar, Senapelan, Pekanbaru City, Riau 28153', NULL, 'Kedai Kopi KimTeng', 4.20, 30000, 4.37, 3294, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kedai Kopi KimTeng.jpg'),
(133, 3, 7, 'Nasi goreng restaurant', 'Sebong Lagoi, Teluk Sebong, Sebong Lagoi, Teluk Sebong, Bintan Regency, Riau Islands', NULL, 'Warung Yeah!', 53.40, 125000, 4.50, 848, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(134, 3, 7, 'Seafood restaurant', 'Komplek Ruko Mahkota Raya, Jl. Raja H. Fisabilillah, RW.2, Teluk Tering, Batam Kota, Batam City, Riau Islands 29461', 'The distance to this place will be much closer if you are from Batam City', 'Sei Enam Seafood Batam', 94.60, 40000, 4.21, 1061, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sei Enam Seafood Batam.jpg'),
(135, 3, 7, 'Seafood restaurant', 'Pantai, Jl. H. Moh. Saleh, RT.002/RW.001, Batu Besar, Nongsa, Batam City, Riau Islands 29465', 'The distance to this place will be much closer if you are from Batam City', 'Rezeki Seafood Restaurant', 88.00, 175000, 4.35, 2782, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(136, 3, 7, 'Upscale restaurant on stilts offering a classic menu of Indonesian seafood dishes & ocean views.', 'Nirwana Gardens Resorts, Jalan Panglima Pantar, Sebong Lagoi, Kec. Tlk. Sebong, Kabupaten Bintan, Kepulauan Riau 29152', NULL, 'The Kelong Seafood Restaurant', 56.30, 500000, 4.10, 1211, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(137, 3, 7, 'Seafood restaurant', 'Jalan Trans Barelang City, Tembesi, Kec. Sagulung, Kota Batam, Kepulauan Riau 29472', 'The distance to this place will be much closer if you are from Batam City', 'Barelang Seafood Restaurant', 105.00, 125000, 4.37, 2249, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(138, 3, 7, 'Noodle shop', 'Ruko Royal Sincom, Blk. D No.15 - 16, Tlk. Tering, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29431', 'The distance to this place will be much closer if you are from Batam City', 'RM Mie Tarempa', 88.60, 40000, 4.49, 8835, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Mie Tarempa.jpg'),
(139, 3, 7, 'Seafood restaurant', 'Jl. Komp. Business Centre, Lubuk Baja Kota, Kec. Lubuk Baja, Kota Batam, Kepulauan Riau 29444', 'The distance to this place will be much closer if you are from Batam City', 'RM Yong Kee', 96.20, 75000, 4.37, 3085, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Yong Kee.jpg'),
(140, 3, 7, 'Bar', 'Batam Marriott Hotel Harbour Bay (Level R, Jodoh River, Batu Ampar, Batam City, Riau Islands 29453', 'The distance to this place will be much closer if you are from Batam City', 'Altitude Rooftop Bar & Lounge', 98.00, 155000, 4.74, 296, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(141, 3, 7, 'Restaurant', 'Batam Marriott Hotel Harbour Bay, Harbour Bay Downtown, Jl. Duyung Level 2, Sungai Jodoh, Kota Batam, Kepulauan Riau 29453', 'The distance to this place will be much closer if you are from Batam City', 'Goji Kitchen & Bar', 98.00, 250000, 4.93, 350, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(142, 3, 7, 'Indonesian restaurant', 'Limindo trade center 2 blok A No.13-14 Batam Center, Jl. Bakal, Batam City, Riau Islands 29444', 'The distance to this place will be much closer if you are from Batam City', 'Bhinneka Indonesian Resto & Cafe', 90.30, 75000, 4.84, 1132, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(143, 2, 7, 'Prominent collection of 6 bridges connecting the Batam, Rempang, & Galang islands.', 'Q5MG+69M, Jl. Trans Barelang, Sembulang, Galang, Kota Batam, Kepulauan Riau 29481', NULL, 'Barelang Bridge', 137.00, 0, 4.21, 1157, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(144, 2, 7, 'Large Buddhist temple with many statues, plus an eatery serving vegetarian fare.', '42HM+QVG, Komplek Maha Vihara Duta Maitreya Bukit Beruntung, Sungai Panas, Kec. Batam Kota, Kota Batam, Kepulauan Riau 29432', 'The distance to this place will be much closer if you are from Batam City', 'Maha Vihara Duta Maitreya Temple', 94.10, 0, 4.59, 1968, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Maha Vihara Duta Maitreya Temple.jpg'),
(145, 1, 7, 'Compact island featuring the tomb of a revered historian, a palace & a mosque made of egg whites.', 'Penyengat, Tanjung Pinang Kota, Tanjung Pinang City, Riau Islands', 'There is Rp8000 boat fee from Tanjung Pinang to reach this place', 'Penyengat Island', 7.00, 0, 4.34, 367, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Penyengat Island.jpg'),
(146, 2, 7, 'Striking Buddhist temple with tranquil grounds, featuring a series of lifelike stone arhat statues.', 'WG3Q+WX4, Batu 13, Kec. Tanjungpinang Tim., Kota Tanjung Pinang, Kepulauan Riau 29125', NULL, '500 Lohan Temple', 10.30, 30000, 4.50, 264, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(147, 1, 7, 'Home to 238 scenic islands, this laid-back archipelago hosts diving, snorkeling & boating.', 'Jemaja, Kepulauan Anambas Regency, Riau Islands', 'Taking a fast boat from batam or airplane from Tanjung Pinang is required to reach this place. Price does not include the fast boat / airplane ticket', 'Anambas Islands', 500.00, 0, 4.42, 314, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Anambas Islands.jpg'),
(148, 2, 7, 'Buddhist temple', 'Pinang, Tj. Unggat, Kec. Bukit Bestari, Kota Tanjung Pinang, Kepulauan Riau 29125', NULL, 'Vihara Avalokitesvara Graha', 7.80, 0, 4.37, 394, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Vihara Avalokitesvara Graha.jpg'),
(149, 1, 7, 'Island', 'Galang, Batam City, Riau Islands', 'Recommended to use a tour for best experience. Taking a boat is required to reach this place.', 'Abang Island', 55.00, 0, 4.50, 41, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Abang Island.jpg'),
(150, 1, 7, 'Former mining site made up of sandy hills with a bright-blue lake & stalls selling fruit.', 'Jl. Raya Busung, Busung, Kec. Seri Kuala Lobam, Kabupaten Bintan, Kepulauan Riau 29152', NULL, 'Bintan Desert', 44.20, 30000, 4.29, 1397, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(151, 1, 7, 'Long stretch of white sandy beach with picturesque boulders & a few small shade huts.', 'trikora, Kawal, Kec. Gn. Kijang, Kabupaten Bintan, Kepulauan Riau 29151', NULL, 'Trikora Beach', 48.40, 5000, 4.34, 390, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(152, 2, 7, 'Seaside Buddhist complex from the 19th-century, with statues of gods & animals, a pagoda & koi pond.', 'Jalan Pasir Panjang, 32000 Sitiawan, Perak, Malaysia', 'The distance to this place will be much closer if you are from Batam City', 'Budhi Bhakti Temple', 95.60, 0, 4.66, 1967, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Budhi Bhakti Temple.jpg'),
(153, 2, 7, 'Contemporary mosque in the Lubuk Baja Business Center, with a cafe, library, garden & more.', 'Jl. Imam Bonjol, Lubuk Baja Kota, Kec. Lubuk Baja, Kota Batam, Kepulauan Riau 29444', 'The distance to this place will be much closer if you are from Batam City', 'Jabal Arafah Mosque', 95.80, 5000, 4.80, 6104, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(154, 2, 7, 'Pilgrimage place', '4HQM+MWC, Unnamed Road, Malang Rapat, Gunung Kijang, Bintan Regency, Riau Islands 29151', NULL, 'Grotto Santa Maria (Santa Maria Cave)', 46.60, 0, 4.26, 39, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(155, 1, 7, 'Picturesque natural wonder of prehistoric stones in the sea along a white sandy beach.', 'X9PF+MXR, Sepempang, East Bunguran, Natuna Regency, Riau Islands 29783', 'This place is on Natuna island. You can go here by using airplane from Batam or ferry from Tanjung Pinang.', 'Alif Stone Park', 1000.00, 10000, 4.60, 810, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(156, 2, 7, 'Buddhist temple', '42Q6+X8R, Jl. Pembangunan, Lubuk Baja Kota, Kec. Lubuk Baja, Kota Batam, Kepulauan Riau 29432', 'The distance to this place will be much closer if you are from Batam City', 'Budhi Bhakti Temple', 95.60, 0, 4.69, 1882, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Budhi Bhakti Temple.jpg'),
(157, 1, 8, 'Tourist attraction', '67FH+X72, JL. Padang-Kerinci No.37162, Kersik Tuo, Kayu Aro, Kerinci Regency, Jambi 37162', NULL, 'Kayu Aro Tea Plantation', 437.00, 8000, 4.41, 184, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(158, 1, 8, 'River', 'CHF8+598, Teluk Kenali, Telanaipura, Jambi City, Jambi 36361', NULL, 'Batanghari River', 9.10, 0, 4.16, 625, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Batanghari River.jpg'),
(159, 1, 8, '3,805m-high volcano, the tallest in Indonesia, with multi-day climbing trips to the active crater.', 'South Lubuk Gadang, Sangir, South Solok Regency, West Sumatra', 'Price may vary based on day or your status.', 'Mount Kerinci', 422.00, 25000, 4.41, 896, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mount Kerinci.jpg'),
(160, 2, 8, 'Excavations of ornate, centuries-old temples in a riverside complex popular for walking & cycling', 'GMC8+RRP, Muaro Jambi, Maro Sebo, Muaro Jambi Regency, Jambi 36382', NULL, 'Muaro Jambi Temple Complex', 22.50, 9000, 4.47, 2100, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(161, 2, 8, 'Curved pedestrian bridge known for sunset water views & street food stalls by the riverside.', 'CJ78+873, Kasang, East Jambi, Jambi City, Jambi 36123', NULL, 'Gentala Arasy Pedestrian Bridge', 15.40, 3000, 4.49, 7106, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gentala Arasy Pedestrian Bridge.jpg'),
(162, 2, 8, 'Mosque', 'RT.01/RW.No.60, Jl. Sultan Thaha, Legok, Telanaipura, Jambi City, Jambi 36124', NULL, 'Agung Al Falah Mosque', 2.40, 0, 4.78, 3262, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Agung Al Falah Mosque.jpg'),
(163, 1, 8, 'Lake in a volcanic crater at an altitude of 2005 m., a popular hiking & camping destination.', '7CV6+V6F, Pesisir, Bukit, Gunung Tujuh, Kerinci Regency, Jambi 37163', 'Price does not include parking fee', 'Gunung Tujuh Lake', 413.00, 7500, 4.50, 81, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(164, 2, 8, 'A small museum on Islam & bridge views from an ornate, mosque-style tower mounted with a clock.', 'CJ87+2M5, Arab Melayu, Pelayangan, Jambi City, Jambi 36123', NULL, 'Gentala Arasy Tower', 15.20, 3000, 4.49, 2619, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gentala Arasy Tower.jpg'),
(165, 1, 8, 'A long hiking trail in jungle surrounds leads to this small lake known for its bright blue color.', 'Dusun Baru Lempur, Gunung Raya, Kerinci Regency, Jambi', 'Has a different price for international tourist', 'Lake Kaco', 387.00, 15000, 4.59, 193, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lake Kaco.jpg'),
(166, 2, 8, 'Buddhist temple', 'GMF5+JM4, Desa Muaro Jambi, Kecamatan Maro Sebo, Kabupaten Muaro, Muaro Jambi, Kec. Maro Sebo, Kota Jambi, Jambi 36382', NULL, 'Gedong Temple', 21.10, 9000, 4.59, 46, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(167, 3, 8, 'Pempek restaurant', 'Jl. Soekarno-Hatta No.8, The Hok, Kec. Jambi Sel., Kota Jambi, Jambi 36126', NULL, 'Pempek Selamat', 4.60, 40000, 4.47, 2182, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pempek Selamat.jpg'),
(168, 3, 8, 'Restaurant', 'Jl. Jend. Basuki Rahmat No.70, Paal Lima, Kec. Kota Baru, Kota Jambi, Jambi 36764', NULL, 'RM. Aroma Cempaka', 3.80, 60000, 4.49, 4054, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM. Aroma Cempaka.jpg'),
(169, 3, 8, 'Restaurant', 'CJ3G+728, Jl. Orang Kayo Hitam, Budiman, Kec. Jambi Tim., Kota Jambi, Jambi 36123', NULL, 'Kwetiau Achun', 2.40, 40000, 4.57, 46, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(170, 3, 8, 'Seafood restaurant', 'Jl. Sultan Agung No.4, Beringin, Kec. Ps. Jambi, Kota Jambi, Jambi 36124', NULL, 'Pondok Pindang Sarinande Jambi', 2.80, 60000, 4.40, 994, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pondok Pindang Sarinande Jambi.jpg'),
(171, 3, 8, 'Indonesian restaurant', 'Jl. H. Adam Malik No.191, Handil Jaya, Kec. Jelutung, Kota Jambi, Jambi 36125', NULL, 'Gudhas Village', 3.40, 75000, 4.52, 257, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(172, 3, 9, 'Restaurant', 'Jl. Wolter Monginsidi No.175, Gulak Galik, Kec. Tlk. Betung Utara, Kota Bandar Lampung, Lampung 35401', NULL, 'Pandan Wangi Restaurant', 6.20, 75000, 4.44, 130, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(173, 3, 9, 'Bakso restaurant', 'Jl. Wolter Monginsidi No.42 A, Durian Payung, Kec. Tj. Karang Pusat, Kota Bandar Lampung, Lampung 35214', NULL, 'Bakso Sonhaji Sony', 4.60, 30000, 4.29, 10971, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bakso Sonhaji Sony.jpg'),
(174, 3, 9, 'Pempek restaurant', 'Jl. Jend. Sudirman No.35 - 37, Rw. Laut, Engal, Kota Bandar Lampung, Lampung 35213', NULL, 'Pempek 123', 4.30, 35000, 4.47, 3508, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pempek 123.jpg'),
(175, 3, 9, 'Unpretentious restaurant offering seafood specialties, a convivial atmosphere & outdoor seating.', 'Jl. Ganjaran, Negeri Sakti, Kec. Gedong Tataan, Kota Bandar Lampung, Lampung', NULL, 'Jumbo Kakap', 11.10, 65000, 4.49, 5735, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Jumbo Kakap.jpg'),
(176, 3, 9, 'Restaurant', 'Jl. Arif Rahman Hakim No.45, Jagabaya III, Kec. Way Halim, Kota Bandar Lampung, Lampung 35122', NULL, 'Taman Santap Rumah Kayu', 3.20, 60000, 4.46, 1430, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(177, 3, 9, 'Padang restaurant', 'Jl. Diponegoro No.1, Kupang Kota, Kec. Tlk. Betung Utara, Kota Bandar Lampung, Lampung 35225', NULL, 'Begadang Resto Convention Hall', 6.20, 75000, 4.57, 738, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(178, 1, 9, 'Laid-back beach with white sands & clear waters with reefs for snorkeling & scuba diving.', 'Lampung', NULL, 'Mutun Beach', 18.20, 25000, 4.18, 5390, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mutun Beach.jpg'),
(179, 1, 9, 'Island', '86PF+RX8, Jl. Kelagian Lunik, Pulau Pahawang, Kec. Punduh Pidada, Kabupaten Pesawaran, Lampung 35453', 'Required to take a 2-3 hours boat from Gilimanuk port to reach the island', 'Pahawang Island', 70.00, 0, 4.72, 1246, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pahawang Island.jpg'),
(180, 1, 9, 'Tourist attraction', '64G2+9H, Kiluan Negeri, Tanggamus Regency, Lampung 35379', NULL, 'Teluk Kiluan', 78.80, 5000, 4.51, 112, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(181, 1, 9, 'Petite island destination with white-sand beaches & opportunities for water sports.', 'Gebang, Padang Cermin, Pesawaran Regency, Lampung', 'Required to take a boat from Ketapang to reach the island.', 'Kelagian Island', 57.00, 10000, 4.33, 268, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(182, 1, 9, 'Swimming, water sports & beachside dining, plus boat trips to a floating mosque & offshore sandbar.', 'Jl. Way Ratai No.KM. 14, Sidodadi, Teluk Pandan, Kabupaten Pesawaran, Lampung 35451', 'Price is not including parking fee', 'Sari Ringgung Beach', 23.50, 25000, 4.20, 7841, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sari Ringgung Beach.jpg'),
(183, 1, 9, 'Tourist attraction', 'RW7J+HFQ, Pasar Krui, Pesisir Tengah, West Pesisir Regency, Lampung 34874', NULL, 'Krui Beach', 243.00, 0, 4.58, 263, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(184, 1, 9, 'National parkCaldera in the Sunda Strait between Java & Sumatra which violently erupted in 1883.', 'Hutan, East Lampung Regency, Lampung', 'Has a different price for international tourist, for more information : https://waykambas.org/tarif-masuk-tnwk/', 'Way Kambas National Park', 82.20, 5000, 4.30, 5169, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(185, 2, 9, 'A brightly painted minaret dominates this striking Islamic prayer center, with food hawkers nearby.', 'Jl. Diponegoro, Gulak Galik, Kec. Tlk. Betung Utara, Kota Bandar Lampung, Lampung 35212', NULL, 'Al Furqon Grand Mosque', 4.60, 0, 4.80, 4935, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Al Furqon Grand Mosque.jpg'),
(186, 2, 9, 'Exhibits on provincial history including a replica traditional stilt house & a colonial-era cannon.', 'Jl. ZA. Pagar Alam No.64, Gedong Meneng, Kec. Rajabasa, Kota Bandar Lampung, Lampung 35141', NULL, 'Lampung Museum', 5.40, 5000, 4.50, 2666, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lampung Museum.png'),
(187, 2, 9, 'Open air museum', 'Jl. Ki Hajar Dewantara, Banjar Rejo, Kec. Batanghari, Kabupaten Lampung Timur, Lampung 34381', NULL, 'Griya Kebun 38', 52.00, 10000, 4.20, 611, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(188, 2, 9, 'Museum', 'Jl. DR. Setia Budi No.74, Negeri Olok Gading, Kec. Tlk. Betung Bar., Kota Bandar Lampung, Lampung 35223', NULL, 'Lampoeng Traditional Lamban Dalom', 7.80, 0, 4.80, 128, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lampoeng Traditional Lamban Dalom.png'),
(189, 2, 9, 'Celebrating local heritage, a yellow-&-red, crown-shaped tower on a hill, with ocean & harbor views.', 'Jl. Lintas Sumatra, Bakauheni, Kec. Bakauheni, Kabupaten Lampung Selatan, Lampung 35592', NULL, 'Menara Siger', 91.10, 20000, 4.30, 4864, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(190, 1, 9, 'Tourist attraction', 'Jl. Bukit Aslan No.2, Way Gubak, Sukabumi, Bandar Lampung City, Lampung 35244', NULL, 'Bukit AsLan', 11.60, 25000, 4.50, 916, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(191, 1, 10, 'Tourist attraction', 'FM22+C8Q, Keciput, Sijuk, Belitung Regency, Bangka Belitung Islands 33414', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Kepayang Island', 243.00, 0, 4.60, 841, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(192, 1, 10, 'Sandy strip with calm waves popular with families, plus hawker stalls & live music.', 'Jl. Raya Pasir Padi, Air Itam, Kec. Bukitintan, Kota Pangkal Pinang, Kepulauan Bangka Belitung', NULL, 'Pasir Padi Beach', 9.10, 0, 4.23, 2059, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pasir Padi Beach.jpg'),
(193, 1, 10, 'White sandy beach tucked in a cove with clear waters for snorkelling & granite rock formations.', 'Pulau, Kabupaten Belitung, Kepulauan Bangka Belitung 33414', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Tanjung Tinggi Beach', 242.00, 0, 4.67, 5430, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tanjung Tinggi Beach.jpg'),
(194, 1, 10, 'Tourist attraction', 'FJ7C+55G, Tanjung Binga, Sijuk, Belitung Regency, Bangka Belitung Islands 33414', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Lengkuas Island', 244.00, 0, 4.70, 1955, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL);
INSERT INTO `tour_objects` (`id`, `tour_type_id`, `province_id`, `description`, `location`, `note`, `name`, `distance`, `price`, `rating`, `review`, `created_at`, `updated_at`, `image`) VALUES
(195, 1, 10, 'Scenic beach with white sand & boat rentals for water activities & trips to offshore islands.', 'CMQF+H49, Sijuk, Belitung Regency, Bangka Belitung Islands 33414', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Tanjung Kelayang Beach', 242.00, 0, 4.59, 4638, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tanjung Kelayang Beach.jpg'),
(196, 1, 10, 'White sandy beach with large granite stones offering fishing, boating & diving to see coral reefs.', 'Sinar Baru, Sungai Liat, Bangka Regency, Bangka Belitung Islands', NULL, 'Parai Tenggiri Beach', 43.00, 25000, 4.46, 2249, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(197, 1, 10, 'Tourist attraction', 'Jl. Raya Toboali, Nibung, Kec. Koba, Kabupaten Bangka Tengah, Kepulauan Bangka Belitung 33782', NULL, 'Kaolin Lake', 67.90, 10000, 4.54, 4173, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(198, 2, 10, 'Exhibits & artifacts on local culture & history in a replica of a classic Belitung home.', '7M53+687, Jl. Gajah Mada, Lesung Batang, Kec. Tj. Pandan, Kabupaten Belitung, Kepulauan Bangka Belitung 33411', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Rumah Adat Belitung', 215.00, 0, 4.45, 2128, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Adat Belitung.jpg'),
(199, 2, 10, 'Industrial models, antique equipment & hands-on geological exhibits trace local tin-mining history.', 'Batin Tikal, Taman Sari, Pangkal Pinang City, Bangka Belitung Islands 33684', NULL, 'Tin Museum', 2.30, 5000, 4.57, 1300, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tin Museum.jpg'),
(200, 2, 10, 'Museum', '25M7+5JX, Lenggang, Gantung, East Belitung Regency, Bangka Belitung Islands', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Museum Kata Andrea Hirata', 283.00, 50000, 4.29, 668, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(201, 2, 10, 'Desa Wisata replikasi rumah laskar pelangi desa lenggang', 'Jl. Laskar Pelangi, Lenggang, Kec. Gantung, Kabupaten Belitung Timur, Kepulauan Bangka Belitung 33562', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Sekolah Dasar Muhammadiyah - Laskar Pelangi', 282.00, 3000, 4.44, 4883, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(202, 2, 10, 'Buddhist temple', '452M+4MF Pantai Tikus, Parit Padang, Sungai Liat, Bangka Regency, Bangka Belitung Islands 33211', NULL, 'Padepokan Puri Tri Agung', 32.50, 0, 4.60, 1663, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Padepokan Puri Tri Agung.jpg'),
(203, 3, 10, 'Noodle shop', 'Jl. Sriwijaya No.27, Parit, Kec. Tj. Pandan, Kabupaten Belitung, Kepulauan Bangka Belitung 33416', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Mie Belitung Atep', 217.00, 25000, 4.33, 1488, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(204, 3, 10, 'Coffee shop', 'Jl. Depati Hamzah No.150, Bacang, Kec. Bukitintan, Kota Pangkal Pinang, Kepulauan Bangka Belitung 33684', NULL, 'Warung Kopi Kong Djie', 2.90, 30000, 4.39, 1217, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(205, 3, 10, 'Restaurant', 'Jl. Lettu Mad Daud No.22, Parit, Kec. Tj. Pandan, Kabupaten Belitung, Kepulauan Bangka Belitung 33411', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Rumah Makan Belitong Timpo Duluk', 218.00, 90000, 4.34, 2716, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(206, 3, 10, 'Noodle shop', 'Jl. K.H. Hassan Basri No.83, RT.02/RW.01, Batin Tikal, Kec. Taman Sari, Kota Pangkal Pinang, Kepulauan Bangka Belitung 33684', NULL, 'Mie Koba Iskandar', 2.00, 15000, 4.38, 2885, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mie Koba Iskandar.jpg'),
(207, 3, 10, 'Restaurant', 'Jl. Toniwen No.89, Masjid Jamik, Kec. Rangkui, Kota Pangkal Pinang, Kepulauan Bangka Belitung 33684', NULL, 'Otak Otak Ase', 1.20, 35000, 4.39, 3723, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Otak Otak Ase.jpg'),
(208, 3, 10, 'Restaurant', 'Jl. Jend. Sudirman, Baru, Kec. Manggar, Kabupaten Belitung Timur, Kepulauan Bangka Belitung', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Fega Seafood Restaurant', 294.00, 65000, 4.37, 1763, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(209, 3, 10, 'Seafood restaurant', 'Jl. Yang Zubaidah No.242, Bintang, Kec. Rangkui, Kota Pangkal Pinang, Kepulauan Bangka Belitung 33137', NULL, 'RM Asui', 1.10, 110000, 4.24, 1736, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Asui.jpg'),
(210, 3, 10, 'Coffee shop', '47XP+MP2, Jl. Sudirman, Lipat Kajang,, Baru, Kec. Manggar, Kabupaten Belitung Timur, Kepulauan Bangka Belitung 33512', 'This place is on Belitung Regency which can be reached by ferry or airplane.', 'Warung Kopi Atet', 294.00, 10000, 4.38, 385, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(211, 3, 11, 'Ice cream shop', 'Jl. Karel Satsuit Tubun No.8, Akcaya, Kec. Pontianak Sel., Kota Pontianak, Kalimantan Barat 78121', NULL, 'Ice Cream Angi', 2.60, 50000, 4.56, 4388, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(212, 3, 11, 'Chinese restaurant', 'Jl. Pahlawan No.238/9, Benua Melayu Darat, Kec. Pontianak Sel., Kota Pontianak, Kalimantan Barat 78115', NULL, 'Nasi Akwang', 1.80, 70000, 4.49, 1019, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(213, 3, 11, 'Straightforward restaurant with outdoor seating & a down-home vibe offering seafood dishes.', 'Jl. Hijas, Benua Melayu Darat, Kec. Pontianak Sel., Kota Pontianak, Kalimantan Barat 78122', NULL, 'Abang Kepiting Restaurant', 2.30, 175000, 4.38, 3064, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(214, 3, 11, 'Seafood restaurant', 'Jl. Ismail Marzuki No.33A, Benua Melayu Darat, Kec. Pontianak Sel., Kota Pontianak, Kalimantan Barat 78243', NULL, 'Pondok Kakap', 2.00, 250000, 4.47, 2986, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(215, 2, 11, 'Sultan’s palace built in the 1770s, noted for its yellow appearance, period artifacts & cannons.', 'X8CX+FWQ, Jl. Tj. Raya 1, Dalam Bugis, Kec. Pontianak Tim., Kota Pontianak, Kalimantan Barat 78243', NULL, 'Keraton Kadriah', 3.80, 0, 4.55, 2493, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(216, 2, 11, 'A garden abuts this historical museum displaying cultural, geological & archaeological relics.', 'Komplek Museum Negeri Pontianak, Jl. Jenderal Ahmad Yani, Parit Tokaya, Kec. Pontianak Sel., Kota Pontianak, Kalimantan Barat 78121', NULL, 'Museum Negeri Pontianak', 5.10, 1000, 4.38, 1751, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(217, 2, 11, 'Imposing cathedral known for its vast cupola & soaring interiors, plus many stained-glass windows.', 'Jl. Pattimura Indah No.195, Darat Sekip, Kec. Pontianak Kota, Kota Pontianak, Kalimantan Barat 78011', NULL, 'Saint Joseph Cathedral', 1.50, 0, 4.89, 3176, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Saint Joseph Cathedral.jpg'),
(218, 2, 11, 'Mosque', 'Jl. Jenderal Ahmad Yani, Akcaya, Kec. Pontianak Sel., Kota Pontianak, Kalimantan Barat', NULL, 'Masjid Raya Mujahidin', 3.50, 0, 4.88, 2307, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Masjid Raya Mujahidin.jpg'),
(219, 2, 11, 'Visitors to this small public park can stand on the equator, marked by a historic monument.', 'Jl. Khatulistiwa No.Kel, Batu Layang, Kec. Pontianak Utara, Kota Pontianak, Kalimantan Barat 78244', NULL, 'Equator Monument Khatulistiwa Park', 10.40, 0, 4.38, 8905, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(220, 2, 11, 'Buddhist temple', 'Jl. Sejahtera No.28, Melayu, Kec. Singkawang Bar., Kota Singkawang, Kalimantan Barat 79111', NULL, 'Tri Dharma Bumi Raya Temple', 152.00, 0, 4.68, 485, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(221, 2, 11, 'Heritage building', 'WX6R+55X, Condong, Singkawang Tengah, Singkawang City, West Kalimantan 79111', NULL, 'Tjhia Family House', 152.00, 0, 4.58, 1180, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(222, 2, 11, 'Replica of a traditional Dayak tribal hall, set on painted pillars & used for concerts & events.', 'X83C+62M, Sungai Bangkong, Pontianak Kota, Pontianak, West Kalimantan 78113', NULL, 'Gawai Dayak Radakng House', 4.10, 0, 4.50, 6151, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gawai Dayak Radakng House.jpg'),
(223, 1, 11, 'Vast protected area of seasonally fluctuating lakes & forest home to proboscis monkeys & rare birds.', 'Nanga Leboyan, Danau Sentarum, Kapuas Hulu Regency, West Kalimantan 78765', NULL, 'Sentarum Lake National Park', 510.00, 15000, 4.59, 389, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(224, 1, 11, 'Tourist attraction', '79271, Pulau Lemukutan, Sungai Raya Kepulauan, Kabupaten Bengkayang, Kalimantan Barat', 'Taking/hiring a boat is required to reach this beach. Tour is recommended.', 'Lemukutan Island', 148.00, 0, 4.60, 405, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lemukutan Island.jpg'),
(225, 1, 11, 'Beach', '2J82+MPC, West Kalimantan 79466', NULL, 'Batu Nenek Beach', 363.00, 15000, 4.76, 54, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(226, 1, 11, 'Remote rocky beach with a monolithic top-heavy formation best accessed by boat.', 'Karimunting, Raya Kepulauan River, Bengkayang Regency, West Kalimantan', NULL, 'Batu Payung Beach', 130.00, 20000, 4.19, 1403, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Batu Payung Beach.jpg'),
(227, 1, 11, 'Tourist attraction', 'VV5R+HMP, Sedau, Singkawang Selatan, Singkawang City, West Kalimantan 79163', NULL, 'Tanjung Bajau Beach', 139.00, 40000, 4.28, 1681, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tanjung Bajau Beach.jpg'),
(228, 1, 11, 'Mangroves, swamps & mountain rainforest home to proboscis monkeys & orangutans, plus giant orchids.', 'Kalinilam, Deltapawan, Jl. Gajah Mada, Ketapang Regency, West Kalimantan 78857', 'Has a different price for foreign tourist.', 'Gunung Palung National Park', 338.00, 1000, 4.30, 188, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(229, 1, 11, 'Beach', 'Jl. Mempawah-Sei Duri, Sungai Kunyit Laut, Sungai Kunyit, Kab. Mempawah, Kalimantan Barat 78371', NULL, 'Kijing Beach', 93.00, 10000, 4.07, 241, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(230, 3, 11, 'Restaurant', 'Gg. Tradisional No.45, Condong, Kec. Singkawang Tengah, Kota Singkawang, Kalimantan Barat 79111', NULL, 'Choi Pan Tho Ce', 152.00, 25000, 4.60, 983, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(231, 3, 11, 'Coffee shop', 'Jl. Merapi, Benua Melayu Darat, Kec. Pontianak Sel., Kota Pontianak, Kalimantan Barat 78243', NULL, 'Warung Kopi ASIANG', 1.10, 20000, 4.60, 5123, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Warung Kopi ASIANG.jpg'),
(232, 3, 11, 'Chinese noodle restaurant', 'Jl. Nusa Indah 1, Darat Sekip, Kec. Pontianak Kota, Kota Pontianak, Kalimantan Barat 78243', NULL, 'Bakmie Yau Tek (Bakmie Tunggu)', 1.80, 40000, 4.40, 727, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bakmie Yau Tek (Bakmie Tunggu).jpg'),
(233, 3, 11, 'Porridge restaurant', 'WX5Q+QG7, Jl. Niaga, Melayu, Kec. Singkawang Bar., Kota Singkawang, Kalimantan Barat 79111', NULL, 'Bubur Pekong', 152.00, 25000, 4.40, 525, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(234, 3, 11, 'Chinese restaurant', 'X89R+WCM, Jl. Siam, Benua Melayu Darat, Kec. Pontianak Sel., Kota Pontianak, Kalimantan Barat 78122', NULL, 'RESTAURANT A Hin Chai Kue Panas Siam', 1.50, 35000, 4.40, 1433, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RESTAURANT A Hin Chai Kue Panas Siam.jpg'),
(235, 3, 12, 'Seafood restaurant', 'Jl. Marsma R. Iswahyudi No.4, Gn. Bahagia, Kecamatan Balikpapan Selatan, Kota Balikpapan, Kalimantan Timur 76115', NULL, 'Kepiting Kenari', 117.00, 175000, 4.36, 2406, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(236, 3, 12, 'Seafood restaurant', 'Jl. Jenderal Sudirman, Ruko Bandar Jl. Jenderal Sudirman No.18 Blok M, Klandasan Ulu, Kalimantan Timur 76112', NULL, 'Ocean\'s', 113.00, 125000, 4.36, 5603, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(237, 3, 12, 'Seafood restaurant', 'Jl. Marsma R. Iswahyudi No.70, Gn. Bahagia, Kecamatan Balikpapan Selatan, Kota Balikpapan, Kalimantan Timur 76114', NULL, 'Dandito', 115.00, 175000, 4.47, 8267, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(238, 3, 12, 'Seafood restaurant', 'Jl. Mayor Jendral Sutoyo No.15A, Sungai Pinang Dalam, Kec. Sungai Pinang, Kota Samarinda, Kalimantan Timur 75117', NULL, 'Pondok Borneo', 4.50, 175000, 4.57, 2894, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pondok Borneo.jpg'),
(239, 3, 12, 'Soto restaurant', 'Jl. Pangeran Diponegoro No.43, Pelabuhan, Kec. Samarinda Kota, Kota Samarinda, Kalimantan Timur 75112', NULL, 'Soto Banjar Restoran Amado', 1.90, 40000, 4.38, 1986, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Soto Banjar Restoran Amado.jpg'),
(240, 3, 12, 'Restaurant', 'Jl. KH. Abul Hasan No.54, Ps. Pagi, Kec. Samarinda Kota, Kota Samarinda, Kalimantan Timur 75111', NULL, 'Ayam Goreng Banjar', 1.30, 35000, 4.48, 2363, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ayam Goreng Banjar.jpg'),
(241, 1, 12, 'Tourist attraction', 'Jl. AMD Gg. 4 No.RT 42, Margo Mulyo, Kec. Balikpapan Bar., Kota Balikpapan, Kalimantan Timur 76131', NULL, 'Margomulyo Mangrove Forest', 109.00, 0, 4.19, 778, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Margomulyo Mangrove Forest.jpg'),
(242, 1, 12, 'Archipelago', 'East Kalimantan', 'A boat/ferry trip is required .', 'Derawan Archipelago', 599.00, 0, 4.62, 542, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(243, 1, 12, 'River', 'East Kalimantan', NULL, 'Mahakam River', 288.00, 0, 4.33, 1004, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mahakam River.jpg'),
(244, 1, 12, 'Divers are drawn to the big lake with stingless jellyfish on this small, secluded island.', 'East Kalimantan', 'A boat/ferry trip is required .', 'Samama Island Stingless Jellyfish Lake', 598.00, 20000, 4.61, 304, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(245, 1, 12, 'Swimming lake', '7M2M+VHP, Biduk-Biduk, Biduk Biduk, Berau Regency, East Kalimantan 77373', NULL, 'Labuan Cermin Lake', 428.00, 10000, 4.68, 516, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(246, 1, 12, 'Recreation center', 'Jl. Soekarno-Hatta Km. 23, No. 185 RT. 42, Karang Joang, Kec. Balikpapan Utara, Kota Balikpapan, Kalimantan Timur 76127', NULL, 'Sun Bear Education and Conservation Center', 89.60, 0, 4.54, 1252, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sun Bear Education and Conservation Center.jpg'),
(247, 1, 12, 'Nature preserve', '3CP2+349, Pulau Sangalaki, Pulau Derawan, Kec. Pulau Derawan, Kabupaten Berau, Kalimantan Timur', NULL, 'Sangalaki Island', 590.00, 10000, 4.50, 307, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(248, 2, 12, 'Local history museum', 'Jl. Monumen Timur, Panji, Kec. Tenggarong, Kabupaten Kutai Kartanegara, Kalimantan Timur 75513', NULL, 'Kutai Sultan\'s Palace', 31.70, 2500, 4.37, 159, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(249, 2, 12, 'Museum', 'Museum Kayu, Jalan, Panji, Tenggarong, Kutai Kartanegara Regency, East Kalimantan 75513', NULL, 'Tuah Himba Wood Museum', 34.30, 5000, 4.39, 542, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tuah Himba Wood Museum.jpg'),
(250, 2, 12, 'Historical landmark', '5F5R+WR9, Jl. Kuran, Bugis, Kec. Gn. Tabur, Kabupaten Berau, Kalimantan Timur 77352', 'Entry fee number is voluntary', 'Mount Tabur Sultanate Palace', 463.00, 5000, 4.60, 95, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(251, 2, 12, 'Known for its modern Middle Eastern design, this large mosque has 7 towers & an ornate interior.', 'Jl. Slamet Riyadi No.1, Tlk. Lerong Ulu, Kec. Sungai Kunjang, Kota Samarinda, Kalimantan Timur 75243', NULL, 'Islamic Center Samarinda Mosque', 4.30, 0, 4.79, 4298, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Islamic Center Samarinda Mosque.jpg'),
(252, 2, 12, 'Tourist information center', 'Jl. Wisata Budaya Pampang, No.32, RT.03, Kelurahan Budaya Pampang, Kec Samarinda Utara, Arah Samarinda-Bontang, 5 KM dari jalan raya, Sebelum Bandara APT.Pranoto, Sungai Siring, Kec. Samarinda Utara, Kota Samarinda, Kalimantan Timur 75119', 'Performance only on Sunday', 'Pampang Cultural Park', 22.40, 20000, 4.58, 1714, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pampang Cultural Park.jpg'),
(253, 1, 13, 'Tours & trails across jungle slopes home to endangered orangutans & semi-nomadic hill tribes.', 'Limbur, Hampang, Kotabaru Regency, South Kalimantan', NULL, 'Meratus Mountains', 201.00, 15000, 4.55, 102, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(254, 1, 13, 'Tourist attraction', 'F373+CMG, Tiwingan Baru, Aranio, Tiwingan Lama, Kec. Aranio, Kabupaten Banjar, Kalimantan Selatan 70671', 'Hiring a boat is required to get to this island', 'Pinus Island', 69.20, 0, 4.49, 689, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pinus Island.jpg'),
(255, 1, 13, 'Tourist attraction', 'Cempaka, Mandi Angin Barat, Kec. Karang Intan, Kabupaten Banjar, Kalimantan Selatan 70661', NULL, 'Sultan Adam Forest Park', 55.80, 10000, 4.59, 908, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(256, 1, 13, 'Weir', 'F2M5+37J, Aranio, Banjar Regency, South Kalimantan 70671', NULL, 'Riam Kanan Dam', 59.60, 10000, 4.26, 102, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(257, 1, 13, 'Beach', 'Angsana, Tanah Bumbu Regency, South Kalimantan', 'There is parking fee.', 'Angsana Beach', 201.00, 0, 4.29, 1639, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Angsana Beach.jpg'),
(258, 1, 13, 'Tourist attraction', '9WPG+X7, Wiritasi, Kusan Hilir, Tanah Bumbu Regency, South Kalimantan', NULL, 'Pagatan Beach', 239.00, 0, 4.04, 48, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pagatan Beach.jpg'),
(259, 2, 13, 'Museum', 'MJW5+CJG, Jl. Kampung Kenanga, Sungai Jingah, Kec. Banjarmasin Utara, Kota Banjarmasin, Kalimantan Selatan 70122', NULL, 'Wasaka Museum', 3.80, 0, 4.49, 581, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(260, 2, 13, 'Striking religious edifice painted pale yellow, with green & blue tiled domes & a soaring minaret.', 'Jl. A. Yani, Cindai Alus, Kec. Martapura, Kabupaten Banjar, Kalimantan Selatan 70611', NULL, 'Al-Karomah Great Mosque', 35.30, 0, 4.80, 7618, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Al-Karomah Great Mosque.jpg'),
(261, 2, 13, 'Sculpture', 'Sungai Baru, Banjarmasin Tengah, Banjarmasin City, South Kalimantan', NULL, 'Bekantan Statue', 0.60, 0, 4.55, 2313, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bekantan Statue.jpg'),
(262, 2, 13, 'Sprawling mosque complex with a huge, domed prayer hall & 5 towers on scenic landscaped grounds.', 'Jl. Jend Sudirman No.1, Antasan Besar, Kec. Banjarmasin Tengah, Kota Banjarmasin, Kalimantan Selatan 70114', NULL, 'Sabilal Muhtadin Great Mosque', 2.10, 0, 4.80, 10583, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sabilal Muhtadin Great Mosque.jpg'),
(263, 2, 13, 'Nestled in the heart of Banjarmasin, Indonesia, Lokbaintan Floating Market stands as a testament to the city\'s vibrant culture and rich heritage. Established centuries ago, this iconic market has been a vital hub of trade and commerce, serving as a lifeline for local communities along the Martapura River.', 'Jalan Sungai Martapura Jl. Sungai Tandipah, Sungai Tandipah, Kec. Sungai Tabuk, Kabupaten Banjar, Kalimantan Selatan 70653', NULL, 'Lokbaintan Floating Market', 10.20, 0, 4.58, 1035, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(264, 3, 13, 'Indonesian restaurant', 'Jl. A. Yani No.KM.34 No.4, Guntung Paikat, Kec. Banjarbaru Selatan, Kota Banjar Baru, Kalimantan Selatan 70713', NULL, 'Rumah Makan \"Swarga\"', 34.70, 35000, 4.10, 1422, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(265, 3, 13, 'Pasta shop', 'Komplek Villa Anyar Utama Komplek Villa Anyar Utama No. 30, Loktabat Utara, Kec. Banjarbaru Utara, Kota Banjar Baru, Kalimantan Selatan 70721', NULL, 'Pasta Joglo Banjar', 33.20, 75000, 4.40, 1617, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(266, 3, 13, 'Restaurant', 'Jalan A. Yani KM.30,5, Guntungmanggis, Kec. Landasan Ulin, Kota Banjar Baru, Kalimantan Selatan 70721', NULL, 'Semua Senang (Pak Siyo)', 29.70, 35000, 4.40, 1820, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Semua Senang (Pak Siyo).jpg'),
(267, 3, 13, 'Buffet restaurant', 'Jl. Kinibalu No.28, Tlk. Dalam, Kec. Banjarmasin Tengah, Kota Banjarmasin, Kalimantan Selatan 70117', NULL, 'Warung Berkat', 2.50, 25000, 4.60, 841, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Warung Berkat.jpg'),
(268, 3, 13, 'Satay restaurant', 'JL. A Yani, Km 24.5, Landasan Ulin, Landasan Ulin Utara, Kec. Liang Anggang, Kota Banjar Baru, Kalimantan Selatan 70724', NULL, 'Rumah Makan \" R A M A N I A \"', 23.70, 40000, 4.00, 88, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(269, 3, 13, 'Restaurant', 'HR6F+88M, Loktabat Utara, Banjarbaru Utara, Banjarbaru City, South Kalimantan 70714', NULL, 'Rumah Makan Duta Rasa', 33.20, 35000, 4.10, 557, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(270, 3, 13, 'Restaurant', 'Jl. Pintas Sambangan, Landasan Ulin Sel., Kec. Liang Anggang, Kota Banjar Baru, Kalimantan Selatan 70722', NULL, 'Danau Wisata Kuliner & Cangkir Coffee', 21.60, 60000, 4.30, 1272, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(271, 2, 14, 'Historical place museum', 'Raja, South Arut, West Kotawaringin Regency, Central Kalimantan 74112', NULL, 'Istana Kuning', 453.00, 5000, 4.40, 2648, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Istana Kuning.jpg'),
(272, 2, 14, 'Historical landmark', '59Q6+CR7, Mandomai, Kapuas Barat, Kapuas Regency, Central Kalimantan 73564', NULL, 'Huma Hai Loendjoe', 105.00, 5000, 4.54, 10, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(273, 2, 14, 'Exhibits tracing the history & culture of the Dayak people of Borneo, with art, artifacts & weapons.', 'Jl. Tjilik Riwut No.Km. 2.5, Palangka, Kec. Jekan Raya, Kota Palangka Raya, Kalimantan Tengah 73112', NULL, 'Balanga Museum', 3.50, 2500, 4.28, 501, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Balanga Museum.jpg'),
(274, 2, 14, 'Monastery', 'XPWV+8PP, Banturung, Bukit Batu, Palangka Raya City, Central Kalimantan 73112', NULL, 'Bukit Doa Karmel Tangkiling, Palangkaraya', 34.70, 0, 4.61, 115, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(275, 2, 14, 'Historical landmark', 'QWWC+2G3, Langkai, Jekan Raya, Palangka Raya City, Central Kalimantan 73112', NULL, 'Palangka Raya City Monument (Soekarno Monument)', 2.10, 0, 4.43, 831, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Palangka Raya City Monument (Soekarno Monument).jpg'),
(276, 1, 14, 'Tourist attraction', '8JFG+HMW, Mendawai, South Arut, West Kotawaringin Regency, Central Kalimantan 74112', NULL, 'Arut River', 455.00, 0, 4.40, 40, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(277, 1, 14, 'Campground', 'XQ89+FVP, Tumbang Tahai, Bukit Batu, Palangka Raya City, Central Kalimantan 73112', NULL, 'Kawasan Arboretum Nyaru Menteng', 29.60, 10000, 4.05, 151, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kawasan Arboretum Nyaru Menteng.jpg'),
(278, 1, 14, 'Tourist attraction', '2Q23+H94, Banturung, Bukit Batu, Palangka Raya City, Central Kalimantan 73112', NULL, 'Taman Wisata Alam Tangkiling', 33.70, 5000, 4.17, 221, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(279, 1, 14, 'Tours of a forested national park known for its abundance of wildlife, including orangutans.', 'Teluk Pulai, Kumai, West Kotawaringin Regency, Central Kalimantan 74181', 'Highly recommend to get a tour package to enter.', 'Tanjung Puting National Park', 456.00, 2500, 4.77, 1599, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tanjung Puting National Park.jpg'),
(280, 1, 14, 'This sprawling national park along the Sabangau River is home to orangutans, gibbons & rare birds.', 'Jalan Mahir Mahar KM. 1.2, Paduran Sabangau, Sebangau Kuala, Paduran Sabangau, Kec. Sebangau Kuala, Palangka Raya, Kalimantan Tengah 74874', 'Highly recommend to get a tour package to enter.', 'Sebangau National Park Central Kalimantan', 169.00, 5000, 4.30, 2146, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sebangau National Park Central Kalimantan.jpg'),
(281, 3, 14, 'Restaurant', 'Jl. Jend. Sudirman No.1, Palangka, Kec. Jekan Raya, Kota Palangka Raya, Kalimantan Tengah 73111', NULL, 'Rumah Tjilik Riwut Gallery & Resto', 2.40, 50000, 4.50, 1408, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Tjilik Riwut Gallery & Resto.jpg'),
(282, 3, 14, 'Ikan bakar restaurant', 'Jl. Bukit Rawi Km No.2, Pahandut Seberang, Kec. Pahandut, Kota Palangka Raya, Kalimantan Tengah 73111', NULL, 'Kampung Lauk Restaurant', 4.10, 75000, 4.20, 4275, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kampung Lauk Restaurant.jpg'),
(283, 3, 14, 'Indonesian restaurant', 'Jl. RTA Milono No.15, Langkai, Kec. Pahandut, Kota Palangka Raya, Kalimantan Tengah 73111', NULL, 'Rumah Makan Samba (masakan khas Kalteng)', 1.70, 75000, 4.40, 838, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Samba (masakan khas Kalteng).jpg'),
(284, 3, 14, 'Grilled fish restaurant', 'Jl. G. Obos VII Gg. 6 No.9, Menteng, Kec. Jekan Raya, Kota Palangka Raya, Kalimantan Tengah 73112', NULL, 'Pondok Makan Dan kolam Boga Rasa Indah', 3.90, 50000, 4.30, 383, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(285, 3, 14, 'Seafood restaurant', 'Jl. Usman Harun No.39, Baamang Hilir, Kec. Baamang, Kabupaten Kotawaringin Timur, Kalimantan Tengah 74312', NULL, 'Kampung Oelin Cafe', 221.00, 75000, 4.00, 632, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(286, 3, 14, 'Grilled fish restaurant', 'Jl. Jepang, Pulau Telo, Kec. Selat, Kabupaten Kapuas, Kalimantan Tengah 73516', NULL, 'Restoran Sawah Buli Lewu', 135.00, 75000, 3.98, 167, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(287, 2, 15, 'Museum', '7JXC+G4J, Kampung Empat, Tarakan Timur, Tarakan City, North Kalimantan', 'Taking a ferry/airplane is needed', 'World War II Museum Kota Tarakan', 245.00, 5000, 4.40, 106, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(288, 2, 15, 'Museum', 'Pamusian, Tarakan Tengah, Tarakan City, North Kalimantan', 'Taking a ferry/airplane is needed', 'Museum Rumah Bundar Tarakan', 241.00, 0, 4.30, 163, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(289, 2, 15, 'Park', 'Jl. Pattimura, Nunukan Tim., Kec. Nunukan, Kabupaten Nunukan, Kalimantan Utara 77482', 'Taking a ferry/airplane is needed', 'City Square', 388.00, 0, 4.30, 2377, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'City Square.jpg'),
(290, 2, 15, 'Monument', 'V947+98G, Jl. Katamso, Kabupaten Bulungan, Kalimantan Utara 77216', NULL, 'Tugu Cinta Damai', 2.00, 0, 4.50, 602, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tugu Cinta Damai.jpg'),
(291, 1, 15, 'Relaxed, rustic sandy beach with fishing & vendors serving local seafood specialties.', 'Pantai Amal, Tarakan Timur, Tarakan City, North Kalimantan', 'Taking a ferry/airplane is needed', 'Amal Beach', 248.00, 25000, 4.01, 174, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(292, 1, 15, 'Beach', 'Pantai Amal, Tarakan Timur, Tarakan City, North Kalimantan', 'Taking a ferry/airplane is needed', 'Binalatung Beach', 250.00, 5000, 4.07, 180, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(293, 1, 15, 'Tourist attraction', 'GR5G+6CX, Rian, Sesayap, Tana Tidung Regency, North Kalimantan 77152', NULL, 'Rian Mountain Waterfall', 157.00, 2000, 4.40, 169, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(294, 1, 15, 'Park', 'R8HV+3W8, Central Tanjung Palas, Tanjung Palas, Bulungan Regency, North Kalimantan 77211', NULL, 'White Mountain Tourism', 8.20, 0, 3.90, 323, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'White Mountain Tourism.jpg'),
(295, 1, 15, 'Tourist attraction', 'Karang Rejo, Tarakan Barat, Karang Rejo, Kec. Tarakan Bar., Kota Tarakan, Kalimantan Utara', 'Taking a ferry/airplane is needed. Has different price for foreign tourist.', 'Kawasan Konservasi Mangrove Dan Bekantan', 241.00, 5000, 4.30, 2512, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kawasan Konservasi Mangrove Dan Bekantan.jpg'),
(296, 3, 15, 'Family restaurant', 'Jl. Niaga I No.27, Karang Balik, Kec. Tarakan Bar., Kota Tarakan, Kalimantan Utara', 'Taking a ferry/airplane is needed', 'Depot gili paulina', 240.00, 75000, 4.30, 161, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(297, 3, 15, 'Restaurant', 'Karang Rejo, Tarakan Barat, Tarakan City, North Kalimantan', 'Taking a ferry/airplane is needed', 'Lemakan Samudra', 242.00, 200000, 4.60, 832, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lemakan Samudra.jpg'),
(298, 3, 15, 'Seafood restaurant', 'Jl. Cendrawasih No.1, RT.14/RW, Karang Anyar Pantai, Kec. Tarakan Bar., Kota Tarakan, Kalimantan Utara', 'Taking a ferry/airplane is needed', 'Kaltara Fried Crab', 241.00, 75000, 4.20, 362, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kaltara Fried Crab.jpg'),
(299, 3, 15, 'Restaurant', 'Jl. Cendrawasih No.28, Tj. Selor Hilir, Kec. Tj. Selor, Kabupaten Bulungan, Kalimantan Utara 77215', NULL, 'Rumah Makan Mk\'d (Mama Dedy)', 4.00, 25000, 4.20, 11, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(300, 2, 15, 'Museum', 'R9J4+QVF, Central Tanjung Palas, Tanjung Palas, Bulungan Regency, North Kalimantan 77211', NULL, 'Museum Kesultanan Bulungan', 8.00, 0, 4.20, 440, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Museum Kesultanan Bulungan.jpg'),
(301, 1, 15, 'Forested oasis featuring wildlife, a recreational river, waterfalls, hiking & educational events.', 'V9CH+PCG, Balai Taman Nasional Kayan Mentarang Pemda, Jl. Pusat Pemerintahan, Tanjung Belimbing, Pujungan, Kabupaten Malinau, Kalimantan Utara 77562', 'Taking a boat is needed.', 'Kayan Mentarang National Park', 324.00, 10000, 4.40, 294, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kayan Mentarang National Park.jpg'),
(302, 3, 16, 'Restaurant', 'Jl. Alam Sutera Town Center, Jl. Alam Utama Blok 10J No.6, Pakulonan, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15325', NULL, 'Justus Steakhouse Alam Sutera', 61.70, 600000, 4.75, 997, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(303, 3, 16, 'Seafood restaurant', 'Flavor Bliss.3, Jl. Alam Sutera Boulevard No.Kavling 6, Pakulonan, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15325', NULL, 'Bandar Djakarta Alam Sutera', 61.70, 200000, 4.60, 18174, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bandar Djakarta Alam Sutera.jpg'),
(304, 3, 16, 'Soto restaurant', 'Perumahan, Gading Serpong, Jl. Boulevard Raya Gading Serpong No.1 Blok AA 4, Pakulonan Bar., Kec. Klp. Dua, Kabupaten Tangerang, Banten 15810', 'Has many branches across the city', 'Soto Betawi H. Mamat', 61.50, 60000, 4.40, 1129, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Soto Betawi H. Mamat.jpg'),
(305, 3, 16, 'Traditional Sundanese kitchen serving a variety of seafood plates in relaxed, open-air gazebos.', 'The Breeze, Bsd City, Jl. Boulevard BSD Tim. Unit L67 A-C, Sampora, Kec. Cisauk, Kabupaten Tangerang, Banten 15345', NULL, 'Gubug Makan Mang Engking The Breeze BSD', 70.70, 135000, 4.28, 5688, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gubug Makan Mang Engking The Breeze BSD.jpg'),
(306, 3, 16, 'Chinese restaurant', 'Gading Serpong, Jhl Solitaire, Jl. Gading Serpong Boulevard, Curug Sangereng, Kec. Klp. Dua, Kabupaten Tangerang, Banten 15810', NULL, 'Royal 8 Chinese Semi Fine Dining', 61.70, 600000, 4.80, 402, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(307, 3, 16, 'Trendy restaurant focused on ribs & other pork-centric dishes served with fries & martini cocktails.', 'Ruko South Goldfinch SGA 039 The Springs, Cihuni, Pagedangan, Tangerang Regency, Banten 15332', NULL, 'Hog Wild with Chef Bruno Serpong', 67.20, 120000, 4.56, 1852, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(308, 1, 16, 'One of a series of lakes at a former quarry, popular for photos & lined with street food stands.', 'PCCJ+Q6X, Jalan Cigaru, Cisoka, Tangerang Regency, Banten 15730', NULL, 'Cigaru Blue Lake Cisoka', 48.50, 0, 4.00, 6329, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Cigaru Blue Lake Cisoka.jpg'),
(309, 1, 16, 'Popular strip of seashore with restaurants & hotels, plus boat & water-sport equipment rentals.', 'PR3R+933, Jalan Raya Labuan, Sukajadi, Carita, Sukarame, Kec. Carita, Kabupaten Pandeglang, Banten 42264', 'Price does not include parking fee', 'Carita Beach', 59.10, 15000, 4.25, 1643, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(310, 1, 16, 'Picturesque national park comprising islands with rare wildlife, including the Javan rhino.', '698G+42H, Ujungjaya, Banten', 'Price may vary based on day or your status. For more information check https://tnujungkulon.menlhk.go.id/show/index/121/Tarif-Masuk', 'Ujung Kulon National Park', 132.00, 7500, 4.39, 4111, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(311, 1, 16, 'Sandy beach with rock formations, a backdrop of lush forests & big waves that draw surfers.', 'JL Cikaung, Sawarna, Kec. Bayah, Kabupaten Lebak, Banten 42393', 'Price not including parking fee', 'Sawarna Beach', 146.00, 5000, 4.48, 6651, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(312, 1, 16, 'Beach', 'WV6M+PGF Pantai Anyer, Jl. Raya Karang Bolong, Bandulu, Kec. Anyar, Kabupaten Serang, Banten 42166', 'Price does not include parking fee', 'Anyer Beach', 41.70, 5000, 4.49, 13600, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Anyer Beach.jpg'),
(313, 1, 16, 'Urban park with a jogging track, climbing wall & koi farm, plus a skate park & ping-pong center.', 'Jl. Scientia Boulevard, Curug Sangereng, Kec. Klp. Dua, Kabupaten Tangerang, Banten 15810', NULL, 'Scientia Square Park (SQP)', 61.50, 45000, 4.50, 21722, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Scientia Square Park (SQP).jpg'),
(314, 2, 16, 'Buddhist temple', 'X49X+RQ8, Jl. Tubagus Raya, Banten, Kec. Kasemen, Kota Serang, Banten 42191', NULL, 'Vihara Avalokitesvara', 10.60, 0, 4.79, 1095, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Vihara Avalokitesvara.jpg'),
(315, 2, 16, 'Mosque with a broad, turquoise dome supported by 4 half-domes, plus delicate ceiling calligraphy.', 'RJHQ+XM8, Jl. Satria - Sudirman, RT.001/RW.001, Sukaasih, Kec. Tangerang, Kota Tangerang, Banten 15111', NULL, 'Al-AZhom Mosque', 66.20, 0, 4.80, 20359, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Al-AZhom Mosque.jpg'),
(316, 2, 16, 'Historical landmark', '86QH+JJ, Kanekes, Leuwidamar, Lebak Regency, Banten', 'Requiring a quite difficult trekking to reach the spot.', 'Inner Baduy', 88.20, 0, 4.57, 102, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(317, 2, 16, 'Mosque with a tower built in the 16th century & a remnant of the old port city of Banten.', 'Jl. Komp. Masjid Agung Banten, RT./RW/RW.001/011, Banten, Kec. Kasemen, Kota Serang, Banten 42191', NULL, 'Great Mosque of Banten', 10.50, 0, 4.60, 16070, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Great Mosque of Banten.jpg'),
(318, 2, 16, 'Historic Chinese-style house built in 1684, now a museum with elaborate period decor & furniture.', 'Jalan Cilame No. 18&20, RT.001/RW.004, Pasar Lama, Kec. Tangerang, Kota Tangerang, Banten 15118', NULL, 'Museum Benteng Heritage', 63.80, 30000, 4.46, 970, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(319, 1, 17, 'Sea World in Jakarta is located inside the Ancol Dream Land complex. More than 4000 species of fish, sharks and sea life. Walk through tunnels, massive oceanarium, shows and displays.', 'Jl. Lodan timur No.7, RT.14/RW.10, Ancol, Kec. Pademangan, Jkt Utara, Daerah Khusus Ibukota Jakarta 14430', 'Price is not including Ancol entry ticket and vehicle ticket. Ticket price may vary depending on the day, for more information please visit : https://www.ancol.com/widget/regular-sea-world-ancol', 'Sea World', 12.50, 85000, 4.49, 43278, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(320, 1, 17, 'Scattered through Jakarta Bay are the 1000 Islands, Palau Seribu. Known for great beaches, diving, and holiday travel, these make a great day trip or weekend getaway.', 'Kepulauan Seribu, Kepulauan Seribu Regency, Jakarta 14520', 'Booking a lodging ahead is recommended. Required to take boat from Ancol port to reach the islands.', 'Thousand Islands', 49.00, 0, 4.29, 1763, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Thousand Islands.jpg'),
(321, 1, 17, NULL, 'Jl. Taman Suropati No.5, RT.5/RW.5, Menteng, Kec. Menteng, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10310', NULL, 'Taman Suropati', 4.50, 0, 18.32, 21712, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Taman Suropati.jpg'),
(322, 2, 17, 'Indonesia\'s largest mosque is a sacred place of worship as well as a center for conferences, lectures and seminars.', 'Jl. Taman Wijaya Kusuma, Ps. Baru, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10710', NULL, 'Istiqlal Mosque', 4.20, 5000, 490.71, 15132, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(323, 2, 17, 'Built to commemorate Indonesia\'s independence, National Monument dominates Medan Merdeka.', 'RT.5/RW.2, Gambir, Central Jakarta City, Jakarta 10110', 'Price may differ depend on your status.', 'National Monument (MONAS)', 2.70, 24000, 151.83, 118258, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(324, 2, 17, NULL, 'Jl. Taman Mini Indonesia Indah, Ceger, Kec. Cipayung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13820', 'For more price information please visit here : https://tamanmini.com/taman_jelajah_indonesia/tiket-jam-buka/', 'Beautiful Indonesia in Miniature Park', 21.80, 35000, 37.45, 162413, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(325, 2, 17, 'Temporarily Closed In 1778, the Batavia Society for Arts and Science established what would become, after many expansions and name changes, the world-famous National Museum.', 'Jl. Medan Merdeka Barat No.12, Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10110', 'Has different price for international tourist. For more information : https://www.museumnasional.or.id/layanan-blu', 'National Museum', 2.00, 15000, 169.91, 16975, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(326, 2, 17, 'Once the first banks of Indonesia, now a museum of banking in Indonesia.', 'Jl. Pintu Besar Utara No.3, RT.4/RW.6, Pinangsia, Kec. Taman Sari, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11110', NULL, 'Museum Bank Indonesia', 8.40, 0, 105.16, 11625, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Museum Bank Indonesia.jpg'),
(327, 2, 17, NULL, 'Jl. Katedral No.7B, Ps. Baru, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10710', NULL, 'Jakarta Cathedral', 4.20, 0, 123.05, 13481, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Jakarta Cathedral.jpg'),
(328, 2, 17, 'This is the old city of Batavia. Rundown, picturesque and a great night market.', 'Kawasan Kota Tua, Taman Fatahillah No.1, RT.7/RW.7, Pinangsia, Taman Sari, West Jakarta City, Jakarta 11110', NULL, 'Jakarta Kota Tua', 9.20, 0, 200.05, 20953, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Jakarta Kota Tua.jpg'),
(329, 2, 17, 'The Chinatown of Jakarta began long before Indonesia existed as a nation and was originally the Chinatown of Batavia. This was the area where the Dutch required the Chinese to live. Today, the whole area is called Glodok and includes traditional houses, markets, architecture and some very beautiful Chinese temples; the Da Shi Miao and the Vihara Dharma Bhakti temples are both popular tourist attractions. The Glodok Market is one of the great commercial centers of Jakarta where you can buy everything from antiques to laptops.', 'Jl. Pancoran, RT.2/RW.1, Glodok, Kec. Taman Sari, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11120', NULL, 'Glodok Chinatown', 7.80, 0, 25.21, 9167, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(330, 3, 17, 'Indonesian restaurant', 'Jalan Tanah Abang 5 No.36 Gambir RT.13, 14, RT.14/RW.4, Petojo Sel., Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10160', NULL, 'Gado-Gado Cemara (Sejak 1947)', 3.30, 60000, 4.50, 1231, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(331, 3, 17, 'Restaurant', 'Jl. Barito I No.19 4, RT.3/RW.1, Kramat Pela, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12130', NULL, 'Gultik blok M', 11.80, 25000, 4.50, 1927, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gultik blok M.jpg'),
(332, 3, 17, 'Chinese noodle restaurant', 'Jl. Kelinci Raya No.1 3, RT.1/RW.4, Ps. Baru, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10710', NULL, 'Bakmi Gang Kelinci', 5.30, 60000, 4.20, 6225, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(333, 3, 17, 'Ketoprak Ciragil & Baso, Siomay Jhony', 'Jl. Ciragil II No.24 6, RT.6/RW.1, Rw. Bar., Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12180', NULL, 'Ketoprak Ciragil & Baso, Siomay Jhony', 9.10, 35000, 4.30, 1411, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(334, 3, 17, 'Homey Chinese eatery serving hearty hot-pot mains & other classic dishes in snug quarters.', 'Jl. H. Agus Salim No.2 23B, RT.1/RW.1, Kebon Sirih, Menteng, Central Jakarta City, Jakarta 10340', NULL, 'Claypot Popo Sabang', 1.90, 40000, 4.50, 2814, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Claypot Popo Sabang.jpg'),
(335, 3, 17, 'Ice cream parlor serving a variety of creative desserts in a cozy space with a retro vibe.', 'Jl. Veteran I No.10, RT.4/RW.2, Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10110', NULL, 'Ragusa Es Italia', 4.50, 40000, 4.40, 19435, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ragusa Es Italia.jpg'),
(336, 3, 17, 'Cafe', 'Jl. Abdulrahman No.46, RT.12/RW.5, Cibubur, Kec. Ciracas, Jakarta, Daerah Khusus Ibukota Jakarta 13720', NULL, 'Teras Rumah Nenek', 27.90, 65000, 4.80, 6564, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(337, 3, 17, 'Betawi restaurant', 'Jl. Raya Parung - Ciputat No.RT.3, RT.3/RW.7, Bojongsari Baru, Kec. Bojongsari, Kota Depok, Jawa Barat 16516', NULL, 'Gabus Pucung Dapur Betawi Cabe 5', 30.70, 60000, 4.40, 269, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(338, 3, 17, 'Betawi restaurant', 'Jl. Assirot No.1, RT.1/RW.3, Sukabumi Sel., Kec. Kb. Jeruk, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 11560', NULL, 'Laksa Betawi Assirot', 11.40, 40000, 4.60, 815, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(339, 3, 17, 'Swanky Ritz-Carlton locale with farm-to-table buffets, Sunday brunch & afternoon tea.', 'SCBD, Sudirman Central Business District, Jl. Jend. Sudirman kav 52-53, RT.5/RW.3, Senayan, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12190', NULL, 'PASOLA Restaurant', 8.00, 250000, 4.91, 1957, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(340, 3, 17, 'Chinese restaurant', 'Hotel Mulia Jakarta, Jl. Asia Afrika, RT.1/RW.3, Gelora, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10270', NULL, 'Table8', 9.60, 250000, 4.88, 3735, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(341, 3, 17, 'Creative cocktails & eclectic global fare on offer in airy, sophisticated digs with a lush garden.', 'Ayana Midplaza Jakarta Lobby Level, Jl. Jend. Sudirman Kav. 10-11, Karet Tengsin, Tanah Abang, RT.10/RW.11, Karet Tengsin, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10220', NULL, 'JimBARan Lounge', 4.60, 200000, 4.74, 1893, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(342, 1, 17, 'Sprawling zoo in the rainforest with a primate center, children\'s zoo & Sumatran & white tigers.', 'Jl. Harsono RM No.1, Ragunan, Ps. Minggu, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12550', NULL, 'Ragunan Zoo', 19.00, 4000, 4.50, 104972, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(343, 1, 17, 'Park', 'MWF4+453, Jl. Setu Cipayung, taman, cempaka, Kec. Cipayung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13870', NULL, 'Cempaka Park', 24.00, 0, 4.60, 1809, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Cempaka Park.jpg'),
(344, 3, 18, 'Restaurant', 'Lobby Level, Jl. HOS. Cokroaminoto No.41-43, Arjuna, Cicendo, Bandung City, West Java 40172', NULL, 'Purnawarman Restaurant', 3.20, 210000, 4.87, 1598, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(345, 3, 18, 'Sundanese restaurant', 'Jl. Raya Puncak - Gadog No.59, Ciloto, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat 43253', NULL, 'RM Bumi Aki Puncak', 87.10, 100000, 4.70, 19979, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(346, 3, 18, 'Well-known eatery for satay, with long tables in a large warehouse structure just off a toll road.', 'Jalan Raya Cibungur, Cibungur, Kec. Bungursari, Kabupaten Purwakarta, Jawa Barat 41181', NULL, 'Sate Maranggi Haji Yetty', 71.90, 85000, 4.60, 72224, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sate Maranggi Haji Yetty.jpg'),
(347, 3, 18, 'Restaurant', 'Jl. Villa Triniti, Cigugur Girang, Kec. Parongpong, Kabupaten Bandung Barat, Jawa Barat 40559', NULL, 'Kampung Daun', 15.00, 110000, 4.51, 12194, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(348, 3, 18, 'Down-to-earth choice for homestyle Indonesian, rice & satay in an informal atmosphere.', 'Jl. Cangkring 2 No.34, Kejaksan, Kec. Kejaksan, Kota Cirebon, Jawa Barat 45123', NULL, 'Nasi Jamblang Ibu Nur', 136.00, 45000, 4.39, 17647, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(349, 3, 18, 'Indonesian restaurant', 'Jl. Cipaganti No.75G, Pasteur, Kec. Sukajadi, Kota Bandung, Jawa Barat 40161', NULL, 'Iga Bakar Si Jangkung', 5.40, 85000, 4.39, 9725, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(350, 3, 18, 'Indonesian restaurant', 'Jl. DR. Cipto Mangunkusumo No.8, Pekiringan, Kec. Kesambi, Kota Cirebon, Jawa Barat 45131', NULL, 'Nasi Jamblang Mang Dull', 136.00, 60000, 4.29, 13846, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(351, 3, 18, 'Satay restaurant', 'Jl. Raya Pacet, Cipendawa, Kec. Pacet, Kabupaten Cianjur, Jawa Barat 43253', NULL, 'Sate Maranggi Sari Asih', 78.50, 55000, 4.50, 19784, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(352, 3, 18, 'Coffee shop', 'Jl. Bukit Pakar Utara No.10, Ciburial, Kec. Cimenyan, Kabupaten Bandung, Jawa Barat 40135', NULL, 'Armor Kopi', 8.20, 30000, 4.49, 5779, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(353, 3, 18, 'Indonesian restaurant', 'Samping bank BTN Krucuk, Jl. Slamet Riyadi No.1, RW.5, Kesenden, Krucuk, Kota Cirebon, Jawa Barat 45151', NULL, 'Empal Gentong Krucuk', 126.00, 60000, 4.49, 8020, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(354, 1, 18, 'National forest', 'Pananjung, Pangandaran, Pangandaran Regency, West Java 46396', 'Has different price for international tourist', 'Pangandaran National Park', 205.00, 21000, 4.34, 1482, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(355, 1, 18, 'Historic site resembling a cave with gardens, built by the sultans of Cirebon for rest & meditation.', 'Sunyaragi, Kesambi, Cirebon City, West Java 45132', NULL, 'Sunyaragi Cave', 137.00, 17000, 4.39, 12404, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(356, 2, 18, 'Notable street', 'Bandung City, West Java', NULL, 'Jalan Asia Afrika', 1.40, 0, 4.56, 894, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Jalan Asia Afrika.jpg'),
(357, 1, 18, 'Natural mineral hot spring pools of varying temperatures & sizes amid mountains & tea plantations.', '7M63+V45, Jl. Sariater, Ciater, Kec. Ciater, Kabupaten Subang, Jawa Barat 41281', NULL, 'Sari Ater Hot Spring', 27.50, 48000, 4.35, 9971, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(358, 1, 18, 'Major ruins from 5000 BCE or earlier featuring hundreds of rectangular stones on a stepped hillside.', 'Kp. Gunung Padang, Karyamukti, Kec. Campaka, Kabupaten Cianjur, Jawa Barat 43263', NULL, 'Gunung Padang Megalithic Site', 95.40, 10000, 4.59, 4079, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(359, 1, 18, 'Tourist attraction', '6H2H+W79, Kertawangi, Cisarua, West Bandung Regency, West Java 40551', NULL, 'Cimahi Rainbow Waterfall', 19.00, 15000, 4.42, 612, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(360, 2, 18, 'Modern Hindu temple at the base of Mount Salak, built in traditional style, with panoramic views.', '8PJP+C5W, Tamansari, Bogor Regency, West Java 16610', NULL, 'Pura Parahyangan Agung Taman Sari Gunung Salak', 194.00, 0, 4.74, 1387, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(361, 1, 18, 'Animals from 5 continents live in this safari park with separate day & night excursions.', 'Jalan Kapten Harun Kabir No.724, Cibeureum, Kec. Cisarua, Kabupaten Bogor, Jawa Barat 16750', 'For more price information please visit here : https://bogor.tamansafari.com/siang.php', 'Indonesia Safari Park Cisarua', 103.00, 250000, 4.70, 63618, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(362, 1, 18, 'Tourist attraction', 'Medalsari, Pangkalan, Karawang, West Java 41362', 'For more price package information, please visit : https://www.mygreencanyon.com/2016/09/daftar-harga-tiket-masuk-green-canyon_6.html', 'Green Canyon', 102.00, 10000, 4.42, 1035, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(363, 2, 18, 'Grand Dutch colonial administration building dating to the 1920s, now West Java\'s government house.', 'Jl. Diponegoro No.22, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115', NULL, 'Gedung Sate', 1.70, 5000, 4.66, 8339, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(364, 1, 18, 'Sprawling gardens with many flowers, a large hedge maze, topiary, a lake & more.', 'Jl. Mariwati No.KM. 7, Kawungluwuk, Kec. Sukaresmi, Kabupaten Cianjur, Jawa Barat 43254', NULL, 'Taman Bunga Nusantara', 84.70, 50000, 4.60, 28924, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(365, 2, 18, 'This museum in a botanical garden is dedicated to the past presidents of Indonesia.', 'Jl. Ir. H. Juanda No.1, RT.04/RW.01, Paledang, Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat 16122', NULL, 'Museum Kepresidenan Balai Kirti', 123.00, 0, 4.70, 1006, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL);
INSERT INTO `tour_objects` (`id`, `tour_type_id`, `province_id`, `description`, `location`, `note`, `name`, `distance`, `price`, `rating`, `review`, `created_at`, `updated_at`, `image`) VALUES
(366, 2, 18, 'Spacious mosque, founded in the 19th century, with a large, domed roof & twin 81-m. minarets.', 'Jl. Dalem Kaum No.14, Balonggede, Kec. Regol, Kota Bandung, Jawa Barat 40251', NULL, 'Bandung Grand Mosque', 2.50, 0, 4.65, 9145, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bandung Grand Mosque.jpg'),
(367, 1, 18, 'Active volcanic peak featuring 3 craters & a cavern, with guided tours & food/souvenir vendors.', 'Cikahuripan, Lembang, West Bandung Regency, West Java', 'Has different price for international tourist.', 'Tangkuban Perahu', 25.20, 30000, 4.25, 8523, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(368, 2, 18, '1928 museum with exhibits ranging from rocks & minerals to invertebrate & vertebrate fossils.', 'Jl. Diponegoro No.57, Cihaur Geulis, Kec. Cibeunying Kaler, Kota Bandung, Jawa Barat 40122', NULL, 'Geology Museum', 2.30, 10000, 4.66, 15868, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(369, 2, 18, 'Museum', 'Setra Duta Raya No.L6, Ciwaruga, Kec. Parongpong, Bandung, Jawa Barat 40151', NULL, 'NuArt Sculpture Park', 9.70, 50000, 4.72, 912, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(370, 1, 18, '8,747-foot high active volcano featuring 4 different craters, mud pools & hiking trails.', 'Karamat Wangi, Cisurupan, Garut Regency, West Java', 'Has different price for international tourist.', 'Mount Papandayan', 77.70, 20000, 4.59, 2130, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(371, 1, 18, 'This sulfurous, volcanic crater lake has a distinctive coloration, rare plants & exotic wildlife.', 'Sugihmukti, Pasirjambu, Bandung Regency, West Java', 'For more price information please visit : https://www.ciwideyoutbound.com/harga-tiket-kawah-putih.html', 'White Crater', 48.10, 28000, 4.41, 8318, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(372, 1, 18, 'Theme park with European-style buildings, Dutch costumes for rent, a mini zoo & a hip restaurant.', 'Jl. Raya Lembang No.108, Gudangkahuripan, Kec. Lembang, Kabupaten Bandung Barat, Jawa Barat 40391', NULL, 'Farmhouse Susu Lembang', 13.90, 35000, 4.40, 65790, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Farmhouse Susu Lembang.jpg'),
(373, 1, 18, 'More than 20,000 orchids feature in this forest attraction with a playground & hanging bridge.', 'Genteng, Cikole, Kec. Lembang, Kabupaten Bandung Barat, Jawa Barat 40391', 'Has different price for international tourist.', 'Orchid Forest Cikole', 20.10, 40000, 4.60, 30681, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(374, 1, 18, 'Sprawling botanical garden created in the 19th century & featuring orchids, Cinchona trees & more.', 'Jl. Kebun Raya Cibodas, Sindangjaya, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat 43253', NULL, 'Cibodas Botanical Garden', 85.90, 15000, 4.60, 15865, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(375, 1, 18, 'Tourist attraction', 'Jalan Nasional No.11, South Tugu, Cisarua, Bogor Regency, West Java 16750', NULL, 'Puncak Pass Bogor', 89.90, 15000, 4.70, 15966, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(376, 1, 18, 'Landscaped park featuring walking paths, benches & a pond, plus sculptures & topiary.', '4J46+P62, Jl. Ganesa, Lb. Siliwangi, Kecamatan Coblong, Kota Bandung, Jawa Barat 40132', NULL, 'Ganesha Park', 3.50, 0, 4.50, 1945, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ganesha Park.jpg'),
(377, 1, 18, 'Agricultural activities are the theme of this learning attraction aimed at the natural world.', 'Komplek Graha Puspa, Jl. Sersan Bajuri No.KM 4, RW.5, Cihideung, Kec. Parongpong, Kabupaten Bandung Barat, Jawa Barat 40559', NULL, 'Jendela Alam', 14.40, 125000, 4.40, 2608, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(378, 2, 18, 'City park', 'Jl. Aceh No.53, Babakan Ciamis, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40117', NULL, 'Taman Sejarah Bandung', 2.60, 0, 4.60, 4442, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Taman Sejarah Bandung.jpg'),
(379, 3, 18, 'Cozy, cash-only outlet serving classic Indonesian comfort fare in airy, basic quarters.', 'Jl. Sultan Tirtayasa No.49b, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115', NULL, 'Bubur Ayam Mang H Oyo Pusat (ASLI)', 1.50, 30000, 4.30, 3038, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bubur Ayam Mang H Oyo Pusat (ASLI).jpg'),
(380, 3, 18, 'Sundanese restaurant', 'Jl. RA Kartini No.11B, RT.002/RW.005, Margahayu, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17113', NULL, 'Rumah Makan Khas Sunda Cibiuk', 128.00, 85000, 4.40, 1764, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(381, 3, 18, 'Sundanese restaurant', 'Jl. Diponegoro No.25, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115', NULL, 'Nasi Bancakan Wassalam Abah Barna', 1.90, 40000, 4.30, 13730, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(382, 3, 18, 'Breezy cafe with open-air & glass-enclosed seating serving local & Western-style dishes, plus cakes.', 'Jl. Rancabentang No.11A, Ciumbuleuit, Kec. Cidadap, Kota Bandung, Jawa Barat 40142', NULL, 'Miss Bee Providore', 7.40, 80000, 4.75, 9575, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(383, 3, 18, 'Sundanese restaurant', 'Jl. Veteran No.25, Kb. Pisang, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40112', NULL, 'Batagor Kingsley', 0.80, 35000, 4.20, 10998, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Batagor Kingsley.jpg'),
(384, 1, 18, 'Expansive, scenic botanical garden showcasing a wide range of tropical flowers & plants.', 'Jl. Ir. H. Juanda No.13, Paledang, Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat 16122', NULL, 'Bogor Botanical Gardens', 182.00, 25500, 4.70, 96326, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bogor Botanical Gardens.jpg'),
(385, 1, 19, 'Volcano', 'Rejosari, Pranten, Bawang, Batang Regency, Central Java', NULL, 'Mount Prau', 91.60, 15000, 4.75, 599, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(386, 1, 19, 'Rugged stairs lead to the top of this soaring hill, known for its sunrises & mountain panoramas.', 'Sawah & Hutan, Dieng, Kejajar, Wonosobo Regency, Central Java', NULL, 'Mount Sikunir', 95.70, 5000, 4.70, 16875, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mount Sikunir.jpg'),
(387, 1, 19, 'Produced from volcanic eruptions, this plateau is home to a few ancient Hindu temples.', 'Bakal Buntu, Bakal, Batur, Banjarnegara, Central Java', NULL, 'Dieng Plateau', 90.60, 10000, 4.57, 8952, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Dieng Plateau.jpg'),
(388, 1, 19, 'Mountainside recreation park with hot springs, a waterfall, natural swimming pools & playgrounds.', 'Jl. Raya Baturaden No.174, Dusun I Karangmangu, Karangmangu, Kec. Baturaden, Kabupaten Banyumas, Jawa Tengah 53151', NULL, 'Batu Raden', 189.00, 25000, 4.50, 28279, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Batu Raden.jpg'),
(389, 1, 19, 'Hilltop viewpoint overlooking the rolling Dieng plateau, plantations & its green-colored lake.', 'Theater, Jl. Dieng KM.2, Dieng, Kec. Kejajar, Kabupaten Wonosobo, Jawa Tengah 56354', NULL, 'Batu Ratapan Angin', 90.90, 10000, 4.70, 8218, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(390, 1, 19, 'Beach', 'Karimunjawa, Jepara Regency, Central Java', 'A boat ride / ferry is needed.', 'Tanjung Gelam Beach', 160.00, 20000, 4.65, 389, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(391, 1, 19, 'A popular climbing option, this dormant stratovolcano offers distant mountain views from 2 peaks.', 'Suroteleng, Selo, Boyolali Regency, Central Java', NULL, 'Mount Merbabu', 87.40, 7500, 4.60, 2880, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(392, 2, 19, '1 of 2 ornate Buddhist temples in a 9th-century complex with many buildings, stupas & shrines.', 'Jl. Candi Plaosan, Plaosan Lor, Bugisan, Kec. Prambanan, Kabupaten Klaten, Jawa Tengah 57454', NULL, 'Plaosan Temple', 113.00, 5000, 4.59, 11344, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(393, 2, 19, 'Small, carved-stone Buddhist temple from the 800s & a monastery offering simple overnight stays.', 'Jl. Mayor Kusen, Sumberrejo, Mendut, Kec. Mungkid, Kabupaten Magelang, Jawa Tengah 56501', NULL, 'Candi Mendut (Temple)', 92.20, 10500, 4.57, 5775, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(394, 2, 19, 'Borobudur Temple Compounds This famous Buddhist temple, dating from the 8th and 9th centuries, is located in central Java. It was built in three tiers: a pyramidal base with five concentric square terraces, the trunk of a cone with three circular platforms and, at the top, a monumental stupa. The walls and balustrades are decorated with fine low reliefs, covering a total surface area of 2,500 m2. Around the circular platforms are 72 openwork stupas, each containing a statue of the Buddha. The monument was restored with UNESCO\'s help in the 1970s.', 'Jl. Badrawati, Kw. Candi Borobudur, Borobudur, Kec. Borobudur, Kabupaten Magelang, Jawa Tengah', 'For more information visit : https://borobudurpark.com/en/temple/borobudur-2/', 'Borobudur Temple', 93.90, 400000, 4.68, 102537, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Borobudur Temple.jpg'),
(395, 2, 19, 'The House of Danar Hadi proudly unveils an Integrated Culture Heritage Complex that is destined to become a tourist attraction for the city of Surakarta. It has been founded to preserve and advance the art of batik in Indonesia as part of the national cultural legancy.', 'Slamet Riyadi St No.261, Sriwedari, Laweyan, Surakarta City, Central Java 57141', NULL, 'Museum Batik Danar Hadi', 99.40, 35000, 4.58, 2771, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(396, 2, 19, 'Historic temple complex with traditional Chinese & Javanese architectural features.', 'Jl. Simongan No.129, Bongsari, Kec. Semarang Barat, Kota Semarang, Jawa Tengah 50148', NULL, 'Sam Poo Kong Temple', 2.90, 35000, 4.48, 26786, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(397, 2, 19, 'Built in 1757 by the nephew of the King Pakubuwono II after a bitter power struggle, this smaller palace is still lived in.', 'Jl. Ronggowarsito, Keprabon, Kec. Banjarsari, Kota Surakarta, Jawa Tengah 57131', NULL, 'Mangkunegaran Palace', 100.00, 50000, 4.67, 7523, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(398, 2, 19, 'Sacred mountainside Javanese-Hindu temple built in the 15th century & overlooking tea plantations.', 'C534+J55, Ceto, RT.01/RW.03, Cetho, Gumeng, Kec. Jenawi, Kabupaten Karanganyar, Jawa Tengah 57792', NULL, 'Cetho Temple', 149.00, 30000, 4.69, 11270, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(399, 2, 19, 'Mountainside complex featuring 9 Hindu temples, hiking trails, hot springs & scenic views.', 'Jalan Ke Candi Gedong Songo, Candi, Krajan, Banyukuning, Bandungan, Kabupaten Semarang, Jawa Tengah 50614', 'Has different price for foreign tourist.', 'Gedong Songo Temple', 39.00, 15000, 4.60, 15797, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(400, 2, 19, 'Old town with Dutch colonial buildings like a church & a train station, plus antique shops & cafes.', '2CJH+M9F, Tanjung Mas, Semarang Utara, Semarang City, Central Java 50174', NULL, 'Semarang Old Town', 4.00, 0, 4.64, 6576, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Semarang Old Town.jpg'),
(401, 2, 19, '600-year-old temple complex dedicated to birth & new life, consisting of a pyramid & statues.', '94FJ+3J7, Tambak, Berjo, Kec. Ngargoyoso, Kabupaten Karanganyar, Jawa Tengah 57793', NULL, 'Sukuh Temple', 138.00, 20000, 4.55, 3879, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(402, 2, 19, 'Former colonial-era headquarters of the Dutch East Indies Railway Company, offering guided tours.', 'Jl. Pemuda No.160, Sekayu, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50132', NULL, 'Lawang Sewu Building', 0.20, 20000, 4.58, 69263, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lawang Sewu Building.jpg'),
(403, 3, 19, 'Restaurant', 'Jl. AR. Hakim No.112, Mangkukusuman, Kec. Tegal Tim., Kota Tegal, Jawa Tengah 52131', NULL, 'Serabi Notosuman', 154.00, 15000, 4.52, 670, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(404, 3, 19, 'Chicken restaurant', 'Jl. Gajahmada No.99D, Miroto, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50134', NULL, 'Ayam Bakar Primarasa', 2.00, 60000, 4.50, 3330, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ayam Bakar Primarasa.png'),
(405, 3, 19, 'Cake shop', 'Gg. Lombok No.11, Purwodinatan, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50137', NULL, 'Loenpia Gang Lombok', 3.50, 60000, 4.35, 3922, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Loenpia Gang Lombok.jpg'),
(406, 3, 19, 'Soto restaurant', 'Jl. Brigjen Sudiarto No.75, Joyosuran, Kec. Ps. Kliwon, Kota Surakarta, Jawa Tengah 57156', NULL, 'Soto Gading 1', 103.00, 25000, 4.38, 9313, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(407, 3, 19, 'Straightforward restaurant serving classic Javanese dishes amid bright, traditional decor.', 'Jl. Veteran No.29, Lempongsari, Kec. Gajahmungkur, Kota Semarang, Jawa Tengah 50231', NULL, 'Pesta Keboen Restoran', 2.20, 60000, 4.50, 3713, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pesta Keboen Restoran.jpg'),
(408, 3, 19, 'Indonesian restaurant', 'Jl. Diponegoro No.45, Lempongsari, Kec. Gajahmungkur, Kota Semarang, Jawa Tengah 50231', NULL, 'D\'Kambodja Heritage Dapur Ndeso Anne Avantie', 3.90, 125000, 4.30, 2224, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(409, 3, 19, 'A simple place to eat that serves traditional Solo food, Sop Timlo, and snacks are available', 'Jl. Jend. Urip Sumoharjo No.94, Purwodiningratan, Kec. Jebres, Kota Surakarta, Jawa Tengah 57128', NULL, 'Timlo Solo Restaurant', 102.00, 60000, 4.30, 3350, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(410, 3, 19, 'Restaurant', 'Jl.Tabanan No.4, Tegalsari, Kec. Candisari, Kota Semarang, Jawa Tengah 50614', NULL, 'Koenokoeni Cafe Gallery', 3.80, 90000, 4.40, 5527, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(411, 3, 19, 'Central Javanese restaurant', 'Jl. Arifin No.59, Kepatihan Wetan, Kec. Jebres, Kota Surakarta, Jawa Tengah 57129', NULL, 'Nini Thowong Restaurant', 102.00, 50000, 4.30, 4728, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(412, 3, 19, 'Self-service restaurant dishing up traditional Indonesian grub amid down-to-earth surroundings.', 'Jl. Cendrawasih No.607, Sawah,Ladang, Krakahan, Kec. Tj., Kabupaten Brebes, Jawa Tengah 52254', NULL, 'Rumah Makan Kedung Roso', 183.00, 20000, 4.10, 8187, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(413, 3, 19, 'Satay restaurant', 'Jl. Gajah Mada No.14, Mintaragen, Kec. Tegal Tim., Kota Tegal, Jawa Tengah 52112', NULL, 'Sate Kambing Batibul Bang Awi', 153.00, 50000, 4.30, 1738, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(414, 2, 20, 'Major Buddhist temple complex with numerous buildings, dating from the 8th century.', 'Jl. Raya Solo - Yogyakarta No.KM.16, Bugisan, Kec. Prambanan, Kabupaten Sleman, Daerah Istimewa Yogyakarta', NULL, 'Sewu Temple', 19.00, 10000, 4.66, 4722, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(415, 2, 20, 'Built in the 18th century, this grand palace is still used by Indonesian royalty.', 'Jl. Rotowijayan Blok No. 1, Panembahan, Kecamatan Kraton, Kota Yogyakarta, Daerah Istimewa Yogyakarta', NULL, 'Yogyakarta Palace', 0.60, 25000, 4.52, 39384, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Yogyakarta Palace.jpg'),
(416, 2, 20, 'Architecturally ornate, 18th-century former royal garden with a storied bathing complex.', 'Patehan, Kraton, Yogyakarta City, Special Region of Yogyakarta 55133', 'Has different price for foreign tourist.', 'Water Castle (Tamansari)', 1.50, 5000, 4.52, 43523, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Water Castle (Tamansari).jpg'),
(417, 2, 20, 'Performing arts theater', 'Klurak, Tamanmartani, Kalasan, Sleman Regency, Special Region of Yogyakarta 55571', 'Has different price for foreign tourist.', 'Ramayana Ballet at Prambanan', 17.00, 150000, 4.71, 2612, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(418, 2, 20, 'Archaeological site featuring a mix of Buddhist & Hindu structures, stone temples & caves.', 'Jl. Raya Piyungan - Prambanan No.2, Gatak, Bokoharjo, Kec. Prambanan, Kabupaten Sleman, Daerah Istimewa Yogyakarta 5572', 'Has different price for foreign tourist.', 'Ratu Boko Temple', 17.80, 40000, 4.64, 16072, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(419, 2, 20, 'Hilltop complex of 9th-century temples built on terraces, with views of surrounding farmland.', 'Jl. Candi Ijo, Nglengkong, Sambirejo, Kec. Prambanan, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55572', 'Has different price for foreign tourist.', 'Ijo Temple', 19.90, 7000, 4.75, 1721, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(420, 2, 20, 'Expansive, 9th-century Hindu temple complex featuring structures with stone spires & sculptures.', 'Jl. Raya Solo - Yogyakarta No.16, Kranggan, Bokoharjo, Kec. Prambanan, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55571', 'Has different price for foreign tourist.', 'Prambanan Temples', 17.70, 50000, 4.69, 98295, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Prambanan Temples.jpg'),
(421, 2, 20, 'Artifacts related to the art & culture of Java, plus guided tours, a restaurant & a lush garden.', 'Jl. Boyong No.KM 25, Kaliurang, Hargobinangun, Kec. Pakem, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55582', 'Has different price depending on the tour type, for more information visit https://ullensentalu.com/berkunjung.html', 'Ullen Sentalu Museum', 26.50, 50000, 4.67, 11427, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(422, 1, 20, 'Popular attraction where visitors float into the large cave on inflated tubes.', 'Jalan Goa Pindul Gelaran 2, RT.3/RW.16, Bejiharjo, Kec. Karangmojo, Kabupaten Gunung Kidul, Daerah Istimewa Yogyakarta 55813', 'Has different price depending on the tour type, for more information visit https://goapindul.net/paket-wisata-goa-pindul/', 'Pindul Cave', 44.10, 4000, 4.46, 8169, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pindul Cave.jpg'),
(423, 1, 20, 'Lively public beach offering beach chairs/umbrellas, roaring waves & horse drawn–cart rides.', 'Special Region of Yogyakarta', NULL, 'Parangtritis Beach', 27.50, 10000, 4.59, 15637, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(424, 1, 20, 'Nature-tourism destination offering outdoor games & activities, plus areas for photo opportunities.', 'Jalan Waduk Sermo, Kalibiru, Hargowilis, Kec. Kokap, Kabupaten Kulon Progo, Daerah Istimewa Yogyakarta 55653', NULL, 'Kalibiru National Park', 32.80, 10000, 4.37, 8160, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(425, 1, 20, 'Tall Sumatran Pine trees rise into the heavens at this government-administered forest.', 'Jl raya Jl. Hutan Pinus Nganjir, Mangunan, Kec. Dlingo, Kabupaten Bantul, Daerah Istimewa Yogyakarta 55783', NULL, 'Imogiri Pine Forest', 21.80, 5000, 4.59, 25476, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Imogiri Pine Forest.jpg'),
(426, 1, 20, '9,610-foot active volcano with a hiking trail to its smoking summit & a surrounding National Park.', 'Dusun 2, Suroteleng, Selo, Boyolali Regency, Central Java', NULL, 'Merapi Volcano', 56.10, 15000, 4.44, 5074, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(427, 1, 20, 'Rugged vertical sinkhole cave that can be explored using the caving gear provided on site.', 'Jetis, Pacarejo, Semanu, Gunung Kidul Regency, Special Region of Yogyakarta 55893', 'This attraction may not suited for many person. For more information visit : https://www.goa-jomblang.com/en/tour-package/jomblang-cave-trip', 'Jomblang Cave', 47.50, 500000, 4.57, 1785, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(428, 1, 20, 'White sand beach featuring an island connected to the mainland via a rope bridge & a cable car.', 'Jl. Pantai Sel. Jawa, Pantai, Purwodadi, Kec. Tepus, Kabupaten Gunung Kidul, Daerah Istimewa Yogyakarta 55881', NULL, 'Timang Beach', 71.00, 5000, 4.50, 3632, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Timang Beach.jpg'),
(429, 3, 20, 'Indonesian restaurant', 'Jl. Sartono No.829, Mantrijeron, Kec. Mantrijeron, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55143', NULL, 'Kesuma Restaurant', 2.70, 125000, 4.56, 803, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(430, 3, 20, 'Javanese restaurant', 'Jl. Dagen No.2C, Sosromenduran, Gedong Tengen, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55271', NULL, 'Gudeg Yu Djum', 1.70, 25000, 4.30, 3401, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gudeg Yu Djum.jpg'),
(431, 3, 20, 'Cake shop', 'Kaliurang St No.10A, Manggung, Caturtunggal, Depok, Sleman Regency, Special Region of Yogyakarta 55284', NULL, 'Bakpia Kukus Tugu Jogja', 6.20, 60000, 4.50, 6396, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(432, 3, 20, 'Restaurant', 'Jl. Padokan No.16, Padokan Kidul, Tirtonirmolo, Kec. Kasihan, Kabupaten Bantul, Daerah Istimewa Yogyakarta 55181', NULL, 'Oseng-oseng Mercon Bu Narti', 5.40, 40000, 4.60, 398, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(433, 3, 20, 'Relaxed self-serve restaurant with a down-home ambiance dishing up spicy catfish dishes.', 'Jl. Sewon Indah No.RT.04, Ngireng-ireng, Panggungharjo, Kec. Sewon, Kabupaten Bantul, Daerah Istimewa Yogyakarta 55188', NULL, 'Mangut Lele Dapur Asli Mbok Marto Ijoyo', 7.30, 45000, 4.60, 5900, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(434, 3, 20, 'Soto ayam restaurant', 'Wates St No.33, Kdipiro, Ngestiharjo, Kasihan, Bantul Regency, Special Region of Yogyakarta 55182', NULL, 'Warung Soto Kadipiro Asli', 2.10, 35000, 4.50, 6561, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Warung Soto Kadipiro Asli.jpg'),
(435, 3, 20, 'Soto restaurant', '6CQW+JRF, Sambisari, Purwomartani, Kec. Kalasan, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55571', NULL, 'Saoto Bathok Mbah Katro', 13.20, 20000, 4.50, 13319, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Saoto Bathok Mbah Katro.jpg'),
(436, 3, 20, 'Indonesian restaurant', 'Jl. Magangan Kulon No.1, Panembahan, Kecamatan Kraton, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55131', NULL, 'Bale Raos - The Sultan\'s Dishes', 19.00, 90000, 4.50, 5483, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(437, 2, 21, 'Iconic memorial monument offering a 2-story museum with exhibits on the 1945 Battle of Surabaya.', 'Jl. Pahlawan, Alun-alun Contong, Kec. Bubutan, Surabaya, Jawa Timur 60174', NULL, 'Tugu Pahlawan and Museum 10 November Surabaya', 3.50, 5000, 4.69, 25823, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(438, 2, 21, 'Landmark statue symbolic of Surabaya city, featuring a shark & crocodile tussling amid seaweed.', 'Jl. Diponegoro No.1-B, Darmo, Kec. Wonokromo, Surabaya, Jawa Timur 60241', NULL, 'Suroboyo Statue', 5.90, 0, 4.68, 7164, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Suroboyo Statue.jpg'),
(439, 2, 21, 'Museum featuring a prehistoric animal diorama, life-size dinosaur replicas & educational exhibits.', 'Jl. Raya Oro-Oro Ombo No.9, Temas, Kec. Batu, Kota Batu, Jawa Timur 65314', NULL, 'Wildlife Museum', 105.00, 125000, 4.57, 1453, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(440, 2, 21, 'Resembling the Arc de Triomphe, this iconic monument is a busy gathering spot with cultural venues.', 'Tugurejo, Ngasem, Kediri Regency, East Java 64182', NULL, 'Simpanglima Gumul Monument', 120.00, 0, 4.60, 51845, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Simpanglima Gumul Monument.jpg'),
(441, 2, 21, 'Imposing bi-level temple with Hindu & Buddhist carvings & statues amid walled landscaped gardens.', 'Jl. Kertanegara, Candirenggo, Kec. Singosari, Kabupaten Malang, Jawa Timur 65153', NULL, 'Singosari Temple', 85.20, 0, 4.48, 3712, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(442, 2, 21, 'Whimsical museum featuring scenes & characters from Hollywood movies, plus cars, tanks & mopeds.', 'Jl. Terusan Sultan Agung No.2, Ngaglik, Kec. Batu, Kota Batu, Jawa Timur 65314', NULL, 'Museum Angkut', 98.80, 100000, 4.69, 56585, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(443, 2, 21, 'Sprawling mosque with a bright blue dome, herbal gardens & a tower open to visitors for city views.', 'Jl. Masjid Al-AkbarTimur No.1, Pagesangan, Kec. Jambangan, Surabaya, Jawa Timur 60274', NULL, 'Masjid Nasional Al Akbar', 13.80, 0, 4.88, 6415, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Masjid Nasional Al Akbar.jpg'),
(444, 1, 21, 'Popular white sand beach known for its challenging waves, strong winds & spectacular sunsets.', 'East Java', NULL, 'Pulau Merah Beach', 299.00, 10000, 4.48, 13857, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(445, 1, 21, 'Protected landscape known as Indonesia\'s \'little Africa\' with mountains, savanna & rich wildlife.', 'Area Hutan/Kebun, Sumberwaru, Banyuputih, Situbondo Regency, East Java', NULL, 'Baluran National Park', 262.00, 150000, 4.57, 4327, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(446, 1, 21, 'Palm-fringed sandy beach with rock formations & waves for surfing accessed via a winding road.', 'East Java', NULL, 'Klayar Beach', 297.00, 15000, 4.59, 4019, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(447, 1, 21, 'Small, scenic lake surrounded by hotels & eateries & offering speedboat rentals.', 'Ngluweng, Sarangan, Plaosan, Magetan Regency, East Java', NULL, 'Sarangan Lake', 206.00, 20000, 4.58, 6524, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(448, 1, 21, 'Set of volcanoes featuring the namesake volcano known for its vibrant blue flames of sulfuric gas.', 'East Java', 'Has different price for foreign tourist.', 'Ijen Crater', 260.00, 5000, 4.62, 7577, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ijen Crater.jpg'),
(449, 1, 21, 'Soaring over 2300 meters above sea level, Mount Bromo is the only active volcano inside Java\'s spectacular Tengger Caldera national park.', 'Area Gn. Bromo, Podokoyo, Tosari, Pasuruan Regency, East Java', 'Has different price for foreign tourist.', 'Mount Bromo', 103.00, 29000, 4.66, 14003, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(450, 1, 21, 'Protected mountainous area with 2 active volcanoes rising out of an expansive sea of sand.', 'XXH2+7X4, Ranupani, East Java', 'Has different price for foreign tourist.', 'Bromo Tengger Semeru National Park', 116.00, 35000, 4.79, 44745, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bromo Tengger Semeru National Park.jpg'),
(451, 1, 21, 'Massive, well-known tiered waterfall in a lush canyon, accessible via hiking trail.', 'Jalan Tumpak Sewu, Besukcukit, Sidomulyo, Kec. Pronojiwo, Kabupaten Lumajang, Jawa Timur 67374', 'Hiring a guide is recommended.', 'Tumpak Sewu Waterfall', 155.00, 10000, 4.81, 5242, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(452, 1, 21, '200-m. waterfall with rainlike streams tumbling down the walls of a verdant, cylindrical canyon.', '5228+VC5, Branggah, Sapih, Kec. Lumbang, Kabupaten Probolinggo, Jawa Timur 67183', NULL, 'Madakaripura Waterfall', 107.00, 33000, 4.50, 3509, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(453, 3, 21, 'Javanese restaurant', 'Jl. KHR Abdul Fattah No.88, Botoran, ngemplak, Kabupaten Tulungagung, Jawa Timur 66213', NULL, 'Ayam Lodho Pak Yusuf', 151.00, 35000, 4.30, 1964, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(454, 3, 21, 'East Javanese restaurant', 'Jl. Raden Santri No.19, Bedilan, Kebungson, Kec. Gresik, Kabupaten Gresik, Jawa Timur 61114', NULL, 'Nasi Krawu Mbok Su', 21.20, 30000, 4.40, 274, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(455, 3, 21, 'Javanese restaurant', 'Jl. Raya Sedati Gede No.66, Bono, Sedati Gede, Kec. Sedati, Kabupaten Sidoarjo, Jawa Timur 61253', NULL, 'Bu Nur Aini Rujak Cingur Sedati', 18.80, 30000, 4.30, 981, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(456, 3, 21, 'Soup shop', 'Dusun Kepatihan, Cluring, Banyuwangi Regency, East Java 68482', NULL, 'Rujak Soto Mbok Mbret', 277.00, 35000, 4.50, 980, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(457, 3, 21, 'Noodle shop', 'Jl. KH Ahmad Dahlan No.10, Sukoharjo, Kec. Klojen, Kota Malang, Jawa Timur 65118', NULL, 'Hok Lay Restaurant', 90.10, 55000, 4.40, 4210, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(458, 3, 21, 'Restaurant', 'Kawi St Kios No.43B, Bareng, Klojen, Malang City, East Java 65116', NULL, 'Rumah Makan Pecel Kawi Hj Musilah Asli 1975', 89.80, 35000, 4.30, 5261, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(459, 3, 21, 'Nasi restaurant', 'Jl. Jagir Wonokromo Wetan No.10, Jagir, Kec. Wonokromo, Surabaya, Jawa Timur 60244', NULL, 'Sego Sambel Mak Yeye', 6.40, 30000, 4.30, 9863, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sego Sambel Mak Yeye.jpg'),
(460, 3, 21, 'East Javanese restaurant', 'Ps. Pegirian, Jl. Nyamplungan No.236, Ampel, Kec. Semampir, Surabaya, Jawa Timur 60152', NULL, 'Nasi Babat Pegirian', 4.10, 35000, 4.50, 6376, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Nasi Babat Pegirian.jpg'),
(461, 3, 21, 'East Javanese restaurant', 'Jl. Embong Malang No.38, Genteng, Kec. Genteng, Surabaya, Jawa Timur 60275', NULL, 'Lontong Balap Asli Pak Gendut (Pusat)', 3.50, 30000, 4.10, 1394, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lontong Balap Asli Pak Gendut (Pusat).jpg'),
(462, 3, 21, 'Noodle shop', 'Jalan Gajah Mada, Gang 1, Pandean, Bulusidokare, Kec. Sidoarjo, Kabupaten Sidoarjo, Jawa Timur 61234', NULL, 'Mie Gajah Mada', 23.90, 40000, 4.50, 2405, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(463, 3, 21, 'Indonesian restaurant', 'Jl. Raya Ketengan No.Km.21, Junok, Tunjung, Kec. Burneh, Kabupaten Bangkalan, Jawa Timur 69121', NULL, 'Bebek Sinjay Madura', 29.30, 40000, 4.30, 19540, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(464, 3, 21, 'Indonesian restaurant', 'Jl. Raya Ketegan No.85, Ketengan, Tunjung, Kec. Burneh, Kabupaten Bangkalan, Jawa Timur 69121', NULL, 'Bebek Songkem Pak Salim', 28.50, 35000, 4.30, 3351, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(465, 1, 21, 'Tourist attraction', 'QFW6+2C6, Asemanis Satu, Larangan Tokol, Kec. Tlanakan, Kabupaten Pamekasan, Jawa Timur 69371', NULL, 'Wisata Api Abadi', 110.00, 5000, 4.20, 2157, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Wisata Api Abadi.jpg'),
(466, 3, 22, 'Satay restaurant', 'Jl. Campuhan II, Legian, Kec. Kuta, Kabupaten Badung, Bali 80361', NULL, 'Sate Babi Bawah Pohon', 6.50, 35000, 4.50, 8135, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sate Babi Bawah Pohon.jpg'),
(467, 3, 22, 'Chinese restaurant', 'Jl. Raya Kuta No.530, Tuban, Kec. Kuta, Kabupaten Badung, Bali 80361', NULL, 'Warung Laota Tuban', 9.10, 160000, 4.50, 8164, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(468, 3, 22, 'Seafood restaurant', 'Jalan Hang Tuah No.45, Sanur Kaja, Denpasar Selatan, Jl. Hang Tuah No.51, Sanur Kaja, Denpasar Selatan, Kota Denpasar, Bali 80227', NULL, 'Warung Mak Beng', 5.80, 75000, 4.60, 18475, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Warung Mak Beng.jpg'),
(469, 3, 22, 'Straightforward neighborhood restaurant plating spicy rice dishes & other local specialties.', 'Jl. Raya Kuta No.100, Kuta, Kec. Kuta, Kabupaten Badung, Bali 80361', NULL, 'Nasi Pedas Ibu Andika', 8.60, 40000, 4.20, 5271, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(470, 3, 22, 'Balinese restaurant', 'Jl. Raya Tuban No.2X, Tuban, Kec. Kuta, Kabupaten Badung, Bali 80361', NULL, 'Ayam Betutu Khas Gilimanuk', 9.90, 75000, 4.40, 10354, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ayam Betutu Khas Gilimanuk.jpg'),
(471, 3, 22, 'Indonesian restaurant', 'Jalan Professor Doktor Ida Bagus Mantra No. 300A Keramas, Medahan, Kec. Blahbatuh, Kabupaten Gianyar, Bali', NULL, 'Warong Legong', 18.40, 125000, 4.89, 2375, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(472, 3, 22, 'Indonesian restaurant', 'Jl. Kayu Aya No.17, Seminyak, Kec. Kuta Utara, Kabupaten Badung, Bali 80361', NULL, 'Waroeng Bernadette', 8.20, 125000, 4.91, 3235, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(473, 3, 22, 'Indonesian restaurant', 'Amnaya Resort, Jl. Kartika Plaza Gg. Puspa Ayu No.99, Kuta, Kec. Kuta Sel., Kabupaten Badung, Bali 80361', NULL, 'Sukun Restaurant Kuta', 9.60, 135000, 4.86, 1533, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(474, 2, 22, 'Scenic waterfront venue at Uluwatu Temple, offering traditional Balinese dance shows every day.', 'Kawasan parkir Pura Uluwatu, Jl. Uluwatu, Pecatu, Kec. Kuta Sel., Kabupaten Badung, Bali 80361', NULL, 'Kecak Uluwatu', 28.80, 140000, 4.70, 7726, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(475, 2, 22, 'Traditional Balinese temple located on a small, rocky island & offering water vistas.', 'Beraban, Kediri, Tabanan Regency, Bali 82121', NULL, 'Tanah Lot Temple', 18.80, 75000, 4.53, 102495, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tanah Lot Temple.jpg'),
(476, 2, 22, 'Elegant spiritual retreat & gardens surrounded by natural springs, with swimming & picnicking.', 'HHQQ+836, Jalan Raya Abang Desa Adat Jl. Raya Tirta Gangga, Ababi, Kec. Abang, Kabupaten Karangasem, Bali 80852', NULL, 'Tirta Gangga', 63.10, 35000, 4.58, 21352, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(477, 2, 22, 'Scenic Hindu temple on a lake with gardens, boating & wild animals for photo opportunities.', 'Danau Beratan, Candikuning, Baturiti, Tabanan Regency, Bali 82191', NULL, 'Ulun Danu Bratan Temple', 48.90, 75000, 4.59, 43934, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ulun Danu Bratan Temple.jpg'),
(478, 2, 22, '11th-century temple & funerary complex with 10 rock-cut shrines carved into cliff niches.', 'Sebatu, Tegallalang, Gianyar Regency, Bali 80511', NULL, 'Gunung Kawi Sebatu Temple', 36.10, 30000, 4.57, 3173, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(479, 2, 22, 'Expansive park featuring monumental Hindu sculptures, plus frequent dance performances & concerts.', 'Uluwatu St, Ungasan, South Kuta, Badung Regency, Bali 80364', NULL, 'Garuda Wisnu Kencana Cultural Park', 19.00, 115000, 4.47, 63160, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Garuda Wisnu Kencana Cultural Park.jpg'),
(480, 2, 22, 'Large, holy site featuring 23 temples, including several with soaring spires, plus many festivals.', 'Besakih, Rendang, Karangasem Regency, Bali 80863', 'Has different price for foreign tourist.', 'Besakih Temple', 51.20, 30000, 4.34, 17108, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(481, 1, 22, 'Hindu temple complex set in the jungle, renowned for the macaque monkeys who call it home.', 'Jl. Monkey Forest, Ubud, Kecamatan Ubud, Kabupaten Gianyar, Bali 80571', 'For more information visit : https://monkeyforestubud.com/', 'Sacred Monkey Forest Sanctuary', 21.80, 80000, 4.29, 82448, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(482, 1, 22, 'Volcanic mountain featuring hikes to its summit, plus villages & a scenic lake at its base.', 'South Batur, Kintamani, Bangli Regency, Bali', NULL, 'Mount Batur', 60.90, 10000, 4.50, 6752, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(483, 1, 22, 'Tourist attraction', 'Bunga Mekar, Nusa Penida, Klungkung Regency, Bali 80771', 'Taking a boat to Nusa Penida is required to reach this spot.', 'Kelingking Beach', 45.00, 0, 4.77, 13877, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(484, 1, 22, 'Peaceful white-sand beach fringed by a number of high-end hotels, restaurants & resorts.', 'Bali', NULL, 'Nusa Dua Beach', 19.60, 0, 4.06, 6845, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(485, 1, 22, 'Scenic waterfall in a lush jungle setting above a shallow bathing area, with cafes nearby.', 'Kemenuh, Sukawati, Gianyar Regency, Bali', NULL, 'Tegenungan Waterfall', 17.90, 20000, 4.26, 35738, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(486, 1, 22, 'Bustling sandy stretch lined with restaurants & resorts, a well-known spot for surfing & sunsets.', 'Kuta, Badung Regency, Bali', NULL, 'Kuta Beach - Bali', 8.00, 0, 4.29, 50706, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kuta Beach - Bali.jpg'),
(487, 1, 22, 'Popular, picturesque overlook with scenic views of sunsets & waves crashing over rocky coves.', 'Nusa Lembongan, Jungutbatu, Nusa Penida, Klungkung Regency, Bali 80771', NULL, 'Devil\'s Tears', 30.80, 5000, 4.57, 8788, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(488, 1, 22, 'White-sand cliff- & statue-lined beach for walking, swimming or paddling, with rentable chairs.', 'Bali', NULL, 'Pandawa Beach', 24.30, 8000, 4.43, 13196, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(489, 1, 22, 'Long, narrow white-sand swimming & surfing beach with numerous oceanside seafood restaurants.', 'Jimbaran, South Kuta, Badung Regency, Bali', NULL, 'Jimbaran Beach', 14.00, 0, 4.19, 5833, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Jimbaran Beach.jpg'),
(490, 1, 22, 'Wide sandy beach close to hotels, bars & cafes known for its sunset views & surfable waves.', 'Bali', NULL, 'Legian Beach', 7.90, 0, 4.15, 5046, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Legian Beach.jpg'),
(491, 2, 23, 'Tourist attraction', 'Jl. Raya Kewapante Ohe, Kajowair, Kec. Hewokloang, Kabupaten Sikka, Nusa Tenggara Tim.', 'Taking a ferry / airplane is required.', 'Watublapi Weaving Village', 387.00, 0, 4.67, 81, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Watublapi Weaving Village.jpg'),
(492, 2, 23, 'Tourist attraction', 'Wailiang, Kota Walkabubak, West Sumba Regency, East Nusa Tenggara', 'Taking a ferry / airplane is required. Entrance fee is voluntary start from 5000', 'Tarung Cultural Village', 828.00, 5000, 4.36, 444, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(493, 2, 23, 'Picturesque village with traditional houses, sharing ceremonies, food & overnight experiences.', 'Satar Lenda, Satar Mese Barat, Manggarai Regency, East Nusa Tenggara', 'Getting a tour is recommended. Taking a ferry / airplane is required.', 'Wae Rebo Village', 836.00, 0, 4.65, 1304, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Wae Rebo Village.jpg'),
(494, 2, 23, 'Historical landmark', '4XFP+892, Unnamed Rd, Nusa Tenggara Tim., Tiworiwu, Kec. Jerebuu, Kabupaten Ngada, Nusa Tenggara Tim.', 'Taking a ferry / airplane is required.', 'Bena Traditional Village', 642.00, 20000, 4.57, 1572, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bena Traditional Village.jpg'),
(495, 2, 23, 'Tourist attraction', 'Kampung Belaraghi, Keligejo, Kec. Aimere, Kabupaten Ngada, Nusa Tenggara Tim.', 'Taking a ferry / airplane is required.', 'Belaraghi Village', 680.00, 10000, 11.72, 133, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(496, 1, 23, 'White, pink, and black sand beaches in this small island known for its wildlife and panoramic views.', 'Komodo, West Manggarai Regency, East Nusa Tenggara', 'Getting a tour is recommended. Taking a ferry / airplane is required.', 'Padar Island', 877.00, 7500, 4.94, 2843, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(497, 1, 23, 'Popular island destination for diving & viewing Komodo dragons, the world\'s largest lizards.', 'Komodo, West Manggarai Regency, East Nusa Tenggara', 'Getting a tour is recommended. Has a different price for foreign tourist. Taking a ferry / airplane is required.', 'Komodo Island', 889.00, 300000, 4.19, 1846, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(498, 1, 23, 'Pale pink sandy beach with clear waters & reef teeming with tropical fish & some strong currents.', 'East Nusa Tenggara', 'Has a different price for foreign tourist. Taking a ferry / airplane is required.', 'Pink Beach', 885.00, 10000, 4.77, 3095, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pink Beach.jpg'),
(499, 1, 23, 'Volcano steeped in local myth, with tri-colored crater lakes set in a park with foot & road access.', 'Woloara, Kelimutu, Ende Regency, East Nusa Tenggara', 'Taking a ferry / airplane is required.', 'Mount Kelimutu', 447.00, 0, 4.58, 1032, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mount Kelimutu.jpg'),
(500, 1, 23, 'Also known as Fruit Bat Island, this tiny mangrove islet is home to thousands of giant flying foxes.', 'Komodo, West Manggarai Regency, East Nusa Tenggara', 'Taking a ferry / airplane is required.', 'Kalong (Flying Foxes) Island', 892.00, 0, 4.56, 426, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kalong (Flying Foxes) Island.jpg'),
(501, 1, 23, 'Mountainous national park offering sunrise views & a volcanic peak with colorful crater lakes.', '7Q5V+9CQ, West Detusoko, Detusoko, Ende Regency, East Nusa Tenggara', 'Has a different price for foreign tourist. Taking a ferry / airplane is required.', 'Kelimutu National Park', 476.00, 20000, 4.66, 1833, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(502, 1, 23, 'Tourist attraction', 'Kanawah Island, Pasir Putih, Komodo, West Manggarai Regency, East Nusa Tenggara', 'Taking a ferry / airplane is required.', 'Kanawa Island', 851.00, 10000, 4.10, 852, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(503, 1, 23, 'Small inhabited island in Komodo National Park known for its Komodo dragons & scuba diving.', 'Pasir Panjang, Komodo, West Manggarai Regency, East Nusa Tenggara', 'Taking a ferry / airplane is required.', 'Rinca Island', 877.00, 5000, 4.16, 952, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(504, 1, 23, 'Nature preserve', 'Labuan Bajo, Komodo, West Manggarai Regency, East Nusa Tenggara', 'Taking a ferry / airplane is required.', 'Batu Cermin Cave', 831.00, 10000, 4.13, 1585, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(505, 3, 23, 'Seafood restaurant', 'RG5H+WCW, Alak, Kupang City, East Nusa Tenggara', NULL, 'Warung Artis Kuah Asam Tenau', 11.80, 35000, 4.60, 1947, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(506, 3, 23, 'Seafood restaurant', 'Ir. Soekarno Hatta No.9, Labuan Bajo, Kec. Komodo, Kabupaten Manggarai Barat, Nusa Tenggara Tim.', 'Taking a ferry / airplane is required.', 'Taman Laut Handayani Seafood Restaurant Labuan Bajo', 837.00, 125000, 4.60, 3096, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(507, 3, 23, 'Restaurant', 'Jl. Soekarno Hatta No.15, Labuan Bajo, Kec. Komodo, Kabupaten Manggarai Barat, Nusa Tenggara Tim. 86754', 'Taking a ferry / airplane is required.', 'Hong Signature Restaurant', 839.00, 125000, 4.74, 482, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(508, 3, 23, 'Indonesian restaurant', 'Jl. Alo Tanis, Labuan Bajo, Kec. Komodo, Kabupaten Manggarai Barat, Nusa Tenggara Tim. 86554', 'Taking a ferry / airplane is required.', 'Pondok Mai Ceng\'go Labuan Bajo', 837.00, 75000, 4.60, 1320, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(509, 3, 23, 'Indonesian restaurant', 'Oebufu, Oebobo, Kupang City, East Nusa Tenggara', NULL, 'Sate dan Gulai Yusro 10 Mas Tono', 2.30, 40000, 4.50, 365, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sate dan Gulai Yusro 10 Mas Tono.jpg'),
(510, 3, 23, 'Restaurant', 'Jl. Matani Raya, Penfui Tim., Kec. Kupang Tengah, Kabupaten Kupang, Nusa Tenggara Tim.', NULL, 'SALOME TAMNOS 77', 11.20, 15000, 4.50, 387, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(511, 3, 23, 'Seafood restaurant', 'Jl. Soekarno Hatta, Labuan Bajo, Kec. Komodo, Kabupaten Manggarai Barat, Nusa Tenggara Tim. 86754', 'Taking a ferry / airplane is required.', 'Artomoro Restaurant and Grill', 838.00, 175000, 4.20, 900, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(512, 3, 23, 'Chinese restaurant', 'Jl. Mgr. Van Beakum, Wae Kelambu, Kec. Komodo, Kabupaten Manggarai Barat, Nusa Tenggara Tim.', 'Taking a ferry / airplane is required.', 'Rumah Makan Kellan Eat First', 836.00, 110000, 4.40, 884, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(513, 3, 23, 'Seafood restaurant', 'Jl. Kosasih, Solor, Kec. Kota Lama, Kota Kupang, Nusa Tenggara Tim.', NULL, 'Kuliner Sea Food Kampung Solor', 5.20, 135000, 4.50, 2630, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kuliner Sea Food Kampung Solor.jpg'),
(514, 3, 23, 'Restaurant', 'Jl. Soekarno Hatta, Labuan Bajo, Kec. Komodo, Kabupaten Manggarai Barat, Nusa Tenggara Tim.', 'Taking a ferry / airplane is required.', 'Green Cherry', 839.00, 250000, 3.90, 1662, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(515, 2, 24, 'Tourist attraction', '37VX+F6C, Jl. Beach Walk, Kuta, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83573', NULL, 'Statue of Princess Mandalika', 55.50, 0, 4.09, 163, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(516, 2, 24, 'Clothing store', 'Unnamed Rd No.83561, Sukarara, Kec. Jonggat, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83561', NULL, 'Panji Sari Woman,s Group Weaving Village', 25.20, 0, 3.63, 236, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Panji Sari Woman,s Group Weaving Village.jpg'),
(517, 2, 24, 'Dramatically lit at night, this Islamic prayer & study center combines Arabian & Indonesian designs.', 'Jl. Udayana, Gomong, Kec. Selaparang, Kota Mataram, Nusa Tenggara Bar. 83125', NULL, 'Islamic Center NTB - Hubbul Wathan Great Mosque', 1.20, 0, 4.79, 6019, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Islamic Center NTB - Hubbul Wathan Great Mosque.jpg'),
(518, 2, 24, 'State museum featuring a wide array of traditional Indonesian arts, crafts & wedding costumes.', 'Jl. Panji Tilar Negara No.6, Taman Sari, Kec. Ampenan, Kota Mataram, Nusa Tenggara Bar. 83117', NULL, 'West Nusa Tenggara State Museum', 2.80, 4000, 4.58, 1682, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(519, 2, 24, 'Gift shop', 'Senggigi, Batu Layar, West Lombok Regency, West Nusa Tenggara 83355', NULL, 'Senggigi Art Market', 13.20, 0, 3.39, 51, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Senggigi Art Market.jpg'),
(520, 1, 24, 'Mountainous national park & trekking area with a campground, guided hikes & striking panoramas.', 'Semeru, Senaru, Kec. Bayan, Kabupaten Lombok Utara, Nusa Tenggara Bar. 83354', NULL, 'Mount Rinjani', 91.90, 5000, 4.64, 2296, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(521, 1, 24, 'This small island features a WWII Japanese tunnel, hotels, an Irish pub, diving & more.', 'Gili Indah, Pemenang, North Lombok Regency, West Nusa Tenggara', 'Taking a boat is required to get here.', 'Gili Trawangan Island', 39.00, 0, 4.35, 6196, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gili Trawangan Island.jpeg'),
(522, 1, 24, 'Scenic site showcasing 2 different waterfalls reachable by trails through lush, scenic surrounds.', 'Air Terjun Sendang Gile, Senaru, Kec. Bayan, Kabupaten Lombok Utara, Nusa Tenggara Bar. 83354', NULL, 'Sendang Gile and Tiu Kelep Waterfall', 84.00, 10000, 4.56, 2710, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(523, 1, 24, 'Small, laid-back island featuring a lake & beaches with bungalows, plus diving, snorkeling & cafes.', 'Gili Indah, Pemenang, North Lombok Regency, West Nusa Tenggara', 'Taking a boat is required to get here.', 'Gili Meno Island', 37.10, 0, 4.50, 1578, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gili Meno Island.jpg'),
(524, 1, 24, 'Popular swimming & surfing beach with white sand, clear water & sunbed/umbrella rentals.', 'Selong Belanak, Praya Barat, Central Lombok Regency, West Nusa Tenggara 83572', NULL, 'Selong Belanak Beach', 49.20, 5000, 4.58, 5514, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Selong Belanak Beach.jpg'),
(525, 1, 24, 'White sand & turquoise water feature at this bustling hub for lounging, swimming & boating.', 'West Nusa Tenggara', NULL, 'Tanjung Aan Beach', 53.30, 10000, 4.50, 4942, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(526, 3, 24, 'Indonesian restaurant', 'Jl. Arya Banjargentas No. 88X Ampenan Sekarbela, Tj. Karang, Kec. Ampenan, Kota Mataram, Nusa Tenggara Bar. 83115', NULL, 'Rumah Makan Khas Lombok Tanjung Karang', 5.30, 40000, 4.70, 1520, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(527, 3, 24, 'Indonesian restaurant', 'Jalan Raya Ketara Sengkol, Kecamatan Pujut, Ketara, Praya, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83573', NULL, 'Dapur Sasak Restaurant', 36.80, 60000, 4.40, 339, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(528, 3, 24, 'Seafood restaurant', 'Jl. Langko No.68, Pejeruk, Kec. Ampenan, Kota Mataram, Nusa Tenggara Bar. 83114', NULL, 'Roemah Langko by Putera Lombok', 4.30, 125000, 4.60, 1819, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Roemah Langko by Putera Lombok.jpg'),
(529, 3, 24, 'Chicken restaurant', 'JL. Gelatik No. 2B, Cakranegara, Cakranegara Bar., Kec. Mataram, Kota Mataram, Nusa Tenggara Bar. 83239', NULL, 'Taliwang Khas Pak Udin', 4.30, 75000, 4.50, 2612, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Taliwang Khas Pak Udin.jpg'),
(530, 3, 24, 'Diner', 'Jl. Panca Usaha No.22A, Cilinaya, Kec. Cakranegara, Kota Mataram, Nusa Tenggara Bar. 83239', NULL, 'Kania II Restaurant', 5.20, 40000, 4.30, 1310, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(531, 3, 24, 'Mediterranean restaurant', 'Jl. Raya Kuta No.5, Kuta, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83573', NULL, 'El Bazar Cafe & Restaurant', 49.20, 250000, 4.50, 1388, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(532, 3, 24, 'Compact & relatively undeveloped, visitors to this small island can walk around it in 2 hours.', 'Gili Indah, Pemenang, North Lombok Regency, West Nusa Tenggara', 'Taking a boat is required to get here.', 'Gili Air Island', 34.60, 0, 4.31, 1090, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gili Air Island.jpg'),
(533, 3, 25, 'Bakery', 'Jl. Sultan Botutihe No.29, Ipilo, Kec. Kota Tim., Kota Gorontalo, Gorontalo 96134', NULL, 'Pia Saronde', 1.40, 50000, 4.57, 913, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pia Saronde.jpg'),
(534, 3, 25, 'Seafood restaurant', 'Jalan Yos Sudarso No. 51, Tenda, Kecamatan Hulonthalangi, Kota Gorontalo, Gorontalo 96133', NULL, 'RM Ohara', 3.20, 75000, 4.50, 929, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Ohara.jpg'),
(535, 3, 25, 'Satay restaurant', 'G344+HJ3, Pohe, Hulonthalangi, Gorontalo Regency, Gorontalo 96133', NULL, 'RM Ratu', 5.00, 75000, 4.46, 454, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(536, 3, 25, 'Family restaurant', 'Jl. Sultan Botutihe, Ipilo, Kec. Kota Tim., Kota Gorontalo, Gorontalo', NULL, 'D\'Cozy Can Cook', 1.40, 50000, 4.20, 80, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'D\'Cozy Can Cook.jpg');
INSERT INTO `tour_objects` (`id`, `tour_type_id`, `province_id`, `description`, `location`, `note`, `name`, `distance`, `price`, `rating`, `review`, `created_at`, `updated_at`, `image`) VALUES
(537, 3, 25, 'Seafood restaurant', 'JXFJ+9V8, Kayubulan, Limboto, Gorontalo Regency, Gorontalo 96181', NULL, 'RM Sari Laut Mas Joko', 14.30, 50000, 3.90, 140, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(538, 1, 25, 'Tourist attraction', 'Poduoma, Olele, Kec. Suwawa Tim., Kabupaten Bone Bolango, Gorontalo 96584', 'Recommended to hire a boat and guide to transport you to the right beautiful spots.', 'Olele Beach', 28.10, 0, 4.55, 902, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Olele Beach.jpg'),
(539, 1, 25, 'Island', 'Moluo, Kwandang, North Gorontalo Regency, Gorontalo', 'This is a resort island. Taking a boat is needed to get here.', 'Saronde Island', 74.40, 0, 4.44, 47, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Saronde Island.jpg'),
(540, 1, 25, 'Tourist attraction', 'Botubarani, Kabila Bone, Bone Bolango Regency, Gorontalo 96117', 'Additional price : Boat = Rp80.000/3 person, snorkling equipment = Rp50.000, diving suit = Rp50.000, fish food = Rp20.000/pack', 'Whale Shark Sightseeing Spot', 12.10, 40000, 4.43, 403, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(541, 1, 25, 'Lake', 'Gorontalo Regency, Gorontalo', NULL, 'Limboto Lake', 17.20, 0, 4.09, 154, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Limboto Lake.jpg'),
(542, 1, 25, 'Tourist attraction', 'G74R+3H9, Tulabolo, Suwawa Timur, Bone Bolango Regency, Gorontalo 96584', 'Price detail information can be can be seen here : https://tiket.boganinaniwartabone.org/p/sanctuary-maleo-hungayono', 'Hungayono Forest', 29.40, 5000, 4.68, 15, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(543, 2, 25, 'Round 16th-century fort ruins with panoramic views, built from egg whites, sand & plaster.', 'Dembe I, Kota Barat, Kota Gorontalo, Gorontalo 96181', NULL, 'Otanaha Fortress', 8.70, 10000, 4.38, 2014, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Otanaha Fortress.jpg'),
(544, 2, 25, 'Museum', 'HX2V+JXP, Jl. Usman Isa, Iluta, Kec. Batudaa, Kabupaten Gorontalo, Gorontalo 96271', NULL, 'Soekarno Amphibious Aircraft Landing Museum', 8.80, 5000, 4.28, 151, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(545, 2, 25, 'Mosque', 'MP4C+8RV, Jl. Srikandi, RT.001, Pd. Benda, Kec. Pamulang, Kota Tangerang Selatan, Banten 15416', NULL, 'Baiturrahim Great Mosque', 1.20, 0, 4.79, 1664, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Baiturrahim Great Mosque.jpg'),
(546, 2, 25, 'Monument', 'G3J5+5P5, Tenda, Hulonthalangi, Gorontalo Regency, Gorontalo 96133', NULL, 'Nani Wartabone Monument', 1.80, 0, 4.59, 182, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Nani Wartabone Monument.jpg'),
(547, 1, 26, 'Beach', 'Dusun Pangale, Baurung, Kec. Banggae Tim., Kabupaten Majene, Sulawesi Barat 91412', NULL, 'Pantai Dato Majene', 143.00, 5000, 4.50, 1085, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pantai Dato Majene.jpg'),
(548, 1, 26, 'Tourist attraction', '7WWC+8HX, Mamunyu, Mamuju, Mamuju Regency, West Sulawesi 91511', NULL, 'Tammasapi Waterfall', 6.10, 5000, 4.30, 99, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(549, 1, 26, 'Tourist attraction', 'Strait, Jl. Yos Sudarso, Binanga, Kec. Mamuju, Kabupaten Mamuju, Sulawesi Barat 91511', NULL, 'Anjungan Pantai Manakarra', 0.40, 5000, 4.40, 2135, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Anjungan Pantai Manakarra.jpg'),
(550, 1, 26, 'Tourist attraction', 'Mammi, Binuang, Polewali Mandar Regency, West Sulawesi', NULL, 'Taman Wisata Bahari Polewali Mandar', 195.00, 25000, 4.30, 1171, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(551, 1, 26, 'Tourist attraction', 'C2HM+4C8, Sinyonyoi, Kalukku, Mamuju Regency, West Sulawesi 91561', NULL, 'Lombang Lombang Beach', 27.00, 2000, 4.10, 282, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lombang Lombang Beach.jpg'),
(552, 1, 26, 'Highest point in Mamuju city', '8W32+XG5, Rimuku, Kec. Mamuju, Kabupaten Mamuju, Sulawesi Barat 91511', NULL, 'ANJORO PITU', 3.20, 10000, 4.40, 100, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(553, 3, 26, 'Restaurant', 'Jl. Abdul Malik Pattana Endeng, Simboro, Kec. Mamuju, Kabupaten Mamuju, Sulawesi Barat 91512', NULL, 'RM. Cici', 4.50, 75000, 4.40, 643, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM. Cici.jpg'),
(554, 3, 26, 'Asian restaurant', 'Binanga, Mamuju, Mamuju Regency, West Sulawesi 91511', NULL, 'Gayatri Restaurant', 0.70, 50000, 4.40, 64, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Gayatri Restaurant.jpg'),
(555, 3, 26, 'South Sulawesi restaurant', '8VJV+8G9, Jl. Dr. Sam Ratulangi, Binanga, Kec. Mamuju, Kabupaten Mamuju, Sulawesi Barat 91511', NULL, 'Coto Paraikatte Yamaha', 0.90, 25000, 4.50, 129, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Coto Paraikatte Yamaha.jpg'),
(556, 3, 26, 'Indonesian restaurant', 'JL. HASANUDDIN, LINGK. GALUNG-GALUNG, Lalampanua, Kec. Pamboang, Kabupaten Majene, Sulawesi Barat 91451', NULL, 'Dapur Mandar', 125.00, 75000, 4.50, 506, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(557, 3, 26, 'Diner', '8V8M+GMX, Rimuku, Kec. Mamuju, Kabupaten Mamuju, Sulawesi Barat 91511', NULL, 'Revive Resto &Cafe', 1.80, 50000, 4.60, 74, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(558, 3, 26, 'Cafe', '8V7G+CMH, Jl. Diponegoro, Karema, Kec. Mamuju, Kabupaten Mamuju, Sulawesi Barat 91512', NULL, 'Paddock Cafe & Resto Mamuju', 2.50, 50000, 3.70, 66, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(559, 2, 26, 'Museum', 'Pambusuang, Balanipa, Polewali Mandar Regency, West Sulawesi 91353', NULL, 'Nusa Pustaka Museum and Library', 155.00, 0, 4.40, 78, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Nusa Pustaka Museum and Library.jpg'),
(560, 2, 26, 'Heritage museum', '8VFM+FQ2, Rimuku, Kec. Mamuju, Kabupaten Mamuju, Sulawesi Barat 91511', NULL, 'Rumah Adat Mamuju', 0.70, 10000, 4.40, 227, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Adat Mamuju.jpg'),
(561, 2, 26, 'Museum', 'Jl. Raden Suradi, Pangali-Ali, Kec. Banggae, Kabupaten Majene, Sulawesi Barat', NULL, 'Museum - Ziekenhuis - Mandar Majene', 140.00, 3000, 4.60, 105, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Museum - Ziekenhuis - Mandar Majene.jpg'),
(562, 2, 27, 'Tourist attraction', '4V64+C98, Jl. Pangeran Hidayat, Lere, Kec. Palu Bar., Kota Palu, Sulawesi Tengah 94221', NULL, 'Sou Raja', 9.10, 5000, 4.30, 510, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sou Raja.jpg'),
(563, 2, 27, 'Local history museum', 'Jl. Kemiri No.23, Kamonji, Kec. Palu Bar., Kota Palu, Sulawesi Tengah 94111', 'Has different price for foreign tourist.', 'Museum Negeri Propinsi Sulawesi Tengah', 10.40, 3000, 4.40, 389, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(564, 2, 27, 'Tourist attraction', 'Tim, Tondo, Kec. Palu Tim., Kota Palu, Sulawesi Tengah 94119', NULL, 'Nosarara Nosabatutu Monument', 4.80, 10000, 4.47, 334, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Nosarara Nosabatutu Monument.jpg'),
(565, 2, 27, 'Mosque', '4V83+9HC, Jl. Cumi-Cumi, Lere, Kec. Palu Bar., Kota Palu, Sulawesi Tengah 94111', NULL, 'Arqam Baburahman Floating Mosque', 10.00, 0, 4.60, 449, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Arqam Baburahman Floating Mosque.jpg'),
(566, 1, 27, 'Waterfall', 'Jl. Trans Sulawesi, Salodik, Luwuk, Kabupaten Banggai, Sulawesi Tengah 94716', NULL, 'Salodik Waterfall', 563.00, 2500, 4.56, 611, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(567, 1, 27, 'Beach', 'Jl. Karang Ria, Boneoge, Kec. Banawa, Kabupaten Donggala, Sulawesi Tengah 94351', NULL, 'Pantai Tanjung Karang', 44.50, 0, 4.07, 99, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pantai Tanjung Karang.jpg'),
(568, 1, 27, 'Tourist attraction', '6GXR+59X, Leboni, Pamona Pusalemba, Poso Regency, Central Sulawesi 94663', NULL, 'Saluopa Waterfall', 284.00, 5000, 4.66, 838, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Saluopa Waterfall.jpg'),
(569, 1, 27, 'Lake', 'Danau, Poso Regency, Central Sulawesi', NULL, 'Danau Poso', 314.00, 10000, 4.58, 356, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(570, 1, 27, 'Ravine', 'Kolori, West Lore, Poso Regency, Central Sulawesi', NULL, 'Bada Valley', 334.00, 0, 4.96, 58, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bada Valley.jpg'),
(571, 1, 27, 'National park', 'G5GQ+2H8, Dodolo, Central Sulawesi', 'For more detail information please visit : https://lorelindu.info/?page_id=1236', 'Lore Lindu National Park', 148.00, 5000, 4.42, 172, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(572, 3, 27, 'Restaurant', '3VQ4+3CM, Jl. Pue Bongo, Boyaoge, Kec. Tatanga, Kota Palu, Sulawesi Tengah 94222', NULL, 'Kaledo Stereo', 11.00, 125000, 4.43, 762, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kaledo Stereo.jpg'),
(573, 3, 27, 'Seafood restaurant', 'Jl. Tembang No.23, Lere, Kec. Palu Bar., Kota Palu, Sulawesi Tengah 94111', NULL, 'Rumah Makan Heni Putri Kaili', 9.20, 50000, 4.36, 353, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Heni Putri Kaili.jpg'),
(574, 3, 27, 'Cafe', '3Q6X+C9R, Bungin, Luwuk, Banggai Regency, Central Sulawesi 94711', NULL, 'Cafe Bukit Kasih Sayang', 591.00, 75000, 4.18, 185, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(575, 3, 27, 'Grilled fish restaurant', '6JRW+F58, Jl. Setia Budi, Sangele, Pamona Puselemba, Sangele, Kec. Pamona Utara, Kabupaten Poso, Sulawesi Tengah 94663', NULL, 'Ongga Bale', 268.00, 75000, 4.10, 678, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(576, 3, 27, 'Soup shop', 'Jl. Diponegoro No.75, Lere, Kec. Palu Bar., Kota Palu, Sulawesi Tengah 94221', NULL, 'Rumah Makan Abadi Kaledo', 9.30, 75000, 4.09, 451, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Abadi Kaledo.jpg'),
(577, 2, 28, 'Buddhist temple', '8RWQ+V6C, Jl. Sungen, Kakaskasen Dua, Kec. Tomohon Utara, Kota Tomohon, Sulawesi Utara', NULL, 'Vihara Ekayana', 20.00, 10000, 4.56, 161, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(578, 2, 28, 'Cemetery', 'CX9G+W98, Airmadidi Bawah, Airmadidi, North Minahasa Regency, North Sulawesi', 'Recommended to come here with a tour guide.', 'Waruga Burial Complexes', 26.40, 0, 4.46, 46, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(579, 2, 28, 'Buddhist temple', 'FRVV+JW2, Jl. D. I. Panjaitan, Calaca, Kec. Wenang, Kota Manado, Sulawesi Utara', NULL, 'Ban Hin Kiong Temple', 3.30, 0, 4.58, 668, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ban Hin Kiong Temple.jpg'),
(580, 2, 28, 'Heritage museum', 'Jl. W.R. Supratman No.72, Lawangirung, Kec. Wenang, Kota Manado, Sulawesi Utara 95123', NULL, 'Museum Negeri Provinsi Sulawesi Utara', 2.10, 0, 4.13, 196, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Museum Negeri Provinsi Sulawesi Utara.jpg'),
(581, 2, 28, 'Tourist attraction', 'Batulubang, Lembeh Island, Bitung City, North Sulawesi', 'A boat ride is required to get here.', 'Trikora Monument', 53.00, 0, 4.27, 339, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Trikora Monument.jpg'),
(582, 1, 28, 'Sprawling national park in a picturesque, tropical setting featuring abundant coral & marine life.', 'Kawasan Youth center, Pelabuhan Marina plazaa, Mega mas kawasan, Manado City, North Sulawesi', 'A ferry ride is required to get here; Has different price for foreign tourist. For more information visit : https://tn-bunaken.com/2022/06/08/memantau-aktivitas-pengunjung-di-kawasan-taman-nasional-bunaken/', 'Bunaken National Marine Park', 19.40, 5000, 4.58, 3777, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bunaken National Marine Park.jpg'),
(583, 1, 28, 'National park', 'H557+P9V, Bitung Utara, Batuputih Atas, Kec. Ranowulu, Kota Bitung, Sulawesi Utara', 'Has different price for international tourist', 'Tangkoko National Reserve', 62.10, 2000, 4.45, 244, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(584, 1, 28, 'Iconic volcano peak & popular destination for scenic walks, including hikes along a lava riverbed.', 'Kayawu, Tomohon Utara, Tomohon City, North Sulawesi', NULL, 'Lokon Volcano', 27.70, 5000, 4.62, 299, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(585, 1, 28, 'Narrow waterway & popular scuba diving site features clear, blue waters & vibrant marine life.', 'F66F+C3M, Tandurusa, Aertembaga, Bitung City, North Sulawesi', NULL, 'Lembeh Strait', 53.90, 0, 5.00, 253, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lembeh Strait.jpg'),
(586, 1, 28, 'Hillside prayer site with outdoor statues representing Bible scenes & a striking bunkerlike chapel.', '8VX2+H2G, Kakaskasen Tiga, Tomohon Utara, Tomohon City, North Sulawesi', NULL, 'Mahawu Prayer Hill', 20.70, 3000, 4.68, 972, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(587, 1, 28, 'Color-changing volcanic lake with a sulphur aroma & steaming vents surrounded by lush mountains.', 'Lahendong, Tomohon Selatan, Tomohon City, North Sulawesi', NULL, 'Lake Linau', 29.40, 35000, 4.52, 1077, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(588, 1, 28, 'Large, scenic Indonesian lake offering boat tours & views of the nearby rice paddies & mountains.', 'Minahasa Regency, North Sulawesi', NULL, 'Lake Tondano', 42.60, 4000, 4.41, 487, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(589, 1, 28, 'Asia\'s largest Christ statue is the highlight at this scenic hillside locale with sweeping views.', 'CRQX+53R, Winangun Satu, Malalayang, Manado City, North Sulawesi', NULL, 'Christ Blessing Statue', 6.10, 0, 4.68, 3095, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Christ Blessing Statue.jpg'),
(590, 3, 28, 'Seafood restaurant', 'Kawasan, Mega Mas Jl. Laksda John Lie, Sulawesi Utara', NULL, 'Tuna House Mega Mas', 2.50, 75000, 4.46, 2774, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tuna House Mega Mas.jpg'),
(591, 3, 28, 'Seafood restaurant', 'Jl. Jendral Sudirman No.85, Pinaesaan, Kec. Wenang, Kota Manado, Sulawesi Utara', NULL, 'Raja Oci Restaurant', 2.40, 75000, 4.43, 1218, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(592, 3, 28, 'Manado restaurant', 'Jl. Diponegoro No.9, Lawangirung, Kec. Wenang, Kota Manado, Sulawesi Utara', NULL, 'Rumah Makan Nasi Kuning Saroja Manado', 1.80, 40000, 4.36, 1617, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(593, 3, 28, 'Airy, relaxed venue with shared tables serving classic Indonesian plates from satay to seafood.', 'Jl. Piere Tendean, Titiwungan Utara, Kec. Sario, Kota Manado, Sulawesi Utara', NULL, 'Raja Sate', 2.20, 60000, 4.31, 1434, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Raja Sate.jpg'),
(594, 3, 28, 'Seafood restaurant', 'Jl. Raya Tanawangko Kalasey No.55, Kalasey Satu, Manado, Kalasey Satu, Kec. Mandolang, Kabupaten Minahasa, Sulawesi Utara 95116', NULL, 'City Extra', 9.90, 175000, 4.45, 1909, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(595, 3, 28, 'Seafood restaurant', 'Bahu Mall Complex, Jl. Wolter Monginsidi No.1, Sulawesi Utara', NULL, 'Wisata Bahari Seafood Restaurant', 4.10, 125000, 4.35, 2076, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(596, 3, 28, 'Manado restaurant', 'Jl. Diponegoro No.9, Lawangirung, Kec. Wenang, Kota Manado, Sulawesi Utara', NULL, 'Nasi Kuning Saroja Manado Restaurant', 1.80, 25000, 4.36, 1617, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Nasi Kuning Saroja Manado Restaurant.jpg'),
(597, 2, 29, 'Historical landmark', 'GJR4+VPM, Tomba, Wolio, Bau-Bau City, South East Sulawesi 93717', 'Taking a ferry / airplane is needed.', 'Malige Palace', 221.00, 0, 4.48, 83, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Malige Palace.jpg'),
(598, 2, 29, 'Tourist attraction', 'GJW4+4JP, Murhum, Bau-Bau City, South East Sulawesi 93717 , and GH8M+CV5, Jl. Raya Palagimata, Baadia, Kec. Betoambari, Bau-Bau City, South East Sulawesi 93717', 'Taking a ferry / airplane is needed. This statue is splitted into 2 part, the head and the tail.', 'Dragon Statue', 220.00, 0, 4.39, 63, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Dragon Statue.jpg'),
(599, 2, 29, 'Fortress', 'GJG2+4W6, Jl. Labuke, Melai, Kec. Murhum, Kota Bau-Bau, Sulawesi Tenggara 93713', 'Taking a ferry / airplane is needed.', 'Buton Fortress', 223.00, 5000, 4.60, 1513, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(600, 2, 29, 'Historical landmark', 'JHFR+6RC Liya Togo, Liya Mawi, Wangi-Wangi Sel., Kabupaten Wakatobi, Sulawesi Tenggara 93795', 'Taking a ferry / airplane is needed.', 'Liya Togo Village', 381.00, 20000, 4.34, 79, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(601, 2, 29, 'History museum', '4M25+CVF, Kotano Wuna, Tongkuno, Muna Regency, South East Sulawesi 93652', 'Taking a ferry / airplane is needed.', 'Ancient Relics Site Liang Kobori', 158.00, 0, 4.42, 59, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ancient Relics Site Liang Kobori.jpg'),
(602, 1, 29, 'Popular locale known for its wide sandy beach, shallow turquoise waters & sunset views.', 'South East Sulawesi', 'Taking a ferry / airplane is needed.', 'Nirwana Beach', 230.00, 2000, 4.50, 1140, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(603, 1, 29, 'Island', 'Lasolo, North Konawe Regency, South East Sulawesi', 'Taking a ferry / boat is needed.', 'Labengki Island', 89.00, 0, 4.50, 130, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Labengki Island.jpg'),
(604, 1, 29, 'Tourist attraction', 'QPHW+M27, Sumber Sari, Kec. Moramo, Kabupaten Konawe Selatan, Sulawesi Tenggara 93891', NULL, 'Moramo waterfall', 62.80, 10000, 4.50, 640, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(605, 1, 29, 'Beach', 'Tapulaga, Soropia, Konawe Regency, South East Sulawesi', 'Taking a ferry / boat is needed.', 'Bokori Island', 28.80, 10000, 4.48, 1371, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bokori Island.jpg'),
(606, 1, 29, 'Island reserve with protected coral and marine life and dive sites known for rays and sperm whales.', 'CWPJ+J57, Lentea, South East Sulawesi', 'Taking a ferry / airplane is needed. For more price information please visit : https://tiket.wakatobinationalpark.id/', 'Wakatobi National Park', 372.00, 5000, 4.50, 2180, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Wakatobi National Park.jpg'),
(607, 1, 29, 'Beach', 'Unnamed Rd, Taipa, Kec. Lembo, Kabupaten Konawe Utara, Sulawesi Tenggara 93352', NULL, 'Taipa Beach', 63.30, 5000, 4.37, 230, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(608, 3, 29, 'South Sulawesi restaurant', 'XGGM+QVF, Mokoau, Kambu, Kendari City, South East Sulawesi 93231', NULL, 'RM. Coto Jeneberang Kendari', 9.80, 30000, 4.60, 653, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(609, 3, 29, 'South Sulawesi restaurant', '2GP3+58G, Tobuuha, Puuwatu, Kendari City, South East Sulawesi 93115', NULL, 'RM Pangkep Punggolaka', 6.00, 70000, 4.40, 802, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(610, 3, 29, 'Seafood restaurant', '2G9C+HP7, Jl. Brigjen M. Yoenoes, Bende, Kec. Kadia, Kota Kendari, Sulawesi Tenggara 93461', NULL, 'RM Angkasa Nikmat', 2.60, 65000, 4.30, 1359, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Angkasa Nikmat.jpg'),
(611, 3, 29, 'Seafood restaurant', 'Samping Bundaran, Jl. Bypass, Jl. Tapak Kuda, Korumba, Kec. Mandonga, Kota Kendari, Sulawesi Tenggara 93111', NULL, 'Pondok Seafood Kikil Dan Steak Kendari', 4.20, 40000, 4.40, 542, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(612, 3, 29, 'Steak house', 'Jl. Saranani No.65A, Korumba, Kec. Mandonga, Kota Kendari, Sulawesi Tenggara 93111', NULL, 'Progrill Steak & Resto', 4.50, 75000, 4.40, 2062, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Progrill Steak & Resto.jpg'),
(613, 3, 29, 'Buffet restaurant', '2GFG+5FG, Jl. Buburanda, Korumba, Lepo-Lepo, Kec. Mandonga, Kota Kendari, Sulawesi Tenggara 93231', NULL, 'Rumah Makan Ibu Dina', 3.40, 40000, 4.40, 965, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Ibu Dina.jpg'),
(614, 3, 29, 'Indonesian restaurant', 'Kompleks Pier No. 29, Bende, Kadia, Bende, Kec. Kadia, Kota Kendari, Sulawesi Tenggara 93111', NULL, 'PIER 29 Resto & Cafe', 3.10, 75000, 4.40, 778, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(615, 3, 30, 'South Sulawesi restaurant', 'Jl. Gn. Lompobattang No.41-43, Pisang Utara, Kec. Ujung Pandang, Kota Makassar, Sulawesi Selatan 90115', NULL, 'Sop Konro Karebossi', 5.50, 75000, 4.38, 8497, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sop Konro Karebossi.jpg'),
(616, 3, 30, 'Lounge', 'Jl. Ujung Pandang No.8, Bulo Gading, Kec. Ujung Pandang, Kota Makassar, Sulawesi Selatan 90111', NULL, 'Gravity Sky Lounge', 6.90, 175000, 4.68, 1037, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(617, 3, 30, 'South Sulawesi restaurant', 'Jl. Serigala No.54, Mamajang Dalam, Kec. Mamajang, Kota Makassar, Sulawesi Selatan 90132', NULL, 'Pallu Basa Serigala', 3.70, 40000, 4.60, 16344, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pallu Basa Serigala.jpg'),
(618, 3, 30, 'South Sulawesi restaurant', 'Jl. Nusantara Baru No.86, Pattunuang, Kec. Wajo, Kota Makassar, Sulawesi Selatan 90173', NULL, 'Coto Nusantara', 7.50, 40000, 4.50, 3935, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Coto Nusantara.jpg'),
(619, 3, 30, 'Casual seafood joint serving Indonesian-style grilled fish, crab, clams & more in bright, cozy digs.', 'Jl. Boulevard No.52, Masale, Kec. Panakkukang, Kota Makassar, Sulawesi Selatan 90231', NULL, 'Rumah Makan Seafood Apong', 2.10, 75000, 4.50, 4196, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(620, 3, 30, 'Restaurant', 'Mall Phinisi Point, Jl. Metro Tj. Bunga No.2, Panambungan, Kec. Mariso, Kota Makassar, Sulawesi Selatan 90121', NULL, 'Lontar Dining Restaurant', 7.20, 185000, 5.00, 640, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(621, 3, 30, 'Chinese restaurant', 'Mall Phinisi Point, Jalan Metro Tanjung Bunga No.2 Upper Ground (Mall Phinisi Point), Panambungan, Mariso, Kp. Buyang, Kec. Mariso, Kota Makassar, Sulawesi Selatan 90121', NULL, 'Sunachi Harbour', 7.30, 110000, 4.76, 758, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(622, 1, 30, 'Beach', 'South Sulawesi', NULL, 'Losari Beach', 6.50, 0, 4.35, 5881, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Losari Beach.jpg'),
(623, 1, 30, 'Tourist attraction', 'FC6X+XRG, Ara, Bontobahari, Bulukumba Regency, South Sulawesi', NULL, 'Apparalang Cape', 183.00, 10000, 4.65, 2572, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(624, 1, 30, 'Tourist attraction', 'Rammang Rammang 3JM6+VW9 Salenrang, Bontua, Bontonlempangan, Kabupaten Maros, Sulawesi Selatan 90561', NULL, 'Karst Maros', 46.80, 5000, 4.70, 2204, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(625, 1, 30, 'National park', '5RXF+G9H, Bentenge, South Sulawesi', 'Has different price for foreign tourist.', 'Bantimurung National Park', 98.80, 30000, 4.38, 12663, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bantimurung National Park.jpg'),
(626, 1, 30, 'Tourist attraction', 'FC7X+2W3, Dusun Kadien, Desa Ara, Kecamatan Bonto Bahari, Ara, Kec. Bonto Bahari, Kabupaten Bulukumba, Sulawesi Selatan', NULL, 'Apparalang Beach', 183.00, 5000, 4.68, 760, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(627, 1, 30, 'Island', 'Selayar Islands Regency, South Sulawesi', 'This place is on an island, so a ferry/boat ride is needed.', 'Selayar Beach', 247.00, 0, 4.50, 579, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Selayar Beach.jpg'),
(628, 1, 30, 'Beach', 'Jalan Tanjung Bunga, Tj. Merdeka, Kec. Tamalate, Kota Makassar, Sulawesi Selatan 90224', NULL, 'Akkarena Beach', 8.10, 10000, 4.17, 2936, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(629, 1, 30, 'Terrace lookout point over a mountain landscape renowned for its blanket of fog at sunrise.', 'Benteng Mamulu, Kapala Pitu, North Toraja Regency, South Sulawesi 91854', NULL, 'Lolai Tongkonan Lempe', 319.00, 15000, 4.60, 3273, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(630, 2, 30, 'Tourist attraction', 'XVPG+483, Lembang Sangbua, Kesu, Tadongkon, Kec. Kesu, Kabupaten Toraja Utara, Sulawesi Selatan 91852', 'There are additional fee for guide and rental torch.', 'Londa Burial Caves', 309.00, 15000, 4.51, 2281, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(631, 2, 30, 'Tourist attraction', '3WC3+6M3, Butu Lobo, Sesean, North Toraja Regency, South Sulawesi 91853', NULL, 'Bori\' Parinding', 323.00, 10000, 4.53, 86, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(632, 2, 30, 'Cemetery', 'VCWW+R6V, Jl. Sultan Abdullah Raya belakang makam raja, raja, Kec. Tallo, Kota Makassar, Sulawesi Selatan 90212', NULL, 'Tallo Kings Cemetery Complex', 9.30, 0, 4.48, 352, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tallo Kings Cemetery Complex.jpg'),
(633, 2, 30, 'Set in a traditional Bugis structure, this museum showcases sacred artifacts from Gowa history.', 'Jl. K. H. Wahid Hasyim No.39, Sungguminasa, Kec. Somba Opu, Kabupaten Gowa, Sulawesi Selatan 92111', 'Entry fee number is voluntary.', 'Balla Lompoa Museum', 7.00, 0, 4.50, 2082, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Balla Lompoa Museum.jpg'),
(634, 2, 30, 'Tourist attraction', 'Rammang Rammang 3JM6+VW9 Salenrang, Bontua, Bontonlempangan, Kabupaten Maros, Sulawesi Selatan 90561', NULL, 'Rammang-Rammang Village', 46.80, 5000, 4.68, 2340, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(635, 2, 30, 'Built in the shape of a sea turtle, this 17th-century Dutch fort houses Indonesian history exhibits.', 'No.Road, Jl. Ujung Pandang, Bulo Gading, Kec. Ujung Pandang, Kota Makassar, Sulawesi Selatan 90171', NULL, 'Fort Rotterdam', 7.40, 5000, 4.43, 14375, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Fort Rotterdam.jpg'),
(636, 2, 30, 'Tourist attraction', '2W36+W6Q, Unnamed Road, Pantanakan Lolo, Kec. Kesu, Kabupaten Toraja Utara, Sulawesi Selatan 91834', 'Has a different price for foreign tourist.', 'Kete Kesu Village', 316.00, 5000, 4.60, 6550, '2025-05-01 17:00:00', '2025-05-01 17:00:00', NULL),
(637, 1, 31, 'Volcano', 'Kie Ici, Ibu, West Halmahera Regency, North Maluku', NULL, 'Mount Ibu', 142.00, 11000, 4.43, 42, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mount Ibu.jpg'),
(638, 1, 31, 'Lake', 'Takome, Pulau Ternate, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Lake Tolire Besar', 36.40, 0, 4.45, 317, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lake Tolire Besar.jpg'),
(639, 1, 31, 'Black-sand beach in tree-ringed cove with calm, clear water for swimming & snorkeling.', 'Sulamadaha, Pulau Ternate, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Sulamadaha beach', 31.40, 0, 4.32, 623, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Sulamadaha beach.jpg'),
(640, 1, 31, 'Lake', 'Ternate Selatan, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Ngade Lake', 25.00, 5000, 4.50, 152, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ngade Lake.jpg'),
(641, 1, 31, 'Beach', 'Jl. Pertamina Tobelo Selatan, Halmahera, Kabupaten Halmahera Utara, Maluku Utara', NULL, 'Kupa-Kupa Beach', 183.00, 20000, 4.34, 122, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kupa-Kupa Beach.jpg'),
(642, 1, 31, 'Tourist attraction', 'R9V7+X8J, Jl. Pertamina, Kulaba, Kec. Pulau Ternate, Kota Ternate, Maluku Utara', NULL, 'Batu Angus Ternate', 27.00, 2000, 4.44, 892, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Batu Angus Ternate.jpg'),
(643, 2, 31, 'Fortress', 'Q96F+V6W, Kayu Merah, Ternate Selatan, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Kalamata Fort', 22.60, 3000, 4.34, 785, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kalamata Fort.jpg'),
(644, 2, 31, 'Mosque', 'Q9QR+M7P, Gamalama, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Al Munawwaroh Ternate Great Mosque', 21.00, 0, 4.70, 1550, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Al Munawwaroh Ternate Great Mosque.jpg'),
(645, 2, 31, 'Fortress', 'R97Q+G7M, North Sangaji, Kota Ternate Utara, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Fort Tolukko', 23.40, 10000, 4.48, 1000, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Fort Tolukko.jpg'),
(646, 2, 31, 'Local history museum', 'R92M+6J7, Salero, Kota Ternate Utara, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Ternate Sultanate Museum', 22.70, 0, 4.49, 903, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ternate Sultanate Museum.jpg'),
(647, 3, 31, 'Indonesian restaurant', 'Q9VQ+WX6, East Makassar, Ternate Tengah, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Ci Yati Popeda & Ikan Bakar Restaurant', 21.60, 40000, 4.60, 233, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ci Yati Popeda & Ikan Bakar Restaurant.jpg'),
(648, 3, 31, 'Padang restaurant', 'Q9PM+GW5, Jl. Kemuning, Stadion, Kec. Ternate Tengah, Kota Ternate, Maluku Utara', 'Ferry/boat ride is needed.', 'RM.D\'TACTICHA', 20.80, 35000, 4.10, 176, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM.D\'TACTICHA.jpg'),
(649, 3, 31, 'Grilled fish restaurant', 'Kompleks, Jl. Pohon Pala Jl. Wijaya Kusuma, RT.02/RW.01, Baru City, Ternate Tengah, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Rumah Makan Baghdad', 20.00, 35000, 4.30, 352, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Baghdad.jpg'),
(650, 3, 31, 'Restaurant', 'Jl. Ahmad Yani No.1, Kota Baru, Kec. Ternate Tengah, Kota Ternate, Maluku Utara', 'Ferry/boat ride is needed.', 'Rasa Rica Resto', 20.00, 35000, 4.10, 58, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rasa Rica Resto.jpg'),
(651, 3, 31, 'Seafood restaurant', 'Q9QM+GPV, Kalumpang, Ternate Tengah, Ternate City, North Maluku', 'Ferry/boat ride is needed.', 'Pondok Katu Ternate', 20.80, 125000, 4.40, 508, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pondok Katu Ternate.jpg'),
(652, 2, 32, 'Mosque', 'C37M+WMG, Kaitetu, Leihitu, Central Maluku Regency, Maluku', NULL, 'Wapauwe Mosque', 17.20, 0, 4.74, 44, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Wapauwe Mosque.jpg'),
(653, 2, 32, 'Museum', 'Haria, Saparua, Central Maluku Regency, Maluku', 'Entry fee is voluntary.', 'House Of Pattimura', 58.90, 0, 4.00, 4, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'House Of Pattimura.jpg'),
(654, 2, 32, 'Monument', '856R+XWW, Kel Amantelu, Sirimau, Kota Ambon, Maluku', NULL, 'Monumen Martha Christina Tiahahu', 10.70, 5000, 4.55, 165, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Monumen Martha Christina Tiahahu.jpg'),
(655, 2, 32, 'Fortress', 'Saparua, Central Maluku Regency, Maluku', 'Taking a ferry is required', 'Fort Duurstede', 65.00, 0, 4.49, 264, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Fort Duurstede.jpg'),
(656, 2, 32, 'Fortress', '9Q38+R42, Sila, Nusa Laut, Central Maluku Regency, Maluku', 'Taking a ferry is required', 'Beverwijk Fortress', 72.50, 25000, 4.48, 18, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Beverwijk Fortress.jpg'),
(657, 1, 32, 'Beach', 'Tial, Salahutu, Central Maluku Regency, Maluku', NULL, 'Pasir Panjang Beach', 21.90, 10000, 4.27, 132, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pasir Panjang Beach.jpg'),
(658, 1, 32, 'Beach', 'Jl. Kabupaten, Kec. Seram Utara, Kabupaten Maluku Tengah, Maluku', 'Taking a ferry is required', 'Ora Beach', 137.00, 0, 4.64, 321, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ora Beach.jpg'),
(659, 1, 32, 'Beach', 'Jalan Propinsi, Liang, Salahutu, Kabupaten Maluku Tengah, Maluku', NULL, 'Liang Beach', 38.30, 10000, 4.48, 1266, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Liang Beach.jpg'),
(660, 1, 32, 'Island', 'Dullah Laut, Pulau Dullah Utara, Tual City, Maluku', 'Hiring / taking a boat is needed', 'Bair Island', 543.00, 0, 4.72, 40, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bair Island.jpg'),
(661, 3, 32, 'Store', '86P3+H55, Jl. PHB Halong Atas, Hative Kecil, Kec. Sirimau, Kota Ambon, Maluku', NULL, 'Ikan Asar Galala', 4.20, 35000, 4.20, 21, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Ikan Asar Galala.jpg'),
(662, 3, 32, 'Restaurant', '853M+V56, Jl. Dana Kopra No.16, Uritetu, Kec. Sirimau, Kota Ambon, Maluku 97124', NULL, 'Dapor Kole Kole', 11.10, 85000, 4.40, 554, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Dapor Kole Kole.jpg'),
(663, 3, 32, 'Ikan bakar restaurant', 'Jl. Anthony Rebok No.19, RT.1/RW.5, Kel Honipopu, Kec. Sirimau, Kota Ambon, Maluku', NULL, 'RM Sari Rasa', 11.30, 85000, 4.30, 432, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Sari Rasa.jpg'),
(664, 3, 32, 'Restaurant', 'Jl. Diponegoro No.26, Kel Ahusen, Kec. Sirimau, Kota Ambon, Maluku', NULL, 'Rumah Makan New Ratu Gurih', 11.50, 125000, 4.40, 369, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan New Ratu Gurih.jpg'),
(665, 3, 32, 'Cafe', '852J+V96, Said Perintah, Kel Ahusen, Kec. Sirimau, Kota Ambon, Maluku', NULL, 'Rumah Kopi Sibu Sibu, Ambon', 11.20, 25000, 4.40, 923, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Kopi Sibu Sibu, Ambon.jpg'),
(666, 3, 32, 'Hawker stall', 'Jl. Suli Raya, Suli, Kec. Salahutu, Kabupaten Maluku Tengah, Maluku', NULL, 'Rujak Natsepa', 17.70, 20000, 4.60, 612, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rujak Natsepa.jpg'),
(667, 1, 33, 'Christian enclave with a beach, a modern, triangular church & a huge, hilltop Christ statue.', 'Mansinam, Manokwari Timur, Manokwari Regency, West Papua', 'Taking/hiring a boat is needed.', 'Mansinam Island', 8.00, 5000, 4.33, 95, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mansinam Island.jpg'),
(668, 1, 33, 'Beach pavilion', '44PG+QP2, Sunsweni, Manokwari Barat, Manokwari Regency, West Papua 98313', NULL, 'Bakaro Beach', 11.90, 20000, 4.50, 214, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bakaro Beach.jpg'),
(669, 1, 33, 'Beach', 'Jl. Pasir Putih, Pasir Putih, Kec. Manokwari Tim., Kabupaten Manokwari, Papua Bar. 98313', NULL, 'Pantai Pasir Putih', 7.30, 0, 4.30, 417, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pantai Pasir Putih.jpg'),
(670, 1, 33, 'Beach', '32HV+8RJ, Sowi, Manokwari Selatan, Manokwari Regency, West Papua 98315', NULL, 'Dosa Beach', 10.00, 10000, 4.10, 136, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Dosa Beach.jpg'),
(671, 3, 33, 'Restaurant', 'Sekolah Yapis, Reremi Dekat, Jl. S. Condronegoro, Manokwari Bar., Kec. Manokwari Bar., Kabupaten Manokwari, Papua Bar. 98312', NULL, 'HOKKY resto', 0.40, 75000, 3.50, 22, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'HOKKY resto.jpg'),
(672, 3, 33, 'Restaurant', 'Jl. Merdeka No.57, Padarni, Kec. Manokwari Bar., Kabupaten Manokwari, Papua Bar. 98312', NULL, 'Billy Cafe', 2.00, 60000, 4.20, 293, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Billy Cafe.jpg'),
(673, 3, 33, 'Restaurant', 'Jl. Pasir Putih No.33, Pasir Putih, Kec. Manokwari Tim., Kabupaten Manokwari, Papua Bar. 98313', NULL, 'Inggandi Beach Resto & Cafe', 5.40, 110000, 4.30, 609, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Inggandi Beach Resto & Cafe.jpeg'),
(674, 3, 33, 'Restaurant', '43F2+G88, Jl. Trikora Rendani, Wosi, Kec. Manokwari Bar., Kabupaten Manokwari, Papua Bar. 98312', NULL, 'Oriestom Cafe & Restaurant', 3.60, 85000, 4.30, 346, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Oriestom Cafe & Restaurant.jpg'),
(675, 3, 33, 'Restaurant', '43P2+XXP, Jl. Trikora Wosi, Wosi, Kec. Manokwari Bar., Kabupaten Manokwari, Papua Bar. 98312', NULL, 'Rumah Makan Pangkep', 2.00, 90000, 4.20, 235, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Pangkep.jpg'),
(676, 1, 34, 'Beach', 'Tablasupa, Depapre, Jayapura Regency, Papua 99353', 'Need to rent/hire a boat and guide to get here.', 'Harlem Beach', 57.60, 10000, 4.59, 270, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Harlem Beach.jpg'),
(677, 1, 34, 'Tourist attraction', '8GQQ+MV4, Atabar, Ebungfau, Jayapura Regency, Papua 99359', NULL, 'Lake Emfote (Love Lake)', 35.60, 20000, 4.31, 201, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lake Emfote (Love Lake).jpg'),
(678, 1, 34, 'Tourist attraction', 'Doyo Lama, Waibu, Jayapura Regency, Papua 99352', NULL, 'Bukit Teletubbies Kabupaten Jayapura', 31.70, 50000, 4.50, 1426, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bukit Teletubbies Kabupaten Jayapura.jpg'),
(679, 1, 34, 'Beach', 'Tanjung Ria, Jayapura Utara, Jayapura City, Papua', NULL, 'Base-G Beach', 18.50, 10000, 4.24, 1153, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Base-G Beach.jpg'),
(680, 2, 34, 'Ethnographic museum', 'Baru City, Abepura, Jayapura City, Papua 99351', NULL, 'Museum Loka Budaya', 3.90, 0, 4.50, 97, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Museum Loka Budaya.jpg'),
(681, 2, 34, 'Tourist attraction', '9VQ2+9P8, Skow Yambe, Muara Tami, Jayapura City, Papua 99351', NULL, 'Skow Village', 39.40, 0, 4.38, 49, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Skow Village.jpg'),
(682, 2, 34, 'Monument', '9RCP+93H, Skow Yambe, Muara Tami, Jayapura City, Papua 99351', NULL, 'Dispela Monument', 39.40, 0, 4.50, 2, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Dispela Monument.jpg'),
(683, 3, 34, 'Seafood restaurant', 'Jl. Koti, Numbai, Distrik Jayapura Selatan, Kota Jayapura, Papua 99222', NULL, 'Rumah Laut Cafe & Restaurant', 11.70, 110000, 4.47, 1500, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Laut Cafe & Restaurant.jpg'),
(684, 3, 34, 'Coffee shop', 'Jalan kasuari no.2 Dok V Atas, Mandala, Jayapura Utara, Jayapura City, Papua 99114', NULL, 'Pit\'s Corner', 14.20, 40000, 4.40, 1111, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pit\'s Corner.jpg'),
(685, 3, 34, 'Seafood restaurant', 'CJ63+H23, Jl. Raya Abepura - Sentani, Asei Kecil, Kec. Sentani Tim., Kabupaten Jayapura, Papua 99351', NULL, 'Yougwa Restaurant', 12.40, 90000, 4.38, 761, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Yougwa Restaurant.jpg'),
(686, 3, 34, 'Seafood restaurant', 'Jl. Raya Abepura-Kotaraja Kota Baru, Wai Mhorock, Kec. Abepura, Kota Jayapura, Papua 99225', NULL, 'Rumah Makan Sendok Garpu Jayapura', 2.90, 60000, 4.30, 1360, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Sendok Garpu Jayapura.jpg'),
(687, 1, 35, 'Huge marine park popular for snorkeling around coral reefs & swimming with resident whale sharks.', 'FF2H+P92, Sobei Indah, Duairi, Teluk Wondama Regency, West Papua 98362', 'Has different price for foreign tourist.', 'Cenderawasih Bay National Park', 0.00, 1500, 4.32, 293, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Cenderawasih Bay National Park.jpg'),
(688, 1, 35, 'Beach', 'Jl. Christian Waray, Sanoba, Distrik Nabire, Kabupaten Nabire, Papua 98816', NULL, 'Wisata Pantai Gedo', 11.80, 10000, 3.90, 153, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Wisata Pantai Gedo.jpg'),
(689, 1, 35, 'Tourist attraction', 'Unnamed Road, Tlk. Kimi, 98818, Air Mandidi, Distrik Tlk. Kimi, Kabupaten Nabire, Papua 98818', NULL, 'Pantai Monalisa', 22.10, 20000, 4.10, 85, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pantai Monalisa.jpg'),
(690, 1, 35, 'National reserve', 'MRR9+636, Urumusu, Uwapa, Nabire Regency, Papua 98853', NULL, 'Niagara Bihewa', 35.00, 20000, 4.40, 23, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Niagara Bihewa.jpg'),
(691, 1, 35, 'Tourist attraction', 'MJ9J+MGV, Air Mandidi, Teluk Kimi, Nabire Regency, Papua', NULL, 'Telaga MAMAE', 14.70, 20000, 4.30, 3, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Telaga MAMAE.jpg'),
(692, 3, 35, 'Restaurant', 'Jl. Medan Dalam, Karang Mulia, Distrik Nabire, Kabupaten Nabire, Papua', NULL, 'Morning Order Cafe', 1.60, 40000, 4.80, 44, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Morning Order Cafe.jpg'),
(693, 3, 35, 'Restaurant', 'JGH2+695, Morgo, Nabire, Nabire Regency, Papua 98811', NULL, 'Bebek Lombok Ijo', 1.10, 60000, 4.20, 203, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bebek Lombok Ijo.jpg'),
(694, 3, 35, 'Ikan bakar restaurant', 'JGQ4+RF6, Jl. Kupang, Kali Susu, Distrik Nabire, Kabupaten Nabire, Papua 98811', NULL, 'RM Sari Kuring', 3.20, 75000, 4.30, 210, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'RM Sari Kuring.jpg'),
(695, 3, 35, 'Restaurant', 'JGR6+389, JL. Pemuda, Oyehe, Karang Mulia, Distrik Nabire, Kabupaten Nabire, Papua 98816', NULL, 'Nusantara Restaurant', 3.20, 50000, 3.90, 36, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Nusantara Restaurant.jpg'),
(696, 2, 36, 'Traditional Village', 'Pugima, Walelagama, Jayawijaya Regency, Papua', NULL, 'Pugima - Traditional Village', 29.50, 0, 5.00, 5, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pugima - Traditional Village.jpg'),
(697, 2, 36, 'Tourist attraction', '2WMR+PCF, Jiwika, Kurulu, Jayawijaya Regency, Papua 99554', NULL, 'Mummy of Jiwika', 34.80, 0, 3.54, 49, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mummy of Jiwika.jpg'),
(698, 2, 36, 'Tourist attraction', 'XX75+H2P, Aikima, Kurulu, Jayawijaya Regency, Papua', NULL, 'Mummy of Akima', 26.20, 0, 4.14, 15, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Mummy of Akima.jpg'),
(699, 1, 36, 'Cave', '3W33+83P, Milima, Kurulu, Jayawijaya Regency, Papua 99554', NULL, 'Contilola Cave', 39.70, 0, 3.83, 16, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Contilola Cave.jpg'),
(700, 1, 36, 'Lake', 'Tailarek, Asotipo, Jayawijaya Regency, Papua', NULL, 'Lake Habbema', 55.30, 0, 4.57, 40, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Lake Habbema.jpg'),
(701, 1, 36, 'Tourist attraction', 'XX73+82H, Aikima, Kurulu, Jayawijaya Regency, Papua 99566', NULL, 'Pasir Putih Wamena', 25.90, 0, 4.80, 50, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Pasir Putih Wamena.jpg'),
(702, 1, 36, 'Tourist attraction', 'WW84+Q98, Honelama, Wamena, Jayawijaya Regency, Papua 99511', NULL, 'Kebun Raya Wamena', 16.10, 0, 4.30, 53, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Kebun Raya Wamena.jpg'),
(703, 3, 36, 'Bakso restaurant', 'Jl. SD. Percobaan, Kama, Distrik Wamena, Kabupaten Jayawijaya, Papua 99511', NULL, 'Bakso Wiguna', 21.70, 25000, 4.20, 75, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Bakso Wiguna.jpg'),
(704, 3, 36, 'Restaurant', 'Jl. Jenderal Sudirman, Hurekama, Distrik Wamena, Kabupaten Jayawijaya, Papua 99511', NULL, 'Rumah Makan Fakhira', 21.30, 40000, 4.00, 348, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Fakhira.jpg'),
(705, 3, 36, 'Padang restaurant', 'WW2R+34C, Jl. Yos Sudarso, Hurekama, Distrik Wamena, Kabupaten Jayawijaya, Papua 99511', NULL, 'Rumah Makan Minang Jaya', 21.10, 40000, 4.30, 38, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Minang Jaya.jpg'),
(706, 3, 36, 'Indonesian restaurant', 'WW5W+P42, Wamena Kota, Wamena, Jayawijaya Regency, Papua 99511', NULL, 'Blambangan', 22.40, 75000, 3.70, 38, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Blambangan.jpg'),
(707, 1, 37, 'Beach', 'F9QH+H3G, Jl. Menara Lampu Satu, Samkai, Kec. Merauke, Kabupaten Merauke, Papua Selatan 99614', NULL, 'The Lamp One Beach', 4.10, 5000, 4.20, 305, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'The Lamp One Beach.jpg'),
(708, 1, 37, 'Vast, protected savannah & swamp forest habitat for many bird species, plus wallabies & crocodiles.', '9RXM+PFV, Rawa Biru, Sota, Merauke Regency, Papua', NULL, 'Wasur National Park', 67.30, 20000, 4.17, 55, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Wasur National Park.jpg'),
(709, 2, 37, 'Tourist attraction', 'H2C8+V99, Jl. Poros, Sota, Kec. Sota, Kabupaten Merauke, Papua', NULL, 'Tugu 0 Kilometer Merauke Sabang', 76.30, 0, 4.69, 675, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tugu 0 Kilometer Merauke Sabang.jpg'),
(710, 2, 37, 'Memorial park', 'HXGX+X8Q, Sota, Merauke Regency, Papua 99656', NULL, 'Tugu Kembar Sabang - Merauke', 73.70, 0, 4.30, 289, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Tugu Kembar Sabang - Merauke.jpg'),
(711, 3, 37, 'Restaurant', 'Bambu Pemali, Merauke, Merauke Regency, Papua 99614', NULL, 'Restoran Pinang Sirih', 1.50, 125000, 4.40, 403, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Restoran Pinang Sirih.jpg'),
(712, 3, 37, 'Seafood Restaurant', 'FCV2+J44, Jl. Raya Mandala, Bambu Pemali, Kec. Merauke, Kabupaten Merauke, Papua 99615', NULL, 'Seafood Restaurant Mas Yono', 1.70, 75000, 4.30, 292, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Seafood Restaurant Mas Yono.jpg'),
(713, 3, 37, 'Restaurant', 'Jl. Raya Mandala, Mandala, Kec. Merauke, Kabupaten Merauke, Papua', NULL, 'Rumah Makan Kelapa 5 Merauke', 1.90, 110000, 4.50, 43, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Rumah Makan Kelapa 5 Merauke.jpg'),
(714, 3, 37, 'Restaurant', 'Jl. Irian Seringgu, Seringgu Jaya, Kec. Merauke, Kabupaten Merauke, Papua 99614', NULL, 'Segeri Restaurant', 2.40, 140000, 4.30, 338, '2025-05-01 17:00:00', '2025-05-01 17:00:00', 'Segeri Restaurant.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tour_types`
--

CREATE TABLE `tour_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `keyname` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tour_types`
--

INSERT INTO `tour_types` (`id`, `keyname`, `type`, `created_at`, `updated_at`) VALUES
(1, 'nature', 'Nature', '2024-03-27 17:00:00', '2024-04-15 09:41:03'),
(2, 'culture', 'Culture', '2024-03-27 17:00:00', '2024-03-27 17:00:00'),
(3, 'culinary', 'Culinary', '2024-03-27 17:00:00', '2024-03-27 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `image` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `display_name`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bio`, `role`, `image`) VALUES
(15, 'christian winarta', 'cw2002', NULL, '$2y$10$GEntqdL.4.Xtg/249pT8dOthaIsZ/BuDlBOzHBQax9.HEieH8K/fu', NULL, '2024-04-16 06:18:09', '2024-04-16 08:16:19', 'aaaa aaaa', '6873cf83128f82b7ded50e30bc43bb764784508be28a2fc9da743c053747433e', NULL),
(16, 'user1', 'user1', NULL, '$2y$10$qAfHjRB1j3NcQpyWIW7osemKgtbOsLsDHN6m90JJ4BL1oBjxDHfyW', NULL, '2024-04-16 06:18:56', '2024-04-16 06:18:56', NULL, '1', NULL),
(17, 'user2', 'user2', NULL, '$2y$10$dFxFNWUUqDWinxNNiZMc9.oYj2vNBm4EvVXdEGWF1SgcBBMDTZfKK', NULL, '2024-04-16 06:19:10', '2024-04-16 06:19:10', 'user2', '1', NULL),
(18, 'user3', 'user3', NULL, '$2y$10$uB3Ff8zqP.bNHUPFo0kcUu9voyct91KWx328UMKUqmXBnI9x5DfVa', NULL, '2024-04-16 06:20:51', '2024-04-16 06:20:51', NULL, '1', NULL),
(19, 'my name is??', '123123123', NULL, '$2y$10$OAIO3qKigyOKblRY9hL4EOiIhBytW2syt/4AfKTouahA.iXgW1LCG', NULL, '2024-04-18 06:27:52', '2024-04-18 07:01:39', NULL, '1', NULL),
(20, 'asdasdasdadad', 'sadadsasd', NULL, '$2y$10$ke4YFNGsuhnBp85WsmlDyOGsqE8zBEWVDgSIKhDko585/2heCLUx.', NULL, '2024-04-19 06:54:20', '2024-04-19 06:54:20', NULL, '1', NULL),
(21, 'qweqweqwe', 'testets', NULL, '$2y$10$xLpFqRGDSDhdGpUjnsnfH.cfwaS293oth5IVfgavbkqho9yWI4iAe', NULL, '2024-04-19 13:56:20', '2024-04-19 13:56:20', NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_favourite`
--

CREATE TABLE `user_favourite` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tour_object_id` bigint(20) UNSIGNED NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_tour_object_id_foreign` (`tour_object_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyname` (`keyname`);

--
-- Indexes for table `tour_objects`
--
ALTER TABLE `tour_objects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_objects_tour_type_id_foreign` (`tour_type_id`),
  ADD KEY `tour_objects_province_id_foreign` (`province_id`);

--
-- Indexes for table `tour_types`
--
ALTER TABLE `tour_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyname` (`keyname`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_favourite`
--
ALTER TABLE `user_favourite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_favourite_user_id_foreign` (`user_id`),
  ADD KEY `user_favourite_tour_object_id_foreign` (`tour_object_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tour_objects`
--
ALTER TABLE `tour_objects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT for table `tour_types`
--
ALTER TABLE `tour_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_favourite`
--
ALTER TABLE `user_favourite`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_tour_object_id_foreign` FOREIGN KEY (`tour_object_id`) REFERENCES `tour_objects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tour_objects`
--
ALTER TABLE `tour_objects`
  ADD CONSTRAINT `tour_objects_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`),
  ADD CONSTRAINT `tour_objects_tour_type_id_foreign` FOREIGN KEY (`tour_type_id`) REFERENCES `tour_types` (`id`);

--
-- Constraints for table `user_favourite`
--
ALTER TABLE `user_favourite`
  ADD CONSTRAINT `user_favourite_tour_object_id_foreign` FOREIGN KEY (`tour_object_id`) REFERENCES `tour_objects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_favourite_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
