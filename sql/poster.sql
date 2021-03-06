-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 09 月 25 日 08:35
-- 服务器版本: 5.5.27
-- PHP 版本: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `poster`
--

-- --------------------------------------------------------

--
-- 表的结构 `poster`
--

CREATE TABLE IF NOT EXISTS `poster` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dealtime` datetime NOT NULL COMMENT '发布时间',
  `detail` longtext COMMENT '描述',
  `issubmit` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否发布',
  `photo` varchar(255) NOT NULL COMMENT '照片地址',
  `submitter` varchar(20) NOT NULL COMMENT '发布者ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `poster`
--

INSERT INTO `poster` (`id`, `dealtime`, `detail`, `issubmit`, `photo`, `submitter`, `title`) VALUES
(6, '2013-08-16 21:00:36', '啊啊啊啊 啊', '1', '/public/poster/720130816210036.jpg', 'admin', '啊啊'),
(7, '2013-08-16 21:46:55', 'qqqqqqqqqqqqqqqqq', '1', '/public/poster/0b2635fae6cd7b89cc84bcb20e2442a7d9330e3c20130816214655.jpg', 'vb', 'xcccxcxcxcxcxc'),
(8, '2013-08-16 21:49:49', 'aa', '1', '/public/poster/220130816214949.jpg', 'admin', 'aa'),
(9, '2013-08-16 21:49:55', 'xc', '1', '/public/poster/420130816214955.jpg', 'admin', 'xcccxcxcxcxcxc'),
(10, '2013-08-16 21:50:00', 'vb', '1', '/public/poster/320130816215000.jpg', 'admin', 'vb'),
(11, '2013-08-16 21:50:07', 'io', '1', '/public/poster/6c3ab051f81986181cf9d9264bed2e738ad4e6f320130816215007.jpg', 'admin', 'io'),
(12, '2013-08-16 21:50:13', 'zx', '1', '/public/poster/8efb81cb39dbb6fd490831690824ab18962b37cb20130816215013.jpg', 'admin', 'zx'),
(13, '2013-08-16 21:50:19', 'io', '1', '/public/poster/223e4134970a304ef481934bd0c8a786c8175c8520130816215019.jpg', 'admin', 'io'),
(14, '2013-08-16 21:50:20', 'io', '1', '/public/poster/223e4134970a304ef481934bd0c8a786c8175c8520130816215020.jpg', 'admin', 'io'),
(15, '2013-08-16 21:50:20', 'io', '1', '/public/poster/223e4134970a304ef481934bd0c8a786c8175c8520130816215020.jpg', 'admin', 'io'),
(16, '2013-08-16 21:50:28', 'as', '1', '/public/poster/8efb81cb39dbb6fd35d645990824ab18962b37a520130816215028.jpg', 'admin', 'zxas'),
(17, '2013-08-16 21:50:34', 'io', '1', '/public/poster/1320130816215034.jpg', 'admin', 'io'),
(18, '2013-08-16 21:50:41', '1212', '1', '/public/poster/08eb7bcb0a46f21fd7279762f7246b600c33ae9620130816215041.jpg', 'admin', 'q1'),
(19, '2013-08-16 21:50:48', '121212', '1', '/public/poster/7e65ad345982b2b7399fabf530adcbef76099ba520130816215048.jpg', 'admin', '1234'),
(20, '2013-08-16 21:51:04', '23424', '1', '/public/poster/05954aed2e738bd49c638493a08b87d6267ff9f720130816215104.jpg', 'admin', '34'),
(25, '2013-08-16 21:51:56', ' 啊坟蛋发的发', '1', '/public/poster/67b8a9014c086e06203309fb03087bf40bd1cb8c20130816215156.jpg', 'admin', '啊啊'),
(26, '2013-08-16 21:52:02', '去去 ', '1', '/public/poster/0d3a0ef41bd5ad6e98c8e2fd81cb39dbb6fd3c9120130816215202.jpg', 'admin', '请求 '),
(27, '2013-08-16 21:52:11', '一天天', '1', '/public/poster/05954aed2e738bd49c638493a08b87d6267ff9f720130816215211.jpg', 'admin', 'uiuC'),
(28, '2013-08-16 22:27:48', '这些', '1', '/public/poster/420130816222748.jpg', 'admin', '这些'),
(29, '2013-08-19 19:53:21', '', '1', '/public/poster/488088896b4bbf3af52ca0e76545889220130819195321.jpg', 'admin', 'qw'),
(30, '2013-08-19 19:58:07', '', '1', '/public/poster/fate_stay_night_wallpaper_7-normal20130819195807.jpg', 'admin', 'qwwwwwwwwwww');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `type` varchar(1) NOT NULL DEFAULT '1' COMMENT '权限类型',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `type`, `username`) VALUES
(1, 'admin@zjut.com', '21232F297A57A5A743894A0E4A801FC3', '3', 'admin'),
(11, 'ab@ab.com', '187EF4436122D1CC2F40DC2B92F0EBA0', '2', 'ab'),
(12, '56@56.com', '9F61408E3AFB633E50CDF1B20DE6F466', '1', '56');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
