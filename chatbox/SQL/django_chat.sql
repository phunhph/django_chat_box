-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 09:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `django_chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add chat_ box', 8, 'add_chat_box'),
(30, 'Can change chat_ box', 8, 'change_chat_box'),
(31, 'Can delete chat_ box', 8, 'delete_chat_box'),
(32, 'Can view chat_ box', 8, 'view_chat_box'),
(33, 'Can add chat_ group', 9, 'add_chat_group'),
(34, 'Can change chat_ group', 9, 'change_chat_group'),
(35, 'Can delete chat_ group', 9, 'delete_chat_group'),
(36, 'Can view chat_ group', 9, 'view_chat_group'),
(37, 'Can add detail_group', 10, 'add_detail_group'),
(38, 'Can change detail_group', 10, 'change_detail_group'),
(39, 'Can delete detail_group', 10, 'delete_detail_group'),
(40, 'Can view detail_group', 10, 'view_detail_group'),
(41, 'Can add group_ chat', 11, 'add_group_chat'),
(42, 'Can change group_ chat', 11, 'change_group_chat'),
(43, 'Can delete group_ chat', 11, 'delete_group_chat'),
(44, 'Can view group_ chat', 11, 'view_group_chat');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$YuzCNec7OLfim4urR0dxuI$3HXsilFsvSGlIy4RTC5IKZpVtaDZ+p3vRzZB5fitWQo=', NULL, 0, 'Nguyễn Hữu Phú', '', '', 'phunhph33261@fpt.edu.vn', 0, 1, '2023-12-14 07:21:59.239872'),
(2, 'pbkdf2_sha256$600000$s2Toug3m6FPFI3oDzs8FYg$GZVE6VCO3jpP4T0ypEo2Y5yUY1RQsCvEgHr15GVWaxg=', NULL, 0, 'admin', '', '', 'admin@fpt.edu.vn', 0, 1, '2023-12-14 07:27:08.241367');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_chat_box`
--

