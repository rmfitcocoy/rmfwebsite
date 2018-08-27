-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2018 at 12:08 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rmf_illdy`
--

-- --------------------------------------------------------

--
-- Table structure for table `rmf_commentmeta`
--

CREATE TABLE `rmf_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rmf_comments`
--

CREATE TABLE `rmf_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_comments`
--

INSERT INTO `rmf_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-08-21 07:30:06', '2018-08-21 07:30:06', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rmf_links`
--

CREATE TABLE `rmf_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rmf_options`
--

CREATE TABLE `rmf_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_options`
--

INSERT INTO `rmf_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy', 'yes'),
(2, 'home', 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy', 'yes'),
(3, 'blogname', 'RMF Website', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'francisco.abayon@rafi.org.ph', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=6&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:55:\"colorlib-login-customizer/colorlib-login-customizer.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";i:2;s:35:\"fancybox-for-wordpress/fancybox.php\";i:3;s:35:\"illdy-companion/illdy-companion.php\";i:4;s:39:\"kiwi-social-share/kiwi-social-share.php\";i:5;s:53:\"simple-custom-post-order/simple-custom-post-order.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'illdy', 'yes'),
(41, 'stylesheet', 'illdy', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:4:{i:5;a:3:{s:5:\"title\";s:8:\"PRODUCTS\";s:4:\"text\";s:201:\"<ul><li><a href=\"#\" title=\"Our work\">Our work</a></li><li><a href=\"#\" title=\"Club\">Club</a></li><li><a href=\"#\" title=\"News\">News</a></li><li><a href=\"#\" title=\"Announcement\">Announcement</a></li></ul>\";s:6:\"filter\";b:0;}i:6;a:3:{s:5:\"title\";s:11:\"INFORMATION\";s:4:\"text\";s:197:\"<ul><li><a href=\"#\" title=\"Pricing\">Pricing</a></li><li><a href=\"#\" title=\"Terms\">Terms</a></li><li><a href=\"#\" title=\"Affiliates\">Affiliates</a></li><li><a href=\"#\" title=\"Blog\">Blog</a></li></ul>\";s:6:\"filter\";b:0;}i:7;a:3:{s:5:\"title\";s:7:\"SUPPORT\";s:4:\"text\";s:205:\"<ul><li><a href=\"#\" title=\"Documentation\">Documentation</a></li><li><a href=\"#\" title=\"FAQs\">FAQs</a></li><li><a href=\"#\" title=\"Forums\">Forums</a></li><li><a href=\"#\" title=\"Contact\">Contact</a></li></ul>\";s:6:\"filter\";b:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:53:\"simple-custom-post-order/simple-custom-post-order.php\";s:18:\"scporder_uninstall\";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '7', 'yes'),
(84, 'page_on_front', '6', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'rmf_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:15:{s:19:\"wp_inactive_widgets\";a:0:{}s:12:\"blog-sidebar\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:12:\"page-sidebar\";a:0:{}s:16:\"footer-sidebar-1\";a:1:{i:0;s:6:\"text-5\";}s:16:\"footer-sidebar-2\";a:1:{i:0;s:6:\"text-6\";}s:16:\"footer-sidebar-3\";a:1:{i:0;s:6:\"text-7\";}s:16:\"footer-sidebar-4\";a:0:{}s:24:\"front-page-about-sidebar\";a:3:{i:0;s:13:\"illdy_skill-2\";i:1;s:13:\"illdy_skill-3\";i:2;s:13:\"illdy_skill-4\";}s:27:\"front-page-projects-sidebar\";a:4:{i:0;s:15:\"illdy_project-3\";i:1;s:15:\"illdy_project-4\";i:2;s:15:\"illdy_project-5\";i:3;s:15:\"illdy_project-6\";}s:27:\"front-page-services-sidebar\";a:3:{i:0;s:15:\"illdy_service-2\";i:1;s:15:\"illdy_service-3\";i:2;s:15:\"illdy_service-4\";}s:26:\"front-page-counter-sidebar\";a:3:{i:0;s:15:\"illdy_counter-4\";i:1;s:15:\"illdy_counter-3\";i:2;s:15:\"illdy_counter-2\";}s:23:\"front-page-team-sidebar\";a:3:{i:0;s:14:\"illdy_person-5\";i:1;s:14:\"illdy_person-4\";i:2;s:14:\"illdy_person-2\";}s:29:\"front-page-full-width-sidebar\";a:0:{}s:31:\"front-page-testimonials-sidebar\";a:2:{i:0;s:19:\"illdy_testimonial-1\";i:1;s:19:\"illdy_testimonial-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'cron', 'a:5:{i:1535074209;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1535095809;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1535095975;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1535095976;a:1:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(112, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1534837243;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(116, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1535062128;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(121, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1535062136;s:7:\"checked\";a:4:{s:5:\"illdy\";s:5:\"2.1.1\";s:13:\"twentyfifteen\";s:3:\"2.0\";s:15:\"twentyseventeen\";s:3:\"1.7\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(123, 'can_compress_scripts', '1', 'no'),
(126, 'current_theme', 'Illdy', 'yes'),
(127, 'theme_mods_illdy', 'a:61:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:22:\"illdy_services_general\";i:1;s:28:\"illdy_services_general_title\";s:8:\"Services\";s:28:\"illdy_services_general_entry\";s:113:\"In order to help you grow your business, our carefully selected experts can advise you in in the following areas:\";s:22:\"illdy_preloader_enable\";i:1;s:32:\"illdy_preloader_background_color\";s:7:\"#ffffff\";s:29:\"illdy_preloader_primary_color\";s:7:\"#f1d204\";s:30:\"illdy_preloader_secondly_color\";s:7:\"#ffffff\";s:15:\"illdy_text_logo\";s:5:\"Illdy\";s:30:\"illdy_contact_bar_facebook_url\";s:1:\"#\";s:29:\"illdy_contact_bar_twitter_url\";s:1:\"#\";s:30:\"illdy_contact_bar_linkedin_url\";s:1:\"#\";s:11:\"illdy_email\";s:16:\"contact@site.com\";s:11:\"illdy_phone\";s:14:\"(555) 555-5555\";s:14:\"illdy_address1\";s:26:\"Street 221B Baker Street, \";s:14:\"illdy_address2\";s:10:\"London, UK\";s:38:\"illdy_general_footer_display_copyright\";i:1;s:22:\"illdy_footer_copyright\";s:43:\"&copy; Copyright 2016. All Rights Reserved.\";s:21:\"illdy_img_footer_logo\";s:123:\"http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/wp-content/themes/illdy/layout/images/footer-logo.png\";s:38:\"illdy_enable_post_posted_on_blog_posts\";i:1;s:37:\"illdy_enable_post_category_blog_posts\";i:1;s:33:\"illdy_enable_post_tags_blog_posts\";i:1;s:37:\"illdy_enable_post_comments_blog_posts\";i:1;s:38:\"illdy_enable_social_sharing_blog_posts\";i:1;s:34:\"illdy_enable_author_box_blog_posts\";i:1;s:23:\"illdy_team_general_show\";i:1;s:24:\"illdy_team_general_title\";s:4:\"Team\";s:24:\"illdy_team_general_entry\";s:71:\"Meet the people that are going to take your business to the next level.\";s:31:\"illdy_testimonials_general_show\";i:1;s:32:\"illdy_testimonials_general_title\";s:12:\"Testimonials\";s:34:\"illdy_testimonials_number_of_posts\";i:4;s:24:\"illdy_about_general_show\";i:1;s:25:\"illdy_about_general_title\";s:5:\"About\";s:25:\"illdy_about_general_entry\";s:358:\"It is an amazing one-page theme with great features that offers an incredible experience. It is easy to install, make changes, adapt for your business. A modern design with clean lines and styling for a wide variety of content, exactly how a business design should be. You can add as many images as you want to the main header area and turn them into slider.\";s:29:\"illdy_contact_us_general_show\";i:1;s:30:\"illdy_contact_us_general_title\";s:10:\"Contact us\";s:30:\"illdy_contact_us_general_entry\";s:45:\"And we will get in touch as soon as possible.\";s:38:\"illdy_contact_us_general_address_title\";s:7:\"Address\";s:47:\"illdy_contact_us_general_customer_support_title\";s:16:\"Customer Support\";s:26:\"illdy_counter_general_show\";i:1;s:29:\"illdy_counter_background_type\";s:5:\"image\";s:30:\"illdy_counter_background_image\";s:141:\"http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/wp-content/themes/illdy/layout/images/front-page/front-page-counter.jpg\";s:30:\"illdy_counter_background_color\";s:7:\"#000000\";s:29:\"illdy_jumbotron_general_image\";s:140:\"http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/wp-content/themes/illdy/layout/images/front-page/front-page-header.jpg\";s:29:\"illdy_jumbotron_general_entry\";s:148:\"lldy is a great one-page theme, perfect for developers and designers but also for someone who just wants a new website for his business. Try it now!\";s:42:\"illdy_jumbotron_general_first_button_title\";s:10:\"Learn more\";s:45:\"illdyilldy_jumbotron_general_first_button_url\";s:1:\"#\";s:43:\"illdy_jumbotron_general_second_button_title\";s:8:\"Download\";s:46:\"illdyilldy_jumbotron_general_second_button_url\";s:1:\"#\";s:30:\"illdy_latest_news_general_show\";i:1;s:31:\"illdy_latest_news_general_title\";s:11:\"Latest News\";s:31:\"illdy_latest_news_general_entry\";s:119:\"If you are interested in the latest articles in the industry, take a sneak peek at our blog. You have nothing to loose!\";s:29:\"illdy_latest_news_button_text\";s:8:\"See blog\";s:33:\"illdy_latest_news_number_of_posts\";i:3;s:27:\"illdy_projects_general_show\";i:1;s:28:\"illdy_projects_general_title\";s:8:\"Projects\";s:28:\"illdy_projects_general_entry\";s:35:\"You\'ll love our work. Check it out!\";s:24:\"illdy_frontpage_sections\";a:9:{i:0;s:17:\"illdy_panel_about\";i:1;s:20:\"illdy_panel_projects\";i:2;s:26:\"illdy_testimonials_general\";i:3;s:20:\"illdy_panel_services\";i:4;s:25:\"illdy_latest_news_general\";i:5;s:21:\"illdy_counter_general\";i:6;s:16:\"illdy_panel_team\";i:7;s:16:\"illdy_contact_us\";i:8;s:16:\"illdy_full_width\";}s:21:\"illdy_jumbotron_title\";s:85:\"Clean<span class=\"span-dot\">.</span>Slick<span class=\"span-dot\">.</span>Pixel Perfect\";s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(128, 'theme_switched', '', 'yes'),
(129, 'illdy_backup_settings', '5', 'yes'),
(136, 'recently_activated', 'a:0:{}', 'yes'),
(137, 'widget_illdy_recent_posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(138, 'widget_illdy_skill', 'a:4:{s:12:\"_multiwidget\";i:1;i:2;a:4:{s:5:\"title\";s:10:\"Typography\";s:10:\"percentage\";i:60;s:4:\"icon\";s:10:\"fa fa-font\";s:5:\"color\";s:7:\"#f18b6d\";}i:3;a:4:{s:5:\"title\";s:6:\"Design\";s:10:\"percentage\";i:82;s:4:\"icon\";s:12:\"fa fa-pencil\";s:5:\"color\";s:7:\"#f1d204\";}i:4;a:4:{s:5:\"title\";s:11:\"Development\";s:10:\"percentage\";i:86;s:4:\"icon\";s:10:\"fa fa-code\";s:5:\"color\";s:7:\"#6a4d8a\";}}', 'yes'),
(139, 'widget_illdy_project', 'a:5:{s:12:\"_multiwidget\";i:1;i:3;a:4:{s:5:\"title\";s:9:\"Project 1\";s:5:\"image\";s:91:\"https://cdn.colorlib.com/illdy/wp-content/uploads/sites/11/2016/03/front-page-project-1.jpg\";s:5:\"video\";s:0:\"\";s:3:\"url\";s:1:\"#\";}i:4;a:4:{s:5:\"title\";s:9:\"Project 2\";s:5:\"image\";s:91:\"https://cdn.colorlib.com/illdy/wp-content/uploads/sites/11/2016/03/front-page-project-2.jpg\";s:5:\"video\";s:0:\"\";s:3:\"url\";s:1:\"#\";}i:5;a:4:{s:5:\"title\";s:9:\"Project 3\";s:5:\"image\";s:91:\"https://cdn.colorlib.com/illdy/wp-content/uploads/sites/11/2016/03/front-page-project-3.jpg\";s:5:\"video\";s:0:\"\";s:3:\"url\";s:1:\"#\";}i:6;a:4:{s:5:\"title\";s:9:\"Project 4\";s:5:\"image\";s:91:\"https://cdn.colorlib.com/illdy/wp-content/uploads/sites/11/2016/03/front-page-project-4.jpg\";s:5:\"video\";s:0:\"\";s:3:\"url\";s:1:\"#\";}}', 'yes'),
(140, 'widget_illdy_service', 'a:4:{s:12:\"_multiwidget\";i:1;i:2;a:4:{s:5:\"title\";s:10:\"Web Design\";s:4:\"icon\";s:12:\"fa fa-pencil\";s:5:\"entry\";s:185:\"Consectetur adipiscing elit. Praesent molestie urna hendrerit erat tincidunt tempus. Aliquam a leo risus. Fusce a metus non augue dapibus porttitor at in mauris. Pellentesque commodo...\";s:5:\"color\";s:7:\"#f18b6d\";}i:3;a:4:{s:5:\"title\";s:15:\"WEB DEVELOPMENT\";s:4:\"icon\";s:10:\"fa fa-code\";s:5:\"entry\";s:185:\"Consectetur adipiscing elit. Praesent molestie urna hendrerit erat tincidunt tempus. Aliquam a leo risus. Fusce a metus non augue dapibus porttitor at in mauris. Pellentesque commodo...\";s:5:\"color\";s:7:\"#f1d204\";}i:4;a:4:{s:5:\"title\";s:12:\"SEO Analisys\";s:4:\"icon\";s:12:\"fa fa-search\";s:5:\"entry\";s:185:\"Consectetur adipiscing elit. Praesent molestie urna hendrerit erat tincidunt tempus. Aliquam a leo risus. Fusce a metus non augue dapibus porttitor at in mauris. Pellentesque commodo...\";s:5:\"color\";s:7:\"#6a4d8a\";}}', 'yes'),
(141, 'widget_illdy_counter', 'a:4:{s:12:\"_multiwidget\";i:1;i:4;a:5:{s:5:\"title\";s:8:\"Projects\";s:9:\"data_from\";i:1;s:7:\"data_to\";i:260;s:10:\"data_speed\";i:2000;s:21:\"data_refresh_interval\";i:100;}i:3;a:5:{s:5:\"title\";s:7:\"Clients\";s:9:\"data_from\";i:1;s:7:\"data_to\";i:120;s:10:\"data_speed\";i:2000;s:21:\"data_refresh_interval\";i:100;}i:2;a:5:{s:5:\"title\";s:6:\"Coffes\";s:9:\"data_from\";i:1;s:7:\"data_to\";i:260;s:10:\"data_speed\";i:2000;s:21:\"data_refresh_interval\";i:100;}}', 'yes'),
(142, 'widget_illdy_person', 'a:4:{s:12:\"_multiwidget\";i:1;i:5;a:8:{s:5:\"title\";s:13:\"Mark Lawrance\";s:5:\"image\";s:101:\"https://cdn.colorlib.com/illdy/wp-content/themes/illdy/layout/images/front-page/front-page-team-1.jpg\";s:8:\"position\";s:12:\"Web Designer\";s:5:\"entry\";s:42:\"Creative, detail-oriented, always focused.\";s:12:\"facebook_url\";s:1:\"#\";s:11:\"twitter_url\";s:1:\"#\";s:12:\"linkedin_url\";s:1:\"#\";s:5:\"color\";s:7:\"#f18b6d\";}i:4;a:8:{s:5:\"title\";s:12:\"Jane Stenton\";s:5:\"image\";s:101:\"https://cdn.colorlib.com/illdy/wp-content/themes/illdy/layout/images/front-page/front-page-team-2.jpg\";s:8:\"position\";s:14:\"SEO Specialist\";s:5:\"entry\";s:59:\"Curious, tech-geeck and gets serious when it comes to work.\";s:12:\"facebook_url\";s:1:\"#\";s:11:\"twitter_url\";s:1:\"#\";s:12:\"linkedin_url\";s:1:\"#\";s:5:\"color\";s:7:\"#f1d204\";}i:2;a:8:{s:5:\"title\";s:10:\"John Smith\";s:5:\"image\";s:101:\"https://cdn.colorlib.com/illdy/wp-content/themes/illdy/layout/images/front-page/front-page-team-3.jpg\";s:8:\"position\";s:9:\"Developer\";s:5:\"entry\";s:51:\"Enthusiastic, passionate with great sense of humor.\";s:12:\"facebook_url\";s:1:\"#\";s:11:\"twitter_url\";s:1:\"#\";s:12:\"linkedin_url\";s:1:\"#\";s:5:\"color\";s:7:\"#6a4d8a\";}}', 'yes'),
(143, 'widget_illdy_home_parallax', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(144, 'widget_illdy_testimonial', 'a:3:{s:12:\"_multiwidget\";i:1;i:1;a:3:{s:4:\"name\";s:10:\"Jane Smith\";s:5:\"image\";s:108:\"https://cdn.colorlib.com/illdy/wp-content/themes/illdy/layout/images/front-page/front-page-testimonial-1.jpg\";s:11:\"testimonial\";s:445:\"                    Awesome theme with great design and helpfull support. If you don’t know how to code your own WordPress theme, but you still want a good-looking website for your business, Illdy might be exactly what you need. It is a slick theme with a lot of of features to choose from. You can customize whatever section you want and you can rest assure that no matter what device your website is viewed on – it looks great.            \";}i:2;a:3:{s:4:\"name\";s:10:\"Jane Smith\";s:5:\"image\";s:90:\"https://cdn.colorlib.com/illdy/wp-content/uploads/sites/11/2016/02/mike-muller-127x127.jpg\";s:11:\"testimonial\";s:445:\"                    Awesome theme with great design and helpfull support. If you don’t know how to code your own WordPress theme, but you still want a good-looking website for your business, Illdy might be exactly what you need. It is a slick theme with a lot of of features to choose from. You can customize whatever section you want and you can rest assure that no matter what device your website is viewed on – it looks great.            \";}}', 'yes'),
(150, 'illdy_show_required_actions', 'a:1:{s:24:\"illdy-req-import-content\";b:1;}', 'yes'),
(151, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.0.3\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1534863862;s:7:\"version\";s:5:\"5.0.3\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(166, 'mfbfw', 'a:47:{s:6:\"border\";s:0:\"\";s:11:\"borderColor\";s:7:\"#BBBBBB\";s:15:\"showCloseButton\";s:2:\"on\";s:11:\"closeHorPos\";s:5:\"right\";s:11:\"closeVerPos\";s:3:\"top\";s:12:\"paddingColor\";s:7:\"#FFFFFF\";s:7:\"padding\";s:2:\"10\";s:11:\"overlayShow\";s:2:\"on\";s:12:\"overlayColor\";s:7:\"#666666\";s:14:\"overlayOpacity\";s:3:\"0.3\";s:9:\"titleShow\";s:2:\"on\";s:13:\"titlePosition\";s:6:\"inside\";s:10:\"titleColor\";s:7:\"#333333\";s:13:\"showNavArrows\";s:2:\"on\";s:11:\"zoomOpacity\";s:2:\"on\";s:11:\"zoomSpeedIn\";s:3:\"500\";s:12:\"zoomSpeedOut\";s:3:\"500\";s:15:\"zoomSpeedChange\";s:3:\"300\";s:12:\"transitionIn\";s:4:\"fade\";s:13:\"transitionOut\";s:4:\"fade\";s:6:\"easing\";s:0:\"\";s:8:\"easingIn\";s:11:\"easeOutBack\";s:9:\"easingOut\";s:10:\"easeInBack\";s:12:\"easingChange\";s:14:\"easeInOutQuart\";s:10:\"imageScale\";s:2:\"on\";s:14:\"centerOnScroll\";s:2:\"on\";s:18:\"hideOnContentClick\";s:0:\"\";s:18:\"hideOnOverlayClick\";s:2:\"on\";s:18:\"enableEscapeButton\";s:2:\"on\";s:6:\"cyclic\";s:0:\"\";s:10:\"mouseWheel\";s:0:\"\";s:11:\"galleryType\";s:3:\"all\";s:16:\"customExpression\";s:74:\"jQuery(thumbnails).addClass(\"fancybox\").attr(\"rel\",\"fancybox\").getTitle();\";s:14:\"autoDimensions\";s:2:\"on\";s:10:\"frameWidth\";s:3:\"560\";s:11:\"frameHeight\";s:3:\"340\";s:12:\"loadAtFooter\";s:0:\"\";s:14:\"callbackEnable\";s:0:\"\";s:15:\"callbackOnStart\";s:31:\"function() { alert(\"Start!\"); }\";s:16:\"callbackOnCancel\";s:32:\"function() { alert(\"Cancel!\"); }\";s:18:\"callbackOnComplete\";s:34:\"function() { alert(\"Complete!\"); }\";s:17:\"callbackOnCleanup\";s:33:\"function() { alert(\"CleanUp!\"); }\";s:15:\"callbackOnClose\";s:31:\"function() { alert(\"Close!\"); }\";s:8:\"nojQuery\";s:0:\"\";s:16:\"extraCallsEnable\";s:0:\"\";s:14:\"extraCallsData\";s:0:\"\";s:9:\"uninstall\";s:0:\"\";}', 'yes'),
(167, 'mfbfw_active_version', '3.0.12', 'yes'),
(171, 'scporder_install', '1', 'yes'),
(173, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1535062136;s:7:\"checked\";a:8:{s:19:\"akismet/akismet.php\";s:5:\"4.0.8\";s:55:\"colorlib-login-customizer/colorlib-login-customizer.php\";s:5:\"1.2.0\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.0.3\";s:35:\"fancybox-for-wordpress/fancybox.php\";s:6:\"3.0.13\";s:9:\"hello.php\";s:3:\"1.7\";s:35:\"illdy-companion/illdy-companion.php\";s:5:\"2.1.1\";s:39:\"kiwi-social-share/kiwi-social-share.php\";s:5:\"2.0.8\";s:53:\"simple-custom-post-order/simple-custom-post-order.php\";s:5:\"2.3.2\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:8:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.8\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:55:\"colorlib-login-customizer/colorlib-login-customizer.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:39:\"w.org/plugins/colorlib-login-customizer\";s:4:\"slug\";s:25:\"colorlib-login-customizer\";s:6:\"plugin\";s:55:\"colorlib-login-customizer/colorlib-login-customizer.php\";s:11:\"new_version\";s:5:\"1.2.0\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/colorlib-login-customizer/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/colorlib-login-customizer.1.2.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/colorlib-login-customizer/assets/icon-256x256.jpg?rev=1862920\";s:2:\"1x\";s:78:\"https://ps.w.org/colorlib-login-customizer/assets/icon-256x256.jpg?rev=1862920\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:80:\"https://ps.w.org/colorlib-login-customizer/assets/banner-772x250.jpg?rev=1862920\";}s:11:\"banners_rtl\";a:0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.0.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.0.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007\";s:2:\"1x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=984007\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}}s:35:\"fancybox-for-wordpress/fancybox.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/fancybox-for-wordpress\";s:4:\"slug\";s:22:\"fancybox-for-wordpress\";s:6:\"plugin\";s:35:\"fancybox-for-wordpress/fancybox.php\";s:11:\"new_version\";s:6:\"3.0.13\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/fancybox-for-wordpress/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/fancybox-for-wordpress/assets/icon-256x256.jpg?rev=1864321\";s:2:\"1x\";s:75:\"https://ps.w.org/fancybox-for-wordpress/assets/icon-256x256.jpg?rev=1864321\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:77:\"https://ps.w.org/fancybox-for-wordpress/assets/banner-772x250.jpg?rev=1864321\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}s:35:\"illdy-companion/illdy-companion.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:29:\"w.org/plugins/illdy-companion\";s:4:\"slug\";s:15:\"illdy-companion\";s:6:\"plugin\";s:35:\"illdy-companion/illdy-companion.php\";s:11:\"new_version\";s:5:\"2.1.1\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/illdy-companion/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/illdy-companion.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/illdy-companion/assets/icon-256x256.jpg?rev=1492620\";s:2:\"1x\";s:68:\"https://ps.w.org/illdy-companion/assets/icon-256x256.jpg?rev=1492620\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:70:\"https://ps.w.org/illdy-companion/assets/banner-772x250.jpg?rev=1492620\";}s:11:\"banners_rtl\";a:0:{}}s:39:\"kiwi-social-share/kiwi-social-share.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:31:\"w.org/plugins/kiwi-social-share\";s:4:\"slug\";s:17:\"kiwi-social-share\";s:6:\"plugin\";s:39:\"kiwi-social-share/kiwi-social-share.php\";s:11:\"new_version\";s:5:\"2.0.8\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/kiwi-social-share/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/kiwi-social-share.2.0.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/kiwi-social-share/assets/icon-256x256.png?rev=1445882\";s:2:\"1x\";s:70:\"https://ps.w.org/kiwi-social-share/assets/icon-256x256.png?rev=1445882\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/kiwi-social-share/assets/banner-772x250.png?rev=1445902\";}s:11:\"banners_rtl\";a:0:{}}s:53:\"simple-custom-post-order/simple-custom-post-order.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:38:\"w.org/plugins/simple-custom-post-order\";s:4:\"slug\";s:24:\"simple-custom-post-order\";s:6:\"plugin\";s:53:\"simple-custom-post-order/simple-custom-post-order.php\";s:11:\"new_version\";s:5:\"2.3.2\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/simple-custom-post-order/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/simple-custom-post-order.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/simple-custom-post-order/assets/icon-256x256.jpg?rev=1859717\";s:2:\"1x\";s:77:\"https://ps.w.org/simple-custom-post-order/assets/icon-256x256.jpg?rev=1859717\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:79:\"https://ps.w.org/simple-custom-post-order/assets/banner-772x250.jpg?rev=1859717\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(174, 'colorlib-login-customizer_version', '1.2.0', 'yes'),
(175, 'kiwi_social_sharing_version', '2.0.8', 'yes'),
(176, 'kiwi_general_settings', 'a:9:{s:17:\"networks_ordering\";s:0:\"\";s:20:\"networks_article_bar\";a:5:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:11:\"google-plus\";i:3;s:9:\"pinterest\";i:4;s:6:\"fintel\";}s:13:\"share_buttons\";s:2:\"on\";s:22:\"share_buttons_location\";s:3:\"top\";s:12:\"button_shape\";s:4:\"rect\";s:23:\"share_buttons_posttypes\";s:0:\"\";s:24:\"floating_panel_posttypes\";s:0:\"\";s:28:\"share_buttons_posttypes_list\";a:0:{}s:29:\"floating_panel_posttypes_list\";a:0:{}}', 'yes'),
(196, '_transient_is_multi_author', '0', 'yes'),
(220, '_site_transient_timeout_theme_roots', '1535063934', 'no'),
(221, '_site_transient_theme_roots', 'a:4:{s:5:\"illdy\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `rmf_postmeta`
--

CREATE TABLE `rmf_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_postmeta`
--

INSERT INTO `rmf_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 8, '_form', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]'),
(4, 8, '_mail', 'a:8:{s:7:\"subject\";s:28:\"RMF Website \"[your-subject]\"\";s:6:\"sender\";s:42:\"[your-name] <francisco.abayon@rafi.org.ph>\";s:4:\"body\";s:219:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on RMF Website (http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy)\";s:9:\"recipient\";s:28:\"francisco.abayon@rafi.org.ph\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(5, 8, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:28:\"RMF Website \"[your-subject]\"\";s:6:\"sender\";s:42:\"RMF Website <francisco.abayon@rafi.org.ph>\";s:4:\"body\";s:161:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on RMF Website (http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy)\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:38:\"Reply-To: francisco.abayon@rafi.org.ph\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(6, 8, '_messages', 'a:8:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";}'),
(7, 8, '_additional_settings', NULL),
(8, 8, '_locale', 'en_US'),
(9, 6, '_edit_lock', '1534864906:1'),
(10, 9, '_wp_trash_meta_status', 'publish'),
(11, 9, '_wp_trash_meta_time', '1534865004');

-- --------------------------------------------------------

--
-- Table structure for table `rmf_posts`
--

CREATE TABLE `rmf_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_posts`
--

INSERT INTO `rmf_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-08-21 07:30:06', '2018-08-21 07:30:06', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-08-21 07:30:06', '2018-08-21 07:30:06', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/?p=1', 0, 'post', '', 1),
(2, 1, '2018-08-21 07:30:06', '2018-08-21 07:30:06', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-08-21 07:30:06', '2018-08-21 07:30:06', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-08-21 07:30:06', '2018-08-21 07:30:06', '<h2>Who we are</h2><p>Our website address is: http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2018-08-21 07:30:06', '2018-08-21 07:30:06', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/?page_id=3', 0, 'page', '', 0),
(4, 1, '2018-08-21 07:32:58', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-21 07:32:58', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/?p=4', 0, 'post', '', 0),
(5, 0, '2018-08-21 15:23:23', '0000-00-00 00:00:00', '', 'Illdy Backup Settings', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-08-21 15:23:23', '2018-08-21 15:23:23', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/?page_id=5', 0, 'page', '', 0),
(6, 1, '2018-08-21 15:01:22', '2018-08-21 15:01:22', '', 'Front Page', '', 'publish', 'closed', 'closed', '', 'front-page', '', '', '2018-08-21 15:01:22', '2018-08-21 15:01:22', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/front-page/', 0, 'page', '', 0),
(7, 1, '2018-08-21 15:01:22', '2018-08-21 15:01:22', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2018-08-21 15:01:22', '2018-08-21 15:01:22', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/blog/', 0, 'page', '', 0),
(8, 1, '2018-08-21 15:04:22', '2018-08-21 15:04:22', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]\nRMF Website \"[your-subject]\"\n[your-name] <francisco.abayon@rafi.org.ph>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on RMF Website (http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy)\nfrancisco.abayon@rafi.org.ph\nReply-To: [your-email]\n\n0\n0\n\nRMF Website \"[your-subject]\"\nRMF Website <francisco.abayon@rafi.org.ph>\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on RMF Website (http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy)\n[your-email]\nReply-To: francisco.abayon@rafi.org.ph\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2018-08-21 15:04:22', '2018-08-21 15:04:22', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/?post_type=wpcf7_contact_form&p=8', 0, 'wpcf7_contact_form', '', 0),
(9, 1, '2018-08-21 15:23:23', '2018-08-21 15:23:23', '{\n    \"widget_illdy_project[3]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjk6IlByb2plY3QgMSI7czo1OiJpbWFnZSI7czo5MToiaHR0cHM6Ly9jZG4uY29sb3JsaWIuY29tL2lsbGR5L3dwLWNvbnRlbnQvdXBsb2Fkcy9zaXRlcy8xMS8yMDE2LzAzL2Zyb250LXBhZ2UtcHJvamVjdC0xLmpwZyI7czo1OiJ2aWRlbyI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO30=\",\n            \"title\": \"Project 1\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"8db66605306a4fe01bb2eafc97d4b76a\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-08-21 15:23:23\"\n    },\n    \"widget_illdy_project[4]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjk6IlByb2plY3QgMiI7czo1OiJpbWFnZSI7czo5MToiaHR0cHM6Ly9jZG4uY29sb3JsaWIuY29tL2lsbGR5L3dwLWNvbnRlbnQvdXBsb2Fkcy9zaXRlcy8xMS8yMDE2LzAzL2Zyb250LXBhZ2UtcHJvamVjdC0yLmpwZyI7czo1OiJ2aWRlbyI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO30=\",\n            \"title\": \"Project 2\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"e053604aa0f201cc5fec7335c481ab05\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-08-21 15:23:23\"\n    },\n    \"widget_illdy_project[5]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjk6IlByb2plY3QgMyI7czo1OiJpbWFnZSI7czo5MToiaHR0cHM6Ly9jZG4uY29sb3JsaWIuY29tL2lsbGR5L3dwLWNvbnRlbnQvdXBsb2Fkcy9zaXRlcy8xMS8yMDE2LzAzL2Zyb250LXBhZ2UtcHJvamVjdC0zLmpwZyI7czo1OiJ2aWRlbyI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO30=\",\n            \"title\": \"Project 3\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"082577b8fddaf71382425bc2923af1c7\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-08-21 15:23:23\"\n    },\n    \"widget_illdy_project[6]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjk6IlByb2plY3QgNCI7czo1OiJpbWFnZSI7czo5MToiaHR0cHM6Ly9jZG4uY29sb3JsaWIuY29tL2lsbGR5L3dwLWNvbnRlbnQvdXBsb2Fkcy9zaXRlcy8xMS8yMDE2LzAzL2Zyb250LXBhZ2UtcHJvamVjdC00LmpwZyI7czo1OiJ2aWRlbyI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO30=\",\n            \"title\": \"Project 4\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"751206d90246e1a6fde2befb2d98a007\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-08-21 15:23:23\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'c16a6386-8c6d-4ad9-a2d0-3b2ea5692b25', '', '', '2018-08-21 15:23:23', '2018-08-21 15:23:23', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/2018/08/21/c16a6386-8c6d-4ad9-a2d0-3b2ea5692b25/', 0, 'customize_changeset', '', 0),
(10, 1, '2018-08-21 15:23:23', '2018-08-21 15:23:23', '', 'Illdy Backup Settings', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-08-21 15:23:23', '2018-08-21 15:23:23', '', 5, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/illdy/2018/08/21/5-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rmf_termmeta`
--

CREATE TABLE `rmf_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rmf_terms`
--

CREATE TABLE `rmf_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  `term_order` int(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_terms`
--

INSERT INTO `rmf_terms` (`term_id`, `name`, `slug`, `term_group`, `term_order`) VALUES
(1, 'Uncategorized', 'uncategorized', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rmf_term_relationships`
--

CREATE TABLE `rmf_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_term_relationships`
--

INSERT INTO `rmf_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rmf_term_taxonomy`
--

CREATE TABLE `rmf_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_term_taxonomy`
--

INSERT INTO `rmf_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rmf_usermeta`
--

CREATE TABLE `rmf_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_usermeta`
--

INSERT INTO `rmf_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'administrator'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'rmf_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'rmf_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"a7dbb3c53c4cb8508499fe6a3ef658ccfd097502386930163299a4a242c7563a\";a:4:{s:10:\"expiration\";i:1535009575;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\";s:5:\"login\";i:1534836775;}s:64:\"e577e1d024e44bf86a51ab077e25018b8c017806a074a1a59c0d0895ef02bcc3\";a:4:{s:10:\"expiration\";i:1536069616;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\";s:5:\"login\";i:1534860016;}}'),
(17, 1, 'rmf_dashboard_quick_press_last_post_id', '4');

-- --------------------------------------------------------

--
-- Table structure for table `rmf_users`
--

CREATE TABLE `rmf_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_users`
--

INSERT INTO `rmf_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'administrator', '$P$BC8SHx/3R70exBeZ1ajXlYUtiVOVmN0', 'administrator', 'francisco.abayon@rafi.org.ph', '', '2018-08-21 07:30:04', '', 0, 'administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rmf_commentmeta`
--
ALTER TABLE `rmf_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `rmf_comments`
--
ALTER TABLE `rmf_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `rmf_links`
--
ALTER TABLE `rmf_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `rmf_options`
--
ALTER TABLE `rmf_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `rmf_postmeta`
--
ALTER TABLE `rmf_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `rmf_posts`
--
ALTER TABLE `rmf_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `rmf_termmeta`
--
ALTER TABLE `rmf_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `rmf_terms`
--
ALTER TABLE `rmf_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `rmf_term_relationships`
--
ALTER TABLE `rmf_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `rmf_term_taxonomy`
--
ALTER TABLE `rmf_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `rmf_usermeta`
--
ALTER TABLE `rmf_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `rmf_users`
--
ALTER TABLE `rmf_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rmf_commentmeta`
--
ALTER TABLE `rmf_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rmf_comments`
--
ALTER TABLE `rmf_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rmf_links`
--
ALTER TABLE `rmf_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rmf_options`
--
ALTER TABLE `rmf_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `rmf_postmeta`
--
ALTER TABLE `rmf_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rmf_posts`
--
ALTER TABLE `rmf_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rmf_termmeta`
--
ALTER TABLE `rmf_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rmf_terms`
--
ALTER TABLE `rmf_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rmf_term_taxonomy`
--
ALTER TABLE `rmf_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rmf_usermeta`
--
ALTER TABLE `rmf_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `rmf_users`
--
ALTER TABLE `rmf_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
