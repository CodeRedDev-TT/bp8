-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 01, 2022 at 12:53 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workout`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Abs', '2022-05-18 06:08:41', '2022-05-18 06:35:10'),
(2, 'Back', '2022-05-18 06:09:15', '2022-05-18 06:35:29'),
(3, 'Legs', '2022-05-18 06:09:37', '2022-05-18 06:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01910306e849df5606de5add7f8b20fffd137614a2001fabf0f8e299dcac815965c1945aeb914637', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:03:49', '2022-07-19 04:03:49', '2024-06-18 00:03:49'),
('0542e6e86cba7a5decb46e6a65ca03ab8f75a33763792f10ad524efada2051b6ffc814e8e8e3cf07', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:05:27', '2022-11-21 00:05:27', '2024-10-20 20:05:27'),
('057ee50789794e17e6795dd7a3c10712cd9f4b58cdd1c3f208e021eb711421220f30cc24b3468d68', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:17:01', '2022-11-21 00:17:01', '2024-10-20 20:17:01'),
('075a4beca1e30dfb54d965058b594b4cf82daa0c773342edb1d8c919d648b92823d1e2063eb888ef', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:09:05', '2022-07-30 21:09:05', '2024-06-29 17:09:05'),
('092a2b7653fbf057104dbeb52ab25650932c0d27593c46a09e207145d98762fa0b1af4378efe22f5', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:15:24', '2022-07-19 04:15:24', '2024-06-18 00:15:24'),
('093c39fdae03354c8fc88a5c00096fb787cd4b7384ecc653cabb7836696035f4c2e7172d1c8705da', 2, 1, 'Personal Access Token', '[]', 0, '2022-06-14 06:04:41', '2022-06-14 06:04:41', '2024-05-14 02:04:41'),
('0979a03c65d718abe29cfca19f3b666f72be43b59d6c2888f597e73b7a8dd4fc394a2e28e1f144e7', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:27:46', '2022-07-30 21:27:46', '2024-06-29 17:27:46'),
('0c7539525ba0aaab3c97b030b8d9524e16c50fc80438cd4e785da3384b929a61ed8b7c2ed9668699', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:01:33', '2022-07-19 04:01:33', '2024-06-18 00:01:33'),
('0d15fab3b109c7a6b7b9aa99e3385a28514f87356e4823b46ec7dc1b5a786d038c0f1407eba53e3a', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 01:01:20', '2022-11-21 01:01:20', '2024-10-20 21:01:20'),
('0dddcfc8e82cf5e0292b946f93c94cf3b0aa6247bd5aefd56195e5b6281981e38b5b3460b788358c', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:10:34', '2022-07-19 04:10:34', '2024-06-18 00:10:34'),
('0ec717723f07c78c66f1f065832a6f982821178cc86574762daa3679efa38bba397bcc0499a4f352', 2, 1, 'Personal Access Token', '[]', 0, '2022-06-14 06:26:45', '2022-06-14 06:26:45', '2024-05-14 02:26:45'),
('11ee8682645284ff1fcb49ae0ab99cfe19ed322d2928e133564f24d5d6f1a007a4b9b0472c855550', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 01:04:20', '2022-08-29 01:04:20', '2024-07-28 21:04:20'),
('17310e290206ecf847bf218fe428e737ad02a51b1d3e277db002586d69cb8bdedeac4e4d499f22d1', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:27:51', '2022-09-15 12:27:51', '2024-08-15 08:27:51'),
('1788289ebf52a7f40a5136f398f44946bc640ae4e09bc5f9de7938e49b98a1447dab0e223edf96ab', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 21:19:34', '2022-08-29 21:19:34', '2024-07-29 17:19:34'),
('18afd8c9d26766e41c7d97939ff0e9be55cb70edb0ccd789caebb694569989bfdb8f6eaceb1d20e4', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:57:08', '2022-07-30 20:57:08', '2024-06-29 16:57:08'),
('19c81653d4607ac2ef33f19ddedfa8f38ee3d923dcbce90cd5546f84358c34b366804a4f532eb1ec', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 03:44:57', '2022-07-19 03:44:57', '2024-06-17 23:44:57'),
('1d763f166cb7988a26e9e2128ed10f218880597edfdc1a15cf5b5f992f42e6984f86fa680659452f', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:46:11', '2022-11-21 00:46:11', '2024-10-20 20:46:11'),
('1f8938af7e9ccbd544611e133d0552833e2299141b7fb1887a72372122e770a22376d484f35b28f5', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:49', '2022-07-19 04:25:49', '2024-06-18 00:25:49'),
('208fea7b9b2c46a250316b0644c216b94f526ac806bbabbf523a2809e29cb3a368cb230faf52a36e', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:18:58', '2022-07-30 21:18:58', '2024-06-29 17:18:58'),
('20cbaf090344a2e7f6bfbd5221545299860f29e7a86680215786f84c40469c57fa90603407c49be4', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 22:56:08', '2022-08-29 22:56:08', '2024-07-29 18:56:08'),
('231bd70255b348586409e4871b2921db0333620dc19a03c6e5b61dc6e61856de11308b8662842414', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:25:33', '2022-07-30 20:25:33', '2024-06-29 16:25:33'),
('2398efbe82861992e63094315537a7ef28c68fe33367447c01eff3e61ddf0489c1783be5a30e48cd', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:05:05', '2022-11-21 00:05:05', '2024-10-20 20:05:05'),
('260afd04f53f96e9df1196a4accf6ed10e6b30c614686e4782778eca57290952562d008602a14ecf', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:45', '2022-07-19 04:25:45', '2024-06-18 00:25:45'),
('27b44da42dd7e7da13f335029b7ee083404bc47866186e63bf972a3636abb159c3784289eb4736bb', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:47', '2022-07-19 04:25:47', '2024-06-18 00:25:47'),
('27cbff5f1802d3ff63912f284c5530e46cf0fc48936523c60c802fd76d8dfe0bc66e6fcf9645ebe0', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:17:34', '2022-11-21 00:17:34', '2024-10-20 20:17:34'),
('286478a704963eee01470dabb8283b2237f04c404aa5d4ca2258ceba8ed611759c7c56a8aafc08a2', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:42', '2022-07-19 04:25:42', '2024-06-18 00:25:42'),
('2b283cba35d0087ff7a5ee66d351e5429aa7aa7a007876206c2987731e65f8e88395f5e4231ebd6c', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:43', '2022-07-19 04:25:43', '2024-06-18 00:25:43'),
('2c08a9d081a5cec90f104707c712b4f1bc17f79a811187a31b002c3a1758e994d9ae8171229d040d', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:30:04', '2022-07-30 21:30:04', '2024-06-29 17:30:04'),
('2dcc79117cc71393431ce1b7889d578b8c72cf1e6635e8d28dccd5b5c7c163f087e50207f3f99e00', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:34:09', '2022-09-15 12:34:09', '2024-08-15 08:34:09'),
('2e86d8ebe30bf03b7d263843096e65de5017badb53d9c056d20c3cb2c147b51e9d4c2762f26f3eb8', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:25:11', '2022-07-30 21:25:11', '2024-06-29 17:25:11'),
('2ebcca35cf84530036ee08e66b2adf2ff9ea0061bd916d92ae4929001e6f281598d6f7fdf11cff65', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-13 20:00:54', '2022-08-13 20:00:54', '2024-07-13 16:00:54'),
('31e3b1fdb6f39060a6f9c514739a142f1033bead86c3fc3c33ed301b8b6f63566f096145d1a0c81f', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:27:23', '2022-09-15 12:27:23', '2024-08-15 08:27:23'),
('37f85ea8e166013be764c5922aea246ae3e3d47f3e8ac9ea035afd0c3ae63e83b4af8cf43be0d9c8', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-22 16:39:00', '2022-07-22 16:39:00', '2024-06-21 12:39:00'),
('3b56848b6f0dc1939f60b39543f9affc79be6cf4ff2c3b6361782f6341672bd24efc1587c6fa562b', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:19:18', '2022-07-30 20:19:18', '2024-06-29 16:19:18'),
('3e703e9863fdbc7284344f040a1ba72f3f9284ddfb6972bc9133457d2df5b688b1261894cdb80c29', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:14:51', '2022-09-15 12:14:51', '2024-08-15 08:14:51'),
('4224ddb1b2cacaf092b3cfadecf2e4ca44fda87729c175af5dcbb6f36c9491f67a8c274c2eae2232', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:04:42', '2022-07-30 20:04:42', '2024-06-29 16:04:42'),
('46bead06ede75cd50a044cedbc5135233c30b46cd897a38a0d43a4b7ea36ab439f518d9d8d7d8883', 2, 1, 'Personal Access Token', '[]', 0, '2022-06-14 06:09:08', '2022-06-14 06:09:08', '2024-05-14 02:09:08'),
('46e2797ca10dbd4d144e0535979c771c27e6304c3593a005984d7d5c4058bd75ce22756c8bb0eaf4', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:31:45', '2022-07-30 20:31:45', '2024-06-29 16:31:45'),
('48055033f7ae4e25dcfde3fb033cdc9baca6d5b7c31b469f21f114c6a9178ffbf8f08157b511e7b9', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:44', '2022-07-19 04:25:44', '2024-06-18 00:25:44'),
('4901170be21d40bc5a4b8b7da73d484b0f06b1ab573d3b2219a361a5cc8da55a8b49978551967fa5', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:12:23', '2022-09-15 12:12:23', '2024-08-15 08:12:23'),
('4c4d0621b2fd8696a093ad2d5e57637771b2b60ee0cc482176a01104564d51d76eb5f66a2a04e796', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:57:23', '2022-07-30 20:57:23', '2024-06-29 16:57:23'),
('4cab49ce2b78f41d0daf39af2e89c1a94b1892cca6ee39bf827f0d1f22daef3d0eb70da8e187e464', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-22 16:35:24', '2022-07-22 16:35:24', '2024-06-21 12:35:24'),
('4fc094d251512a87356eb6ae8228f3e8a64568c429c9252669c13c0f15e14f41dc7ce22f5598e265', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:36:31', '2022-07-19 04:36:31', '2024-06-18 00:36:31'),
('50366d15837434063f6828506c39d7166affb995627446ad88c33d9f9187a95175fcbca3f2ea659d', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:04:27', '2022-11-21 00:04:27', '2024-10-20 20:04:27'),
('52222a3c925fd262759ac84bbe2da74a27ae2a9ab8ef8ce54ea7935c91e26714e76f35efe209f188', 2, 1, 'Personal Access Token', '[]', 0, '2022-06-14 06:23:49', '2022-06-14 06:23:49', '2024-05-14 02:23:49'),
('532a25b574e7e9ebd1d78dcbd9182f3b25f224ed0c69c4a7a03a11b18a5db8f05205604412c88329', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:46', '2022-07-19 04:25:46', '2024-06-18 00:25:46'),
('5466a5225b343462ba8d4129eb94f6d0b1e7f369302f852947d64b8577b9343106d5eb06450ca442', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 23:01:54', '2022-08-29 23:01:54', '2024-07-29 19:01:54'),
('554bee4f27719db2473346c89c30b7a77d3a36a04f787af5052e7b1c1495d5ffa49e22f1403c4c1a', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 20:50:56', '2022-08-29 20:50:56', '2024-07-29 16:50:56'),
('56bdd7c10ffbbf83b653cd6cc91e53417514c92277e4898c9c59bd3c2ce2f25a88e3d5cf48a41dc0', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:31:51', '2022-07-30 20:31:51', '2024-06-29 16:31:51'),
('5be6efc00241a8593ae3c935df8531979bfdf737cf03ae4eea6cdb134bc975a7f2958b50ea2cbb5a', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:03:41', '2022-07-19 04:03:41', '2024-06-18 00:03:41'),
('5d62107dcd5efada1ba0b989464584348ef8a18e9fad3dc69ab0007fb04b8f93badb6ab18face5c7', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:24:30', '2022-09-15 12:24:30', '2024-08-15 08:24:30'),
('5db8366b89bfa71ec700cad2ec5ebcde32e0d5679e419a8fc465d5535c628d2b48d5f3a12a337ff4', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:56:29', '2022-07-30 20:56:29', '2024-06-29 16:56:29'),
('5ee12b6de640dbd00ea8abed4bdc9fe7c7a215c0662a8301447aeb03eabcb674804c4b46acebf2dc', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:45', '2022-07-19 04:25:45', '2024-06-18 00:25:45'),
('6259017905f612a9a74937186282d51224063b60efc5e732f8172bf995384de291ffa8454a4b945a', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 20:51:41', '2022-08-29 20:51:41', '2024-07-29 16:51:41'),
('63e9e535c5327f6fd2e875a416ac35adfbc7621f70052cbe294cfc7b8e4b9aace7bae853d1ba39fa', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:38:17', '2022-08-14 15:38:17', '2024-07-14 11:38:17'),
('64462fd4e5c03fc38a2e6aee8d27a06bc88a406b880b88ccb651a48ec2cfb699bf0dadd5537c3cf4', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:06:33', '2022-07-30 21:06:33', '2024-06-29 17:06:33'),
('64a735f3bcee46d9d70592af9b7325f0b1b17dda4a44c7b942daa1d19d50cba1a6d5fe8984403f0a', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:24:37', '2022-09-15 12:24:37', '2024-08-15 08:24:37'),
('662e100c4b2441de77085a7970723375cda8a5a8f3cf029c191f90641162b13b1dc0a7ffce7e8ffa', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:42', '2022-07-19 04:25:42', '2024-06-18 00:25:42'),
('663ce55cf870797081f6ce213b1a5014a94e4e366e596b492bb5327e1f9dcfa2287d5fb0dda37b91', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:13:48', '2022-09-15 12:13:48', '2024-08-15 08:13:48'),
('663d9a38627ed2e3e4084ad471470c4b6e4d029b4c2bb5da5db17393f279f57409c2a4f2877fb681', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:49', '2022-07-19 04:25:49', '2024-06-18 00:25:49'),
('676f771c34aa5a12198df367999824847e96c47d23f2a450a19ee71f70edf404ebfe3a7e7b73894c', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:43', '2022-07-19 04:25:43', '2024-06-18 00:25:43'),
('69d01564cca945e9c2c0d3a1fa9c8c11391d215f7010e254b0b89ca18b8ca2035b9e05b00171f7d4', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 03:45:17', '2022-07-19 03:45:17', '2024-06-17 23:45:17'),
('6e3f4ccbd3af34154e4b7a65ffe0e692bcad3fc94d8716103ca02bdd1bcc624dfb8b42e74527bbec', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:42:35', '2022-07-30 20:42:35', '2024-06-29 16:42:35'),
('6ed06ee32ae3312a0ddfbfb87513b607f2efeb523b8b4b5b5f7d7506eed265ec6030365474679916', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:36:09', '2022-08-14 15:36:09', '2024-07-14 11:36:09'),
('6ed612b63c3773d59eccb4f00da68f35c63aebac2b815864e102e661f0f5da9aac90181b83019cd3', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:32:50', '2022-07-30 20:32:50', '2024-06-29 16:32:50'),
('72414f9f9a8bf794cc51095167d2e28a845ff16d4eaed471caed38b39db688c627d832d36500433d', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:58:25', '2022-08-14 15:58:25', '2024-07-14 11:58:25'),
('734e4fe5219f67fc174bbcd6b9f29e134a217058169bae1b4ad4348c49dd709b584cf377509999d1', 2, 1, 'Personal Access Token', '[]', 0, '2022-06-14 06:19:24', '2022-06-14 06:19:24', '2024-05-14 02:19:24'),
('744695c1a260c118ea88cda7aff92b153d1ae60e4c80a71b4f1528e46da8dbeea4f3cdfdeabce7ca', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-13 19:39:37', '2022-08-13 19:39:37', '2024-07-13 15:39:37'),
('7afe327986a5f133872758a690ec85007ad6bd1abb6becfcc195a2ed7b55fbd202e54792add69203', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:14:01', '2022-09-15 12:14:01', '2024-08-15 08:14:01'),
('7cbd090e991f60383f76045fa270e8d124878581131a74e34f619b2d23463f3a310e199dbad7b88b', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:42', '2022-07-19 04:25:42', '2024-06-18 00:25:42'),
('7db3121a778f3b0561c412a6701b53b66d15655bad297a43f76ea33ebde6a9dac3bb0d6a2c0d252e', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:24:12', '2022-09-15 12:24:12', '2024-08-15 08:24:12'),
('81ecc0c0298f4c0e0f2453719c6cdc9723ec0aa5a9bb801736d746158c172e8f0db11f443fb7187e', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:05:17', '2022-07-30 21:05:17', '2024-06-29 17:05:17'),
('83d008c9afba2952988144f37304e7c29d5909d851257b80b9ea7f0531216713433eaa20bd36edcd', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:37:55', '2022-07-30 20:37:55', '2024-06-29 16:37:55'),
('8419f09551e81065012793678ceb446c01010c4dce1049351ff74d747d3ab1a9ad83970fb2699966', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:45', '2022-07-19 04:25:45', '2024-06-18 00:25:45'),
('87475e03603b4a17161b7537f46f92778256859a7569cefb58676cd01cad3dcb3fa00c408cc10233', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:04:33', '2022-11-21 00:04:33', '2024-10-20 20:04:33'),
('887374359a9e945b4f07f9ce59745f68df2441b8791688db92b1402b3db14a6be1ef672ddd73d0c1', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:48', '2022-07-19 04:25:48', '2024-06-18 00:25:48'),
('8f265a904bdd0cf686c94352df0a4e74e1068c9b1b9aecbb7e2b2ef2ad9c77e88fea0959095f2b5d', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:32:06', '2022-07-30 20:32:06', '2024-06-29 16:32:06'),
('9002d1d2114549e63da9019d8d81df5211e61fcf4f8b181a6a6a9276255c4652d1580cb8c8177816', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:48', '2022-07-19 04:25:48', '2024-06-18 00:25:48'),
('90f1582f8179664d4d178fb3157676d9edbcbe83bdbfce73ca780fe8807d8af038c3b46558e7691f', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:37:58', '2022-08-14 15:37:58', '2024-07-14 11:37:58'),
('918acc07955c1e0ac4de4a610b4a05750b901303eca0c27dff3c57864e672b5c5b7c5274e1591df7', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 23:02:24', '2022-08-29 23:02:24', '2024-07-29 19:02:24'),
('92e09f5a19158d312a95f48848a7dc7a53a11cac6a84bb28bb692a26c7ac444b081121eef755a9ef', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 22:48:09', '2022-08-29 22:48:09', '2024-07-29 18:48:09'),
('9412cd62aef69560fad3368fb9d66087c84a8d69bab90fcc214aa0c914712d356c8f18dac7b58b22', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:51:48', '2022-11-21 00:51:48', '2024-10-20 20:51:48'),
('94347ad1a39d97087dbe32e1b4aaa0975104d07693c87204eeb81d4ab3b4bb2354adb4b06a2feade', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:15:57', '2022-07-30 20:15:57', '2024-06-29 16:15:57'),
('94e9eba1c479ef32756a18072449b7d465c424c3110eb7bc6b75a9be6a0b2307f955e18eb4cefbb6', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:39:24', '2022-07-30 20:39:24', '2024-06-29 16:39:24'),
('95374ea4602a820682912bc0c70704cebad0cab32bdf8a85c76c8817f480460fba5efa213eff7b49', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:25:03', '2022-07-30 21:25:03', '2024-06-29 17:25:03'),
('97207efa11946f758c7a50e7d70c2293d6122c6ddce3d3153e6e95ed1c9f4e51dc08d599db9b8515', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:54:50', '2022-07-30 20:54:50', '2024-06-29 16:54:50'),
('97c797f5099f0d2abc05c45a4c7b4ed9f501588190b93d25924ac97d8a724d773cb1fc5d74db14b4', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 22:43:56', '2022-08-29 22:43:56', '2024-07-29 18:43:56'),
('9a3897575cb9776bb62f9cb8b4f0a493642bf75c3b33aef59abfea88281c79c49750a8d284e4cc50', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:23:48', '2022-09-15 12:23:48', '2024-08-15 08:23:48'),
('9caa446baea8569ade39cc4e35eebe390ee44f561659a50b5b0883ed2bb560c6b3589bb39e3da108', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:44', '2022-07-19 04:25:44', '2024-06-18 00:25:44'),
('9d0f3bf427e2f9d278ea7ea9585e4f9c5ee204e01e212cf9e0490e72b7cb9aa80eebc50a1721dbb8', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:44', '2022-07-19 04:25:44', '2024-06-18 00:25:44'),
('9d34db0db80060684e3c9965827f76b3864a752c244d83d368bb360067514d4d585f652da8b0476b', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-22 16:39:15', '2022-07-22 16:39:15', '2024-06-21 12:39:15'),
('9e87828f714ebbe2d6e7ecdc8c91ac8fd854a46a671d1423d543064743a0cdd787318108e70d1677', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-05 05:47:58', '2022-07-05 05:47:58', '2024-06-04 01:47:58'),
('a0d0d1ef109de850ccd704752d4f40ebcfa23d1ff2e15e251b0c2912a93fd84b676b966776e95554', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 20:49:42', '2022-08-29 20:49:42', '2024-07-29 16:49:42'),
('a481c2237c99a12ec1ec6ea969d2f2c1d77de654b8811752280c43bd2676aaae6432914aeb4ac579', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:48', '2022-07-19 04:25:48', '2024-06-18 00:25:48'),
('a5e8f76b52e36cb4699950a47cb4a2d3123cd641db6a63e9436214e74b51cdb098af9d6bbef8ce5c', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:48', '2022-07-19 04:25:48', '2024-06-18 00:25:48'),
('a6a519fc87178d5ffa735c9a9eeae1e1394407b9cd93b293edf7c07551a85360e508ca26bcf1a108', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:37:56', '2022-08-14 15:37:56', '2024-07-14 11:37:56'),
('a6f86a0c627ef2cd6e98bf704ce291eca302785b4b80c4c695b18b30487ba3eb3b402da3640e2e5a', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:45', '2022-07-19 04:25:45', '2024-06-18 00:25:45'),
('a75aa0d8207366eb1c83abb41b2c10fe98fceac81dc94547850b1ab01c4da0bd35e1dcb28b48860f', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:40', '2022-07-19 04:25:40', '2024-06-18 00:25:40'),
('a902059653e27cff0cc51aca5353273f8d60b3c9de0c47a4bb3f24d514454069c3d7e50a5716e823', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 20:51:17', '2022-08-29 20:51:17', '2024-07-29 16:51:17'),
('addacf7e59267b464415c2c7c92a6c64cd9c29b1ea3c12190027bd68a98763e718b297c048d4f219', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 23:01:43', '2022-08-29 23:01:43', '2024-07-29 19:01:43'),
('b05a277eba77723aabbc6ee7d529ac77f6199740b460a632b923c5f19e0412782462f4744e33275c', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:14:11', '2022-09-15 12:14:11', '2024-08-15 08:14:11'),
('b072741456aca77dab1d4267cdbea05a2c3c1420ee145b9e7f43a72aec8c6f3c81052a93744286cc', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:46', '2022-07-19 04:25:46', '2024-06-18 00:25:46'),
('b116cf7f563af0f3254e89ff402427a2c5363209b634789a0c43c53d09226106f2841e8a2ccec370', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:47', '2022-07-19 04:25:47', '2024-06-18 00:25:47'),
('b1a8de04144733c0baed1dcb3de5da162e79135a9dc3c370224621e71c700135c8af22c5931e9183', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:25:11', '2022-07-30 21:25:11', '2024-06-29 17:25:11'),
('b24cb1a9a3e4efa42bd3a637e53fb4ac423a8a634fea3381d3c594b429e9c6e89c7e9998ac049fe7', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:29:45', '2022-09-15 12:29:45', '2024-08-15 08:29:45'),
('b33f9ac1f38f7b30bba3f3dfb4032a104a4779499969fb1c8f15c6e4ca7f60c5490a12935f955124', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:29:55', '2022-09-15 12:29:55', '2024-08-15 08:29:55'),
('b37e4794a9e082c3594e3bad65b24aed31f9da8c562fabf8c61dbefcc57bee63b6133f5c9556f651', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:43', '2022-07-19 04:25:43', '2024-06-18 00:25:43'),
('b404b94d9184dac1260afde8fdafcc298beacdb55421df8a67bfec59cb9f14d2ed932898cb818f92', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:35:49', '2022-07-30 20:35:49', '2024-06-29 16:35:49'),
('b77283468913dc1ccc2fa5087883d3def01af31b07e8c208e7b22593d1cf11d0027a825660082192', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-13 19:37:46', '2022-08-13 19:37:46', '2024-07-13 15:37:46'),
('b817e145977df4b0b05a68a8620767d813d8539a58b9c573644bed7dbf94173ec109a981f285c514', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:29:44', '2022-09-15 12:29:44', '2024-08-15 08:29:44'),
('b9d05939ecd3228aded851c2c90e3cd060a8ac977281d31a5a014ecd25c19dd94fa84b476eb5217c', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:41', '2022-07-19 04:25:41', '2024-06-18 00:25:41'),
('bbd7e78b5bf8b55628e1ab79d2fe1804abcb05d72e302b76961436458de538dc89fd81da5484fada', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:04:45', '2022-11-21 00:04:45', '2024-10-20 20:04:45'),
('bc3ae0df80c0e73c209c26c52fe22705cab9790585546f3f72a8332e38384aedde8174b2d9717191', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 21:02:02', '2022-08-29 21:02:02', '2024-07-29 17:02:02'),
('bc5a8915113979738c820a384ce90be1ff6edcebd61dc7f6c51ed4a027506ca5a6b09e4187e3287b', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 01:01:15', '2022-11-21 01:01:15', '2024-10-20 21:01:15'),
('bfd0623bce50a4713785f8295975e36eb91dbb5d813acde9643f79662a4144d29075b9ea6c483a1f', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:41', '2022-07-19 04:25:41', '2024-06-18 00:25:41'),
('c05f50e6e0978eb3dcb73e557714d6bae2d0b48ea21e73b868595fcac9dda538787e488cafe696d1', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:34:16', '2022-09-15 12:34:16', '2024-08-15 08:34:16'),
('c115cc226edde9ce4f22e0694a8143ad0ff947ec95c6bd6e12f4b7f79a42ff6a40296ec0c336e555', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:25:31', '2022-07-30 21:25:31', '2024-06-29 17:25:31'),
('c1649ef24b5c016afe557647351b44279825b20a840e63e610b9b01df08c172a55d070e87797f110', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 20:51:02', '2022-08-29 20:51:02', '2024-07-29 16:51:02'),
('c1ac9a90b9ce4e1b11d1fca055bee4d45f1cbae2030a1254b6320d88473db47ba841be3dee066fd3', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-13 20:01:23', '2022-08-13 20:01:23', '2024-07-13 16:01:23'),
('c1db6777a7f8cfadfd1039061f04a906508befbad3f5982b89d7edade9b140ae3c9b8d8bd3fdadfe', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-16 13:53:02', '2022-09-16 13:53:02', '2024-08-16 09:53:03'),
('c21b0f5168b093a30218794dd9a26a50495d7440d7e1409b117a2c8ec5d328294f887f577261c447', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:37:58', '2022-08-14 15:37:58', '2024-07-14 11:37:58'),
('c221ad23be743738c78d2e383f78a4b4f3487d1d9db2656c3dbad6036305511c6e20385118b04f47', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:41', '2022-07-19 04:25:41', '2024-06-18 00:25:41'),
('c955bb121f625f10d3e975008727b75713e5e2b3d9048f7b1af86610b5f8ba3776629cf427596370', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:07:16', '2022-07-30 21:07:16', '2024-06-29 17:07:16'),
('cbfb998cd87c1e290b9be0d557b23103048044461b94b96d854ae54b34be61f7510af5a71e4eaac5', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:25:26', '2022-07-30 20:25:26', '2024-06-29 16:25:26'),
('ce30eca97fc50f2ea948a771d2366132b3c1fc12ab85b504b482dad0b89db74431d853bed6ca6f1a', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:36:09', '2022-08-14 15:36:09', '2024-07-14 11:36:09'),
('ce5b3cb5fea2249bb06a89a87bc06b8bafdb4a6419d7c032ce2d2e97dc3c2031e51df1b81407e7d6', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:14:20', '2022-09-15 12:14:20', '2024-08-15 08:14:20'),
('d505761d6e808fa8b5043489a4f8dde18a90f57f9bf30a305313255f8c2b653580a68f3990e223b4', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:05:43', '2022-07-30 21:05:43', '2024-06-29 17:05:43'),
('d59d280acfb6d574b42bb3e68c718c3ab9fa44177292fe61fd15cc3405234ded14c976ba7ce199c6', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-06 05:28:14', '2022-07-06 05:28:14', '2024-06-05 01:28:15'),
('d5e27be03365356f572e8af94b68fb29a30ee803e37972f410bfc7896c0698c44569f4252f058dec', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:41', '2022-07-19 04:25:41', '2024-06-18 00:25:41'),
('d7fcd6d4f9330da9563a2526780681f54443eb5ee12f5dd820067a5dd777d61ce033be9ba16213ec', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:39:27', '2022-08-14 15:39:27', '2024-07-14 11:39:27'),
('da42d04c33338b49b26fe7a576235c09e10f3ace2679112889bcbc07a1ffdfe450de7e7af0401b43', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:46', '2022-07-19 04:25:46', '2024-06-18 00:25:46'),
('dc30149690a5e0703b1fb3fa11583823b913bddd88c96a338f9638492b94796c52fc368970463249', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 01:10:03', '2022-11-21 01:10:03', '2024-10-20 21:10:03'),
('dd4a5bf7c9e5e0ea32221b76a46757e3f626330be90593b5f654c6abee1d8d0558d11e060d42fcae', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:05:02', '2022-11-21 00:05:02', '2024-10-20 20:05:02'),
('dd5259828671abcc0e5470e2e18bb6fba6e8fd287b5632d6678f1792ba5522a426ca1a84aafb7939', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:06:52', '2022-07-30 21:06:52', '2024-06-29 17:06:52'),
('dea2b88b47d347b54f37865b711d80c149a71a49622cbbdce9f5ad87d9e2fe9c2a7dd19927293013', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:36:21', '2022-08-14 15:36:21', '2024-07-14 11:36:21'),
('dfc48166cbacfc128532b6dc933600e1c46ac4077a53ffd82e553ec684828087524b1865c9b3a554', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:36:09', '2022-08-14 15:36:09', '2024-07-14 11:36:09'),
('e143ba38f289d0d02c8626954325d98d414957e2640d9faff05bd73d6da61d4fe15d21602b16ecd9', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:13:44', '2022-07-30 21:13:44', '2024-06-29 17:13:44'),
('e1e7cd6924af15d8e75381085ac271dce23121fdbd675c787d2db8c3d7c853e160b837c6665d8375', 2, 1, 'Personal Access Token', '[]', 0, '2022-06-14 06:15:43', '2022-06-14 06:15:43', '2024-05-14 02:15:43'),
('e2a3c0a0a0510a50a1614800e7afeee7c44699f49ec2aa847f82d2ebcc050b9368ded07cb3f385a1', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:36:09', '2022-08-14 15:36:09', '2024-07-14 11:36:09'),
('e34b1bbe87e88ddd2616510a02e8cd9903f154d742b458624438bb19f99c7a056e38dc0fa81a686e', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 23:02:07', '2022-08-29 23:02:07', '2024-07-29 19:02:07'),
('e631366862fa54303de9192320e65bdaddb277e6ac366b31dd3b8c39a3e693e9987cb6d4407878d4', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:27:46', '2022-07-30 21:27:46', '2024-06-29 17:27:46'),
('e941a7473d591f07d7ea84abe0c6b52a664fa7f2f6fca4af345e38c1fa8dc02df61621316235b72e', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-13 19:55:10', '2022-08-13 19:55:10', '2024-07-13 15:55:10'),
('e984da4020f31b71d1458c1d7141c35ceaec7439a36dad49d2e020061881db6709a5404c7e36b673', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:31:43', '2022-09-15 12:31:43', '2024-08-15 08:31:43'),
('eb8df388d981c6ffde104dbb5738e3d64153ef4d211b74e8327b3a4ebfc244e430f2c742b9daeb87', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:30:04', '2022-07-30 21:30:04', '2024-06-29 17:30:04'),
('ee0550f672a4a6092043195ea68a8d57e4cb770e5469185bcf9feccbe87ff875c575079cf25cca2b', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:40', '2022-07-19 04:25:40', '2024-06-18 00:25:40'),
('f2138331575e0853f370c3ef05d30c81586f2b2f0a65fee5ac66c3359f564fd7fb97a34e432b47f2', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:17:46', '2022-09-15 12:17:46', '2024-08-15 08:17:46'),
('f3164cae50de07805c0ce948589d81d1eef0477b224382950025b224f6b6fc12d898afab1c3e1caa', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 13:23:05', '2022-09-15 13:23:05', '2024-08-15 09:23:05'),
('f3795a0c59b87993f35b92aa4bb7b9f829b12a75a0b9c2e935bb65221af6c584e6e1017497f4fc7c', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 21:09:53', '2022-07-30 21:09:53', '2024-06-29 17:09:53'),
('f40bdbac0138a34d92e7842325e3a012fcd6db2695e6c05d0fa44831a9f9500fa7495354e0d97b0e', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 22:47:58', '2022-08-29 22:47:58', '2024-07-29 18:47:58'),
('f520ed467fe3fb8e00981e0ff1e689f1e7d3334de95a60bb04f26c5a4778496487b70a04a2fe5333', 2, 1, 'Personal Access Token', '[]', 0, '2022-11-21 00:23:10', '2022-11-21 00:23:10', '2024-10-20 20:23:10'),
('f6f38cf8440f3e4d3adf95f438077ccc263d221a74eacb6ea8f56c0e527949176eaa7865181d12c4', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-14 15:36:09', '2022-08-14 15:36:09', '2024-07-14 11:36:09'),
('f9daed93a9359b8d50791707199070167b374612a64b5e288ac86caf346d782df97ebbcb0a56df2a', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-22 16:38:38', '2022-07-22 16:38:38', '2024-06-21 12:38:38'),
('fb451084502b5007f30a24134e8d2859be91aaada97c287524ea63c44fb679077899312e81c46364', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:17:56', '2022-09-15 12:17:56', '2024-08-15 08:17:56'),
('fbcf90c6a36705630367607cf5792fe16b66069567ddc54685356f31182a4fdbf17d17b8a388417d', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:29:46', '2022-09-15 12:29:46', '2024-08-15 08:29:46'),
('fbf8512852ac6910779e86970bed7c8213700ef2f206379697a8f7f101ecb0c0ac7c199a72a62aca', 2, 1, 'Personal Access Token', '[]', 0, '2022-08-29 22:49:00', '2022-08-29 22:49:00', '2024-07-29 18:49:00'),
('fd97ad69439a30f875c6dc3dff45ed23af1b4d5e38d2f715c5a0fa4be3e9a4c699003cedd4827a92', 2, 1, 'Personal Access Token', '[]', 0, '2022-09-15 12:12:43', '2022-09-15 12:12:43', '2024-08-15 08:12:43'),
('fdb0b2c5a13cb74fc9c30e61178c67c1bc1d2487a5912abeac0546e236e144f1c1a94f29e71986f7', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-30 20:16:48', '2022-07-30 20:16:48', '2024-06-29 16:16:48'),
('fe13c6d41d50d4b785a2e61a9e59c4526ddd3ff158d898f5af83390e9bf0309ae448475e1b46c38c', 2, 1, 'Personal Access Token', '[]', 0, '2022-07-19 04:25:47', '2022-07-19 04:25:47', '2024-06-18 00:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'BP8 Personal Access Client', '6S8T1OqiZqr1XBpvyKqoEE13m76sl9bfcV2tCNHf', NULL, 'http://localhost', 1, 0, 0, '2022-06-14 06:04:09', '2022-06-14 06:04:09'),
(2, NULL, 'BP8 Password Grant Client', 'CmOsCPeQ9NZ8nxDjvFCnhWXFgVqheBFuXGzh3Dd8', 'users', 'http://localhost', 0, 1, 0, '2022-06-14 06:04:09', '2022-06-14 06:04:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-06-14 06:04:09', '2022-06-14 06:04:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pod_stations`
--

