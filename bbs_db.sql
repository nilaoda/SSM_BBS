/*
Navicat MySQL Data Transfer

Source Server         : NewConn
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : bbs_db

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-05-26 13:23:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for thread
-- ----------------------------
DROP TABLE IF EXISTS `thread`;
CREATE TABLE `thread` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_uid` int(11) NOT NULL,
  `t_replyCount` int(255) DEFAULT NULL,
  `t_title` varchar(255) NOT NULL,
  `t_content` text NOT NULL,
  `t_time` varchar(255) DEFAULT NULL,
  `t_clickCount` int(255) DEFAULT '0',
  `t_lastReplyID` int(11) DEFAULT NULL,
  `t_lastTime` varchar(0) DEFAULT NULL,
  `t_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  KEY `t_uid` (`t_uid`),
  CONSTRAINT `t_uid` FOREIGN KEY (`t_uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thread
-- ----------------------------
INSERT INTO `thread` VALUES ('1', '1', '0', '射雕英雄传', '<p>《射雕英雄传》是蒋家骏执导的古装武侠剧，由杨旭文、李一桐、陈星旭、孟子义等领衔主演。</p><p>该剧讲述了郭靖背负着家恨国仇闯入江湖，通过无数历程和在黄蓉的帮助下，最终成长成一位“侠之大者”的武林民族英雄故事。</p><p>该剧于2017年1月9日在东方卫视周播剧场首播。</p>', '2019-05-16 16:51:49', '2', null, null, null);
INSERT INTO `thread` VALUES ('5', '1', null, '测试一个新帖子！哈哈', '<p>我很高兴！！我太高兴了！</p>', '2019-05-17 05:52:09', '0', null, null, null);
INSERT INTO `thread` VALUES ('9', '2', null, '我是张三~', '<p>我在测试帖子发布功能！</p>', '2019-05-17 18:03:55', '0', null, null, null);
INSERT INTO `thread` VALUES ('10', '2', null, '123', '<p>666</p>', '2019-05-17 18:07:26', '0', null, null, null);
INSERT INTO `thread` VALUES ('11', '3', null, '李四发布帖子', '<p>哈哈，我是李四</p>', '2019-05-17 21:56:41', '3', null, null, null);
INSERT INTO `thread` VALUES ('19', '7', null, '我们都要好好的', '<p>出生在普通工人之家的向前，凭借自己的聪明才智和吃苦耐劳的精神，很快在全球知名的IPD基金公司任职并站稳脚跟。期间，他冲破层层障碍如愿以偿与寻找结婚生子。书香门第家庭出生的寻找不顾家人的反对嫁给了贫寒子弟向前，寻找一直从事自己喜爱的舞台艺术工作，婚后不得已放弃工作成为了全职主妇。由于向前工作应酬多，寻找对新生活的不适应，两人沟通不顺导致夫妻关系很快出现问题，更令人担忧的是寻找为此患上严重的抑郁症。两人在努力挽回婚姻无果后，决定分开。即使分开两人依旧把对方当做亲人，一起陪伴孩子成长，而他们的孩子好汉不仅没有受到伤害，还意外收获了两个重组家庭的双倍宠爱。</p>', '2019-05-23 18:31:46', '1', null, null, null);
INSERT INTO `thread` VALUES ('20', '7', null, '我的真朋友', '<p>性格率真、待人处事掏心掏肺的程真真，与一身纨绔子弟习气却隐瞒身份的爱与家总裁独生子邵芃橙，共同进入爱与家花园店成为房产销售新人，彼此搭档。二人生活与工作方式迥异，却通过一个个房子与家庭的故事，一起见证了人情冷暖与社会百态，同时也在房产销售的工作当中，学会了责任与勇敢，找到了彼此最好的归宿。</p>', '2019-05-23 18:32:19', '1', null, null, null);
INSERT INTO `thread` VALUES ('32', '1', null, '11345', '<p>111测试</p>', '2019-05-24 22:51:02', '0', null, null, null);
INSERT INTO `thread` VALUES ('42', '1', null, '图片测试2', '<p>这是一朵花</p>', '2019-05-24 23:57:41', '8', null, null, 'c6b62dd5-34a2-4bcd-9929-6e5bc362bcaa_IMG_20190518_113413.jpg');
INSERT INTO `thread` VALUES ('43', '9', null, 'TEST', '<p>没有视频啊 链接啊 啥的</p>', '2019-05-25 00:23:30', '8', null, null, null);
INSERT INTO `thread` VALUES ('44', '1', null, 'JavaEE测试报告', '<p>Java EE是 J2EE的一个新的名称，之所以改名，目的还是让大家清楚J2EE只是Java企业应用.随着WEB和EJB容器概念诞生，使得软件应用业开始担心SUN的伙伴们是否还在Java平台上不断推出翻新的标准框架，致使软件应用业的业务核心组件架构无所适从，从一直以来是否需要EJB的讨论声中说明了这种彷徨。</p><p>在2004年底中国软件技术大会Ioc微容器(也就是Jdon框架的实现原理)演讲中指出：我们需要一个跨J2SE/WEB/EJB的微容器，保护我们的业务核心组件（中间件），以延续它的生命力，而不是依赖J2SE/J2EE版本.此次J2EE改名为Java EE，实际也反映出业界这种共同心声。</p><p>Java EE的核心是EJB3.0, 其提供了更兼便捷的企业级的应用框架。</p>', '2019-05-25 23:40:17', '6', null, null, 'f507af97-102e-4532-b918-7afe66dee13f_b7003af33a87e9501050ff6610385343fbf2b470.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` int(1) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'eeab8d50ecee3d4a3a5efb37d847e1f', '1');
INSERT INTO `user` VALUES ('2', '张三', 'a7233a8c74080e477912c57cedf035fc', '0');
INSERT INTO `user` VALUES ('3', '李四', 'eeab8d50ecee3d4a3a5efb37d847e1f', '0');
INSERT INTO `user` VALUES ('7', '王五', 'a7233a8c74080e477912c57cedf035fc', '0');
INSERT INTO `user` VALUES ('9', '秋秋', '328d82f751b45d5703bc8e55e731088', '1');
INSERT INTO `user` VALUES ('10', 'baby', '8d249a494df6c2a3b728f08f14533e9d', '1');
DROP TRIGGER IF EXISTS `delThreads`;
DELIMITER ;;
CREATE TRIGGER `delThreads` BEFORE DELETE ON `user` FOR EACH ROW delete from thread where t_uid = old.uid
;;
DELIMITER ;
