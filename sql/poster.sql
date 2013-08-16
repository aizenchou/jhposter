-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 08 月 16 日 16:12
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

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
(21, '2013-08-16 21:51:11', 'ioioi', '1', '/public/poster/0b2635fae6cd7b89cc84bcb20e2442a7d9330e3c20130816215111.jpg', 'admin', 'io'),
(22, '2013-08-16 21:51:29', 'nmnm', '1', '/public/poster/1020130816215129.jpg', 'admin', 'nmnm'),
(23, '2013-08-16 21:51:37', 'sad', '1', '/public/poster/8efb81cb39dbb6fd35d645990824ab18962b37a520130816215137.jpg', 'admin', 'xcsdsd'),
(24, '2013-08-16 21:51:48', '地方的', '1', '/public/poster/1020130816215148.jpg', 'admin', '风格的'),
(25, '2013-08-16 21:51:56', ' 啊坟蛋发的发', '1', '/public/poster/67b8a9014c086e06203309fb03087bf40bd1cb8c20130816215156.jpg', 'admin', '啊啊'),
(26, '2013-08-16 21:52:02', '去去 ', '1', '/public/poster/0d3a0ef41bd5ad6e98c8e2fd81cb39dbb6fd3c9120130816215202.jpg', 'admin', '请求 '),
(27, '2013-08-16 21:52:11', '一天天', '1', '/public/poster/05954aed2e738bd49c638493a08b87d6267ff9f720130816215211.jpg', 'admin', 'uiuC');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `type` varchar(1) NOT NULL DEFAULT '1' COMMENT '权限类型',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `type`, `username`) VALUES
(1, 'admin@zjut.com', 'admin', '3', 'admin'),
(2, '12@12.com', '12', '0', '12'),
(3, '56@56.com', '56', '0', '56'),
(4, 'zx@zx.com', 'zx', '0', 'zx'),
(5, 'df@df.com', 'df', '0', 'df'),
(6, '23@as.com', 'as', '2', 'as'),
(7, 'vb@vb.com', 'vb', '1', 'vb');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