DROP TABLE IF EXISTS `pod_stations`;
CREATE TABLE IF NOT EXISTS `pod_stations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `podid` bigint(20) DEFAULT NULL,
  `stationid` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pod_stations`
--

INSERT INTO `pod_stations` (`id`, `podid`, `stationid`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 3, 14, '2022-05-26 07:44:51', '2022-05-26 07:44:51', NULL),
(4, 4, 2, '2022-05-26 07:44:51', '2022-05-26 07:44:51', NULL),
(5, 4, 13, '2022-05-26 07:44:51', '2022-05-26 07:44:51', NULL),
(105, 36, 17, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(106, 36, 26, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(107, 36, 18, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(108, 36, 19, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(109, 36, 20, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(110, 36, 21, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(111, 36, 22, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(112, 36, 23, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(113, 36, 24, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(114, 36, 25, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL),
(115, 37, 27, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL),
(116, 37, 28, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL),
(117, 37, 29, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL),
(118, 38, 30, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL),
(119, 38, 31, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL),
(120, 38, 32, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL),
(121, 39, 33, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL),
(122, 39, 34, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL),
(123, 39, 35, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
CREATE TABLE IF NOT EXISTS `stations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `asset` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `asset`, `created_at`, `updated_at`) VALUES
(17, 'B10 Cardio 1', 16, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(18, 'B10 Cardio 2', 15, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(19, 'B10 Cardio 3', 14, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(20, 'B10 Cardio 4', 13, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(21, 'B10 Cardio 5', 12, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(22, 'B10 Cardio 6', 11, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(23, 'B10 Cardio 7', 10, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(24, 'B10 Cardio 8', 9, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(25, 'B10 Cardio 9', 8, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(26, 'B10 Cardio 10', 7, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(27, 'Strength 1', 6, '2022-11-21 00:55:46', '2022-11-21 00:55:46'),
(28, 'Strength 2', 13, '2022-11-21 00:56:07', '2022-11-21 00:56:07'),
(29, 'Strength 3', 12, '2022-11-21 00:56:07', '2022-11-21 00:56:07'),
(30, 'Strength 4', 9, '2022-11-21 00:56:07', '2022-11-21 00:56:07'),
(31, 'Strength 5', 6, '2022-11-21 00:56:07', '2022-11-21 00:56:07'),
(32, 'Strength 6', 8, '2022-11-21 00:56:07', '2022-11-21 00:56:07'),
(33, 'Strength 7', 16, '2022-11-21 00:56:07', '2022-11-21 00:56:07'),
(34, 'Strength 8', 15, '2022-11-21 00:56:07', '2022-11-21 00:56:07'),
(35, 'Strength 9', 14, '2022-11-21 00:56:07', '2022-11-21 00:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `station_categories`
--

DROP TABLE IF EXISTS `station_categories`;
CREATE TABLE IF NOT EXISTS `station_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stationid` bigint(20) DEFAULT NULL,
  `categoryid` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `station_categories`
--

INSERT INTO `station_categories` (`id`, `stationid`, `categoryid`, `created_at`, `updated_at`) VALUES
(9, 6, 1, '2022-05-22 00:38:03', '2022-05-22 00:38:03'),
(10, 6, 2, '2022-05-22 00:38:03', '2022-05-22 00:38:03'),
(11, 6, 3, '2022-05-22 00:38:03', '2022-05-22 00:38:03'),
(17, 13, 3, '2022-05-26 06:14:13', '2022-05-26 06:14:13'),
(19, 15, 3, '2022-07-30 17:30:15', '2022-07-30 17:30:15'),
(21, 2, 3, '2022-09-15 13:05:23', '2022-09-15 13:05:23'),
(22, 16, 3, '2022-09-15 13:30:40', '2022-09-15 13:30:40'),
(23, 14, 3, '2022-09-15 13:30:51', '2022-09-15 13:30:51'),
(24, 17, 2, '2022-11-21 00:08:02', '2022-11-21 00:08:02'),
(25, 27, 2, '2022-11-21 00:55:46', '2022-11-21 00:55:46'),
(26, 28, 2, '2022-11-21 00:56:07', '2022-11-21 00:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Screenshot_1 (1)', 'uploads/all/ihXqpE8bBn0cHR1huHvY01Lz0KNG7rXvWdI9CIKy.jpg', 16458, 'jpg', 'image', '2022-05-25 07:08:06', '2022-05-25 07:08:06', NULL),
(2, 'image_processing20210411-28230-6c3m9y', 'uploads/all/EjO8FCmZcVZJFBndyOXziRxBxEGIimoxbeyRaptn.gif', 14219, 'gif', 'image', '2022-09-15 13:30:31', '2022-09-15 13:30:31', NULL),
(3, 'WhatsApp Video 2022-10-31 at 1.47.35 PM', 'uploads/all/QBJX6gfS0n0cfQKBJ9azSRJk3GHilsHkZ9RaKFiP.mp4', 1652680, 'mp4', 'video', '2022-11-20 23:36:23', '2022-11-20 23:36:23', NULL),
(4, 'WhatsApp Video 2022-10-31 at 1.47.15 PM', 'uploads/all/atrAb08vN2fa8MNyyan9z3AFIa14GmCI45V6toiC.mp4', 1570812, 'mp4', 'video', '2022-11-20 23:36:23', '2022-11-20 23:36:23', NULL),
(5, 'WhatsApp Video 2022-10-31 at 1.50.43 PM', 'uploads/all/SiromroNo8WWVa0k1u8aHGLwNsQfjefA4C1KsHlm.mp4', 2017666, 'mp4', 'video', '2022-11-20 23:36:23', '2022-11-20 23:36:23', NULL),
(6, 'WhatsApp Video 2022-10-31 at 1.48.51 PM', 'uploads/all/VE48fCle9xw0kdN1rKK6C5SDiG5bV8SBeVEjf0K7.mp4', 1819416, 'mp4', 'video', '2022-11-20 23:36:23', '2022-11-20 23:36:23', NULL),
(7, 'WhatsApp Video 2022-10-31 at 1.49.06 PM', 'uploads/all/eFYpT4semP9BsvoqaIRFiwrLkcPlaggZvV12Oew5.mp4', 1671797, 'mp4', 'video', '2022-11-20 23:36:23', '2022-11-20 23:36:23', NULL),
(8, 'WhatsApp Video 2022-10-31 at 1.49.22 PM', 'uploads/all/2qjqbsxjV2CxddiSTEr7CYjBd65JQRABeqpCQKet.mp4', 1556479, 'mp4', 'video', '2022-11-20 23:36:23', '2022-11-20 23:36:23', NULL),
(9, 'WhatsApp Video 2022-10-31 at 1.50.07 PM', 'uploads/all/UAjMCLR0m68rS4RrlF0lDws8H1gkXjADYbSVxFx4.mp4', 1085338, 'mp4', 'video', '2022-11-20 23:36:23', '2022-11-20 23:36:23', NULL),
(10, 'WhatsApp Video 2022-10-31 at 1.49.06 PM', 'uploads/all/JLNI2H9a9MrchW18XEf7V9q3IG7jHoIAfXo3uEn2.mp4', 1671797, 'mp4', 'video', '2022-11-20 23:36:37', '2022-11-20 23:36:37', NULL),
(11, 'WhatsApp Video 2022-10-31 at 1.48.51 PM', 'uploads/all/NBXROfPrA1KNldZqR8rBEwift9eFhVJYQ8oKYafz.mp4', 1819416, 'mp4', 'video', '2022-11-20 23:36:37', '2022-11-20 23:36:37', NULL),
(12, 'WhatsApp Video 2022-10-31 at 1.47.35 PM', 'uploads/all/tZuhUqguPDscaebffF7oFmQS8ZPYSQS7Q4Z0wskg.mp4', 1652680, 'mp4', 'video', '2022-11-20 23:36:37', '2022-11-20 23:36:37', NULL),
(13, 'WhatsApp Video 2022-10-31 at 1.49.22 PM', 'uploads/all/QoQKsqij2y49B8emn7L62q37uRBXZqqV50Dq2DCq.mp4', 1556479, 'mp4', 'video', '2022-11-20 23:36:37', '2022-11-20 23:36:37', NULL),
(14, 'WhatsApp Video 2022-10-31 at 1.47.15 PM', 'uploads/all/6hxF86bjVB15fCYgAV591kK5MOafn49Y58LSuIYz.mp4', 1570812, 'mp4', 'video', '2022-11-20 23:36:37', '2022-11-20 23:36:37', NULL),
(15, 'WhatsApp Video 2022-10-31 at 1.50.07 PM', 'uploads/all/IIzSckUdm4DW0I1uJoypBGRARQcKwlZNiVhkHrPJ.mp4', 1085338, 'mp4', 'video', '2022-11-20 23:36:40', '2022-11-20 23:36:40', NULL),
(16, 'WhatsApp Video 2022-10-31 at 1.50.43 PM', 'uploads/all/oG02uuKs7mmTSH2FXLQkZa2W76ebYi3eYcTl8S2w.mp4', 2017666, 'mp4', 'video', '2022-11-20 23:36:42', '2022-11-20 23:36:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nicholas Mohamed', 'test@test.com', NULL, '$2y$10$ZclcNy42oZ96i/fZ.7dDE.pDuUsbkRQPOeoU7f0jQ/n.vRPHZXLzS', NULL, '2022-05-13 23:00:25', '2022-05-13 23:00:25'),
(2, 'Admin', 'admin@admin.com', NULL, '$2y$10$mRj/1EHH6MpKAZukoZ.UhO4Et1Q.POMO10gY.r7LtMn4GYBQZYLJi', 'V8FtONI2FfHRBCnWBcnvv4YTal3rfTsPrPbTMqwuJF7XeLvddHelgWvLTVMZ', '2022-05-17 23:46:43', '2022-05-17 23:46:43');

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

DROP TABLE IF EXISTS `workouts`;
CREATE TABLE IF NOT EXISTS `workouts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `asset` bigint(20) DEFAULT NULL,
  `days` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `name`, `asset`, `days`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 'B10', 2, 'Tuesday', '2022-11-20 23:34:43', '2022-11-21 00:57:47', NULL),
(13, 'Spartans', 15, 'Sunday', '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workout_pods`
--

DROP TABLE IF EXISTS `workout_pods`;
CREATE TABLE IF NOT EXISTS `workout_pods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workoutid` bigint(20) DEFAULT NULL,
  `timesplit` varchar(500) DEFAULT NULL,
  `sets` int(11) NOT NULL,
  `laps` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `exercises_videos` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `workout_pods`
--

INSERT INTO `workout_pods` (`id`, `workoutid`, `timesplit`, `sets`, `laps`, `created_at`, `updated_at`, `deleted_at`, `exercises_videos`) VALUES
(36, 12, '15/15', 2, 3, '2022-11-21 00:57:47', '2022-11-21 00:57:47', NULL, NULL),
(37, 13, '15/15', 2, 3, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL, NULL),
(38, 13, '15/15', 2, 3, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL, NULL),
(39, 13, '15/15', 2, 3, '2022-11-21 01:00:54', '2022-11-21 01:00:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workout_tracks`
--

DROP TABLE IF EXISTS `workout_tracks`;
CREATE TABLE IF NOT EXISTS `workout_tracks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workoutid` bigint(20) DEFAULT NULL,
  `guid` varchar(36) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `workout_tracks`
--

INSERT INTO `workout_tracks` (`id`, `workoutid`, `guid`, `data`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 9, '1234-5678-901234', '{\"id\":9,\"name\":\"Hurricanse\",\"asset\":{\"id\":1,\"file_original_name\":\"Screenshot_1 (1)\",\"file_name\":\"uploads\\/all\\/ihXqpE8bBn0cHR1huHvY01Lz0KNG7rXvWdI9CIKy.jpg\",\"file_size\":\"16458\",\"extension\":\"jpg\",\"type\":\"image\",\"created_at\":\"2022-05-25T00:08:06.000000Z\",\"updated_at\":\"2022-05-25T00:08:06.000000Z\",\"deleted_at\":null},\"days\":\"Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"assetUrl\":\"https:\\/\\/srvmarketing.com\\/bp8\\/storage\\/app\\/public\",\"pods\":[{\"id\":11,\"workoutid\":\"9\",\"sets\":\"1\",\"laps\":\"1\",\"timesplit\":\"12\\/50\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"stations\":[{\"id\":15,\"podid\":\"11\",\"stationid\":\"14\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"name\":\"Jump\",\"asset\":{\"id\":1,\"file_original_name\":\"Screenshot_1 (1)\",\"file_name\":\"uploads\\/all\\/ihXqpE8bBn0cHR1huHvY01Lz0KNG7rXvWdI9CIKy.jpg\",\"file_size\":\"16458\",\"extension\":\"jpg\",\"type\":\"image\",\"created_at\":\"2022-05-25T00:08:06.000000Z\",\"updated_at\":\"2022-05-25T00:08:06.000000Z\",\"deleted_at\":null}},{\"id\":16,\"podid\":\"11\",\"stationid\":\"2\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"name\":\"Push Up\",\"asset\":null},{\"id\":17,\"podid\":\"11\",\"stationid\":\"13\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"name\":\"Squat\",\"asset\":{\"id\":1,\"file_original_name\":\"Screenshot_1 (1)\",\"file_name\":\"uploads\\/all\\/ihXqpE8bBn0cHR1huHvY01Lz0KNG7rXvWdI9CIKy.jpg\",\"file_size\":\"16458\",\"extension\":\"jpg\",\"type\":\"image\",\"created_at\":\"2022-05-25T00:08:06.000000Z\",\"updated_at\":\"2022-05-25T00:08:06.000000Z\",\"deleted_at\":null}}]},{\"id\":12,\"workoutid\":\"9\",\"sets\":\"2\",\"laps\":\"1\",\"timesplit\":\"12\\/34\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"stations\":[{\"id\":18,\"podid\":\"12\",\"stationid\":\"14\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"name\":\"Jump\",\"asset\":{\"id\":1,\"file_original_name\":\"Screenshot_1 (1)\",\"file_name\":\"uploads\\/all\\/ihXqpE8bBn0cHR1huHvY01Lz0KNG7rXvWdI9CIKy.jpg\",\"file_size\":\"16458\",\"extension\":\"jpg\",\"type\":\"image\",\"created_at\":\"2022-05-25T00:08:06.000000Z\",\"updated_at\":\"2022-05-25T00:08:06.000000Z\",\"deleted_at\":null}},{\"id\":19,\"podid\":\"12\",\"stationid\":\"2\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"name\":\"Push Up\",\"asset\":null}]},{\"id\":13,\"workoutid\":\"9\",\"sets\":\"3\",\"laps\":\"1\",\"timesplit\":\"12\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"stations\":[{\"id\":20,\"podid\":\"13\",\"stationid\":\"14\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"name\":\"Jump\",\"asset\":{\"id\":1,\"file_original_name\":\"Screenshot_1 (1)\",\"file_name\":\"uploads\\/all\\/ihXqpE8bBn0cHR1huHvY01Lz0KNG7rXvWdI9CIKy.jpg\",\"file_size\":\"16458\",\"extension\":\"jpg\",\"type\":\"image\",\"created_at\":\"2022-05-25T00:08:06.000000Z\",\"updated_at\":\"2022-05-25T00:08:06.000000Z\",\"deleted_at\":null}},{\"id\":21,\"podid\":\"13\",\"stationid\":\"2\",\"created_at\":\"2022-06-13T23:14:13.000000Z\",\"updated_at\":\"2022-06-13T23:14:13.000000Z\",\"deleted_at\":null,\"name\":\"Push Up\",\"asset\":null}]}]}', NULL, '2022-07-06 05:36:58', '2022-08-13 19:40:05', NULL),
(5, 9, '250eaafa-7ce7-4927-8c56-4e1dca23fedf', '{\"id\":9,\"name\":\"Hurricane\",\"asset\":1,\"days\":\"Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday\",\"created_at\":\"2022-06-14T06:14:13.000000Z\",\"updated_at\":\"2022-06-14T06:14:13.000000Z\",\"deleted_at\":null}', 'active', '2022-08-13 20:00:57', '2022-08-13 20:00:57', NULL),
(6, 10, 'dc94b0fe-f164-4510-a23d-e3af50a81816', '{\"id\":10,\"name\":\"New Workout\",\"asset\":1,\"days\":\"Monday,Wednesday\",\"created_at\":\"2022-07-30T19:19:12.000000Z\",\"updated_at\":\"2022-07-30T19:19:12.000000Z\",\"deleted_at\":null}', 'active', '2022-08-13 20:01:26', '2022-08-13 20:01:26', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
