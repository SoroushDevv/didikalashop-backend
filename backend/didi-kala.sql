-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2022 at 02:17 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

-- Table structure for table `admins`
DROP TABLE IF EXISTS `admins`;

CREATE TABLE
  `admins` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(50) COLLATE utf8mb4_persian_ci NOT NULL,
    `lastname` VARCHAR(50) COLLATE utf8mb4_persian_ci NOT NULL,
    `username` VARCHAR(50) COLLATE utf8mb4_persian_ci NOT NULL,
    `password` VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL,
    `task` VARCHAR(100) COLLATE utf8mb4_persian_ci NOT NULL,
    `img` VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL,
    `token` VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

-- Dumping data for table `admins`
INSERT INTO
  `admins` (
    `id`,
    `firstname`,
    `lastname`,
    `username`,
    `password`,
    `task`,
    `img`,
    `token`
  )
VALUES
  (
    1,
    'علی',
    'محمدی',
    'ali_admin',
    'admin123',
    'مدیریت محصولات',
    'ali.jpg',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6ImFsaV9hZG1pbiIsImV4cCI6MTc0Nzg5Nzg3OX0.dummy_signature_ali'
  ),
  (
    2,
    'زهرا',
    'احمدی',
    'zahra_admin',
    'zahra2025',
    'مدیریت کاربران',
    'zahra.jpg',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6InphaHJhX2FkbWluIiwiZXhwIjoxNzQ3ODk3ODc5fQ.dummy_signature_zahra'
  ),
  (
    3,
    'محمد',
    'رضایی',
    'mohammad_admin',
    'mohammad789',
    'مدیریت سفارشات',
    'mohammad.jpg',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6Im1vaGFtbWFkX2FkbWluIiwiZXhwIjoxNzQ3ODk3ODc5fQ.dummy_signature_mohammad'
  ),
  (
    4,
    'فاطمه',
    'کریمی',
    'fateme_admin',
    'fateme456',
    'پشتیبانی مشتریان',
    'fateme.jpg',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6ImZhdGVtZV9hZG1pbiIsImV4cCI6MTc0Nzg5Nzg3OX0.dummy_signature_fateme'
  ),
  (
    5,
    'حسین',
    'نعمتی',
    'hossein_admin',
    'hossein101',
    'مدیریت محتوا',
    'hossein.jpg',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo1LCJ1c2VybmFtZSI6Imhvc3NlaW5fYWRtaW4iLCJleHAiOjE3NDc4OTc4Nzl9.dummy_signature_hossein'
  );

DROP TABLE IF EXISTS `users`;

CREATE TABLE
  users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(50) COLLATE utf8mb4_persian_ci NULL,
    lastname VARCHAR(50) COLLATE utf8mb4_persian_ci NULL,
    username VARCHAR(50) COLLATE utf8mb4_persian_ci NOT NULL,
    password VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL,
    phone VARCHAR(15) COLLATE utf8mb4_persian_ci NOT NULL,
    city VARCHAR(100) COLLATE utf8mb4_persian_ci NULL,
    email VARCHAR(100) COLLATE utf8mb4_persian_ci NOT NULL,
    address TEXT COLLATE utf8mb4_persian_ci NULL,
    score INT UNSIGNED NULL DEFAULT 0,
    buy DECIMAL(15, 2) NULL DEFAULT 0.00,
    token VARCHAR(255) COLLATE utf8mb4_persian_ci NULL,
    role ENUM ('user', 'admin') NOT NULL DEFAULT 'user',
    PRIMARY KEY (id),
    UNIQUE KEY username (username),
    UNIQUE KEY email (email),
    INDEX phone (phone)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

INSERT INTO
  users (
    id,
    firstname,
    lastname,
    username,
    password,
    phone,
    city,
    email,
    address,
    score,
    buy,
    token,
    role
  )
VALUES
  (
    1,
    'علی',
    'محمدی',
    'ali_mohammadi',
    '$2y$10$samplehash1234567890abcdef',
    '09123456789',
    'تهران',
    'ali.mohammadi@example.com',
    'تهران، خیابان اصلی، کوچه ۱۲',
    50,
    1200.50,
    'token_ali_123',
    'admin'
  ),
  (
    2,
    'زهرا',
    'احمدی',
    'zahra_ahmadi',
    '$2y$10$samplehash1234567890abcdef',
    '09129876543',
    'شیراز',
    'zahra.ahmadi@example.com',
    'شیراز، خیابان گل، پلاک ۵',
    30,
    800.75,
    'token_zahra_456',
    'admin'
  ),
  (
    3,
    'محمد',
    'رضایی',
    'mohammad_rezaei',
    '$2y$10$samplehash1234567890abcdef',
    '09137654321',
    'اصفهان',
    'mohammad.rezaei@example.com',
    'اصفهان، خیابان انقلاب، پلاک ۹',
    70,
    1500.00,
    'token_mohammad_789',
    'admin'
  ),
  (
    4,
    'فاطمه',
    'کریمی',
    'fateme_karimi',
    '$2y$10$samplehash1234567890abcdef',
    '09134567890',
    'تبریز',
    'fateme.karimi@example.com',
    'تبریز، خیابان آزادی، پلاک ۳',
    20,
    450.30,
    'token_fateme_012',
    'user'
  ),
  (
    5,
    'حسین',
    'نعمتی',
    'hossein_noamati',
    '$2y$10$samplehash1234567890abcdef',
    '09135678901',
    'تبریز',
    'hossein.noamati@example.com',
    'تبریز، خیابان ولیعصر، پلاک ۷',
    40,
    900.00,
    'token_hossein_345',
    'user'
  ),
  (
    6,
    'سارا',
    'قاسمی',
    'sara_ghasemi',
    '$2y$10$samplehash1234567890abcdef',
    '09136789012',
    'کرمان',
    'sara.ghasemi@example.com',
    'کرمان، خیابان نادری، پلاک ۴',
    60,
    1300.25,
    'token_sara_678',
    'user'
  ),
  (
    7,
    'رضا',
    'حسینی',
    'reza_hosseini',
    '$2y$10$samplehash1234567890abcdef',
    '09137890123',
    'البرز',
    'reza.hosseini@example.com',
    'البرز، خیابان امام، پلاک ۸',
    10,
    300.00,
    'token_reza_901',
    'user'
  ),
  (
    8,
    'نازنین',
    'رضوی',
    'nazanin_rezavi',
    '$2y$10$samplehash1234567890abcdef',
    '09138901234',
    'کرج',
    'nazanin.rezavi@example.com',
    'کرج، خیابان گلستان، پلاک ۲',
    80,
    2000.00,
    'token_nazanin_234',
    'user'
  ),
  (
    9,
    'امیر',
    'خانمحمدی',
    'amir_khanmohammadi',
    '$2y$10$samplehash1234567890abcdef',
    '09139012345',
    'رشت',
    'amir.khanmohammadi@example.com',
    'رشت، خیابان لاله، پلاک ۶',
    25,
    600.50,
    'token_amir_567',
    'user'
  ),
  (
    10,
    'لیلا',
    'نوری',
    'leila_noori',
    '$2y$10$samplehash1234567890abcdef',
    '09130123456',
    'یزد',
    'leila.noori@example.com',
    'یزد، خیابان سعدی، پلاک ۱',
    15,
    350.75,
    'token_leila_890',
    'user'
  );

-- Table structure for table `user_profiles`
DROP TABLE IF EXISTS `user_profiles`;

