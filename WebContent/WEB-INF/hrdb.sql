/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost:3306
 Source Schema         : hrdb

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : 65001

 Date: 17/12/2019 09:28:54
*/
create database hrdb;
USE hrdb;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '财务部', '无');
INSERT INTO `dept` VALUES (2, '学术部', '无');
INSERT INTO `dept` VALUES (3, '公关部', '无');
INSERT INTO `dept` VALUES (4, '教学部', '无');
INSERT INTO `dept` VALUES (5, '技术部', '无');
INSERT INTO `dept` VALUES (6, '人事部', '优秀部门');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `dept_id` INT(11) NOT NULL,
  `job_id` INT(11) NOT NULL,
  `name` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_id` VARCHAR(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_code` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` VARCHAR(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq_num` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` INT(11) NOT NULL DEFAULT 1,
  `party` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` DATETIME ,
  `race` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `education` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speciality` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hobby` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_EMP_DEPT`(`dept_id`) USING BTREE,
  INDEX `FK_EMP_JOB`(`job_id`) USING BTREE,
  CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EMP_JOB` FOREIGN KEY (`job_id`) REFERENCES `job` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

INSERT INTO `employee` VALUES (1, 1, 1, '段誉', '65335463222243553', '广东省深圳市龙华街道办2号', '513408', '33388876', '15919754435', '803543321', 'wuyingd@qq.com', 1, '党员', '2013-06-01 10:56:41', '汉', '本科', '计算机', '打篮球', '无', '2019-09-22 10:59:34');
INSERT INTO `employee` VALUES (2, 2, 3, '黄老邪', '65335463222243553', '广东省深圳市龙华街道办2号', '513408', '33388876', '15919754433', '803543321', '121434@qq.com', 1, 'q群众', '2019-09-17 11:09:35', '汉', '本科', '软工', '打羽毛球', '无', '2019-09-22 11:08:34'); 
-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (1, '工程师', '无');
INSERT INTO `job` VALUES (2, '会计师', '无');
INSERT INTO `job` VALUES (3, '普通职员', '无');
INSERT INTO `job` VALUES (4, 'Java程序员', '');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `username` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今日头条', '习近平在中央政协工作会议上的讲话金句', '金句来了！习近平在中央政协工作会议暨庆祝中国人民政治协商会议成立70周年大会上的讲话金句​​​​ ', '无', '');
INSERT INTO `notice` VALUES (2, '今日头条', '携手奋进新时代', '新华社评论员：画出最大同心圆，携手奋进新时代——学习\r\n习近平总书记在中央政协工作会议暨庆祝中国人民政治协商会议成立70周年大会重要讲话​​​​ ', '无', '');
INSERT INTO `notice` VALUES (11, '习近平以“六稳”推动经济高质量发展', '联播+丨习近平以“六稳”推动经济高质量发展', '<p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.6rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; font-family: &quot;PingFang SC&quot;, &quot;PingFang TC&quot;, &quot;Microsoft YaHei&quot;, STHeiti, arial, helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12月6日，习近平总书记主持中共中央政治局会议。会议分析研究2020年经济工作，强调全面做好“六稳”工作。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em; font-family: &quot;PingFang SC&quot;, &quot;PingFang TC&quot;, &quot;Microsoft YaHei&quot;, STHeiti, arial, helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“六稳”，即“稳就业、稳金融、稳外贸、稳外资、稳投资、稳预期”。做好“六稳”工作对于保持经济运行在合理区间，确保全面建成小康社会和“十三五”规划圆满收官具有重要意义。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em; font-family: &quot;PingFang SC&quot;, &quot;PingFang TC&quot;, &quot;Microsoft YaHei&quot;, STHeiti, arial, helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">近年来，习近平在国内考察、重要会议、国际活动等多个场合，对如何扎实做好“六稳”工作进行了详细阐述。《联播+》与您一起学习。</p><p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 0.12rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1539311446672181/icon_bluexian_18313.png&quot;) 0% 0% / 0.36rem 0.36rem repeat; border: 1px solid rgb(33, 68, 140);\"><span class=\"text\" style=\"box-sizing: border-box; font-size: 0.36rem; line-height: 0.6rem; display: block; text-align: center; margin: -0.1rem 0px 0.1rem; transform: translate(-0.1rem, 0px); padding: 0.06rem 0.25rem; font-weight: bold; border: 1px solid rgb(33, 68, 140);\">稳就业</span></p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">要出台更多鼓励就业创业的措施，重点解决好高校毕业生、退役军人、下岗职工、农民工、返乡人员等重点人群的就业问题。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年9月18日，在河南考察时的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">要对就业困难人员及时提供就业指导和技能培训，确保他们就业有门路、生活有保障。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年5月22日，在江西考察时的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">要坚持就业优先战略，把解决人民群众就业问题放在更加突出的位置，努力创造更多就业岗位。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0px; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年2月1日，春节前夕在北京看望慰问基层干部群众时的讲话</p><p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 0.12rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1539311446672181/icon_bluexian_18313.png&quot;) 0% 0% / 0.36rem 0.36rem repeat; border: 1px solid rgb(33, 68, 140);\"><span class=\"text\" style=\"box-sizing: border-box; font-size: 0.36rem; line-height: 0.6rem; display: block; text-align: center; margin: -0.1rem 0px 0.1rem; transform: translate(-0.1rem, 0px); padding: 0.06rem 0.25rem; font-weight: bold; border: 1px solid rgb(33, 68, 140);\">稳金融</span></p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">面对未来全球系统性金融风险挑战，我们不但要确保金融安全网资源充足，也要让国际金融架构的代表性更加合理，更好反映世界经济现实格局。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年6月28日，在二十国集团领导人峰会上关于世界经济形势和贸易问题的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">要坚持靶向治疗、精确惩治，聚焦党的十八大以来着力查处的重点对象，紧盯事关发展全局和国家安全的重大工程、重点领域、关键岗位，加大金融领域反腐力度，对存在腐败问题的，发现一起坚决查处一起。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年1月11日，在十九届中央纪委三次全会上的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">希望国际货币基金组织继续在全球贸易议程中发挥积极作用，维护公平开放的全球金融市场，推动国际秩序朝着更加公正合理的方向发展。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0px; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年11月22日，会见国际货币基金组织总裁格奥尔基耶娃时的讲话</p><p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 0.12rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1539311446672181/icon_bluexian_18313.png&quot;) 0% 0% / 0.36rem 0.36rem repeat; border: 1px solid rgb(33, 68, 140);\"><span class=\"text\" style=\"box-sizing: border-box; font-size: 0.36rem; line-height: 0.6rem; display: block; text-align: center; margin: -0.1rem 0px 0.1rem; transform: translate(-0.1rem, 0px); padding: 0.06rem 0.25rem; font-weight: bold; border: 1px solid rgb(33, 68, 140);\">稳外贸</span></p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">我们应该坚持以开放求发展，深化交流合作，坚持“拉手”而不是“松手”，坚持“拆墙”而不是“筑墙”，坚决反对保护主义、单边主义，不断削减贸易壁垒，推动全球价值链、供应链更加完善，共同培育市场需求。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年11月5日，在第二届中国国际进口博览会开幕式上的主旨演讲</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">我们不刻意追求贸易顺差，愿意进口更多国外有竞争力的优质农产品、制成品和服务，促进贸易平衡发展。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年4月26日，在第二届“一带一路”国际合作高峰论坛开幕式上的主旨演讲</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">为此，我们必须坚持对外开放的基本国策，奉行互利共赢的开放战略，深化人文交流，完善对外开放区域布局、对外贸易布局、投资布局，形成对外开放新体制，发展更高层次的开放型经济，以扩大开放带动创新、推动改革、促进发展。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0px; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2015年10月29日，在党的十八届五中全会第二次全体会议上的讲话</p><p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 0.12rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1539311446672181/icon_bluexian_18313.png&quot;) 0% 0% / 0.36rem 0.36rem repeat; border: 1px solid rgb(33, 68, 140);\"><span class=\"text\" style=\"box-sizing: border-box; font-size: 0.36rem; line-height: 0.6rem; display: block; text-align: center; margin: -0.1rem 0px 0.1rem; transform: translate(-0.1rem, 0px); padding: 0.06rem 0.25rem; font-weight: bold; border: 1px solid rgb(33, 68, 140);\">稳外资</span></p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">中国将坚持扩大对外开放，增加商品和服务进口，扩大外资市场准入，加强知识产权保护，形成全方位、多层次、宽领域的全面开放新格局。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年11月14日，在金砖国家领导人巴西利亚会晤公开会议上的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">中国将不断完善市场化、法治化、国际化的营商环境，放宽外资市场准入，继续缩减负面清单，完善投资促进和保护、信息报告等制度。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年11月5日，在第二届中国国际进口博览会开幕式上的主旨演讲</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">中国致力于促进更高水平对外开放，坚定支持多边贸易体制，将在更广领域扩大外资市场准入，积极打造一流营商环境。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0px; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年5月28日，向2019年中国国际服务贸易交易会致贺信</p><p><br/></p>', NULL, 'jack');
INSERT INTO `notice` VALUES (12, '近平新时代中国特色社', '【在习近平新时代中国特色社会主义思想指引下——新时代 新作为 新篇章】全国人大上海虹桥基层立法联系点探索全过程民主', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">央广网北京12月8日消息（记者马喆）据中央广播电视总台中国之声《新闻和报纸摘要》报道，今年11月2日，习近平总书记到上海虹桥街道考察基层立法联系点工作。他指出，虹桥这个基层立法联系点很有意义，立足社区实际、认真扎实地开展工作，做了很多接地气、聚民智的有益探索，并勉励街道要再接再厉，为发展中国特色社会主义民主继续作贡献。<a target=\"_blank\" href=\"http://china.cnr.cn/news//20191208/t20191208_524888505.shtml\" style=\"color: rgb(0, 0, 0); text-decoration-line: none;\"><span style=\"color:#0000ff;font-family:楷体_GB2312\"><strong style=\"color: rgb(0, 0, 0);\">2019-12-8 新闻和报纸摘要全文&gt;&gt;&gt;</strong></span></a></p><p><span class=\"vcp-timelabel\" style=\"display: inline-block; line-height: 3em; float: left; color: rgb(255, 255, 255); padding: 0px 9px; height: 3em; z-index: 1001; position: relative;\">00:15 / 04:53</span></p><p><span class=\"vcp-volume-icon\" style=\"background-image: url(&quot;data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB2aWV3Qm94PSIwIDAgMzYgMzYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+DQogICAgPHBhdGggZD0iTTEyLjM5LDE1LjU0IEwxMCwxNS41NCBMMTAsMjAuNDQgTDEyLjQsMjAuNDQgTDE3LDI1LjUwIEwxNywxMC40OCBMMTIuMzksMTUuNTQgWiIgb3BhY2l0eT0iMSIgZmlsbD0iI2ZmZiI+PC9wYXRoPg0KICAgIDxwYXRoIGQ9Ik0xMi4zOSwxNS41NCBMMTAsMTUuNTQgTDEwLDIwLjQ0IEwxMi40LDIwLjQ0IEwxNywyNS41MCBMMTcsMTAuNDggTDEyLjM5LDE1LjU0IFoiIG9wYWNpdHk9IjEiIGZpbGw9IiNmZmYiPjwvcGF0aD4NCiAgICA8cGF0aCBkPSJNMTkuNjMsMTUuOTIgTDIwLjY4LDE0LjkzIEwyMi44MSwxNi45NCBMMjQuOTQsMTQuOTMgTDI2LDE1LjkyIEwyMy44NiwxNy45MyBMMjYsMTkuOTMgTDI0Ljk0LDIwLjkyIEwyMi44MSwxOC45MiBMMjAuNjgsMjAuOTIgTDE5LjYzLDE5LjkzIEwyMS43NiwxNy45MyBMMTkuNjMsMTUuOTIgWiIgb3BhY2l0eT0iMSIgZmlsbD0iI2ZmZiI+PC9wYXRoPg0KICAgIDxwYXRoIGQ9Ik0xOS42MywxNS45MiBMMjAuNjgsMTQuOTMgTDIyLjgxLDE2Ljk0IEwyNC45NCwxNC45MyBMMjYsMTUuOTIgTDIzLjg2LDE3LjkzIEwyNiwxOS45MyBMMjQuOTQsMjAuOTIgTDIyLjgxLDE4LjkyIEwyMC42OCwyMC45MiBMMTkuNjMsMTkuOTMgTDIxLjc2LDE3LjkzIEwxOS42MywxNS45MiBaIiBvcGFjaXR5PSIxIiBmaWxsPSIjZmZmIj48L3BhdGg+DQo8L3N2Zz4=&quot;); display: inline-block; width: 3em; height: 3em; position: absolute; left: 0px; top: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">　　自2015年起，全国人大常委会法工委在上海虹桥街道设立基层立法联系点。在这里，基层的立法建议可以直达全国人大常委会。四年多来，25条来自基层的建议被采纳，成为法律条文。基层立法联系点有力地彰显了新时代的民主立法、科学立法，也为全过程民主进行了有益探索。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">　　上海虹桥街道是全国人大常委会法工委在全国设立的四个基层立法联系点之一，也是唯一设在街道的立法联系点。基层立法联系点直通全国人大常委会，被百姓形象地称为“群众声音直通车，基层立法彩虹桥”。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">　　近日，全国人大常委会法工委就未成年人保护法修订草案和预防未成年人犯罪法修订草案在上海虹桥街道进行意见征询。征询的对象是街道辖区内的教师、家长和法律工作者等。全国人大常委会法工委社会法室主任郭林茂在征询会上表示，原汁原味的意见，有助于开拓立法思路。</p><p><br/></p>', NULL, '');
INSERT INTO `notice` VALUES (13, '美联邦调查局确', '美联邦调查局确认美海军航空站枪击案凶手为沙特人', '<p style=\"margin-top: 10px; margin-bottom: 20px; padding: 0px; list-style: none; line-height: 30px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Helvetica, &quot;Microsoft YaHei&quot;, simsun, sans-serif; white-space: normal; background-color: rgb(249, 249, 249);\">新华社华盛顿12月7日电（记者邓仙来 孙丁）美国联邦调查局7日在社交媒体上确认，6日发生在美国佛罗里达州一海军航空站的枪击事件凶手为沙特阿拉伯籍男子穆罕默德⋅阿尔沙姆拉尼。</p><p style=\"margin-top: 10px; margin-bottom: 20px; padding: 0px; list-style: none; line-height: 30px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Helvetica, &quot;Microsoft YaHei&quot;, simsun, sans-serif; white-space: normal; background-color: rgb(249, 249, 249);\">美国联邦调查局当日表示，该局下设的打击恐怖活动联合工作组等部门正在参与相关调查。据美国媒体报道，凶手穆罕默德⋅阿尔沙姆拉尼现年21岁，服役于沙特阿拉伯皇家空军，当时在事发海军航空站接受飞行训练。</p><p style=\"margin-top: 10px; margin-bottom: 20px; padding: 0px; list-style: none; line-height: 30px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Helvetica, &quot;Microsoft YaHei&quot;, simsun, sans-serif; white-space: normal; background-color: rgb(249, 249, 249);\">美国海军7日公布了枪击事件中3名遇难人员的姓名及身份，他们均是海军飞行学员，年龄在19岁至23岁之间，分别来自美国亚拉巴马州、佛罗里达州和佐治亚州。</p><p><br/></p>', NULL, 'jack');
INSERT INTO `notice` VALUES (14, '', '', '', NULL, 'jack');
INSERT INTO `notice` VALUES (15, 'qqqqqq', 'qqqqqqqqqqqqqqq', '<p>qqqqqqqqqqqqqqqq</p>', NULL, 'jack');
INSERT INTO `notice` VALUES (16, '我的新闻', '今天天气好', '<p style=\"text-align: center;\"><span style=\"font-size: 24px; color: rgb(255, 0, 0);\">锄禾日当午</span></p><p><span style=\"font-size: 24px; color: rgb(255, 0, 0);\"><br/></span></p><p><span style=\"font-size: 24px; color: rgb(255, 0, 0);\"><img src=\"/Day1208Project/ueditor/jsp/upload/image/20191215/1576372328233030661.png\" title=\"1576372328233030661.png\" alt=\"桌面.png\"/></span></p>', NULL, 'jack');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '普通员工', '');
INSERT INTO `role` VALUES (2, '管理员', '');
INSERT INTO `role` VALUES (3, '超级管理员', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `number` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` INT(11) NOT NULL DEFAULT 1,
  `phone` VARCHAR(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdate` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  INDEX `fk`(`role_id`) USING BTREE,
  CONSTRAINT `fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10001', '123', 2, '15919876657', '2019-09-22 10:22:48', 'jack', '无');
INSERT INTO `user` VALUES ('10005', '123', 1, '19876657432', '2019-10-31 09:01:48', '黄容', NULL);
INSERT INTO `user` VALUES ('10006', 'aaaa', 2, '11111111111', '2019-12-15 10:18:52', '乔峰', '无');
INSERT INTO `user` VALUES ('10007', '123', 1, '12552345245', '2019-10-30 21:06:24', '段誉', '无');
INSERT INTO `user` VALUES ('10010', '123', 1, '30572105702', '2019-12-15 10:15:02', '阿紫', '无');
INSERT INTO `user` VALUES ('10011', '123', 2, '85648742942', '2019-10-30 21:08:47', '梦姑', '无');
INSERT INTO `user` VALUES ('10034', '111111', 1, '12345678988', '2019-12-08 20:55:47', '老何', '111');
INSERT INTO `user` VALUES ('10055', '111111', 3, '12345678999', '2019-12-08 15:26:09', '老王', '优秀');

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `uploadfile` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `uploadName` VARCHAR(50) NOT NULL,
  `fileName` VARCHAR(100) NOT NULL,
  `uploadDate` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8

