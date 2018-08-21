-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2018 at 05:26 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rmf_shapely`
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
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-08-21 07:32:49', '2018-08-21 07:32:49', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

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
(1, 'siteurl', 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/shapely', 'yes'),
(2, 'home', 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/shapely', 'yes'),
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
(29, 'rewrite_rules', 'a:89:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:39:"shapely-companion/shapely-companion.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'shapely', 'yes'),
(41, 'stylesheet', 'shapely', 'yes'),
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
(53, 'show_on_front', 'posts', 'yes'),
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
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'rmf_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(95, 'fresh_site', '1', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:8:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:12:"sidebar-home";a:0:{}s:15:"footer-widget-1";a:0:{}s:15:"footer-widget-2";a:0:{}s:15:"footer-widget-3";a:0:{}s:15:"footer-widget-4";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'cron', 'a:5:{i:1534865572;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1534879972;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1534923358;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1534923359;a:1:{s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(112, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1534837245;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(116, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:58:"http://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:58:"http://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:10:"no_content";s:69:"http://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip";s:11:"new_bundled";s:70:"http://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.8";s:7:"version";s:5:"4.9.8";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1534860055;s:15:"version_checked";s:5:"4.9.8";s:12:"translations";a:0:{}}', 'no'),
(121, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1534860067;s:7:"checked";a:4:{s:7:"shapely";s:5:"1.2.3";s:13:"twentyfifteen";s:3:"2.0";s:15:"twentyseventeen";s:3:"1.7";s:13:"twentysixteen";s:3:"1.5";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(122, 'can_compress_scripts', '1', 'no'),
(123, '_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b', '1534879993', 'no'),
(124, '_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b', '<div class="rss-widget"><p><strong>RSS Error:</strong> WP HTTP Error: cURL error 60: SSL certificate problem: unable to get local issuer certificate</p></div><div class="rss-widget"><p><strong>RSS Error:</strong> WP HTTP Error: cURL error 60: SSL certificate problem: unable to get local issuer certificate</p></div>', 'no'),
(126, 'current_theme', 'Shapely', 'yes'),
(127, 'theme_mods_shapely', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}}', 'yes'),
(128, 'theme_switched', '', 'yes'),
(132, '_site_transient_timeout_theme_roots', '1534861861', 'no'),
(133, '_site_transient_theme_roots', 'a:4:{s:7:"shapely";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'no'),
(134, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1534860071;s:7:"checked";a:3:{s:19:"akismet/akismet.php";s:5:"4.0.8";s:9:"hello.php";s:3:"1.7";s:39:"shapely-companion/shapely-companion.php";s:5:"1.2.3";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:3:{s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.8";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";}s:7:"banners";a:1:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}s:39:"shapely-companion/shapely-companion.php";O:8:"stdClass":9:{s:2:"id";s:31:"w.org/plugins/shapely-companion";s:4:"slug";s:17:"shapely-companion";s:6:"plugin";s:39:"shapely-companion/shapely-companion.php";s:11:"new_version";s:5:"1.2.3";s:3:"url";s:48:"https://wordpress.org/plugins/shapely-companion/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/shapely-companion.zip";s:5:"icons";a:2:{s:2:"2x";s:70:"https://ps.w.org/shapely-companion/assets/icon-256x256.jpg?rev=1567092";s:2:"1x";s:70:"https://ps.w.org/shapely-companion/assets/icon-256x256.jpg?rev=1567092";}s:7:"banners";a:1:{s:2:"1x";s:72:"https://ps.w.org/shapely-companion/assets/banner-772x250.jpg?rev=1567092";}s:11:"banners_rtl";a:0:{}}}}', 'no'),
(135, 'recently_activated', 'a:0:{}', 'yes'),
(136, 'widget_shapely_recent_posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(137, 'widget_shapely-cats', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(138, 'widget_shapely_home_parallax', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(139, 'widget_shapely_home_features', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(140, 'widget_shapely_home_cfa', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(141, 'widget_shapely_home_clients', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(142, 'widget_shapely_video_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(143, 'widget_shapely_home_contact', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(144, 'widget_shapely-social', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(145, 'widget_shapely-page-title', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(146, 'widget_shapely-page-content', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(147, '_transient_timeout_plugin_slugs', '1534946476', 'no'),
(148, '_transient_plugin_slugs', 'a:3:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:39:"shapely-companion/shapely-companion.php";}', 'no'),
(150, '_transient_timeout_shapely_plugin_information_transient_simple-custom-post-order', '1534866850', 'no'),
(151, '_transient_shapely_plugin_information_transient_simple-custom-post-order', 'O:8:"stdClass":18:{s:4:"name";s:24:"Simple Custom Post Order";s:4:"slug";s:24:"simple-custom-post-order";s:7:"version";s:5:"2.3.2";s:6:"author";s:47:"<a href="https://colorlib.com/wp/">Colorlib</a>";s:14:"author_profile";s:39:"https://profiles.wordpress.org/hsameerc";s:12:"requires_php";b:0;s:7:"ratings";a:5:{i:5;i:103;i:4;i:4;i:3;i:5;i:2;i:2;i:1;i:13;}s:11:"num_ratings";i:127;s:15:"support_threads";i:5;s:24:"support_threads_resolved";i:0;s:8:"homepage";s:58:"https://wordpress.org/plugins-wp/simple-custom-post-order/";s:8:"sections";a:5:{s:11:"description";s:416:"<p>Order posts(posts, any custom post types) using a Drag and Drop Sortable JavaScript. Configuration is unnecessary. You can do directly on default WordPress administration.<br />\nExcluding custom query which uses order or orderby parameters, in get_posts or query_posts and so on.</p>\n<p>This plugins is now supported and maintained by <a href="//colorlib.com/wp/“" rel="“friend” nofollow">Colorlib</a>.</p>\n";s:12:"installation";s:188:"<ol>\n<li>Upload <code>plugin-name.php</code> to the <code>/wp-content/plugins/</code> directory</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress</li>\n</ol>\n";s:3:"faq";s:322:"\n<h4>Installation Instructions</h4>\n<p>\n<ol>\n<li>Upload <code>plugin-name.php</code> to the <code>/wp-content/plugins/</code> directory</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress</li>\n</ol>\n</p>\n<h4>A question that someone might have</h4>\n<p>\n<p>An answer to that question.</p>\n</p>\n\n";s:9:"changelog";s:1137:"<h4>Version 1.0 (20-07-2013)</h4>\n<ul>\n<li>Initial release.</li>\n</ul>\n<h4>Version 1.5 (25-07-2013)</h4>\n<ul>\n<li>Fix : fix errors</li>\n<li>Added Taxonomy Sort</li>\n<li>Added Taxonomy Sort option In setting Page</li>\n</ul>\n<h4>Version 2.0 (22-11-2013)</h4>\n<ul>\n<li>Fixed Undefined Notice Error in wp version 3.7.1</li>\n<li>Taxonomy Activate Checkbox removed.</li>\n</ul>\n<h4>Version 2.1 (31-12-2013)</h4>\n<ul>\n<li>Prevent Breaking autocomplete </li>\n</ul>\n<h4>Version 2.2 (02-07-2014)</h4>\n<ul>\n<li>Fixed bug: Custom Query which uses &#8216;order&#8217; or &#8216;orderby&#8217; parameters is preferred</li>\n<li>It does not depend on the designation manner of arguments( Parameters ). ( $args = &#8216;orderby=&amp;order=&#8217; or $args = array( &#8216;orderby&#8217; =&gt; &#8221;, &#8216;order&#8217; =&gt; &#8221; ) )</li>\n<li>Previous Versions Issues were Improved.</li>\n<li>Removed Taxonomy Sort( Will add in next Version 🙂 )</li>\n</ul>\n<h4>Version 2.3 (24-03-2014)</h4>\n<ul>\n<li>Fixed major bug on taxonomy and post order</li>\n</ul>\n<h4>Version 2.3.2 (17-03-2017)</h4>\n<ul>\n<li>Minor documentation and readme tweaks</li>\n</ul>\n";s:11:"screenshots";s:656:"<ol><li><a href="https://ps.w.org/simple-custom-post-order/trunk/screenshot-1.png?rev=1859717"><img src="https://ps.w.org/simple-custom-post-order/trunk/screenshot-1.png?rev=1859717" alt="screenshot-1"></a><p>screenshot-1</p></li><li><a href="https://ps.w.org/simple-custom-post-order/trunk/screenshot-3.png?rev=1859717"><img src="https://ps.w.org/simple-custom-post-order/trunk/screenshot-3.png?rev=1859717" alt=""></a></li><li><a href="https://ps.w.org/simple-custom-post-order/trunk/screenshot-2.png?rev=1859717"><img src="https://ps.w.org/simple-custom-post-order/trunk/screenshot-2.png?rev=1859717" alt="screenshot-2"></a><p>screenshot-2</p></li></ol>";}s:17:"short_description";s:114:"Order posts(posts, any custom post types) using a Drag and Drop Sortable JavaScript. Configuration is unnecessary.";s:13:"download_link";s:67:"https://downloads.wordpress.org/plugin/simple-custom-post-order.zip";s:11:"screenshots";a:3:{i:1;a:2:{s:3:"src";s:76:"https://ps.w.org/simple-custom-post-order/trunk/screenshot-1.png?rev=1859717";s:7:"caption";s:12:"screenshot-1";}i:3;a:2:{s:3:"src";s:76:"https://ps.w.org/simple-custom-post-order/trunk/screenshot-3.png?rev=1859717";s:7:"caption";s:0:"";}i:2;a:2:{s:3:"src";s:76:"https://ps.w.org/simple-custom-post-order/trunk/screenshot-2.png?rev=1859717";s:7:"caption";s:12:"screenshot-2";}}s:8:"versions";a:5:{s:3:"1.0";s:71:"https://downloads.wordpress.org/plugin/simple-custom-post-order.1.0.zip";s:3:"1.5";s:71:"https://downloads.wordpress.org/plugin/simple-custom-post-order.1.5.zip";s:3:"2.0";s:71:"https://downloads.wordpress.org/plugin/simple-custom-post-order.2.0.zip";s:3:"2.1";s:71:"https://downloads.wordpress.org/plugin/simple-custom-post-order.2.1.zip";s:3:"2.2";s:71:"https://downloads.wordpress.org/plugin/simple-custom-post-order.2.2.zip";}s:5:"icons";a:2:{s:2:"1x";s:77:"https://ps.w.org/simple-custom-post-order/assets/icon-256x256.jpg?rev=1859717";s:2:"2x";s:77:"https://ps.w.org/simple-custom-post-order/assets/icon-256x256.jpg?rev=1859717";}s:12:"contributors";a:0:{}}', 'no'),
(152, '_transient_timeout_shapely_plugin_information_transient_fancybox-for-wordpress', '1534866851', 'no');
INSERT INTO `rmf_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(153, '_transient_shapely_plugin_information_transient_fancybox-for-wordpress', 'O:8:"stdClass":18:{s:4:"name";s:22:"FancyBox for WordPress";s:4:"slug";s:22:"fancybox-for-wordpress";s:7:"version";s:6:"3.0.13";s:6:"author";s:44:"<a href="https://colorlib.com/">Colorlib</a>";s:14:"author_profile";s:46:"https://profiles.wordpress.org/colorlibplugins";s:12:"requires_php";b:0;s:7:"ratings";a:5:{i:5;i:32;i:4;i:3;i:3;i:1;i:2;i:1;i:1;i:7;}s:11:"num_ratings";i:44;s:15:"support_threads";i:4;s:24:"support_threads_resolved";i:0;s:8:"homepage";s:53:"https://wordpress.org/plugins/fancybox-for-wordpress/";s:8:"sections";a:5:{s:11:"description";s:2139:"<p>Seamlessly integrates FancyBox into your blog: Upload, activate, and you&#8217;re done. Additional configuration optional.</p>\n<p>You can easily customize almost anything you can think about fancybox lightbox: the border, margin width and color, zoom speed, animation type, close button position, overlay color and opacity and even more advanced option like several options to group images into galleries, and more&#8230;</p>\n<p>By default, the plugin will use jQuery to apply FancyBox to ANY thumbnails that link directly to an image. This includes posts, the sidebar, etc, so you can activate it and it will be applied automatically.</p>\n<h4>Demo</h4>\n<p>You can see the plugin working on a <a href="http://blog.moskis.net/2012/01/20/teclado-apple-en-windows-7/" rel="nofollow">this blog</a> although there&#8217;s nothing amazing to see, just a FancyBox simple implementation, that&#8217;s the point 😉 You can take a look at the code if you&#8217;re curious, though.</p>\n<h4>Further Reading</h4>\n<p>This plugin is developed and maintained by Colorlib. Which is well know for their free <a href="https://colorlib.com/wp/themes/" rel="nofollow"></a>WordPress themes. However, now they are looking to extend their presence in plugin development and believe that FancyBox lightbox is a great way to start.</p>\n<p>If you are new to WordPress and want to lear more we have got you covered. Colorlib will teach you have to <a href="https://colorlib.com/" rel="nofollow">start a blog</a> or <a href="https://colorlib.com/wp/how-to-make-a-website/" rel="nofollow">create a website</a> and much more. If you are already familiar with WordPress you likely want to learn how to make it faster and more reliable. That&#8217;s when you want to look into hosting and more specifically <a href="http://colorlib.com/wp/wordpress-hosting" rel="nofollow">WordPress hosting</a>.</p>\n<p>If you enjoy using FancyBox lightbox for WordPress please leave a <a href="https://wordpress.org/support/plugin/fancybox-for-wordpress/reviews/?filter=5" rel="nofollow">positive feedback</a>. We are committed to make it the best lightbox plugin for WordPress.</p>\n";s:12:"installation";s:455:"<ol>\n<li>Upload the <code>fancybox-for-wordpress</code> folder to the <code>/wp-content/plugins/</code> directory</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress</li>\n<li>That&#8217;s it, FancyBox will be automatically applied to all your image links and galleries.</li>\n<li>If you want to customize a bit the look and feel of FancyBox, go to the Options Page under General Options in the WordPress Admin panel</li>\n</ol>\n";s:3:"faq";s:2079:"\n<h4>Installation Instructions</h4>\n<p>\n<ol>\n<li>Upload the <code>fancybox-for-wordpress</code> folder to the <code>/wp-content/plugins/</code> directory</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress</li>\n<li>That&#8217;s it, FancyBox will be automatically applied to all your image links and galleries.</li>\n<li>If you want to customize a bit the look and feel of FancyBox, go to the Options Page under General Options in the WordPress Admin panel</li>\n</ol>\n</p>\n<h4>&#8211; There was a vulnerability detected in versions 3.0.2 and lower, is my site in danger?</h4>\n<p>\n<p>This vulnerability was patched in version 3.0.3.</p>\n<p>An additional change was introduced in version 3.0.4 to make sure that the malicious code can&#8217;t be printed to visitors even if it still remains in the database.</p>\n<p>If you think your site might still be using a vulnerable version of the plugin please log in to your WordPress admin panel, disable the plugin and clear any cache if your site uses a cache system.</p>\n<p>If you wish to continue using the plugin, check that the plugin is updated to the latest version from your admin panel and enable it. Then check the plugin&#8217;s settings page and make sure there&#8217;s no abnormal code in any of the fields, especially on the Extra Calls tab. If you are not sure about the code you see in the settings please use the Revert to Defaults button at the bottom of the settings page.</p>\n<p>If you think your site might be compromised in any other way check this guide: <a href="https://codex.wordpress.org/FAQ_My_site_was_hacked" rel="nofollow">WordPress Codex &#8211; FAQ My site was hacked</a>.</p>\n</p>\n<h4>&#8211; Is the FancyBox script vulnerable or unsafe?</h4>\n<p>\n<p>No, there&#8217;s nothing wrong with the actual FancyBox script that i know of.</p>\n<p>The vulnerability detected in versions 3.0.2 and lower of the &#8220;FancyBox for WordPress&#8221; plugin was limited to the plugin itself. Other FancyBox plugins or manual implementations of FancyBox are unrelated to this issue.</p>\n</p>\n\n";s:9:"changelog";s:10648:"<h4>3.0.12</h4>\n<p>Fixed errors causes by WordPress SVN.</p>\n<h4>3.0.7</h4>\n<ul>\n<li>Updated Fancybox library</li>\n<li>Updated other libraries this plugins depends on such as jQuery easing and jQuery Mousewheel</li>\n<li>Tested plugin with WordPress 4.6</li>\n</ul>\n<h4>3.0.6</h4>\n<ul>\n<li>Fixes to JavaScript code for showing and hiding elements as they are needed in Settings page. (Thanks to jono55 for reporting)</li>\n</ul>\n<h4>3.0.5</h4>\n<ul>\n<li>Fixed the Revert Options button.</li>\n<li>Fixed wrong version number being shown on the plugin&#8217;s settings page.</li>\n<li>Updated plugin and author links in readme and settings page.</li>\n<li>Updated localization catalog (POT file).</li>\n<li>Updated Spanish translation with minor updates.</li>\n<li>Updated Frequently Asked Questions in readme file.</li>\n<li>Removed version number from printed html source code.</li>\n<li>Removed outdated/incomplete translation binaries.</li>\n</ul>\n<h4>3.0.4</h4>\n<ul>\n<li>Renamed the setting affected by the security issue mentioned in 3.0.3. This should stop the malicious code from appearing on sites where the plugin is updated without removing the malicious code.</li>\n</ul>\n<h4>3.0.3</h4>\n<ul>\n<li>Fixed a security issue. (Thanks to mickaelb for reporting and Konstantin Kovshenin for providing the fix)</li>\n</ul>\n<h4>3.0.2</h4>\n<ul>\n<li>Added support for disabling fancybox on individual hyperlinked images by adding class=&#8217;nolightbox&#8217;. (Thanks to Artem Russakovskii)</li>\n<li>Added a link to the github project page in the info tab in the settings page.</li>\n<li>Fixed and cleaned the installation code, new installations of the plugin should work now without need to go to the settings page.</li>\n<li>Fixed false positives in filenames. (Thanks to Artem Russakovskii)</li>\n<li>Fixed incompatibility with wordpress installations where the wp-content directory had been renamed.</li>\n<li>Fixed an issue that could cause the version of the plugin to be removed from settings when deactivating the plugin.</li>\n<li>Improved HTTPS support by using better code to retrieve the plugin url and load files.</li>\n<li>Removed legacy code to suport upgrading settings from 2.x versions of the plugin. This was done to avoid possible issues with clean installations of the plugin.</li>\n<li>Updated some CSS rules in jQuery UI</li>\n<li>Some minor reformatting and cleanup of code (PHP comments, empty lines, )</li>\n</ul>\n<h4>3.0.1</h4>\n<ul>\n<li>Updated: Localization catalog updated.</li>\n<li>Updated: Spanish localization.</li>\n<li>Fixed: Minor change in settings page that may fix options page being invisible in some cases.</li>\n</ul>\n<h4>3.0.0</h4>\n<ul>\n<li>New: Fancybox v1.3.4 support This includes many new options, like title position.</li>\n<li>New: Additional FancyBox Calls option that lets the user write their own additional code to use FancyBox on specific areas of the blog, like email subscription buttons, login, etc.</li>\n<li>New: Revert settings button added to options page. When pressed, a confirmation dialog will appear.</li>\n<li>New: Improvements in options page, irrelevant settings (settings that depend on a disabled setting) will hide on real time, meaning a cleaner look in the options page.</li>\n<li>Updated: New cleaner code to select thumbnails on which to apply the fancbox script.</li>\n<li>Updated: Many parts of plugins rewriten with many improvements in code.</li>\n<li>Updated: Options are now serialized into a single row in the database.</li>\n<li>Fixed: Plugin should be SSL friendly from now on.</li>\n<li>Fixed: Do not call jQuery option in troubleshooting section didn&#8217;t work if easing was enabled.</li>\n<li>Fixed: Load at footer options should work better now.</li>\n<li>Fixed: CSS external files now addded with wp_enqueue_style().</li>\n<li>Fixed: has_cap error: User level value for options page removed, using role now instead. Thanks to <a href="https://wordpress.org/support/topic/plugin-fancybox-for-wordpress-has_cap-fix" rel="nofollow">vonkanehoffen</a>.</li>\n<li>Removed: jQuery &#8220;noConflict&#8221; Mode option removed bacause jQuery bundled with WordPress always used noConflict.</li>\n<li>Removed: Base64 data (&#8220;data:image/gif;base64,AAAA&#8221;) in left and right fancybox link&#8217;s backgrounds: It didn&#8217;t seem to be working and it is usually regarded as suspicious code, so it has been removed.</li>\n</ul>\n<h4>2.7.5</h4>\n<ul>\n<li>Fixed: Callback arguments are no longer added as &#8220;null&#8221; when they are not set in options page.</li>\n</ul>\n<h4>2.7.4</h4>\n<ul>\n<li>Fixed: Little error tagging 2.7.3, a file didn&#8217;t upload and broke options page.</li>\n<li>Update: Language POT file</li>\n</ul>\n<h4>2.7.3</h4>\n<ul>\n<li>Fixed: Settings not saving in some browsers. Thanks to <a href="https://wordpress.org/support/topic/plugin-fancybox-for-wordpress-save-changes-button-doesnt-submit-form?replies=7#post-1765041" rel="nofollow">supertomate</a></li>\n<li>Fixed: JS being added to other plugins&#8217; configuration pages. Thanks to <a href="https://wordpress.org/support/topic/plugin-fancybox-for-wordpress-theres-a-problem-with-is_plugin_page?replies=1#post-1888828" rel="nofollow">Brandon Dove</a></li>\n<li>Added: Support section in options page with better information</li>\n</ul>\n<h4>2.7.2</h4>\n<ul>\n<li>Fixed: Layout problem in options page in WordPress 2.9</li>\n</ul>\n<h4>2.7.1</h4>\n<ul>\n<li>Fixed: Z-index issue was left out in previus release</li>\n<li>Fixed: Setting to close fancybox when clicking on the overlay wasn&#8217;t available in the menu</li>\n<li>Fixed: Frame width and height options are now in the &#8220;Other&#8221; tab</li>\n<li>Fixed: Tabs now translated in Spanish localization</li>\n</ul>\n<h4>2.7.0</h4>\n<ul>\n<li>New: Fancybox v1.2.6 support</li>\n<li>New: New Admin page with tabs for better organization of all the options</li>\n<li>Added: Setting to change the speed of the animation when changing gallery items</li>\n<li>Added: Setting to enable or disable Escape key to close Fancybox</li>\n<li>Added: Setting to show or hide close button</li>\n<li>Added: Setting to close fancybox when clicking on the overlay</li>\n<li>Added: Setting to enable or disable callback function on start, show and close events</li>\n<li>Added: Italian translation</li>\n<li>Added: Russian translation</li>\n<li>Added: &#8220;Load JS at Footer&#8221; option</li>\n<li>Added: New Changelog tab in  WordPress Plugin Directory</li>\n<li>Fixed: Some typos in Spanish translation</li>\n<li>Fixed: FancyBox not showing above some elements (those with zindex higher than 90)</li>\n<li>Fixed: JavaScript code being included in all admin pages instead of just the plugin&#8217;s options page.</li>\n<li>Fixed: noClonflict preventing frames to work in Fancybox</li>\n<li>Fixed: Custom frame width and height not being applied</li>\n<li>Updated: Japanese translation</li>\n<li>Updated: JS is now Minified instead of Packed</li>\n</ul>\n<h4>2.6.0</h4>\n<ul>\n<li>Optimized the JavaScript code used to apply FancyBox</li>\n<li>Updated Custom Expression section in Options Page</li>\n<li>Fixed uppercase image extensions not being recognized</li>\n<li>CSS is now loaded before the JavaScript for better parallelization</li>\n<li>jquery.easing.1.3.js compressed (from 8,10kb to 3,47kb) and renamed to jquery.easing.1.3.pack.js</li>\n<li>Added Turkish translation (some strings missing)</li>\n<li>Added Japanese translation (some strings missing)</li>\n<li>Updated Spanish translation</li>\n<li>Updated to use new Plugin API in WP2.7 for better forward compatibility</li>\n<li>Removed /wp-content/ reference in fancybox.php for better WP2.8 support</li>\n<li>Optimized some code readability</li>\n</ul>\n<h4>2.5.1</h4>\n<ul>\n<li>Fixed the plugin not working when selecting Gallery Type &#8220;By Post&#8221;</li>\n<li>Fixed a bug that would prevent the title in the IMG tag from being copied to the A tag in some cases</li>\n<li>Fixed the Custom Expression showing in the Admin panel when other gallery types are selected</li>\n</ul>\n<h4>2.5</h4>\n<ul>\n<li>Support for localizations (Spanish and German localizations included)</li>\n<li>Some parts of the code completely rewritten</li>\n<li>Fixed fancybox files being loaded on the admin pages</li>\n<li>New options for close button position, custom jquery expressions, iframe content</li>\n<li>Options page mostly rewritten, better organized</li>\n<li>Medium/advanced, troubleshooting/uninstall options collapsable, hidden by default</li>\n<li>Better support guidelines and links on options page</li>\n<li>Settings link on the Manage plugins page</li>\n<li>Custom expression hidden when not used</li>\n<li>Title atribute on IMG tags is now copied to its parent A tag for better caption support</li>\n<li>New uninstall options and better handling of new options when installing/updating</li>\n<li>Cleans any old options no longer needed when plugin is activated/updated</li>\n</ul>\n<h4>2.2</h4>\n<ul>\n<li>Updated to FancyBox 1.2.1</li>\n<li>Added new settings to Options Page: Easing, padding size, border color</li>\n<li>Tweaked CSS to prevent some themes from adding unwanted styles to fancybox (especially background colors and link outlines)</li>\n<li>Options Page reorganized in three sections: Appearance, Behaviour and Troubleshooting Settings, to make settings easier to find</li>\n</ul>\n<h4>2.1.1</h4>\n<ul>\n<li>Fixed a new bug introduced in 2.1 that prevented options from being saved. Sorry about the mess 🙁</li>\n</ul>\n<h4>2.1</h4>\n<ul>\n<li>Fixed a major bug in 2.0 that prevented it from working until plugin&#8217;s options page was visited</li>\n<li>Added two options for troubleshooting that might help in some cases if the plugin doesn&#8217;t work: disable jQuery noConflict and skip jQuery call</li>\n<li>Additional fixes to caption CSS: Captions should look better now in Hybrid theme, child themes, and other situations where general table elements are improperly styled</li>\n</ul>\n<h4>2.0</h4>\n<ul>\n<li>Brand new Options Page in Admin Panel lets you easely customize many options: fancybox auto apply, image resize to fit, opacity fade while zooming, zoom speed, overlay on/off, overlay color, overlay opacity, close fancybox on image click, keep fancybox centered while scrolling</li>\n<li>CSS completely updated for FancyBox 1.2.0</li>\n<li>Captions fixed in IE</li>\n</ul>\n<h4>1.3</h4>\n<ul>\n<li>Shadows and Close button should be fixed now</li>\n</ul>\n<h4>1.2</h4>\n<ul>\n<li>Updated to FancyBox 1.2.0</li>\n<li>Uses packed version of the JavaScript file (8kb instead of 14kb)</li>\n</ul>\n<h4>1.1</h4>\n<ul>\n<li>Fixed FancyBox not being applied to .jpeg files</li>\n<li>Fixed &#8220;Click to close&#8221; overlay text</li>\n<li>Moved images to /img/ folder</li>\n</ul>\n";s:11:"screenshots";s:907:"<ol><li><a href="https://ps.w.org/fancybox-for-wordpress/trunk/screenshot-1.png?rev=1864321"><img src="https://ps.w.org/fancybox-for-wordpress/trunk/screenshot-1.png?rev=1864321" alt="Simple example of fancybox on a post. &lt;a href=&quot;http://blog.moskis.net/2012/01/20/teclado-apple-en-windows-7/&quot;&gt;Live demo here&lt;/a&gt;"></a><p>Simple example of fancybox on a post. <a href="http://blog.moskis.net/2012/01/20/teclado-apple-en-windows-7/">Live demo here</a></p></li><li><a href="https://ps.w.org/fancybox-for-wordpress/trunk/screenshot-2.png?rev=1864321"><img src="https://ps.w.org/fancybox-for-wordpress/trunk/screenshot-2.png?rev=1864321" alt="Basic settings on Options Page in the Admin Panel. This makes it very easy to customize the plugin to your needs"></a><p>Basic settings on Options Page in the Admin Panel. This makes it very easy to customize the plugin to your needs</p></li></ol>";}s:17:"short_description";s:140:"Seamlessly integrates FancyBox lightbox into your WordPress blog: Upload, activate, and you&#039;re done. Additional configuration optional.";s:13:"download_link";s:65:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.zip";s:11:"screenshots";a:2:{i:1;a:2:{s:3:"src";s:74:"https://ps.w.org/fancybox-for-wordpress/trunk/screenshot-1.png?rev=1864321";s:7:"caption";s:128:"Simple example of fancybox on a post. <a href="http://blog.moskis.net/2012/01/20/teclado-apple-en-windows-7/">Live demo here</a>";}i:2;a:2:{s:3:"src";s:74:"https://ps.w.org/fancybox-for-wordpress/trunk/screenshot-2.png?rev=1864321";s:7:"caption";s:112:"Basic settings on Options Page in the Admin Panel. This makes it very easy to customize the plugin to your needs";}}s:8:"versions";a:29:{s:3:"1.0";s:69:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.1.0.zip";s:5:"1.0.2";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.1.0.2.zip";s:3:"1.1";s:69:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.1.1.zip";s:3:"1.2";s:69:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.1.2.zip";s:3:"1.3";s:69:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.1.3.zip";s:3:"2.0";s:69:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.0.zip";s:3:"2.1";s:69:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.1.zip";s:5:"2.1.1";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.1.1.zip";s:3:"2.2";s:69:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.2.zip";s:3:"2.5";s:69:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.5.zip";s:5:"2.5.1";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.5.1.zip";s:5:"2.6.0";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.6.0.zip";s:5:"2.7.0";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.7.0.zip";s:5:"2.7.1";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.7.1.zip";s:5:"2.7.2";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.7.2.zip";s:5:"2.7.3";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.7.3.zip";s:5:"2.7.4";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.7.4.zip";s:5:"2.7.5";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.2.7.5.zip";s:5:"3.0.0";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.0.zip";s:5:"3.0.1";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.1.zip";s:6:"3.0.10";s:72:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.10.zip";s:5:"3.0.2";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.2.zip";s:5:"3.0.3";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.3.zip";s:5:"3.0.4";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.4.zip";s:5:"3.0.5";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.5.zip";s:5:"3.0.6";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.6.zip";s:5:"3.0.7";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.7.zip";s:5:"3.0.8";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.8.zip";s:5:"3.0.9";s:71:"https://downloads.wordpress.org/plugin/fancybox-for-wordpress.3.0.9.zip";}s:5:"icons";a:2:{s:2:"1x";s:75:"https://ps.w.org/fancybox-for-wordpress/assets/icon-256x256.jpg?rev=1864321";s:2:"2x";s:75:"https://ps.w.org/fancybox-for-wordpress/assets/icon-256x256.jpg?rev=1864321";}s:12:"contributors";a:0:{}}', 'no'),
(154, '_transient_timeout_shapely_plugin_information_transient_colorlib-login-customizer', '1534866853', 'no'),
(155, '_transient_shapely_plugin_information_transient_colorlib-login-customizer', 'O:8:"stdClass":18:{s:4:"name";s:25:"Colorlib Login Customizer";s:4:"slug";s:25:"colorlib-login-customizer";s:7:"version";s:5:"1.2.0";s:6:"author";s:44:"<a href="https://colorlib.com/">Colorlib</a>";s:14:"author_profile";s:46:"https://profiles.wordpress.org/colorlibplugins";s:12:"requires_php";b:0;s:7:"ratings";a:5:{i:5;i:3;i:4;i:0;i:3;i:0;i:2;i:0;i:1;i:0;}s:11:"num_ratings";i:3;s:15:"support_threads";i:2;s:24:"support_threads_resolved";i:0;s:8:"homepage";s:0:"";s:8:"sections";a:5:{s:11:"description";s:2987:"<p>Colorlib Login Customizer by Colorlib is an awesome and intuitive plugin that helps you personalize your login form directly from the Customizer. The plugin fully supports the Live Customizer feature and you can see all the changes in real time and edit them.</p>\n<p>All this plugin’s tools and options can be found by going to Appearance &gt; Customize &gt; Colorlib Login Customizer. There you have templates you can use, logo options, background options, form customizations, and some more.</p>\n<p>Colorlib Login Customizer is without doubt one of the easiest to use WordPress plugin that allows the customization of the login page and form. It was designed and developed to be powerful and user friendly so it can be enjoyed by both beginner and advanced developers. With Colorlib Login Customizer you can build a custom login page and form in a matter of seconds, unlike some other login customizer plugins. Colorlib Login Customizer marks the end of boring and bland login forms as you will be able to fine tune every aspect of the form to match your style and view.</p>\n<p>Build and personalize your WordPress login form from start to finish. Colorlib Login Customizer has the following features:</p>\n<ul>\n<li>Logo options: you can add a custom logo and set up its height and weight.</li>\n<li>Background options: from here you can upload a background image or change the background’s color.</li>\n<li>Form options: you can change the form’s width and height, add a background image, change the background color, add padding and borders, and change the form’s field background color, width, and margin.</li>\n<li>Miscellaneous: in here you will find the options to change the button’s background, color, hover state, border, shadow, and the link’s color and hover color.</li>\n</ul>\n<h4>Further Reading</h4>\n<p>This plugin is developed and maintained by Colorlib. Which is well know for their free <a href="https://colorlib.com/wp/themes/" rel="nofollow"></a>WordPress themes. However, now they are looking to extend their presence in plugin development and believe that Colorlib Login Customizer is a great way to start.</p>\n<p>If you are new to WordPress and want to learn more we have got you covered. Colorlib will teach you how to <a href="https://colorlib.com/" rel="nofollow">start a blog</a> or <a href="https://colorlib.com/wp/how-to-make-a-website/" rel="nofollow">create a website</a> and much more. If you are already familiar with WordPress you likely want to learn how to make it faster and more reliable. That&#8217;s when you want to look into hosting and more specifically <a href="http://colorlib.com/wp/wordpress-hosting" rel="nofollow">WordPress hosting</a>.</p>\n<p>If you enjoy using Colorlib Login Customizer for WordPress please leave a <a href="https://wordpress.org/support/plugin/colorlib-login-customiezr/reviews/?filter=5" rel="nofollow">positive feedback</a>. We are committed to make it the best Login Customizer plugin for WordPress.</p>\n";s:12:"installation";s:418:"<ol>\n<li>Download the plugin (.zip file) on your hard drive.</li>\n<li>Unzip the zip file contents.</li>\n<li>Upload the <code>colorlib-login-customizer</code> folder to the <code>/wp-content/plugins/</code> directory.</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress.</li>\n<li>A new sub menu item <code>Colorlib Login Customizer</code> will appear in your main Settings menu.</li>\n</ol>\n";s:9:"changelog";s:354:"<h4>1.2.0</h4>\n<ul>\n<li>Implemented everything from here: https://github.com/puikinsh/colorlib-login-customizer/milestone/1?closed=1</li>\n</ul>\n<h4>1.1</h4>\n<ul>\n<li>Changed templates functionality</li>\n<li>Added new layout options</li>\n<li>Fixed live preview editing</li>\n<li>Fixed minor bugs</li>\n</ul>\n<h4>1.0</h4>\n<ul>\n<li>Initial release</li>\n</ul>\n";s:3:"faq";s:464:"\n<h4>Installation Instructions</h4>\n<p>\n<ol>\n<li>Download the plugin (.zip file) on your hard drive.</li>\n<li>Unzip the zip file contents.</li>\n<li>Upload the <code>colorlib-login-customizer</code> folder to the <code>/wp-content/plugins/</code> directory.</li>\n<li>Activate the plugin through the &#8216;Plugins&#8217; menu in WordPress.</li>\n<li>A new sub menu item <code>Colorlib Login Customizer</code> will appear in your main Settings menu.</li>\n</ol>\n</p>\n\n";s:11:"screenshots";s:805:"<ol><li><a href="https://ps.w.org/colorlib-login-customizer/assets/screenshot-1.jpg?rev=1872192"><img src="https://ps.w.org/colorlib-login-customizer/assets/screenshot-1.jpg?rev=1872192" alt=""></a></li><li><a href="https://ps.w.org/colorlib-login-customizer/assets/screenshot-2.jpg?rev=1872192"><img src="https://ps.w.org/colorlib-login-customizer/assets/screenshot-2.jpg?rev=1872192" alt=""></a></li><li><a href="https://ps.w.org/colorlib-login-customizer/assets/screenshot-3.jpg?rev=1888161"><img src="https://ps.w.org/colorlib-login-customizer/assets/screenshot-3.jpg?rev=1888161" alt=""></a></li><li><a href="https://ps.w.org/colorlib-login-customizer/assets/screenshot-4.jpg?rev=1888161"><img src="https://ps.w.org/colorlib-login-customizer/assets/screenshot-4.jpg?rev=1888161" alt=""></a></li></ol>";}s:17:"short_description";s:122:"Colorlib Login Customizer by Colorlib is a plugin that helps you personalize your login form directly from the Customizer.";s:13:"download_link";s:74:"https://downloads.wordpress.org/plugin/colorlib-login-customizer.1.2.0.zip";s:11:"screenshots";a:4:{i:1;a:2:{s:3:"src";s:78:"https://ps.w.org/colorlib-login-customizer/assets/screenshot-1.jpg?rev=1872192";s:7:"caption";s:0:"";}i:2;a:2:{s:3:"src";s:78:"https://ps.w.org/colorlib-login-customizer/assets/screenshot-2.jpg?rev=1872192";s:7:"caption";s:0:"";}i:3;a:2:{s:3:"src";s:78:"https://ps.w.org/colorlib-login-customizer/assets/screenshot-3.jpg?rev=1888161";s:7:"caption";s:0:"";}i:4;a:2:{s:3:"src";s:78:"https://ps.w.org/colorlib-login-customizer/assets/screenshot-4.jpg?rev=1888161";s:7:"caption";s:0:"";}}s:8:"versions";a:3:{s:5:"1.1.0";s:74:"https://downloads.wordpress.org/plugin/colorlib-login-customizer.1.1.0.zip";s:5:"1.2.0";s:74:"https://downloads.wordpress.org/plugin/colorlib-login-customizer.1.2.0.zip";s:5:"trunk";s:68:"https://downloads.wordpress.org/plugin/colorlib-login-customizer.zip";}s:5:"icons";a:2:{s:2:"1x";s:78:"https://ps.w.org/colorlib-login-customizer/assets/icon-256x256.jpg?rev=1862920";s:2:"2x";s:78:"https://ps.w.org/colorlib-login-customizer/assets/icon-256x256.jpg?rev=1862920";}s:12:"contributors";a:0:{}}', 'no');

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
(2, 3, '_wp_page_template', 'default');

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
(1, 1, '2018-08-21 07:32:49', '2018-08-21 07:32:49', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-08-21 07:32:49', '2018-08-21 07:32:49', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/shapely/?p=1', 0, 'post', '', 1),
(2, 1, '2018-08-21 07:32:49', '2018-08-21 07:32:49', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/shapely/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-08-21 07:32:49', '2018-08-21 07:32:49', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/shapely/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-08-21 07:32:49', '2018-08-21 07:32:49', '<h2>Who we are</h2><p>Our website address is: http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/shapely.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2018-08-21 07:32:49', '2018-08-21 07:32:49', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/shapely/?page_id=3', 0, 'page', '', 0),
(4, 1, '2018-08-21 07:33:10', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-21 07:33:10', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/RMF-Website/rmfwebsite/Archives/Templates/shapely/?p=4', 0, 'post', '', 0);

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
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rmf_terms`
--

INSERT INTO `rmf_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

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
(12, 1, 'rmf_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'rmf_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:"b78b8f1c51bbdade8017823283f8086d01fae13d519620d98938f057f8b5d135";a:4:{s:10:"expiration";i:1535009587;s:2:"ip";s:3:"::1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36";s:5:"login";i:1534836787;}s:64:"8c510a7999a86f2b1c90212a623ae5daf760c1726129990dd92574b696709aae";a:4:{s:10:"expiration";i:1536069611;s:2:"ip";s:3:"::1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36";s:5:"login";i:1534860011;}}'),
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
(1, 'administrator', '$P$BbsueX2BSK6fq4rsdcdiMaXhu0OLLC1', 'administrator', 'francisco.abayon@rafi.org.ph', '', '2018-08-21 07:32:47', '', 0, 'administrator');

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
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
--
-- AUTO_INCREMENT for table `rmf_postmeta`
--
ALTER TABLE `rmf_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rmf_posts`
--
ALTER TABLE `rmf_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
