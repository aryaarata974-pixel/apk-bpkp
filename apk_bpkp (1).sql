-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2026 at 06:08 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apk_bpkp`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `aktivitas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `aktivitas`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Memantau Percakapan', 'Admin memantau percakapan #12', '2026-09-10 02:26:13', '2026-09-10 02:26:13'),
(2, 1, 'Memantau Percakapan', 'Admin memantau percakapan #10', '2026-09-10 02:26:25', '2026-09-10 02:26:25'),
(3, 4, 'Login', 'yahahah (konsultan) login ke sistem', '2026-09-10 02:30:33', '2026-09-10 02:30:33'),
(4, 4, 'Login', 'yahahah (konsultan) login ke sistem', '2026-09-10 02:40:38', '2026-09-10 02:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-admin@pakbpkp.test|10.200.64.95', 'i:3;', 1788830287),
('laravel-cache-admin@pakbpkp.test|10.200.64.95:timer', 'i:1788830287;', 1788830287);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"fa502915-060d-4fcb-9ba2-28136ce65d99\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788337382,\"delay\":null}', 0, NULL, 1788337382, 1788337382),
(2, 'default', '{\"uuid\":\"721950df-00a1-4c4b-ba28-9494347c16de\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788337390,\"delay\":null}', 0, NULL, 1788337390, 1788337390),
(3, 'default', '{\"uuid\":\"d70941ec-7e8e-4e93-8464-ad76b8d08eaa\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788337410,\"delay\":null}', 0, NULL, 1788337410, 1788337410),
(4, 'default', '{\"uuid\":\"b12d07b8-ad20-4f1b-8f6b-435ab27c14db\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788337623,\"delay\":null}', 0, NULL, 1788337623, 1788337623),
(5, 'default', '{\"uuid\":\"7593965d-1992-4bf1-b7d0-e28bcee12bfd\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788337641,\"delay\":null}', 0, NULL, 1788337641, 1788337641),
(6, 'default', '{\"uuid\":\"839a94da-2346-4f3a-8b43-96585249d52e\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788337851,\"delay\":null}', 0, NULL, 1788337851, 1788337851),
(7, 'default', '{\"uuid\":\"f5683e0a-dd36-49b2-ab78-85958559f1d4\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788371261,\"delay\":null}', 0, NULL, 1788371261, 1788371261),
(8, 'default', '{\"uuid\":\"36048fde-3719-4c59-af1c-128a77885d04\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788371275,\"delay\":null}', 0, NULL, 1788371275, 1788371275),
(9, 'default', '{\"uuid\":\"1f67a38c-0b29-4793-91c4-8390dc5c5efd\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788371309,\"delay\":null}', 0, NULL, 1788371309, 1788371309),
(10, 'default', '{\"uuid\":\"8d14f948-791b-4d3e-af7b-d6e2a34e791b\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788371323,\"delay\":null}', 0, NULL, 1788371323, 1788371323),
(11, 'default', '{\"uuid\":\"d953a940-3821-4f00-95ab-ce0aa6e02f39\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788371513,\"delay\":null}', 0, NULL, 1788371513, 1788371513),
(12, 'default', '{\"uuid\":\"ffbef5bc-9196-486e-8421-eadbe77da952\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788371585,\"delay\":null}', 0, NULL, 1788371585, 1788371585),
(13, 'default', '{\"uuid\":\"51c3a9ed-9afb-4752-a9c6-e90f3f3857f6\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788371589,\"delay\":null}', 0, NULL, 1788371589, 1788371589),
(14, 'default', '{\"uuid\":\"a01cbb61-418f-487d-9ec1-c25ea3f28009\",\"displayName\":\"App\\\\Events\\\\PesanDikirim\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:23:\\\"App\\\\Events\\\\PesanDikirim\\\":1:{s:5:\\\"pesan\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Pesan\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:1:{i:0;s:8:\\\"pengirim\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1788371797,\"delay\":null}', 0, NULL, 1788371797, 1788371797);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_konsultans`
--

CREATE TABLE `kategori_konsultans` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_konsultans`
--