CREATE TABLE
  `user_profiles` (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    profile_image VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY user_id (user_id),
    CONSTRAINT fk_user_profiles_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

-- Dumping data for table `card_details`
INSERT INTO
  user_profiles (user_id, profile_image)
VALUES
  (1, '/uploads/profiles/ali_mohammadi.jpg'),
  (2, '/uploads/profiles/zahra_ahmadi.jpg'),
  (3, '/uploads/profiles/mohammad_rezaei.jpg'),
  (4, '/uploads/profiles/fateme_karimi.jpg'),
  (5, '/uploads/profiles/hossein_noamati.jpg'),
  (6, '/uploads/profiles/sara_ghasemi.jpg'),
  (7, '/uploads/profiles/reza_hosseini.jpg'),
  (8, '/uploads/profiles/nazanin_rezavi.jpg'),
  (9, '/uploads/profiles/amir_khanmohammadi.jpg'),
  (10, '/uploads/profiles/leila_noori.jpg');

-- Table structure for table `card_details`
DROP TABLE IF EXISTS `card_details`;

CREATE TABLE
  `card_details` (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    card_number CHAR(16) COLLATE utf8mb4_persian_ci NOT NULL, -- فقط شماره کارت
    bank_name VARCHAR(50) COLLATE utf8mb4_persian_ci NOT NULL,
    bank_logo VARCHAR(255) COLLATE utf8mb4_persian_ci DEFAULT NULL, -- مسیر/آیکن لوگو بانک
    status ENUM ('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    UNIQUE KEY unique_card (card_number)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

-- Dumping data for table `card_details`
INSERT INTO
  card_details (
    user_id,
    card_number,
    bank_name,
    bank_logo,
    status
  )
VALUES
  (
    1,
    '6037991234567890',
    'بانک ملی ایران',
    'melli-bank-logo',
    'active'
  ),
  (
    1,
    '6104339876543210',
    'بانک ملت',
    'mellat-bank-logo',
    'active'
  ),
  (
    2,
    '6274123456789012',
    'بانک اقتصاد نوین',
    'eghtesad-novin-bank-logo',
    'active'
  ),
  (
    3,
    '5022298765432109',
    'بانک پاسارگاد',
    'pasargad-bank-logo',
    'active'
  ),
  (
    3,
    '6219861122334455',
    'بانک سامان',
    'saman-bank-logo',
    'inactive'
  ),
  (
    4,
    '5892109988776655',
    'بانک سپه',
    'sepah-bank-logo',
    'active'
  ),
  (
    5,
    '6037701122446688',
    'بانک کشاورزی',
    'keshavarzi-bank-logo',
    'active'
  ),
  (
    5,
    '5054167788990011',
    'بانک گردشگری',
    'gardeshgari-bank-logo',
    'active'
  ),
  (
    6,
    '6221063344556677',
    'بانک پارسیان',
    'parsian-bank-logo',
    'active'
  ),
  (
    7,
    '6393479988771122',
    'بانک سینا',
    'sina-bank-logo',
    'active'
  ),
  (
    7,
    '6063732233445566',
    'بانک مهر ایران',
    'mehr-bank-logo',
    'active'
  ),
  (
    8,
    '6280234455667788',
    'بانک مسکن',
    'maskan-bank-logo',
    'active'
  ),
  (
    9,
    '6396071122334455',
    'بانک سرمایه',
    'sarmayeh-bank-logo',
    'active'
  ),
  (
    10,
    '5029386677889900',
    'بانک توسعه تعاون',
    'taavon-bank-logo',
    'active'
  ),
  (
    10,
    '5057852233445566',
    'بانک ایران زمین',
    'iranzamin-bank-logo',
    'active'
  ),
  (
    11,
    '6362149988776655',
    'بانک آینده',
    'ayandeh-bank-logo',
    'active'
  ),
  (
    12,
    '6273533344556677',
    'بانک تجارت',
    'tejarat-bank-logo',
    'active'
  ),
  (
    13,
    '5859831122334455',
    'بانک رفاه کارگران',
    'refah-bank-logo',
    'active'
  ),
  (
    13,
    '6273819988771122',
    'بانک انصار',
    'ansar-bank-logo',
    'active'
  ),
  (
    14,
    '5041722233445566',
    'بانک رسالت',
    'resalat-bank-logo',
    'active'
  ),
  (
    15,
    '6391944455667788',
    'بانک حکمت ایرانیان',
    'hekmat-bank-logo',
    'active'
  ),
  (
    15,
    '6369491122334455',
    'بانک دی',
    'day-bank-logo',
    'active'
  ),
  (
    16,
    '5029386677881122',
    'بانک شهر',
    'shahr-bank-logo',
    'active'
  ),
  (
    17,
    '6396074455667788',
    'بانک مهر اقتصاد',
    'mehr-eghtesad-bank-logo',
    'active'
  ),
  (
    18,
    '6362143344556677',
    'بانک کارآفرین',
    'karafarin-bank-logo',
    'active'
  ),
  (
    19,
    '5022299988771122',
    'بانک پاسارگاد',
    'pasargad-bank-logo',
    'active'
  ),
  (
    19,
    '6273812233445566',
    'بانک انصار',
    'ansar-bank-logo',
    'active'
  ),
  (
    20,
    '6393476677889900',
    'بانک سینا',
    'sina-bank-logo',
    'active'
  ),
  (
    21,
    '6063739988776655',
    'بانک مهر ایران',
    'mehr-bank-logo',
    'active'
  ),
  (
    22,
    '6280232233445566',
    'بانک مسکن',
    'maskan-bank-logo',
    'active'
  ),
  (
    22,
    '6037995566778899',
    'بانک ملی ایران',
    'melli-bank-logo',
    'active'
  ),
  (
    23,
    '6104334455667788',
    'بانک ملت',
    'mellat-bank-logo',
    'active'
  ),
  (
    24,
    '6274128899001122',
    'بانک اقتصاد نوین',
    'eghtesad-novin-bank-logo',
    'active'
  ),
  (
    25,
    '5022293344556677',
    'بانک پاسارگاد',
    'pasargad-bank-logo',
    'active'
  ),
  (
    25,
    '6219867788990011',
    'بانک سامان',
    'saman-bank-logo',
    'active'
  ),
  (
    26,
    '5892101122334455',
    'بانک سپه',
    'sepah-bank-logo',
    'active'
  ),
  (
    27,
    '6037709988771122',
    'بانک کشاورزی',
    'keshavarzi-bank-logo',
    'active'
  ),
  (
    28,
    '5054163344556677',
    'بانک گردشگری',
    'gardeshgari-bank-logo',
    'active'
  ),
  (
    29,
    '6221067788990011',
    'بانک پارسیان',
    'parsian-bank-logo',
    'active'
  ),
  (
    29,
    '6393471122334455',
    'بانک سینا',
    'sina-bank-logo',
    'active'
  ),
  (
    30,
    '6063736677889900',
    'بانک مهر ایران',
    'mehr-bank-logo',
    'active'
  );

-- Table structure for table `categories`
DROP TABLE IF EXISTS `categories`;

CREATE TABLE
  `categories` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) COLLATE utf8mb4_persian_ci NOT NULL,
    `parent_id` INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
    INDEX `parent_idx` (`parent_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

-- والدها
INSERT INTO
  `categories` (`id`, `title`, `parent_id`)
VALUES
  (1, 'گوشی', NULL),
  (2, 'لپتاپ', NULL),
  (3, 'گجت و لوازم دیجیتال', NULL),
  (4, 'تبلت', NULL),
  (5, 'لوازم جانبی', NULL),
  (6, 'تلویزیون و صوتی', NULL),
  (7, 'کنسول بازی', NULL),
  (8, 'دوربین', NULL),
  (9, 'لوازم خانگی', NULL),
  (10, 'آشپزخانه', NULL),
  (11, 'پوشاک', NULL),
  (12, 'کتاب', NULL),
  (13, 'ورزش و سفر', NULL),
  (14, 'ابزارآلات', NULL),
  (15, 'لوازم خودرو', NULL),
  (16, 'مواد غذایی', NULL),
  (17, 'گل و گیاه', NULL),
  (18, 'سامسونگ', 1),
  (19, 'اپل', 1),
  (20, 'نوکیا', 1),
  (21, 'ایسوس', 2),
  (22, 'لنوو', 2),
  (23, 'اچ‌پی', 2),
  (24, 'دل', 2),
  (25, 'اپل', 2),
  (26, 'مایکروسافت', 2),
  (27, 'سامسونگ', 4),
  (28, 'لنوو', 4),
  (29, 'اپل', 4),
  (30, 'هدفون و هندزفری', 3),
  (31, 'کیبورد و ماوس', 3),
  (32, 'شارژر و کابل', 3),
  (33, 'اندروید باکس و پلیر', 3),
  (34, 'تلویزیون', 6),
  (35, 'ساندبار و سینما خانگی', 6),
  (36, 'پلی‌استیشن', 7),
  (37, 'ایکس‌باکس', 7),
  (38, 'نینتندو', 7),
  (39, 'DSLR', 8),
  (40, 'Mirrorless', 8),
  (41, 'ورزشی', 8),
  (42, 'ساید و یخچال', 9),
  (43, 'لباسشویی', 9),
  (44, 'جاروبرقی', 9),
  (45, 'مایکروویو', 10),
  (46, 'مخلوط‌کن', 10),
  (47, 'قابلمه', 10),
  (48, 'مردانه', 11),
  (49, 'زنانه', 11);

(50, 'برنامه‌نویسی', 12),
(51, 'وزنه', 13),
(52, 'چادر کمپینگ', 13),
(53, 'دریل', 14),
(54, 'چکش', 14),
(55, 'روکش صندلی', 15),
(56, 'کپسول آتش‌نشانی', 15),
(57, 'برنج', 16),
(58, 'آب معدنی', 16),
(59, 'گیاه آپارتمانی', 17),
(60, 'ابزار باغبانی', 17);

-- حذف جدول products در صورت وجود
DROP TABLE IF EXISTS `products`;

-- ایجاد جدول products
CREATE TABLE
  `products` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) COLLATE utf8mb4_persian_ci NOT NULL,
    `price` DECIMAL(15, 2) UNSIGNED NOT NULL CHECK (`price` > 0),
    `count` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    `img` VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL,
    `popularity` TINYINT UNSIGNED NOT NULL CHECK (`popularity` BETWEEN 1 AND 5),
    `sale` DECIMAL(15, 2) UNSIGNED NOT NULL DEFAULT 0.00,
    `hasDiscount` BOOLEAN NOT NULL DEFAULT FALSE, -- فیلد برای وضعیت تخفیف
    `discountEndDate` DATETIME DEFAULT NULL, -- تاریخ پایان تخفیف
    `discountPercent` TINYINT UNSIGNED DEFAULT NULL CHECK (`discountPercent` BETWEEN 1 AND 100), -- درصد تخفیف جایگزین قیمت تخفیف‌خورده
    `colors` JSON NOT NULL,
    `productDesc` TEXT COLLATE utf8mb4_persian_ci NOT NULL,
    `url` VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL,
    `categoryID` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
    INDEX `category_idx` (`categoryID`),
    INDEX `title_idx` (`title`),
    INDEX `price_idx` (`price`),
    INDEX `hasDiscount_idx` (`hasDiscount`) -- ایندکس برای بهینه‌سازی کوئری‌های تخفیف
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

-- داده نمونه با درصد تخفیف
INSERT INTO
  `products` (
    `id`,
    `title`,
    `price`,
    `count`,
    `img`,
    `popularity`,
    `sale`,
    `hasDiscount`,
    `discountEndDate`,
    `discountPercent`,
    `colors`,
    `productDesc`,
    `url`,
    `categoryID`
  )
VALUES
  (1,'گوشی سامسونگ گلکسی S24',35000000.00,50,'samsung-s24.jpg',1,100.00,TRUE,'2025-08-16 21:42:00',10,'["سفید"]','گوشی 5G با نمایشگر AMOLED','samsung-s24-url',18),
  (2,'آیفون 14 پرو',55000000.00,30,'iphone-14pro.jpg',2,0.00,FALSE,NULL,NULL,'["مشکی","نقره‌ای"]','گوشی پرچمدار اپل با دوربین 48MP','iphone-14pro-url',19),
  (3,'نوکیا 3310',1500000.00,100,'nokia-3310.jpg',3,0.00,FALSE,NULL,NULL,'["آبی","قرمز"]','گوشی کلاسیک با باتری قوی','nokia-3310-url',20),
  (4,'نوکیا 105',800000.00,2,'nokia-105.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',15,'["مشکی"]','گوشی ساده با دوام بالا','nokia-105-url',20),
  (5,'لپتاپ ایسوس ROG Strix',65000000.00,20,'asus-rog.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',12,'["مشکی"]','لپتاپ گیمینگ با RTX 4070','asus-rog-url',21),
  (6,'لپتاپ لنوو Raider',48000000.00,25,'lenovo-raider.jpg',3,0.00,FALSE,NULL,NULL,'["مشکی"]','لپتاپ گیمینگ با پردازنده Ryzen','lenovo-raider-url',22),
  (7,'لپتاپ اچ‌پی Pavilion',25000000.00,40,'hp-pavilion.jpg',1,100.00,TRUE,'2025-08-16 21:42:00',8,'["نقره‌ای"]','لپتاپ سبک برای مصارف خانگی','hp-pavilion-url',23),
  (8,'لپتاپ دل Inspiron 15',22000000.00,50,'dell-inspiron.jpg',5,0.00,FALSE,NULL,NULL,'["مشکی"]','لپتاپ اقتصادی با عملکرد خوب','dell-inspiron-url',24),
  (9,'مک‌بوک پرو M2',75000000.00,15,'macbook-pro.jpg',4,0.00,FALSE,NULL,NULL,'["خاکستری","نقره‌ای"]','لپتاپ حرفه‌ای با چیپ M2','macbook-pro-url',25),
  (10,'لپتاپ سرفیس پرو 9',60000000.00,20,'surface-pro.jpg',2,100.00,TRUE,'2025-08-16 21:42:00',10,'["مشکی"]','لپتاپ هیبریدی با ویندوز','surface-pro-url',26),
    (11,'پاوربانک شیائومی 20000mAh',1500000.00,80,'xiaomi-powerbank.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',10,'["مشکی","سفید"]','پاوربانک با شارژ سریع','xiaomi-powerbank-url',32),
  (12,'لامپ هوشمند شیائومی',900000.00,60,'xiaomi-smartlamp.jpg',2,0.00,FALSE,NULL,NULL,'["سفید"]','لامپ قابل کنترل با اپلیکیشن','xiaomi-smartlamp-url',33),
  (13,'هارد اکسترنال 1TB وسترن دیجیتال',2500000.00,70,'wd-hdd.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',8,'["مشکی"]','هارد اکسترنال با سرعت بالا','wd-hdd-url',32),
  (14,'فلش مموری 64GB سندیسک',400000.00,100,'sandisk-flash.jpg',1,0.00,FALSE,NULL,NULL,'["نقره‌ای"]','فلش مموری USB 3.0','sandisk-flash-url',32),
  (15,'تبلت سامسونگ گلکسی تب A9',9000000.00,40,'samsung-taba9.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',10,'["خاکستری"]','تبلت اقتصادی با نمایشگر 8.7 اینچ','samsung-taba9-url',27),
  (16,'تبلت لنوو Tab M10',8500000.00,45,'lenovo-tabm10.jpg',5,0.00,FALSE,NULL,NULL,'["مشکی"]','تبلت اندرویدی با باتری قوی','lenovo-tabm10-url',28),
  (17,'آیپد ایر M2',30000000.00,1,'ipad-air.jpg',2,0.00,FALSE,NULL,NULL,'["آبی","خاکستری"]','تبلت اپل با چیپ M2','ipad-air-url',29),
  (18,'آیپد پرو M4',55000000.00,15,'ipad-pro.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',12,'["نقره‌ای"]','تبلت حرفه‌ای با نمایشگر OLED','ipad-pro-url',29),
  (19,'هدفون بی‌سیم JBL',3500000.00,60,'jbl-headphones.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',10,'["مشکی","سفید"]','هدفون بی‌سیم با کیفیت صدا بالا','jbl-headphones-url',30),
  (20,'هندزفری بلوتوثی شیائومی',1200000.00,80,'xiaomi-earbuds.jpg',1,0.00,FALSE,NULL,NULL,'["سفید"]','هندزفری با حذف نویز','xiaomi-earbuds-url',30),
    (21,'کیبورد مکانیکال ریزر',4500000.00,25,'razer-keyboard.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',10,'["مشکی"]','کیبورد گیمینگ با نور RGB','razer-keyboard-url',31),
  (22,'ماوس گیمینگ لاجیتک G502',3200000.00,30,'logitech-g502.jpg',3,0.00,FALSE,NULL,NULL,'["مشکی"]','ماوس حرفه‌ای با DPI بالا','logitech-g502-url',31),
  (23,'مانیتور 27 اینچ LG 4K',15000000.00,15,'lg-4k-monitor.jpg',5,100.00,TRUE,'2025-08-16 21:42:00',12,'["مشکی"]','مانیتور 4K با پنل IPS','lg-4k-monitor-url',34),
  (24,'مانیتور سامسونگ 24 اینچ',9000000.00,20,'samsung-24-monitor.jpg',2,0.00,FALSE,NULL,NULL,'["مشکی"]','مانیتور Full HD با نرخ 75Hz','samsung-24-monitor-url',34),
  (25,'اسپیکر بلوتوثی سونی',5000000.00,40,'sony-speaker.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',8,'["مشکی","آبی"]','اسپیکر پرتابل ضدآب','sony-speaker-url',30),
  (26,'دوربین عکاسی کانن EOS 90D',35000000.00,10,'canon-90d.jpg',4,0.00,FALSE,NULL,NULL,'["مشکی"]','دوربین DSLR با سنسور 32MP','canon-90d-url',35),
  (27,'لنز کانن 50mm f/1.8',8000000.00,12,'canon-50mm.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',10,'["مشکی"]','لنز پرایم پرطرفدار','canon-50mm-url',35),
  (28,'سه‌پایه دوربین مانفروتو',2500000.00,18,'manfrotto-tripod.jpg',2,0.00,FALSE,NULL,NULL,'["مشکی"]','سه‌پایه سبک و مقاوم','manfrotto-tripod-url',35),
  (29,'کنسول پلی‌استیشن 5',32000000.00,20,'ps5-console.jpg',5,100.00,TRUE,'2025-08-16 21:42:00',15,'["سفید"]','کنسول بازی نسل نهم','ps5-console-url',36),
  (30,'دسته پلی‌استیشن 5 DualSense',2800000.00,35,'ps5-dualsense.jpg',4,0.00,FALSE,NULL,NULL,'["سفید","مشکی"]','کنترلر بی‌سیم با بازخورد لمسی','ps5-dualsense-url',36),
    (31,'بازی Horizon Forbidden West',2500000.00,50,'horizon.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',10,'["دیسکی"]','بازی ماجراجویی اکشن برای PS5','horizon-url',37),
  (32,'بازی God of War Ragnarok',2800000.00,45,'gow-ragnarok.jpg',5,0.00,FALSE,NULL,NULL,'["دیسکی"]','اکشن ماجرایی حماسی','gow-ragnarok-url',37),
  (33,'بازی Elden Ring',2600000.00,40,'elden-ring.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',12,'["دیسکی"]','بازی نقش‌آفرینی جهان‌باز','elden-ring-url',37),
  (34,'مایکروسافت Xbox Series X',31000000.00,20,'xbox-seriesx.jpg',5,100.00,TRUE,'2025-08-16 21:42:00',15,'["مشکی"]','کنسول بازی قدرتمند مایکروسافت','xbox-seriesx-url',36),
  (35,'کنترلر Xbox Wireless',2500000.00,30,'xbox-controller.jpg',3,0.00,FALSE,NULL,NULL,'["مشکی","سفید"]','کنترلر بی‌سیم با ارگونومی عالی','xbox-controller-url',36),
  (36,'کیف حمل نینتندو سوییچ',800000.00,40,'switch-case.jpg',2,0.00,FALSE,NULL,NULL,'["قرمز","مشکی"]','کیف محافظ مقاوم','switch-case-url',36),
  (37,'نینتندو سوییچ OLED',18000000.00,25,'switch-oled.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',10,'["سفید","قرمز"]','کنسول هیبریدی با نمایشگر OLED','switch-oled-url',36),
  (38,'هدفون گیمینگ استیل‌سریز',4200000.00,30,'steelseries-headset.jpg',4,0.00,FALSE,NULL,NULL,'["مشکی"]','هدفون با میکروفون نویزگیر','steelseries-headset-url',31),
  (39,'ماوس‌پد RGB کورسیر',900000.00,60,'corsair-mousepad.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',8,'["مشکی"]','ماوس‌پد با نورپردازی RGB','corsair-mousepad-url',31),
  (40,'صندلی گیمینگ DXRacer',12000000.00,15,'dxracer-chair.jpg',5,100.00,TRUE,'2025-08-16 21:42:00',12,'["مشکی","قرمز"]','صندلی ارگونومیک مخصوص بازی','dxracer-chair-url',31),
  (41,'میکروفون استریمینگ Blue Yeti',4500000.00,20,'blue-yeti.jpg',4,0.00,FALSE,NULL,NULL,'["نقره‌ای"]','میکروفون USB با کیفیت ضبط بالا','blue-yeti-url',38),
  (42,'وب‌کم Logitech C920',3200000.00,35,'logitech-c920.jpg',3,100.00,TRUE,'2025-08-16 21:42:00',10,'["مشکی"]','وب‌کم Full HD','logitech-c920-url',38),
  (43,'کارت گرافیک RTX 4080',65000000.00,10,'rtx-4080.jpg',5,0.00,FALSE,NULL,NULL,'["مشکی"]','کارت گرافیک قدرتمند نسل جدید','rtx-4080-url',39),
  (44,'پردازنده Intel i9-14900K',28000000.00,12,'intel-i9.jpg',5,0.00,FALSE,NULL,NULL,'["مشکی"]','پردازنده پرچمدار اینتل','intel-i9-url',39),
  (45,'رم DDR5 32GB کورسیر',4500000.00,25,'corsair-ram.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',8,'["مشکی"]','حافظه رم سرعت بالا','corsair-ram-url',39),
  (46,'مادربرد ASUS Z790',15000000.00,15,'asus-z790.jpg',3,0.00,FALSE,NULL,NULL,'["مشکی"]','مادربرد مخصوص گیمینگ','asus-z790-url',39),
  (47,'SSD سامسونگ 1TB NVMe',3800000.00,40,'samsung-ssd1tb.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',10,'["مشکی"]','اس‌اس‌دی پرسرعت NVMe','samsung-ssd1tb-url',39),
  (48,'هارد اکسترنال سیگیت 2TB',2800000.00,50,'seagate-2tb.jpg',3,0.00,FALSE,NULL,NULL,'["مشکی"]','هارد اکسترنال مقاوم','seagate-2tb-url',32),
  (49,'کولر مایع Corsair',5000000.00,18,'corsair-cooler.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',12,'["مشکی"]','خنک‌کننده مایع پردازنده','corsair-cooler-url',39),
  (50,'پاور 850W EVGA',4000000.00,20,'evga-850w.jpg',3,0.00,FALSE,NULL,NULL,'["مشکی"]','منبع تغذیه با راندمان بالا','evga-850w-url',39),
  (51,'کیس گیمینگ NZXT H710',7000000.00,22,'nzxt-h710.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',10,'["سفید","مشکی"]','کیس با تهویه عالی','nzxt-h710-url',39),
  (52,'مانیتور گیمینگ MSI 32"',19000000.00,14,'msi-32-monitor.jpg',5,0.00,FALSE,NULL,NULL,'["مشکی"]','مانیتور 165Hz منحنی','msi-32-monitor-url',34),
  (53,'هدست واقعیت مجازی Meta Quest 3',22000000.00,16,'meta-quest3.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',12,'["سفید"]','هدست VR بی‌سیم','meta-quest3-url',40),
  (54,'دوربین امنیتی Arlo Pro 4',8000000.00,30,'arlo-pro4.jpg',3,0.00,FALSE,NULL,NULL,'["سفید"]','دوربین بی‌سیم با دید در شب','arlo-pro4-url',41),
  (55,'ربات جاروبرقی Roborock S8',15000000.00,18,'roborock-s8.jpg',4,100.00,TRUE,'2025-08-16 21:42:00',10,'["سفید","مشکی"]','جاروبرقی رباتیک هوشمند','roborock-s8-url',41),
  (56,'ماشین لباسشویی ال‌جی 9kg',22000000.00,12,'lg-washer.jpg',3,0.00,FALSE,NULL,NULL,'["نقره‌ای"]','ماشین لباسشویی هوشمند','lg-washer-url',42),
  (57,'یخچال ساید بای ساید سامسونگ',45000000.00,8,'samsung-fridge.jpg',5,0.00,FALSE,NULL,NULL,'["نقره‌ای"]','یخچال بزرگ با فناوری اینورتر','samsung-fridge-url',42),
  (58,'مایکروویو پاناسونیک',6500000.00,25,'panasonic-microwave.jpg',2,100.00,TRUE,'2025-08-16 21:42:00',8,'["نقره‌ای"]','مایکروویو با منوی هوشمند','panasonic-microwave-url',42),
  (59,'قهوه‌ساز نسپرسو',7000000.00,20,'nespresso-coffee.jpg',4,0.00,FALSE,NULL,NULL,'["مشکی","قرمز"]','قهوه‌ساز کپسولی حرفه‌ای','nespresso-coffee-url',42),
  (60,'چای‌ساز فیلیپس',3500000.00,30,'philips-tea.jpg',2,100.00,TRUE,'2025-08-16 21:42:00',10,'["مشکی","نقره‌ای"]','چای‌ساز استیل شیشه‌ای','philips-tea-url',42),
   (61,'جاروبرقی بوش 2500W',5500000.00,25,'bosch-vacuum.jpg',3,0.00,FALSE,NULL,NULL,'["قرمز","مشکی"]','جاروبرقی پرقدرت با فیلتر HEPA','bosch-vacuum-url',42),
  (62,'اتو بخار فیلیپس',2800000.00,40,'philips-iron.jpg',2,100.00,TRUE,'2025-08-16 21:42:00',10,'["آبی","سفید"]','اتو بخار سریع با قابلیت ضدچکه','philips-iron-url',42)
  ;

-- Table structure for table `comments`
DROP TABLE IF EXISTS `comments`;

CREATE TABLE
  `comments` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `body` TEXT COLLATE utf8mb4_persian_ci NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `userID` INT UNSIGNED NOT NULL,
    `productID` INT UNSIGNED NOT NULL,
    `is_reply` BOOLEAN NOT NULL DEFAULT 0,
    `reply_id` INT UNSIGNED NULL DEFAULT NULL,
    `status` ENUM ('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`productID`) REFERENCES `products` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`reply_id`) REFERENCES `comments` (`id`) ON DELETE SET NULL,
    INDEX `product_idx` (`productID`, `status`, `is_reply`),
    INDEX `reply_idx` (`reply_id`),
    INDEX `created_at_idx` (`created_at`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

INSERT INTO
  `comments` (
    `id`,
    `body`,
    `created_at`,
    `userID`,
    `productID`,
    `is_reply`,
    `reply_id`,
    `status`
  )
VALUES
  (
    1,
    'محصول بسیار باکیفیت بود، خیلی راضی هستم!',
    '2025-05-22 08:30:00',
    1,
    1,
    0,
    NULL,
    'approved'
  ),
  (
    2,
    'تحویل سریع بود ولی بسته‌بندی می‌تونست بهتر باشه.',
    '2025-05-22 13:00:00',
    2,
    8,
    0,
    NULL,
    'approved'
  ),
  (
    3,
    'قیمتش با توجه به کیفیت مناسب بود.',
    '2025-05-23 09:45:00',
    3,
    10,
    0,
    NULL,
    'pending'
  ),
  (
    4,
    'موافقم، کیفیتش واقعا خوبه',
    '2025-05-23 10:00:00',
    1,
    10,
    1,
    3,
    'approved'
  ),
  (
    5,
    'عالی بود، حتما دوباره خرید می‌کنم.',
    '2025-05-24 11:30:00',
    2,
    60,
    0,
    NULL,
    'approved'
  ),
  (
    6,
    'محصول خوب بود ولی پشتیبانی می‌تونست سریع‌تر جواب بده.',
    '2025-05-24 14:20:00',
    3,
    15,
    0,
    NULL,
    'approved'
  ),
  (
    7,
    ' ممنون از نظرتون، روی پشتیبانی کار می‌کنیم',
    '2025-05-24 14:45:00',
    1,
    15,
    1,
    6,
    'approved'
  ),
  (
    8,
    'کیفیت محصول خیلی خوب بود، توصیه می‌کنم.',
    '2025-05-25 10:15:00',
    1,
    20,
    0,
    NULL,
    'pending'
  ),
  (
    9,
    'ارسال به موقع بود، ممنونم.',
    '2025-05-25 16:45:00',
    2,
    25,
    0,
    NULL,
    'approved'
  ),
  (
    10,
    'محصول مطابق توضیحات بود، راضی‌ام.',
    '2025-05-26 14:00:00',
    3,
    30,
    0,
    NULL,
    'approved'
  ),
  (
    11,
    'خیلی خوبه ولی قیمتش یه کم بالاست.',
    '2025-05-26 09:30:00',
    1,
    35,
    0,
    NULL,
    'approved'
  ),
  (
    12,
    ' ممنون، سعی می‌کنیم قیمت‌ها رو بهینه کنیم',
    '2025-05-26 09:45:00',
    2,
    35,
    1,
    11,
    'approved'
  ),
  (
    13,
    'عالی بود، خیلی کاربردیه.',
    '2025-05-27 11:15:00',
    2,
    40,
    0,
    NULL,
    'pending'
  ),
  (
    14,
    'تحویل سریع و محصول باکیفیت.',
    '2025-05-27 15:00:00',
    3,
    45,
    0,
    NULL,
    'approved'
  ),
  (
    15,
    'خوب بود ولی انتظارم بیشتر بود.',
    '2025-05-28 10:45:00',
    1,
    50,
    0,
    NULL,
    'approved'
  ),
  (
    16,
    'ممنون از فیدبکتون، نظرتون رو بررسی می‌کنیم',
    '2025-05-28 11:00:00',
    2,
    50,
    1,
    15,
    'approved'
  ),
  (
    17,
    'محصول خیلی خوبیه، حتما پیشنهاد می‌کنم.',
    '2025-05-28 12:30:00',
    2,
    55,
    0,
    NULL,
    'approved'
  ),
  (
    18,
    'کیفیت معمولی بود، انتظار بیشتری داشتم.',
    '2025-05-29 15:30:00',
    3,
    60,
    0,
    NULL,
    'pending'
  ),
  (
    19,
    'عالی، خیلی راضی‌ام از خریدم.',
    '2025-05-29 09:00:00',
    1,
    65,
    0,
    NULL,
    'approved'
  ),
  (
    20,
    'خوشحالیم که راضی بودید',
    '2025-05-29 09:15:00',
    2,
    65,
    1,
    19,
    'approved'
  );

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE
  `blogs` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL,
    `slug` VARCHAR(255) COLLATE utf8mb4_persian_ci NOT NULL UNIQUE,
    `category` VARCHAR(120) COLLATE utf8mb4_persian_ci NULL, -- داخل خود رکورد: مثل "بررسی" یا "راهنما"
    `excerpt` TEXT COLLATE utf8mb4_persian_ci NULL,
    `content` LONGTEXT COLLATE utf8mb4_persian_ci NOT NULL,
    `cover_image` VARCHAR(500) COLLATE utf8mb4_persian_ci NULL,
    `authorID` INT UNSIGNED NOT NULL,
    `related_productID` INT UNSIGNED NULL,
    `status` ENUM ('draft', 'published', 'archived') NOT NULL DEFAULT 'draft',
    `views_count` INT UNSIGNED NOT NULL DEFAULT 0,
    `likes_count` INT UNSIGNED NOT NULL DEFAULT 0,
    `seo_title` VARCHAR(255) COLLATE utf8mb4_persian_ci NULL,
    `seo_description` VARCHAR(500) COLLATE utf8mb4_persian_ci NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `published_at` DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    -- FOREIGN KEY (`authorID`) REFERENCES `users`(`id`) ON DELETE CASCADE,  -- اگر جدول users دارید فعال کنید
    -- FOREIGN KEY (`related_productID`) REFERENCES `products`(`id`) ON DELETE SET NULL, -- اگر products دارید فعال کنید
    INDEX `slug_idx` (`slug`),
    INDEX `status_idx` (`status`),
    INDEX `created_at_idx` (`created_at`),
    INDEX `category_idx` (`category`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

INSERT INTO
  `blogs` (
    `title`,
    `slug`,
    `category`,
    `excerpt`,
    `content`,
    `cover_image`,
    `authorID`,
    `related_productID`,
    `status`,
    `views_count`,
    `likes_count`,
    `seo_title`,
    `seo_description`,
    `created_at`,
    `published_at`
  )
VALUES
  (
    'بررسی تخصصی گوشی آیفون 15',
    'iphone-15-review',
    '{"key":"review","label":"بررسی"}',
    'نگاهی کامل به طراحی، سخت‌افزار و عملکرد آیفون 15.',
    'آیفون 15 یکی از مهم‌ترین پرچمداران سال 2025 است که اپل با تغییرات قابل توجهی آن را روانه بازار کرده است.
در بخش طراحی، اپل بار دیگر از ترکیب آلومینیوم و شیشه استفاده کرده اما وزن دستگاه سبک‌تر شده است.
صفحه نمایش سوپر رتینا XDR با نرخ نوسازی 120 هرتز تجربه روانی در اسکرول و بازی‌ها ارائه می‌دهد.
از نظر پردازنده، تراشه A17 Bionic عملکردی بی‌نظیر دارد و اجرای سنگین‌ترین بازی‌ها و اپلیکیشن‌ها را ممکن کرده است.
در بخش دوربین، لنز اصلی 48 مگاپیکسلی بهبود زیادی در عکاسی در نور کم نشان می‌دهد.
باتری آیفون 15 نسبت به نسل قبل بزرگ‌تر شده و در تست‌های ما بیش از یک روز کامل دوام آورد.
اپل همچنان به استفاده از iOS با امکانات نرم‌افزاری ویژه ادامه داده و قابلیت‌های جدیدی مثل Live Voicemail اضافه کرده است.
در بخش امنیت، فیس آی‌دی سریع‌تر شده و پشتیبانی از حسگر زیر نمایشگر هنوز اضافه نشده است.
از نظر صدا، اسپیکرهای استریو قدرت و وضوح بسیار خوبی دارند و برای تماشای فیلم عالی هستند.
در مجموع، آیفون 15 یک دستگاه کامل است که هم برای کاربران حرفه‌ای و هم کاربران عادی ارزش خرید بالایی دارد.',
    'iphone-15.jpg',
    1,
    101,
    'published',
    1200,
    150,
    'بررسی آیفون 15',
    'مقاله بررسی تخصصی آیفون 15 اپل با جزئیات کامل.',
    '2025-06-01 10:00:00',
    '2025-06-01 10:00:00'
  ),
  (
    'راهنمای خرید لپ‌تاپ دانشجویی',
    'student-laptop-guide',
    '{ "key": "guide", "label": "راهنما" }',
    'بهترین لپ‌تاپ‌های اقتصادی برای دانشجویان.',
    'انتخاب یک لپ‌تاپ مناسب برای دانشجویان نیازمند توجه به چند نکته کلیدی است.
اولین مورد پردازنده است؛ بهتر است لپ‌تاپی با حداقل Intel i5 یا AMD Ryzen 5 انتخاب شود.
حافظه رم حداقل 8 گیگابایت و فضای ذخیره‌سازی SSD برای سرعت مناسب ضروری است.
صفحه نمایش 13 تا 15 اینچ با رزولوشن Full HD تجربه بهتری در مطالعه و کار با نرم‌افزارها ارائه می‌دهد.
وزن لپ‌تاپ برای حمل و نقل روزانه بسیار اهمیت دارد، وزن کمتر از 1.8 کیلوگرم توصیه می‌شود.
باتری با دوام حداقل 6 ساعت کار واقعی می‌تواند طول روز دانشجو را پوشش دهد.
کیبورد با نور پس‌زمینه و تاچ‌پد دقیق، تجربه کاربری بهتری ایجاد می‌کند.
پورت‌های متنوع از جمله USB-C و HDMI برای اتصال به دستگاه‌های جانبی اهمیت دارند.
سیستم عامل می‌تواند Windows 11 یا Linux باشد و بسته به نیاز کاربر انتخاب شود.
در نهایت، قیمت باید متناسب با بودجه دانشجو و کیفیت لپ‌تاپ انتخاب شود.',
    'studentlaptop.jpg',
    2,
    NULL,
    'published',
    800,
    90,
    'راهنمای خرید لپ‌تاپ',
    'برترین لپ‌تاپ‌های اقتصادی برای دانشجویان 2025.',
    '2025-06-02 09:15:00',
    '2025-06-02 09:15:00'
  ),
  (
    'مقایسه تلویزیون‌های OLED و QLED',
    'oled-vs-qled',
    '{ "key": "compare", "label": "مقایسه" }',
    'بررسی تفاوت‌ها و مزایای دو فناوری تلویزیون.',
    'تلویزیون‌های OLED و QLED هر دو کیفیت تصویر بالایی ارائه می‌دهند، اما تفاوت‌هایی در عملکرد دارند.
OLED دارای پنل‌های ارگانیک است و می‌تواند رنگ سیاه واقعی را نمایش دهد.
QLED از نور پس‌زمینه LED استفاده می‌کند و روشنایی بالاتری ارائه می‌دهد.
زاویه دید OLED گسترده‌تر است و در محیط‌های تاریک عملکرد بهتری دارد.
QLED برای محیط‌های روشن مناسب‌تر است و رنگ‌ها در نور زیاد بهتر حفظ می‌شوند.
مصرف انرژی OLED کمتر از QLED است و باعث کاهش هزینه برق می‌شود.
دوام طولانی مدت QLED معمولاً بالاتر است و برای استفاده طولانی مناسب‌تر است.
قابلیت‌های هوشمند در هر دو مدل تقریبا مشابه هستند و اپلیکیشن‌های استریم را پشتیبانی می‌کنند.
قیمت OLED معمولا بالاتر است و گزینه‌های اقتصادی محدودتری دارد.
انتخاب بین OLED و QLED بستگی به نیاز کاربر، محیط استفاده و بودجه دارد.',
    'Qled.png',
    3,
    220,
    'published',
    950,
    110,
    'مقایسه OLED و QLED',
    'OLED یا QLED؟ بررسی کامل برای خرید.',
    '2025-06-03 14:20:00',
    '2025-06-03 14:20:00'
  ),
  (
    'بررسی جاروبرقی رباتیک شیائومی',
    'xiaomi-robot-vacuum-review',
    '{"key":"review","label":"بررسی"}',
    'تجربه کار با جاروبرقی هوشمند.',
    'جاروبرقی‌های رباتیک شیائومی در سال‌های اخیر محبوبیت زیادی پیدا کرده‌اند.
این مدل دارای سنسورهای هوشمند است که موانع را تشخیص داده و مسیر خود را بهینه می‌کند.
قدرت مکش مناسب باعث جمع‌آوری گرد و خاک و موهای حیوانات خانگی می‌شود.
باتری دستگاه تا 120 دقیقه کار مداوم دوام دارد و پس از اتمام شارژ به داک بازمی‌گردد.
فیلتر HEPA آن باعث جذب ذرات ریز و کاهش آلرژی می‌شود.
کنترل از طریق اپلیکیشن موبایل امکان برنامه‌ریزی و زمان‌بندی روزانه را فراهم می‌کند.
طراحی کم‌صدا، تجربه آرام‌تری در هنگام کار ایجاد می‌کند.
این دستگاه قابلیت پشتیبانی از دستیار صوتی دارد و می‌توان آن را با Alexa یا Google Assistant کنترل کرد.
نگهداری و تمیز کردن مخزن آب و گرد و خاک ساده است و کاربر به راحتی می‌تواند آن را خالی کند.
در کل، جاروبرقی رباتیک شیائومی ترکیبی از کیفیت، قیمت مناسب و امکانات هوشمند را ارائه می‌دهد.',
    'robatic-vacume.jpg',
    1,
    820,
    'published',
    210,
    25,
    'بررسی جاروبرقی شیائومی',
    'آیا ارزش خرید دارد؟',
    '2025-06-14 16:30:00',
    '2025-06-14 16:30:00'
  ),
  (
    'راهنمای خرید پاوربانک',
    'powerbank-guide',
    '{ "key": "guide", "label": "راهنما" }',
    'کدام پاوربانک مناسب شماست؟',
    'انتخاب یک پاوربانک مناسب نیازمند توجه به ظرفیت، سرعت شارژ و قابلیت حمل است.
ظرفیت معمولاً بر حسب میلی‌آمپر ساعت (mAh) اندازه‌گیری می‌شود و برای گوشی‌های امروزی حداقل 10000 mAh توصیه می‌شود.
پشتیبانی از شارژ سریع باعث کاهش زمان شارژ دستگاه می‌شود.
وزن و ابعاد پاوربانک اهمیت زیادی دارد، خصوصاً برای حمل روزانه.
تعداد خروجی‌ها و پورت‌های USB-C یا USB-A می‌تواند استفاده همزمان از چند دستگاه را ممکن کند.
ایمنی و حفاظت در برابر اتصال کوتاه و افزایش ولتاژ بسیار مهم است.
برندهای معتبر معمولا کیفیت ساخت بالاتری دارند و طول عمر باتری طولانی‌تری ارائه می‌دهند.
برخی پاوربانک‌ها دارای نمایشگر LED برای نمایش میزان شارژ هستند.
برخی مدل‌ها قابلیت شارژ وایرلس دارند و برای گوشی‌های سازگار مناسب است.
در نهایت، قیمت باید با کیفیت و ظرفیت پاوربانک تناسب داشته باشد.',
    'powerbank.jpg',
    1,
    NULL,
    'published',
    300,
    42,
    'راهنمای خرید پاوربانک',
    'انتخاب بهترین پاوربانک بازار.',
    '2025-06-17 10:10:00',
    '2025-06-17 10:10:00'
  ),
  (
    'معرفی بهترین اسپیکرهای بلوتوثی',
    'best-bluetooth-speakers',
    '{ "key": "intro", "label": "معرفی" }',
    'لیست اسپیکرهای برتر 2025.',
    'اسپیکرهای بلوتوثی در سال 2025 به شدت پیشرفت کرده‌اند و کیفیت صدا و امکانات بیشتری ارائه می‌دهند.
برخی مدل‌ها دارای مقاومت در برابر آب و گرد و خاک هستند و مناسب فضای باز می‌باشند.
باتری طولانی مدت بیش از 10 ساعت تجربه گوش دادن بدون وقفه را ممکن می‌کند.
اتصال سریع با بلوتوث 5.0 یا بالاتر باعث پایداری ارتباط و کاهش لگ می‌شود.
برخی اسپیکرها دارای قابلیت اتصال چند دستگاه و پخش همزمان صدا هستند.
کیفیت باس و وضوح صدا در مدل‌های بالارده بسیار مطلوب است.
برخی اسپیکرها دارای میکروفون داخلی برای مکالمه و تماس تلفنی هستند.
امکاناتی مانند اکولایزر داخلی و اپلیکیشن مدیریت صدا تجربه کاربری را بهبود می‌دهد.
طراحی قابل حمل و سبک باعث استفاده راحت در سفر و ورزش می‌شود.
در نهایت، این اسپیکرها ترکیبی از کیفیت، امکانات و قیمت مناسب برای کاربران ارائه می‌دهند.',
    'bestspeakers.jpeg',
    1,
    NULL,
    'published',
    350,
    50,
    'بهترین اسپیکر بلوتوثی',
    'اسپیکرهای پیشنهادی برای خرید.',
    '2025-06-23 09:45:00',
    '2025-06-23 09:45:00'
  ),
  (
    'بررسی ساعت هوشمند هواوی Watch X',
    'huawei-watch-x-review',
    '{"key":"review","label":"بررسی"}',
    'نقد ساعت جدید هواوی Watch X.',
    'هواوی Watch X یکی از جدیدترین ساعت‌های هوشمند بازار است که با امکانات متنوع عرضه شده است.
طراحی مدرن و سبک باعث راحتی استفاده در طول روز می‌شود.
صفحه نمایش AMOLED وضوح بالا و رنگ‌های زنده ارائه می‌دهد.
باتری دستگاه حدود 7 روز دوام می‌آورد و پشتیبانی از شارژ سریع دارد.
امکانات ورزشی شامل قدم‌شمار، سنجش ضربان قلب و ردیابی خواب است.
قابلیت اتصال به گوشی از طریق بلوتوث باعث دریافت اعلان‌ها و تماس‌ها می‌شود.
واچ فیس‌های متنوع و قابل تغییر تجربه شخصی‌سازی را فراهم می‌کنند.
اپلیکیشن مخصوص هواوی امکان بررسی آمار روزانه و هفته‌ای را می‌دهد.
مقاومت در برابر آب تا 50 متر، استفاده در شنا و دوش را ممکن می‌کند.
در کل، Watch X گزینه‌ای مناسب برای علاقه‌مندان به ساعت‌های هوشمند با امکانات کامل است.',
    'watchx.jpg',
    2,
    910,
    'published',
    310,
    48,
    'بررسی هواوی Watch X',
    'مزایا و معایب ساعت هوشمند جدید.',
    '2025-06-15 11:20:00',
    '2025-06-15 11:20:00'
  ),
  (
    'راهنمای خرید دوربین برای مبتدی‌ها',
    'beginner-camera-guide',
    '{ "key": "guide", "label": "راهنما" }',
    'دوربین مناسب افراد تازه‌کار.',
    'انتخاب دوربین برای مبتدی‌ها نیازمند توجه به چند فاکتور اصلی است.
اولین فاکتور نوع دوربین است؛ DSLR یا Mirrorless.
رزولوشن سنسور و کیفیت لنز تاثیر زیادی روی عکس‌های نهایی دارد.
وزن و ابعاد دوربین برای حمل آسان اهمیت دارد.
باتری با دوام و امکان شارژ آسان مزیت بزرگی محسوب می‌شود.
برخی دوربین‌ها دارای حالت خودکار پیشرفته برای تازه‌کاران هستند.
قابلیت فیلم‌برداری Full HD یا 4K برای علاقه‌مندان به ویدیو ضروری است.
پورت‌ها و اتصال به کامپیوتر یا گوشی باید ساده باشد.
قیمت باید با بودجه مبتدیان متناسب باشد و گزینه‌های اقتصادی وجود داشته باشد.
در نهایت، انتخاب دوربین مناسب تجربه یادگیری و عکاسی را لذت‌بخش می‌کند.',
    'camerabuyingguide.jpeg',
    2,
    NULL,
    'published',
    200,
    28,
    'راهنمای دوربین مبتدی',
    'چه دوربینی برای شروع عکاسی مناسب است؟',
    '2025-06-18 13:15:00',
    '2025-06-18 13:15:00'
  ),
  (
    'مقایسه لپ‌تاپ‌های گیمینگ ایسوس و MSI',
    'asus-vs-msi-gaming',
    '{ "key": "compare", "label": "مقایسه" }',
    'کدام برند برای گیمرها بهتر است؟',
    'لپ‌تاپ‌های گیمینگ ایسوس و MSI هر دو از پردازنده‌های قدرتمند و کارت گرافیک‌های پیشرفته استفاده می‌کنند.
در عملکرد بازی‌های سنگین تفاوت جزئی در نرخ فریم مشاهده می‌شود.
کیفیت ساخت MSI کمی محکم‌تر است اما وزن بیشتری دارد.
صفحه نمایش ایسوس با نرخ نوسازی 144 هرتز تجربه روان‌تری ارائه می‌دهد.
سیستم خنک‌کننده MSI برای استفاده طولانی مناسب‌تر است.
عمر باتری در هر دو مدل محدود است و باید به شارژر دسترسی داشت.
کیبورد RGB ایسوس قابل شخصی‌سازی است و تجربه کاربری بهتری دارد.
قیمت هر دو برند مشابه است اما مدل‌های اقتصادی ایسوس بیشتر است.
پشتیبانی و گارانتی MSI در برخی کشورها بهتر عمل می‌کند.
انتخاب بین ایسوس و MSI بستگی به نیاز گیمر و ترجیح شخصی دارد.',
    'reviewgaminglaptops.jpeg',
    2,
    330,
    'published',
    320,
    44,
    'ایسوس یا MSI؟',
    'بررسی کامل لپ‌تاپ‌های گیمینگ.',
    '2025-06-21 14:30:00',
    '2025-06-21 14:30:00'
  ),
  (
    'معرفی بهترین پرینترهای خانگی',
    'best-home-printers',
    '{ "key": "intro", "label": "معرفی" }',
    'پرینترهای مناسب خانه و دفتر.',
    'پرینترهای خانگی برای مصارف روزانه و دفترچه‌های کوچک بسیار کاربردی هستند.
برخی مدل‌ها چاپ سیاه و سفید سریع و اقتصادی دارند.
پرینترهای رنگی برای چاپ عکس و اسناد گرافیکی مناسب هستند.
قابلیت اتصال وای‌فای و شبکه باعث سهولت در استفاده گروهی می‌شود.
هزینه کارتریج و تونر باید قبل از خرید بررسی شود.
برخی پرینترها دارای قابلیت چاپ دو رو و اسکنر داخلی هستند.
اندازه و وزن پرینتر برای قرارگیری در فضای خانه اهمیت دارد.
سرعت چاپ بسته به مدل متفاوت است و برای اسناد حجیم اهمیت دارد.
برندهای معتبر معمولاً دوام و کیفیت ساخت بالاتری ارائه می‌دهند.
در نهایت، انتخاب پرینتر مناسب ترکیبی از کیفیت، امکانات و قیمت مناسب است.',
    'bestprintershome.jpeg',
    2,
    NULL,
    'published',
    310,
    41,
    'پرینترهای خانگی 2025',
    'پرینترهای کاربردی و خوش‌قیمت.',
    '2025-06-27 10:10:00',
    '2025-06-27 10:10:00'
  ),
  (
    'بررسی هدفون بی‌سیم سونی WH-1000XM5',
    'sony-wh-1000xm5-review',
    '{"key":"review","label":"بررسی"}',
    'هدفون بی‌سیم سونی WH-1000XM5 و قابلیت‌های آن.',
    'هدفون بی‌سیم سونی WH-1000XM5 یکی از پیشرفته‌ترین مدل‌های بازار است.
کیفیت صدای بسیار بالا و بیس عمیق تجربه موسیقی را بهبود می‌بخشد.
حذف نویز فعال (ANC) در محیط‌های شلوغ بسیار موثر عمل می‌کند.
باتری دستگاه حدود 30 ساعت کار مداوم ارائه می‌دهد.
امکان شارژ سریع باعث استفاده سریع پس از اتمام باتری می‌شود.
اتصال بلوتوث پایدار و پشتیبانی از کدک‌های LDAC و AAC کیفیت صدا را حفظ می‌کند.
طراحی راحت و سبک باعث استفاده طولانی بدون خستگی می‌شود.
دکمه‌ها و کنترل لمسی امکان مدیریت موسیقی و تماس را ساده می‌کند.
اپلیکیشن سونی برای تنظیمات صدا و ANC بسیار مفید است.
در مجموع، WH-1000XM5 گزینه‌ای ایده‌آل برای علاقه‌مندان به موسیقی و سفر است.',
    'sonywirelessheadphone.jpeg',
    1,
    101,
    'published',
    420,
    65,
    'بررسی هدفون سونی WH-1000XM5',
    'هدفون بی‌سیم با ANC و کیفیت عالی.',
    '2025-06-30 10:00:00',
    '2025-06-30 10:00:00'
  ),
  (
    'راهنمای خرید گوشی اقتصادی 2025',
    'budget-smartphone-guide',
    '{ "key": "guide", "label": "راهنما" }',
    'چگونه بهترین گوشی اقتصادی را انتخاب کنیم.',
    'انتخاب گوشی اقتصادی نیازمند توجه به بودجه و نیازهای روزمره است.
پردازنده مناسب، رم کافی و حافظه داخلی از نکات کلیدی هستند.
صفحه نمایش با رزولوشن مناسب و اندازه بین 6 تا 6.5 اینچ تجربه خوبی ارائه می‌دهد.
باتری با ظرفیت حداقل 4000 میلی‌آمپر ساعت برای یک روز کامل مناسب است.
دوربین اصلی و سلفی با کیفیت مناسب برای عکس‌های روزمره کافی است.
سیستم عامل و بروزرسانی‌های امنیتی اهمیت زیادی دارند.
امکان اتصال به شبکه‌های 4G و 5G بسته به منطقه اهمیت دارد.
طراحی مقاوم و ضدخش گزینه بهتری برای استفاده روزمره است.
قیمت با کیفیت و برند گوشی باید متناسب باشد.
در نهایت، انتخاب گوشی اقتصادی باید ترکیبی از کیفیت، امکانات و قیمت مناسب باشد.',
    '2025bestphones.jpeg',
    2,
    NULL,
    'published',
    350,
    48,
    'راهنمای خرید گوشی اقتصادی',
    'بهترین گوشی‌ها با قیمت مناسب.',
    '2025-07-01 09:30:00',
    '2025-07-01 09:30:00'
  ),
  (
    'مقایسه تبلت‌های اپل و سامسونگ',
    'ipad-vs-samsung-tablet',
    '{ "key": "compare", "label": "مقایسه" }',
    'تفاوت‌ها و مزایای آیپد و تبلت‌های سامسونگ.',
    'تبلت‌های اپل و سامسونگ هر دو تجربه کاربری بالایی ارائه می‌دهند.
آیپد دارای iPadOS با اپلیکیشن‌های اختصاصی و بهینه است.
سامسونگ از اندروید و قابلیت‌های چندوظیفگی استفاده می‌کند.
صفحه نمایش آیپد روشنایی و وضوح بیشتری دارد.
سامسونگ قابلیت اتصال به صفحه کلید و قلم S-Pen را دارد.
باتری هر دو مدل برای یک روز کاری کافی است.
وزن و طراحی هر دو مدل برای حمل آسان مناسب هستند.
قابلیت‌های نرم‌افزاری اپل بیشتر برای طراحی و نقاشی مناسب است.
قابلیت‌های سامسونگ برای کار با فایل‌ها و مالتی‌تسکینگ قوی‌تر است.
انتخاب بین آیپد و سامسونگ به نیازهای کاربر و بودجه او بستگی دارد.',
    'appleXsumsung.jpeg',
    1,
    120,
    'published',
    400,
    55,
    'آیپد یا سامسونگ؟',
    'مقایسه کامل تبلت‌های اپل و سامسونگ.',
    '2025-07-02 11:15:00',
    '2025-07-02 11:15:00'
  ),
  (
    'معرفی بهترین لپ‌تاپ‌های سبک 2025',
    'best-lightweight-laptops',
    '{ "key": "intro", "label": "معرفی" }',
    'لیست بهترین لپ‌تاپ‌های سبک و قابل حمل 2025.',
    'لپ‌تاپ‌های سبک برای کاربرانی که دائم در حال حرکت هستند مناسب‌اند.
وزن کمتر از 1.5 کیلوگرم تجربه حمل راحت را فراهم می‌کند.
باتری با دوام بالا برای استفاده روزانه ضروری است.
پردازنده‌های جدید انرژی کم و عملکرد بالا ارائه می‌دهند.
حافظه SSD باعث سرعت بالا در بوت و اجرای برنامه‌ها می‌شود.
صفحه نمایش Full HD یا بالاتر برای مشاهده محتوا با کیفیت لازم است.
کیبورد و تاچ‌پد راحت برای تایپ طولانی بسیار مهم هستند.
طراحی مقاوم و بدنه فلزی حس کیفیت و دوام را منتقل می‌کند.
برندهای معتبر لپ‌تاپ‌های سبک با امکانات کامل ارائه می‌دهند.
در نهایت، این لپ‌تاپ‌ها ترکیبی از سبکی، کیفیت و کارایی هستند.',
    '2025-best-laptops.jpeg',
    2,
    NULL,
    'published',
    380,
    50,
    'بهترین لپ‌تاپ‌های سبک 2025',
    'لپ‌تاپ‌های سبک و با کیفیت بازار.',
    '2025-07-03 13:40:00',
    '2025-07-03 13:40:00'
  ),
  (
    'بررسی لپ‌تاپ مک‌بوک پرو 2025',
    'macbook-pro-2025-review',
    '{"key":"review","label":"بررسی"}',
    'نگاهی به مک‌بوک پرو جدید اپل.',
    'مک‌بوک پرو 2025 با طراحی جدید و سخت‌افزار قوی وارد بازار شده است.
پردازنده M2 Pro قدرت اجرای تمامی برنامه‌های سنگین را دارد.
صفحه نمایش Retina با رنگ‌های واقعی و روشنایی بالا تجربه بصری فوق‌العاده‌ای ارائه می‌دهد.
باتری با دوام بیش از 10 ساعت کار مداوم را تضمین می‌کند.
کیبورد بهبود یافته و تاچ‌بار تجربه تایپ و کاربری راحتی ایجاد می‌کند.
سیستم عامل macOS جدید امکانات حرفه‌ای برای طراحان و برنامه‌نویسان ارائه می‌دهد.
پورت‌های Thunderbolt و HDMI برای اتصال به دستگاه‌های جانبی کافی هستند.
صدای اسپیکرها واضح و با باس مناسب برای فیلم و موسیقی عالی است.
گرمایش دستگاه در استفاده طولانی به خوبی کنترل می‌شود.
در نهایت، مک‌بوک پرو 2025 انتخابی مناسب برای حرفه‌ای‌ها و کاربران پیشرفته است.',
    'macbookpro2025.jpg',
    2,
    112,
    'published',
    380,
    55,
    'بررسی مک‌بوک پرو 2025',
    'بررسی مک‌بوک پرو اپل مدل 2025.',
    '2025-06-12 10:00:00',
    '2025-06-12 10:00:00'
  ),
  (
    'راهنمای خرید کولرگازی',
    'ac-buying-guide',
    '{ "key": "guide", "label": "راهنما" }',
    'چه کولری بخریم؟',
    'انتخاب کولرگازی مناسب نیازمند بررسی چند عامل کلیدی است.
ظرفیت کولر باید متناسب با متراژ فضای مورد استفاده باشد.
نوع کمپرسور و کارایی انرژی مصرفی برای کاهش هزینه‌ها اهمیت دارد.
کولرهای اسپلیت و ایستاده هر کدام مزایا و معایب خود را دارند.
برندهای معتبر معمولا خدمات پس از فروش و دوام بالاتری دارند.
صدای کولر در هنگام کار باید کم باشد تا آرامش محیط حفظ شود.
امکاناتی مانند تایمر، کنترل از راه دور و حالت اقتصادی تجربه بهتری ارائه می‌دهند.
نگهداری و تمیز کردن فیلترها باید آسان باشد.
برخی کولرها دارای قابلیت تنظیم خودکار دما هستند.
در نهایت، انتخاب کولرگازی مناسب ترکیبی از کیفیت، امکانات و قیمت مناسب است.',
    'airconditionerbuyingguide.jpeg',
    3,
    333,
    'published',
    410,
    52,
    'راهنمای خرید کولر گازی',
    'انتخاب بهترین کولر مناسب خانه.',
    '2025-06-19 15:00:00',
    '2025-06-19 15:00:00'
  ),
  (
    'مقایسه یخچال ساید بای ساید ال‌جی و سامسونگ',
    'lg-vs-samsung-fridge',
    '{ "key": "compare", "label": "مقایسه" }',
    'کدام یخچال ارزش خرید بیشتری دارد؟',
    'یخچال‌های ساید بای ساید ال‌جی و سامسونگ هر دو امکانات پیشرفته‌ای ارائه می‌دهند.
ظرفیت داخلی برای خانواده‌های متوسط تا بزرگ کافی است.
سیستم سرمایش و کنترل دما در هر دو برند قابل قبول است.
قابلیت اتصال به آبسردکن و یخساز خودکار در هر دو مدل موجود است.
مصرف انرژی هر دو مدل نسبت به ظرفیت مناسب و اقتصادی است.
فضای داخلی و قفسه‌ها قابل تنظیم هستند تا وسایل مختلف جای بگیرند.
کیفیت ساخت و دوام ال‌جی کمی بهتر ارزیابی شده است.
سامسونگ امکانات هوشمند بیشتری دارد و قابلیت اتصال به گوشی ارائه می‌دهد.
صدای کارکرد دستگاه در هر دو مدل کم و مناسب محیط خانگی است.
در نهایت، انتخاب بین ال‌جی و سامسونگ بسته به ترجیح کاربر و امکانات مورد نیاز است.',
    'lgsamsungref.jpeg',
    3,
    440,
    'published',
    270,
    39,
    'مقایسه یخچال سامسونگ و ال‌جی',
    'بررسی دو برند محبوب لوازم خانگی.',
    '2025-06-22 12:00:00',
    '2025-06-22 12:00:00'
  ),
  (
    'معرفی دوربین‌های ورزشی ضد آب',
    'action-cameras-2025',
    '{ "key": "intro", "label": "معرفی" }',
    'دوربین‌های مناسب ماجراجویی.',
    'دوربین‌های ورزشی ضد آب برای فعالیت‌های خارج از منزل و ورزش‌های آبی بسیار کاربردی هستند.
کیفیت تصویر 4K و تصاویر آهسته امکان ثبت صحنه‌های حرفه‌ای را فراهم می‌کند.
باتری با دوام مناسب برای سفرهای طولانی است.
سایز کوچک و سبک باعث حمل آسان می‌شود.
میکروفون داخلی و اتصال به موبایل برای اشتراک‌گذاری فوری عکس و ویدئو مناسب است.
قابلیت تثبیت تصویر (Stabilization) تصاویر صاف و بدون لرزش ارائه می‌دهد.
مقاومت در برابر ضربه و آب ویژگی مهم برای استفاده در محیط‌های سخت است.
لوازم جانبی مانند گیره‌ها و پایه‌ها تجربه استفاده را راحت‌تر می‌کند.
اپلیکیشن مخصوص امکان تنظیمات و ویرایش تصاویر را فراهم می‌کند.
در مجموع، دوربین‌های ورزشی ضد آب ترکیبی از کیفیت، مقاومت و قابلیت حمل ارائه می‌دهند.',
    'sportcamera.jpeg',
    3,
    NULL,
    'published',
    260,
    36,
    'دوربین ورزشی 2025',
    'اکشن‌کم‌های ضد آب و مقاوم.',
    '2025-06-28 12:00:00',
    '2025-06-28 12:00:00'
  );

-- حذف جدول اگر وجود داشته باشد
DROP TABLE IF EXISTS `offs`;

-- ایجاد جدول با ستون endDate
CREATE TABLE `offs` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(20) COLLATE utf8mb4_persian_ci NOT NULL,
  `percent` TINYINT UNSIGNED NOT NULL,
  `adminID` INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `isActive` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  FOREIGN KEY (`adminID`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  INDEX `date_idx` (`date`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_persian_ci;

-- داده نمونه با 60 رکورد و endDate تا 2025
INSERT INTO `offs` (`id`, `code`, `percent`, `adminID`, `date`, `endDate`, `isActive`)
VALUES
(1, 'KX7N4P8', 20, 1, '2023-06-05', '2023-06-20', 1),
(2, 'Z9T3M2R', 50, 2, '2023-06-21', '2023-07-06', 0),
(3, 'Q5W8L6J', 10, 3, '2023-08-10', '2023-08-25', 1),
(4, 'H2Y9F4K', 15, 4, '2023-08-30', '2023-09-14', 1),
(5, 'B6P1N8T', 25, 5, '2023-09-25', '2023-10-10', 0),
(6, 'M3R7V2Q', 30, 1, '2023-11-05', '2023-11-20', 1),
(7, 'T9K4W8L', 5, 2, '2023-11-21', '2023-12-06', 0),
(8, 'F2J6Y9P', 20, 3, '2024-01-10', '2024-01-25', 1),
(9, 'N7T3M1R', 15, 4, '2024-01-30', '2024-02-14', 1),
(10, 'W8L5Q2K', 40, 5, '2024-02-24', '2024-03-10', 0),
(11, 'P4N9T7J', 10, 1, '2024-04-04', '2024-04-19', 1),
(12, 'Y6K2M3F', 25, 2, '2024-04-20', '2024-05-05', 1),
(13, 'L9R7W5T', 30, 3, '2024-06-09', '2024-06-24', 0),
(14, 'J3P8N1Q', 30, 4, '2024-06-29', '2024-07-14', 1),
(15, 'T2Y6K4M', 20, 5, '2024-07-24', '2024-08-08', 0),
(16, 'R7F3L9W', 15, 1, '2023-06-15', '2023-06-30', 1),
(17, 'K8T2P6N', 35, 2, '2023-07-05', '2023-07-20', 0),
(18, 'M4J9Y3Q', 10, 3, '2023-07-21', '2023-08-05', 1),
(19, 'W6L2T8K', 25, 4, '2023-09-09', '2023-09-24', 1),
(20, 'P9N7F4R', 15, 5, '2023-09-29', '2023-10-14', 0),
(21, 'Y3T6M2J', 40, 1, '2023-10-25', '2023-11-09', 1),
(22, 'F8K4W9L', 20, 2, '2023-12-05', '2023-12-20', 0),
(23, 'N2P7T3Q', 30, 3, '2023-12-21', '2024-01-05', 1),
(24, 'T6Y9J1M', 10, 4, '2024-02-09', '2024-02-24', 1),
(25, 'L3K8F2W', 25, 5, '2024-02-28', '2024-03-14', 0),
(26, 'J9P4N6T', 20, 1, '2024-03-25', '2024-04-09', 1),
(27, 'M2T7Y3K', 15, 2, '2024-05-04', '2024-05-19', 0),
(28, 'W8L3F9Q', 30, 3, '2024-05-20', '2024-06-04', 1),
(29, 'P4N6T2J', 10, 4, '2024-07-09', '2024-07-24', 1),
(30, 'Y7K3M8F', 25, 5, '2024-07-29', '2024-08-13', 0),
(31, 'R2T9L4W', 20, 1, '2024-08-19', '2024-09-03', 1),
(32, 'K6F3P8N', 15, 2, '2024-08-20', '2024-09-04', 0),
(33, 'T9J2Y6M', 10, 3, '2024-08-21', '2024-09-05', 1),
(34, 'L3W8K4T', 25, 1, '2024-08-22', '2024-09-06', 1),
(35, 'F6N2P9J', 30, 2, '2024-08-23', '2024-09-07', 0),
(36, 'Y4T7M3L', 15, 3, '2024-08-24', '2024-09-08', 1),
(37, 'W9K2F8P', 20, 1, '2024-08-25', '2024-09-09', 1),
(38, 'N3T6Y4J', 10, 2, '2024-08-26', '2024-09-11', 0),
(39, 'P8L2M9F', 25, 3, '2024-08-27', '2024-09-12', 1),
(40, 'J6T3W8K', 15, 1, '2024-08-28', '2024-09-13', 1),
(41, 'M9F4N2Y', 20, 2, '2024-08-29', '2024-09-14', 0),
(42, 'T3P8L6J', 10, 3, '2024-08-30', '2024-09-15', 1),
(43, 'K2Y9T4M', 25, 1, '2024-08-31', '2024-09-16', 1),
(44, 'F6N3W8P', 15, 2, '2024-09-01', '2024-09-16', 0),
(45, 'L9T2J4Y', 10, 3, '2024-09-02', '2024-09-17', 1),
(46, 'W3K8M6N', 20, 1, '2024-09-03', '2024-09-18', 1),
(47, 'P9F4T2L', 15, 2, '2024-09-04', '2024-09-19', 0),
(48, 'J6Y3N8K', 25, 3, '2024-09-05', '2024-09-20', 1),
(49, 'T2M9F4W', 10, 1, '2024-09-06', '2024-09-21', 1),
(50, 'N3L8P6Y', 15, 2, '2024-09-07', '2024-09-22', 0),
(51, 'K9T4J2M', 20, 3, '2024-09-08', '2024-09-23', 1),
(52, 'F6Y3N8P', 25, 1, '2024-09-09', '2024-09-24', 1),
(53, 'W2L9T4K', 10, 2, '2024-09-10', '2024-09-25', 0),
(54, 'P8M3F6J', 15, 3, '2024-09-11', '2024-09-26', 1),
(55, 'Y4N9K2T', 20, 1, '2024-09-12', '2024-09-27', 1),
(56, 'T3P8L6M', 25, 2, '2024-09-13', '2024-09-28', 0),
(57, 'J9F4Y2N', 10, 3, '2024-09-14', '2024-09-29', 1),
(58, 'K6T3M8P', 15, 1, '2024-09-15', '2024-09-30', 1),
(59, 'N2L9F4Y', 20, 2, '2024-09-16', '2024-10-01', 0),
(60, 'W8P3T6J', 25, 3, '2024-09-17', '2024-10-02', 1);


DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userID` INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `hour` TIME NOT NULL,
  `isActive` BOOLEAN NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  INDEX `date_idx` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

INSERT INTO `orders` (`userID`, `date`, `hour`, `isActive`) VALUES
(1, '2025-05-22', '08:15:00', 1),
(2, '2025-05-22', '12:45:00', 1),
(3, '2025-05-23', '09:30:00', 0),
(1, '2025-05-23', '15:00:00', 1),
(2, '2025-05-24', '11:20:00', 1),
(3, '2025-05-24', '14:10:00', 1),
(1, '2025-05-25', '10:00:00', 0),
(2, '2025-05-25', '16:30:00', 1),
(3, '2025-05-26', '13:45:00', 1),
(1, '2025-05-26', '09:15:00', 1);



-- Table structure for table `order_items`
DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderID` INT UNSIGNED NOT NULL,
  `productID` INT UNSIGNED NOT NULL,
  `quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  `price` DECIMAL(15,2) NOT NULL,
  `color` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`productID`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

INSERT INTO `order_items` (`orderID`, `productID`, `quantity`, `price`, `color`) VALUES
-- سفارش 1: دو محصول
(1, 1, 2, 30000000, 'red'),
(1, 2, 1, 15000000, 'blue'),

-- سفارش 2: یک محصول
(2, 8, 1, 15000000, 'blue'),

-- سفارش 3: سه محصول
(3, 10, 5, 250000, 'green'),
(3, 11, 2, 500000, 'yellow'),
(3, 12, 1, 1000000, 'purple'),

-- سفارش 4: دو محصول
(4, 58, 3, 20000000, 'yellow'),
(4, 59, 1, 800000, 'black'),

-- سفارش 5: یک محصول
(5, 60, 4, 600000, 'purple'),

-- سفارش 6: دو محصول
(6, 15, 2, 5000000, 'orange'),
(6, 16, 1, 1200000, 'white'),

-- سفارش 7: یک محصول
(7, 20, 6, 800000, 'black'),

-- سفارش 8: سه محصول
(8, 25, 1, 1200000, 'white'),
(8, 26, 2, 700000, 'pink'),
(8, 27, 1, 950000, 'cyan'),

-- سفارش 9: دو محصول
(9, 30, 1, 25000000, 'pink'),
(9, 31, 1, 1800000, 'magenta'),

-- سفارش 10: یک محصول
(10, 35, 8, 350000, 'cyan');


-- Creating table structure for `addresses`
DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `province` VARCHAR(100) COLLATE utf8_persian_ci NOT NULL,
  `address` VARCHAR(255) COLLATE utf8_persian_ci NOT NULL,
  `city` VARCHAR(100) COLLATE utf8_persian_ci,
  `postal_code` BIGINT(20),
  `address_type` ENUM('HOME','WORK','OTHER') DEFAULT 'HOME',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT fk_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- درج داده
INSERT INTO `addresses`
  (`user_id`, `province`, `address`, `city`, `postal_code`, `address_type`)
VALUES
  (1, 'تهران', 'تهران - خیابان ولیعصر - کوچه اول', 'تهران', 1234567890, 'HOME'),
  (1, 'تهران', 'تهران - خیابان انقلاب - کوچه دوم', 'تهران', 1234567891, 'WORK'),
  (2, 'آذربایجان شرقی', 'تبریز - خیابان آزادی - کوچه سوم', 'تبریز', 2345678901, 'HOME'),
  (2, 'آذربایجان شرقی', 'تبریز - خیابان ولیعصر - کوچه چهارم', 'تبریز', 2345678902, 'OTHER'),
  (3, 'فارس', 'شیراز - خیابان زند - کوچه پنجم', 'شیراز', 3456789012, 'HOME'),
  (4, 'اصفهان', 'اصفهان - خیابان نمونه - کوچه ششم', 'اصفهان', 4567890123, 'HOME'),
  (4, 'اصفهان', 'اصفهان - خیابان اصلی - کوچه هفتم', 'اصفهان', 4567890124, 'WORK'),
  (5, 'آذربایجان شرقی', 'تبریز - خیابان احمدآباد - کوچه هشتم', 'تبریز', 5678901234, 'HOME'),
  (6, 'البرز', 'کرج - خیابان آزادی - کوچه نهم', 'کرج', 6789012345, 'HOME'),
  (7, 'خوزستان', 'اهواز - خیابان کیانپارس - کوچه دهم', 'اهواز', 7890123456, 'HOME'),
  (7, 'خوزستان', 'اهواز - خیابان نادری - کوچه یازدهم', 'اهواز', 7890123457, 'OTHER'),
  (8, 'قم', 'قم - خیابان انقلاب - کوچه دوازدهم', 'قم', 8901234567, 'HOME'),
  (9, 'گیلان', 'رشت - خیابان گلسار - کوچه سیزدهم', 'رشت', 9012345678, 'HOME'),
  (10,'یزد', 'یزد - خیابان کاشانی - کوچه چهاردهم', 'یزد', 123456789, 'HOME');


-- Table structure for table `bank cards`
DROP TABLE IF EXISTS `card_details`;

CREATE TABLE
  `card_details` (
    `id` INT (100) NOT NULL AUTO_INCREMENT,
    `user_id` INT (100) NOT NULL,
    `card_number` VARCHAR(255) COLLATE utf8_persian_ci NOT NULL,
    `cardholder_name` VARCHAR(100) COLLATE utf8_persian_ci,
    `expiry_date` VARCHAR(10) COLLATE utf8_persian_ci,
    `card_type` ENUM ('VISA', 'MASTERCARD', 'OTHER') DEFAULT 'OTHER',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_persian_ci;

--Dumping data for table`card_details`
INSERT INTO
  `card_details` (
    `user_id`,
    `card_number`,
    `cardholder_name`,
    `expiry_date`,
    `card_type`
  )
VALUES
  (
    1,
    'ENC_1234-5678-9012-3456',
    'علیرضا احمدی',
    '12/2026',
    'VISA'
  ),
  (
    1,
    'ENC_2345-6789-0123-4567',
    'علیرضا احمدی',
    '06/2027',
    'MASTERCARD'
  ),
  (
    2,
    'ENC_3456-7890-1234-5678',
    'حسین محمدی',
    '03/2026',
    'VISA'
  ),
  (
    3,
    'ENC_4567-8901-2345-6789',
    'علی حسینی',
    '09/2025',
    'MASTERCARD'
  ),
  (
    4,
    'ENC_5678-9012-3456-7890',
    'محمد رضایی',
    '11/2026',
    'VISA'
  ),
  (
    4,
    'ENC_6789-0123-4567-8901',
    'محمد رضایی',
    '05/2027',
    'MASTERCARD'
  ),
  (
    5,
    'ENC_7890-1234-5678-9012',
    'نیما کریمی',
    '08/2026',
    'VISA'
  ),
  (
    6,
    'ENC_8901-2345-6789-0123',
    'زهرا علوی',
    '02/2027',
    'MASTERCARD'
  ),
  (
    7,
    'ENC_9012-3456-7890-1234',
    'امیر نوری',
    '10/2026',
    'VISA'
  ),
  (
    7,
    'ENC_0123-4567-8901-2345',
    'امیر نوری',
    '04/2027',
    'MASTERCARD'
  ),
  (
    8,
    'ENC_1234-5678-9012-3457',
    'فاطمه رحیمی',
    '07/2025',
    'VISA'
  ),
  (
    9,
    'ENC_2345-6789-0123-4568',
    'رضا شریفی',
    '01/2026',
    'MASTERCARD'
  ),
  (
    10,
    'ENC_3456-7890-1234-5679',
    'مریم جعفری',
    '06/2027',
    'VISA'
  ),
  (
    11,
    'ENC_4567-8901-2345-6780',
    'پویا اکبری',
    '12/2026',
    'MASTERCARD'
  ),
  (
    11,
    'ENC_5678-9012-3456-7891',
    'پویا اکبری',
    '03/2027',
    'VISA'
  ),
  (
    12,
    'ENC_6789-0123-4567-8902',
    'سارا قاسمی',
    '09/2025',
    'MASTERCARD'
  ),
  (
    13,
    'ENC_7890-1234-5678-9013',
    'مهدی یزدانی',
    '11/2026',
    'VISA'
  ),
  (
    14,
    'ENC_8901-2345-6789-0124',
    'نرگس محمدزاده',
    '05/2027',
    'MASTERCARD'
  ),
  (
    15,
    'ENC_9012-3456-7890-1235',
    'کیانوش فرهادی',
    '08/2026',
    'VISA'
  ),
  (
    16,
    'ENC_0123-4567-8901-2346',
    'شیما کاظمی',
    '02/2027',
    'MASTERCARD'
  ),
  (
    17,
    'ENC_1234-5678-9012-3458',
    'بهرام سلطانی',
    '10/2026',
    'VISA'
  ),
  (
    18,
    'ENC_2345-6789-0123-4569',
    'الناز حیدری',
    '04/2027',
    'MASTERCARD'
  ),
  (
    19,
    'ENC_3456-7890-1234-5670',
    'کامران زارع',
    '07/2026',
    'VISA'
  ),
  (
    20,
    'ENC_4567-8901-2345-6781',
    'لاله صادقی',
    '01/2027',
    'MASTERCARD'
  ),
  (
    21,
    'ENC_5678-9012-3456-7892',
    'یاسر ملکی',
    '06/2026',
    'VISA'
  ),
  (
    22,
    'ENC_6789-0123-4567-8903',
    'سمیرا رستمی',
    '12/2026',
    'MASTERCARD'
  ),
  (
    23,
    'ENC_7890-1234-5678-9014',
    'بهزاد نعمتی',
    '03/2027',
    'VISA'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `cart_details`
--
ALTER TABLE `card_details` ADD PRIMARY KEY (`id`),
ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments` ADD PRIMARY KEY (`id`),
ADD KEY `productID` (`productID`),
ADD KEY `userID` (`userID`);

--
-- Indexes for table `offs`
--
ALTER TABLE `offs` ADD PRIMARY KEY (`id`),
ADD KEY `adminID` (`adminID`),
ADD KEY `productID` (`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders` ADD PRIMARY KEY (`id`),
ADD KEY `productID` (`productID`),
ADD KEY `userID` (`userID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products` ADD PRIMARY KEY (`id`),
ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses` ADD PRIMARY KEY (`id`),
ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `card_details`
--
ALTER TABLE `card_details` ADD PRIMARY KEY (`id`),
ADD KEY `user_id` (`user_id`);

-- افزودن ایندکس روی user_id
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `card_details` MODIFY `id` INT (100) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 28;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins` MODIFY `id` INT NOT NULL AUTO_INCREMENT = 6,
ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories` MODIFY `id` int (100) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 70;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments` MODIFY `reply_id` INT UNSIGNED NULL DEFAULT NULL;

AUTO_INCREMENT = 61;

UPDATE `comments`
SET
  `reply_id` = NULL
WHERE
  `reply_id` = 0;

--
-- AUTO_INCREMENT for table `offs`
--
ALTER TABLE `offs` MODIFY `id` int (100) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 61;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders` MODIFY `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 31;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products` MODIFY `id` int (100) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 92;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users` MODIFY `id` int (100) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 24;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses` MODIFY `id` INT (100) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 29;

--
-- AUTO_INCREMENT for table `card_details`
--
ALTER TABLE `card_details` MODIFY `id` INT (100) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 28;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `cart_details`
--
ALTER TABLE `card_details` ADD CONSTRAINT `card_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses` ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `card_details`
--
ALTER TABLE `card_details` ADD CONSTRAINT `card_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments` ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `offs`
--
ALTER TABLE `offs` ADD CONSTRAINT `offs_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admins` (`id`),
ADD CONSTRAINT `offs_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders` ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products` ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;