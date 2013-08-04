-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 08 月 04 日 04:31
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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `detail` longtext COMMENT '描述',
  `dealtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `photo` varchar(255) NOT NULL COMMENT '照片地址',
  `submitter` varchar(20) NOT NULL COMMENT '发布者ID',
  `issubmit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='海报信息' AUTO_INCREMENT=99 ;

--
-- 转存表中的数据 `poster`
--

INSERT INTO `poster` (`id`, `title`, `detail`, `dealtime`, `photo`, `submitter`, `issubmit`) VALUES
(48, '12', '12', '2013-08-01 11:36:20', '/public/poster/a20130728184047.jpg', 'admin', 1),
(49, '3454', '44', '2013-08-01 11:36:22', '/public/poster/0d3a0ef41bd5ad6e98c8e2fd81cb39dbb6fd3c9120130728184053.jpg', 'admin', 1),
(50, '4', '4', '2013-08-01 11:36:24', '/public/poster/120130728184059.jpg', 'admin', 1),
(51, '12333', '33333333333333333333333333 333333333333333333 3333333333333333333 333333333333333333 333333333333333333 333333333333333333 333333333333333333 333333333333333333 333333333333333', '2013-08-01 11:36:26', '/public/poster/0b2635fae6cd7b89cc84bcb20e2442a7d9330e3c20130728184106.jpg', 'admin', 1),
(52, '56098', '56', '2013-08-01 11:36:28', '/public/poster/8efb81cb39dbb6fd490831690824ab18962b37cb20130728184112.jpg', 'admin', 1),
(53, '1234', '12', '2013-08-01 11:36:30', '/public/poster/720130728184118.jpg', 'admin', 1),
(54, '89', '8', '2013-08-01 11:36:32', '/public/poster/220130728184123.jpg', 'admin', 1),
(55, '878', '878', '2013-08-01 11:36:34', '/public/poster/0d3a0ef41bd5ad6e8c97f7db80cb39dbb6fd3cb220130728184126.jpg', 'admin', 1),
(56, '78', '878', '2013-08-01 11:36:38', '/public/poster/7e65ad345982b2b7399fabf530adcbef76099ba520130728184131.jpg', 'admin', 1),
(57, '787', '78', '2013-08-01 11:36:40', '/public/poster/420130728184137.jpg', 'admin', 1),
(58, 'fg', 'fg', '2013-08-01 11:36:42', '/public/poster/920130728184143.jpg', 'admin', 1),
(59, 'fg', 'fg', '2013-08-01 11:36:44', '/public/poster/6dda43166d224f4a9465e02208f790529822d12120130728184147.jpg', 'admin', 1),
(60, 'fg', 'g', '2013-07-28 10:41:53', '/public/poster/70e279310a55b319f247b4d742a98226cefc17f220130728184153.jpg', 'admin', 1),
(61, 'ghfg', 'fgg', '2013-07-28 14:39:20', '/public/poster/7acb0a46f21fbe09a0ed8fbd6a600c338644adec20130728184158.jpg', 'admin', 1),
(62, 'hgjgh', 'fgfg', '2013-07-28 14:41:28', '/public/poster/31840420130728184204.jpg', 'admin', 1),
(63, '1234', '4rer', '2013-07-29 08:29:24', '/public/poster/61286b63f6246b606f0881c5eaf81a4c510fa21a20130729162924.jpg', 'admin', 1),
(64, 'sd', 'sd', '2013-07-29 08:29:31', '/public/poster/77c6a7efce1b9d16a3ee80c8f2deb48f8c54646920130729162931.jpg', 'admin', 1),
(65, 'x', 'x', '2013-07-29 08:29:36', '/public/poster/220130729162936.jpg', 'admin', 1),
(66, 'vc', 'cv', '2013-07-29 08:29:42', '/public/poster/902397dda144ad3464a09d2ed1a20cf431ad857f20130729162942.jpg', 'admin', 1),
(67, 'nm', 'nm', '2013-07-29 08:29:50', '/public/poster/27fdd100baa1cd1196794591b812c8fcc2ce2d5120130729162950.jpg', 'admin', 1),
(68, 'm,', 'm,', '2013-07-29 08:29:57', '/public/poster/23229245d688d43fcfa70cc37c1ed21b0ef43b9220130729162957.jpg', 'admin', 1),
(69, 'qw', 'wq', '2013-07-29 08:30:14', '/public/poster/ebba033b5bb5c9eac78390d2d439b6003af3b3b520130729163014.jpg', 'admin', 1),
(70, 'cx', 'xc', '2013-07-29 09:32:22', '/public/poster/2cffb48f8c5494eeed71a2a62cf5e0fe98257edb20130729163020.jpg', '23', 1),
(72, 'bn', 'nb', '2013-07-29 09:32:07', '/public/poster/94cad1c8a786c917f3984990c83d70cf3ac757fb20130729163032.jpg', '23', 1),
(74, 'as', 'as', '2013-07-30 03:33:21', '/public/poster/2cffb48f8c5494eeed71a2a62cf5e0fe98257edb2013072916302020130730113321.jpg', 'admin', 1),
(75, 'as', 'as', '2013-07-30 03:33:48', '/public/poster/2cffb48f8c5494eeed71a2a62cf5e0fe98257edb2013072916302020130730113348.jpg', 'admin', 1),
(76, 'sdsd', 'sdsd', '2013-07-30 03:35:01', '/public/poster/2cffb48f8c5494eeed71a2a62cf5e0fe98257edb2013072916302020130730113501.jpg', '23', 1),
(77, '111111111111111111', '11111111111', '2013-07-30 07:39:17', '/public/poster/320130730153917.jpg', 'admin', 1),
(78, 'ui', 'ui', '2013-07-30 07:39:25', '/public/poster/4c32b07eca806538edb2395096dda144ad34823f20130730153925.jpg', 'admin', 1),
(79, 'io', 'io', '2013-07-30 07:39:34', '/public/poster/4d79d109b3de9c82e1c854306d81800a18d8438520130730153934.jpg', 'admin', 1),
(80, 'op', 'op', '2013-07-30 07:39:40', '/public/poster/4e4a20a4462309f79d96b6bb730e0cf3d6cad69920130730153940.jpg', 'admin', 1),
(81, 'as', 'as', '2013-07-30 07:39:46', '/public/poster/520130730153946.jpg', 'admin', 1),
(82, 'as', 'asasasasasasasasasasas', '2013-07-30 07:39:58', '/public/poster/5f2b19d8bc3eb1352edc31aca61ea8d3fd1f44ab20130730153958.jpg', 'admin', 1),
(83, 'as', 'as', '2013-07-30 07:40:07', '/public/poster/620130730154007.jpg', 'admin', 1),
(84, 'sssssss', 'ssssssssssssssssss', '2013-07-30 07:40:14', '/public/poster/6bae8c5494eef01f36928786e1fe9925bd317d9420130730154014.jpg', 'admin', 1),
(85, 'dc', 'sdsd', '2013-07-30 07:40:24', '/public/poster/7acb0a46f21fbe09a0ed8fbd6a600c338644adec20130730154024.jpg', 'admin', 1),
(86, '', '', '2013-07-31 13:42:49', '/public/poster/微博桌面2012_89477886920130731214249.JPG', '123', 1),
(87, '', '', '2013-07-31 13:42:54', '/public/poster/微博桌面2012_106927519220130731214254.JPG', '123', 1),
(88, '', '', '2013-07-31 13:43:09', '/public/poster/微博桌面2012_302144143320130731214309.JPG', '123', 1),
(89, '', '', '2013-07-31 13:45:54', '/public/poster/微博桌面2012_257747960320130731214554.JPG', '123', 1),
(90, '啊啊啊啊啊啊啊', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2013-08-01 01:30:47', '/public/poster/120130801093047.jpg', 'admin', 1),
(91, '111111111111111111', '11111111', '2013-08-01 11:11:18', '/public/poster/6dda43166d224f4a9465e02208f790529822d12120130801191024.jpg', 'admin', 1),
(92, '1111111', '1111111111', '2013-08-01 11:11:20', '/public/poster/08eb7bcb0a46f21fd7279762f7246b600c33ae9620130801191031.jpg', 'admin', 1),
(93, 'qwqw', 'wqwqw', '2013-08-01 11:11:23', '/public/poster/2cffb48f8c5494eeed71a2a62cf5e0fe98257edb20130801191038.jpg', 'admin', 1),
(94, 'dfdfd', 'fdfdf', '2013-08-01 11:11:25', '/public/poster/1020130801191049.jpg', 'admin', 1),
(95, 'aaaaaaa', 'aaaaaaaaaaaaaa', '2013-08-02 03:36:40', '/public/poster/0d3a0ef41bd5ad6e98c8e2fd81cb39dbb6fd3c9120130802113640.jpg', 'admin', 1),
(96, 'qq', 'qq', '2013-08-02 03:45:52', '/public/poster/120130802114552.jpg', 'admin', 1),
(97, 'aa', 'aa', '2013-08-02 03:48:05', '/public/poster/0b2635fae6cd7b89cc84bcb20e2442a7d9330e3c20130802114805.jpg', 'admin', 1),
(98, 'as', 'as', '2013-08-02 12:06:39', '/public/poster/58b5a4c27d1ed21be0781d54ac6eddc450da3feb20130802200639.jpg', 'q', 1);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(40) NOT NULL COMMENT '邮箱',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `type` varchar(1) NOT NULL DEFAULT '1' COMMENT '权限类型',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=23466 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`email`, `username`, `password`, `type`, `id`) VALUES
('aw@qaaaaaaaaaq.com', '123', '12345', '2', 1),
('aaab', 'admin', 'admin', '3', 2),
('b', '23', '23', '1', 6),
('c', '3', '2234566', '3', 23456),
('e', '234', '234', '5', 23457),
('d', 'sdf', 'sdf', '1', 23458),
('q@q.com', 'q', 'q', '1', 23459),
('s@s.com', 's', 's', '1', 23460),
('w@w.com', 'w', 'w', '1', 23462),
('12@qq.com', 'as', 'as', '1', 23463),
('fg@qw.com', 'dddddddddddddd', 'sd', '0', 23464),
('sd@sd.xom', 'sd', 'sd', '0', 23465);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
