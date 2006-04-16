--
-- $Id$
-- 
-- Database Schema for `medickart`, mysql version
-- 

SET AUTOCOMMIT=0;
START TRANSACTION;

DROP DATABASE IF EXISTS `medickart`;
CREATE DATABASE `medickart`;
USE `medickart`;

-- --------------------------------------------------------

-- 
-- Table structure for table `authors`
-- 

CREATE TABLE `authors` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(100) NOT NULL default '',
  `last_name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `bestsellers`
-- 

CREATE TABLE `bestsellers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `categories`
-- 

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `parent_id` (`parent_id`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `order_details`
-- 

CREATE TABLE `order_details` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL default '0',
  `product_title` varchar(200) NOT NULL default '',
  `product_price` float NOT NULL default '0',
  `ordered_quantity` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `orders`
-- 

CREATE TABLE `orders` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `first_name` varchar(100) NOT NULL default '',
  `last_name` varchar(100) NOT NULL default '',
  `company` varchar(100) NOT NULL default '',
  `unique_reg_no` varchar(20) NOT NULL default '',
  `address1` varchar(200) NOT NULL default '',
  `address2` varchar(200) NOT NULL default '',
  `phone` varchar(20) NOT NULL default '',
  `fax` varchar(20) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `www` varchar(60) NOT NULL default '',
  `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `products`
-- 

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `category_id` int(10) unsigned NOT NULL default '0',
  `publisher_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(200) NOT NULL default '',
  `technical_details` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL default '0',
  `isbn` varchar(20) NOT NULL default '',
  `available_qty` mediumint(9) NOT NULL default '0',
  `image1` varchar(30) NOT NULL default '',
  `image2` varchar(30) NOT NULL default '',
  `image3` varchar(30) NOT NULL default '',
  `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `products_authors`
-- 

CREATE TABLE `products_authors` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `author_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- {{{ Table structure for table `publishers`

CREATE TABLE `publishers` (
  `id`          INT     ( 10 )  unsigned NOT NULL auto_increment,
  `title`       VARCHAR ( 255 )          NOT NULL,
  `description` TEXT                     NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- }}} --------------------------------------------------------

-- 
-- {{{ Table structure for table `users`

CREATE TABLE `users` (
  `id`          INT     ( 10 )  unsigned NOT NULL auto_increment,
  `username`    VARCHAR ( 255 )          NOT NULL,
  `password`    VARCHAR ( 32 )           NOT NULL,
  `email`       VARCHAR ( 255 )          NOT NULL,
  `last_login`  TIMESTAMP                NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- }}} --------------------------------------------------------

COMMIT;