INSERT INTO `kategori_konsultans` (`id`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'jawa', 'jawa', '2026-09-01 23:44:41', '2026-09-01 23:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `konsultan_profils`
--

CREATE TABLE `konsultan_profils` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `aktif` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konsultan_profils`
--

INSERT INTO `konsultan_profils` (`id`, `user_id`, `kategori_id`, `bio`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'jawa', 1, '2026-09-02 00:21:27', '2026-09-02 00:21:27');

-- --------------------------------------------------------

--
-- Table structure for table `konsultasis`
--

CREATE TABLE `konsultasis` (
  `id` bigint UNSIGNED NOT NULL,
  `audiens_id` bigint UNSIGNED NOT NULL,
  `konsultan_id` bigint UNSIGNED NOT NULL,
  `status` enum('menunggu','berlangsung','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `disembunyikan_oleh_audiens` tinyint(1) NOT NULL DEFAULT '0',
  `disembunyikan_oleh_konsultan` tinyint(1) NOT NULL DEFAULT '0',
  `dibersihkan_audiens_pada` timestamp NULL DEFAULT NULL,
  `dibersihkan_konsultan_pada` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konsultasis`
--

INSERT INTO `konsultasis` (`id`, `audiens_id`, `konsultan_id`, `status`, `disembunyikan_oleh_audiens`, `disembunyikan_oleh_konsultan`, `dibersihkan_audiens_pada`, `dibersihkan_konsultan_pada`, `created_at`, `updated_at`) VALUES
(10, 5, 4, 'berlangsung', 0, 1, NULL, NULL, '2026-09-08 01:09:57', '2026-09-08 01:16:52'),
(11, 6, 4, 'berlangsung', 0, 1, NULL, NULL, '2026-09-08 01:43:05', '2026-09-09 05:59:11'),
(12, 3, 4, 'berlangsung', 0, 0, NULL, NULL, '2026-09-08 06:22:34', '2026-09-08 06:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_09_02_065502_add_role_to_users_table', 2),
(5, '2026_09_02_065537_create_kategori_konsultans_table', 2),
(6, '2026_09_02_065538_create_konsultan_profils_table', 2),
(7, '2026_09_02_065539_create_konsultasis_table', 2),
(8, '2026_09_02_065539_create_pesans_table', 2),
(9, '2026_09_07_150115_add_disembunyikan_ke_pesans_table', 3),
(10, '2026_09_07_152024_add_disembunyikan_ke_konsultasis_table', 4),
(11, '2026_09_08_091959_add_waktu_bersih_ke_konsultasis_table', 5),
(12, '2026_09_08_094338_add_balas_ke_ke_pesans_table', 6),
(13, '2026_09_09_142730_add_file_ke_pesans_table', 7),
(14, '2026_09_10_100122_create_activity_logs_table', 8),
(15, '2026_09_10_100507_add_last_login_at_ke_users_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesans`
--

CREATE TABLE `pesans` (
  `id` bigint UNSIGNED NOT NULL,
  `konsultasi_id` bigint UNSIGNED NOT NULL,
  `pengirim_id` bigint UNSIGNED NOT NULL,
  `balas_ke_id` bigint UNSIGNED DEFAULT NULL,
  `isi_pesan` text COLLATE utf8mb4_unicode_ci,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_tipe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disembunyikan_oleh_pengirim` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesans`
--

INSERT INTO `pesans` (`id`, `konsultasi_id`, `pengirim_id`, `balas_ke_id`, `isi_pesan`, `file_path`, `file_nama`, `file_tipe`, `disembunyikan_oleh_pengirim`, `created_at`, `updated_at`) VALUES
(100, 11, 6, NULL, 'halo arya daniel ganteng', NULL, NULL, NULL, 0, '2026-09-08 01:43:26', '2026-09-08 01:43:26'),
(103, 11, 4, NULL, 'apala nih', NULL, NULL, NULL, 0, '2026-09-08 01:53:24', '2026-09-08 01:53:24'),
(105, 11, 6, NULL, 'adakah tambahtambhanya', NULL, NULL, NULL, 0, '2026-09-08 02:12:03', '2026-09-08 02:12:03'),
(108, 11, 6, NULL, 'makan', NULL, NULL, NULL, 0, '2026-09-08 03:00:27', '2026-09-08 03:00:27'),
(109, 11, 4, NULL, 'makan apa', NULL, NULL, NULL, 0, '2026-09-08 05:51:47', '2026-09-08 05:51:47'),
(111, 12, 3, NULL, 'Alo', NULL, NULL, NULL, 0, '2026-09-08 06:22:39', '2026-09-08 06:22:39'),
(112, 12, 3, NULL, 'Selamat siang', NULL, NULL, NULL, 0, '2026-09-08 06:22:48', '2026-09-08 06:22:48'),
(113, 12, 4, NULL, 'siang ada yang bisa saya bantu', NULL, NULL, NULL, 0, '2026-09-08 06:23:04', '2026-09-08 06:23:04'),
(114, 12, 3, 113, 'Halo', NULL, NULL, NULL, 0, '2026-09-08 06:23:22', '2026-09-08 06:23:22'),
(115, 12, 3, NULL, 'Tes', NULL, NULL, NULL, 0, '2026-09-08 06:24:17', '2026-09-08 06:24:17'),
(116, 12, 3, NULL, 'Alo', NULL, NULL, NULL, 0, '2026-09-09 06:35:16', '2026-09-09 06:35:16'),
(117, 12, 4, NULL, NULL, 'chat_files/MDS7EwvRwvnezUSz7yi5bkx3im5emQjDRI2Ynwuk.jpg', 'Gambar WhatsApp 2024-07-16 pukul 18.51.03_76af1637.jpg', 'image/jpeg', 0, '2026-09-09 06:35:30', '2026-09-09 06:35:30'),
(118, 12, 4, NULL, NULL, 'chat_files/Q2sknqUIJCJCTGL1PSJbpUMDgqNaZvcbYIHzmxAv.jpg', 'Gambar WhatsApp 2024-07-16 pukul 18.51.03_76af1637.jpg', 'image/jpeg', 0, '2026-09-09 06:36:32', '2026-09-09 06:36:32'),
(119, 12, 4, NULL, NULL, 'chat_files/nkQVNganW13R7WBatSuTyO2KChJ54YUrbpx5HWA0.docx', 'LOGBOOK KKL MINGGUAN 4.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, '2026-09-09 06:38:11', '2026-09-09 06:38:11'),
(120, 12, 4, NULL, NULL, 'chat_files/iRtGtk0MF3P4np9FIgrr74ZYcM1RhisdnXxrBRWI.png', 'Screenshot 2026-09-09 142104.png', 'image/png', 0, '2026-09-09 06:45:05', '2026-09-09 06:45:05'),
(121, 12, 3, NULL, NULL, 'chat_files/wh1jnBqNO522le3ql99tIBR5KE2fAUXrwG7QTRdi.jpg', 'Screenshot_2026-09-09-14-36-37-01_40deb401b9ffe8e1df2f1cc5ba480b12.jpg', 'image/jpeg', 0, '2026-09-09 07:00:04', '2026-09-09 07:00:04'),
(122, 12, 4, NULL, NULL, 'chat_files/NqOx4C2Nt2OqPw1XGK7jiTErH2V57ycckZDk3zfn.docx', 'LOGBOOK KKL MINGGUAN 4.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, '2026-09-09 07:00:27', '2026-09-09 07:00:27'),
(123, 12, 3, NULL, 'Test', NULL, NULL, NULL, 0, '2026-09-10 01:04:22', '2026-09-10 01:04:22'),
(124, 12, 3, NULL, 'Alo', NULL, NULL, NULL, 0, '2026-09-10 01:04:29', '2026-09-10 01:04:29'),
(125, 12, 3, NULL, NULL, 'chat_files/0u2ExEHmcoqBYWClIeKJ6XjTAkGhf3fBDCKFAvHE.docx', 'nkQVNganW13R7WBatSuTyO2KChJ54YUrbpx5HWA0.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, '2026-09-10 01:04:56', '2026-09-10 01:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('qp2yCBVDD3CWFxgIC45mPPI900r4lvFYbKaOjz2Z', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM0dONjRIeEVoaGJmaDdkdk9OTVVTanVKdTQzbGhLYmJhMVM5SjJVUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rb25zdWx0YXNpLzEyIjtzOjU6InJvdXRlIjtzOjE1OiJrb25zdWx0YXNpLnNob3ciO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1789008043),
('SFo48SdXILJaBrgfo5gJoo47IaGfTbF4sR2FyuZy', 3, '10.200.64.75', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoialpmdlNMU21Sa0EzZHJrRVpMMU5xb2JVRHNqZ1IwYXFIVXVhVVhmRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMC4yMDAuNjQuODc6ODAwMC9rb25zdWx0YXNpLzEyIjtzOjU6InJvdXRlIjtzOjE1OiJrb25zdWx0YXNpLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1789007241);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','konsultan','audiens') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'audiens',
  `last_login_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `last_login_at`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@apkbpkp.test', 'admin', NULL, NULL, '$2y$12$GxysLzYhRdPmId1q562voeJLvs//VR2rENKD1zMkHrgEWRT1oAGqS', NULL, '2026-09-01 23:16:22', '2026-09-01 23:16:22'),
(3, 'Test', 'audiens1@test.com', 'audiens', NULL, NULL, '$2y$12$ArZi3Q4AHXb89ni7epY3Du2V4a4NsA5d/GwP.NJcrasfCVzRmyFTa', NULL, '2026-09-01 23:23:59', '2026-09-07 07:51:03'),
(4, 'yahahah', 'konsultan1@test.com', 'konsultan', NULL, NULL, '$2y$12$OOMJipUeYp1kcRmlCOYhSepof3sEv42/VAtxaO1uWcWklwasO.57G', NULL, '2026-09-02 00:14:51', '2026-09-06 19:10:14'),
(5, 'daniel', 'danielsampeluna123@gmail.com', 'audiens', NULL, NULL, '$2y$12$M0KzD/zaBS4ifZsl9LpqKuQVn3RWj6I0RmuZbckSDDm5qvF8nZTYO', 'ye7vdZrk9X7EFQ7mFO4SFT4q7XfJwwCLx33glS5n9dOagu0rNZ5n4h5oqP4J', '2026-09-08 01:09:35', '2026-09-08 01:09:35'),
(6, 'andra 27', 'viandraremak@gmail.com', 'audiens', NULL, NULL, '$2y$12$7y1eRZkigpirn5AYvVNTae.nP8olNsLXlP6ZFyQ52X4tdfV9Wa4FK', NULL, '2026-09-08 01:37:43', '2026-09-08 01:37:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_konsultans`
--
ALTER TABLE `kategori_konsultans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsultan_profils`
--
ALTER TABLE `konsultan_profils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsultan_profils_user_id_foreign` (`user_id`),
  ADD KEY `konsultan_profils_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `konsultasis`
--
ALTER TABLE `konsultasis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsultasis_audiens_id_foreign` (`audiens_id`),
  ADD KEY `konsultasis_konsultan_id_foreign` (`konsultan_id`);

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
-- Indexes for table `pesans`
--
ALTER TABLE `pesans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesans_konsultasi_id_foreign` (`konsultasi_id`),
  ADD KEY `pesans_pengirim_id_foreign` (`pengirim_id`),
  ADD KEY `pesans_balas_ke_id_foreign` (`balas_ke_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kategori_konsultans`
--
ALTER TABLE `kategori_konsultans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `konsultan_profils`
--
ALTER TABLE `konsultan_profils`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `konsultasis`
--
ALTER TABLE `konsultasis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pesans`
--
ALTER TABLE `pesans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `konsultan_profils`
--
ALTER TABLE `konsultan_profils`
  ADD CONSTRAINT `konsultan_profils_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_konsultans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `konsultan_profils_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `konsultasis`
--
ALTER TABLE `konsultasis`
  ADD CONSTRAINT `konsultasis_audiens_id_foreign` FOREIGN KEY (`audiens_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `konsultasis_konsultan_id_foreign` FOREIGN KEY (`konsultan_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pesans`
--
ALTER TABLE `pesans`
  ADD CONSTRAINT `pesans_balas_ke_id_foreign` FOREIGN KEY (`balas_ke_id`) REFERENCES `pesans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pesans_konsultasi_id_foreign` FOREIGN KEY (`konsultasi_id`) REFERENCES `konsultasis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pesans_pengirim_id_foreign` FOREIGN KEY (`pengirim_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