CREATE TABLE `chat_chat_box` (
  `id` bigint(20) NOT NULL,
  `id_in` int(11) NOT NULL,
  `id_out` int(11) NOT NULL,
  `mes` varchar(100) NOT NULL,
  `time` datetime(6) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `url_file` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_chat_box`
--

INSERT INTO `chat_chat_box` (`id`, `id_in`, `id_out`, `mes`, `time`, `status`, `url_file`) VALUES
(42, 12, 14, '', NULL, 1, 'file/2022-technology_en.pdf'),
(43, 13, 14, '', NULL, 1, 'file/2022-technology_en.pdf'),
(44, 13, 14, '', NULL, 1, 'file/2022-technology_en.pdf'),
(45, 13, 14, '', NULL, 1, 'file/2022-technology_en.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `chat_chat_group`
--

CREATE TABLE `chat_chat_group` (
  `id` bigint(20) NOT NULL,
  `name_group` varchar(50) NOT NULL,
  `url_image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_chat_group`
--

INSERT INTO `chat_chat_group` (`id`, `name_group`, `url_image`) VALUES
(8, 'Nhóm 1', 'image/img3.jpg'),
(10, 'Nhom all', 'image/img6.jpg'),
(11, 'Group học hỏi', 'image/img3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `chat_detail_group`
--

CREATE TABLE `chat_detail_group` (
  `id` bigint(20) NOT NULL,
  `id_group` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_detail_group`
--

INSERT INTO `chat_detail_group` (`id`, `id_group`, `id_user`) VALUES
(20, 8, 12),
(21, 8, 13),
(24, 10, 12),
(25, 10, 13),
(26, 10, 14),
(27, 11, 12),
(28, 11, 14);

-- --------------------------------------------------------

--
-- Table structure for table `chat_group_chat`
--

CREATE TABLE `chat_group_chat` (
  `id` bigint(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `mes` varchar(100) NOT NULL,
  `time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `url_file` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_group_chat`
--

INSERT INTO `chat_group_chat` (`id`, `id_user`, `id_group`, `mes`, `time`, `status`, `url_file`) VALUES
(39, 12, 10, 'alo', '2023-12-21 16:36:45.939032', 0, NULL),
(40, 12, 10, '', '2023-12-21 16:37:02.231587', 0, 'file/2022-technology_en.pdf'),
(41, 13, 10, '', '2023-12-21 16:37:27.077639', 0, 'file/Pháp luật dân sự.pdf'),
(42, 14, 10, '', '2023-12-21 16:38:00.303217', 0, 'file/Nguyen_Thi_Hanh_PH34748.docx');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'Chat', 'chat_box'),
(9, 'Chat', 'chat_group'),
(10, 'Chat', 'detail_group'),
(11, 'Chat', 'group_chat'),
(5, 'contenttypes', 'contenttype'),
(7, 'Login', 'login'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Chat', '0001_initial', '2023-12-13 15:04:23.313407'),
(2, 'Chat', '0002_rename_chat_chat_box', '2023-12-13 15:04:23.346660'),
(3, 'Login', '0001_initial', '2023-12-13 15:04:23.368795'),
(4, 'contenttypes', '0001_initial', '2023-12-13 15:04:23.448633'),
(5, 'auth', '0001_initial', '2023-12-13 15:04:24.016477'),
(6, 'admin', '0001_initial', '2023-12-13 15:04:24.163567'),
(7, 'admin', '0002_logentry_remove_auto_add', '2023-12-13 15:04:24.173642'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-13 15:04:24.183183'),
(9, 'contenttypes', '0002_remove_content_type_name', '2023-12-13 15:04:24.245695'),
(10, 'auth', '0002_alter_permission_name_max_length', '2023-12-13 15:04:24.315659'),
(11, 'auth', '0003_alter_user_email_max_length', '2023-12-13 15:04:24.331875'),
(12, 'auth', '0004_alter_user_username_opts', '2023-12-13 15:04:24.339893'),
(13, 'auth', '0005_alter_user_last_login_null', '2023-12-13 15:04:24.403866'),
(14, 'auth', '0006_require_contenttypes_0002', '2023-12-13 15:04:24.406853'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2023-12-13 15:04:24.417437'),
(16, 'auth', '0008_alter_user_username_max_length', '2023-12-13 15:04:24.434502'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2023-12-13 15:04:24.473857'),
(18, 'auth', '0010_alter_group_name_max_length', '2023-12-13 15:04:24.499617'),
(19, 'auth', '0011_update_proxy_permissions', '2023-12-13 15:04:24.518841'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2023-12-13 15:04:24.535767'),
(21, 'sessions', '0001_initial', '2023-12-13 15:04:24.583003'),
(22, 'Login', '0002_alter_login_img', '2023-12-14 08:11:37.171357'),
(23, 'Login', '0003_rename_img_login_image', '2023-12-14 08:11:37.180875'),
(24, 'Chat', '0003_remove_chat_box_statuts_chat_box_status', '2023-12-15 09:39:27.901460'),
(25, 'Login', '0004_alter_login_image', '2023-12-15 09:39:27.908454'),
(26, 'Chat', '0004_chat_box_file', '2023-12-16 15:49:34.110910'),
(27, 'Chat', '0005_chat_group_detail_group', '2023-12-18 08:09:39.238689'),
(28, 'Chat', '0006_group_chat_remove_detail_group_file_and_more', '2023-12-18 08:54:10.329237'),
(29, 'Chat', '0007_alter_group_chat_file', '2023-12-19 07:26:52.113229'),
(30, 'Chat', '0008_alter_group_chat_file', '2023-12-19 07:31:39.575626'),
(31, 'Chat', '0009_group_chat_url_file', '2023-12-19 07:48:52.636503'),
(32, 'Chat', '0010_remove_group_chat_file', '2023-12-19 07:48:52.650010'),
(33, 'Chat', '0011_remove_chat_box_file_remove_chat_group_image_and_more', '2023-12-19 07:57:30.032580'),
(34, 'Login', '0005_remove_login_image_login_url_image', '2023-12-19 07:57:30.053968');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4i63hdcm4jk0b2431n740qc1d1hslc9d', 'eyJ1c2VyX2lkIjo0fQ:1rEATb:ZQTvRwOItKqg-Iea6HUMJsp9P77WjSj_viTt5sx2OeM', '2023-12-29 15:51:47.571170'),
('dlcafbtmv9xhbebla5txspynhqrf00ux', 'eyJ1c2VyX2lkIjo5fQ:1rFV11:8qm57kYAoncIO4Er8HSxFVZqokVWotCTPk06TB1j-1s', '2024-01-02 07:59:47.515672'),
('g8m9zopt5byzurf38mqxh0m38zphqkvo', 'eyJ1c2VyX2lkIjo3fQ:1rFEk1:AbicOfmZSULAvRVFvXeXk44dUFUkocxwjg_HG65dZhg', '2024-01-01 14:37:09.745707'),
('z1lzndkyrh5jzjzhwepdtn5wwx8zrm5l', '.eJyrViotTi2Kz0xRsjI00VFKy8xJVbICU_oBGTGlBgaphgUKOaUxpYapiSklCilgIaM8hWKQSJqhXkFKmpKOUmZKfHpRfmkBUKuhgVItAJuCGw8:1rGafF:JaXnusU5eqdj6PHeH8RK-Ziltf1jco6yF6YKmBtK1OQ', '2024-01-05 08:13:49.776864');

-- --------------------------------------------------------

--
-- Table structure for table `login_login`
--

CREATE TABLE `login_login` (
  `id` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url_image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_login`
--

INSERT INTO `login_login` (`id`, `email`, `password`, `name`, `url_image`) VALUES
(12, 'phunhph33261@fpt.edu.vn', 'pbkdf2_sha256$600000$sgvQmNKCEJoFdWTZQwPsMP$FXh7vD0H/ibdpsv5TG1/JqlrSYlgeDHDo+rDRLdnhX4=', 'Nguyễn Đại Dương', 'image/user.png'),
(13, 'longhh7@fpt.edu.vn', 'pbkdf2_sha256$600000$l7IPj7PqHCTj0YYGVgVQUs$YFMqPZ68BqibCo0m7wlIlA1FnFfFJJxiVNRGelRIeIE=', 'Đào Xuân Hiển', 'image/user.png'),
(14, 'phuzb2@gmail.com', 'pbkdf2_sha256$600000$EDojym2w4nAPB8RaTOvZ4m$a7U5ga86ht23muyOXoZ19aemNdNWoeuPE2vxW/nGtWs=', 'Nguyễn Văn Tập', 'image/user.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `chat_chat_box`
--
ALTER TABLE `chat_chat_box`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_chat_group`
--
ALTER TABLE `chat_chat_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_detail_group`
--
ALTER TABLE `chat_detail_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_group_chat`
--
ALTER TABLE `chat_group_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `login_login`
--
ALTER TABLE `login_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_chat_box`
--
ALTER TABLE `chat_chat_box`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `chat_chat_group`
--
ALTER TABLE `chat_chat_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chat_detail_group`
--
ALTER TABLE `chat_detail_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `chat_group_chat`
--
ALTER TABLE `chat_group_chat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `login_login`
--
ALTER TABLE `login_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
