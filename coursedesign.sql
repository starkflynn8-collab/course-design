/*
 Navicat Premium Dump SQL

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44)
 Source Host           : localhost:3307
 Source Schema         : coursedesign

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44)
 File Encoding         : 65001

 Date: 25/12/2025 19:10:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `pId` int NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `pContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `pDate` datetime NOT NULL COMMENT '评论日期',
  `pSellerOfLevel` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户评价等级',
  `pGoodsOfLevel` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品评价等级',
  `bId` int NOT NULL COMMENT '买家ID',
  `gId` int NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`pId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (6, '差评，卖家太差', '2022-12-26 10:10:10', 1, 2, 22, 1);

-- ----------------------------
-- Table structure for currentuser
-- ----------------------------
DROP TABLE IF EXISTS `currentuser`;
CREATE TABLE `currentuser`  (
  `uId` int NOT NULL COMMENT '已登录的用户ID',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '唯一的身份标识'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of currentuser
-- ----------------------------
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4Njk3MTkwNTcwMSwiaWF0IjoxNjg2MTA3OTA1NzAxfQ.z13B4ZY5ulV-gAyI_SxJFtp8ppDvyqeITMe2w-PMOFc');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4Njk3MTk0MjUzMSwiaWF0IjoxNjg2MTA3OTQyNTMxfQ.ke2BXhnY5TEbTGpzK6_eiFRM2rnd8_Abz6x0op7nTEk');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MDk0Mjk5NywiaWF0IjoxNjg2Mjc2OTQyOTk3fQ.PMn5wc93Ej5P8HpRt2tDZW34jZHR-RMNkbzsll3Xvlw');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MDk5NDM3OSwiaWF0IjoxNjg2Mjc2OTk0Mzc5fQ.xKpq8ztscaLtdMELP40gVmm7wIi8CGvFzq4Dd623nPw');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MTA3MjAxMCwiaWF0IjoxNjg2Mjc3MDcyMDEwfQ.z6P3O3MoxMNlSpkXIDFHczT6R4bdvC_l5T4yq8Mg5b0');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MTExNjk0NSwiaWF0IjoxNjg2Mjc3MTE2OTQ1fQ.KHpgvIzhT9uzviXNlcDw1rmUGZzOSWY09vihGRTKqAk');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MTI0OTc0NiwiaWF0IjoxNjg2Mjc3MjQ5NzQ2fQ.1GqZXGqTZ66huAr43PLRt9qb3T16cmEWrzm7Nt75hvU');
INSERT INTO `currentuser` VALUES (51, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0IiwiZXhwIjoxNjg3MTQ2MzI2ODk3LCJpYXQiOjE2ODYyODIzMjY4OTd9.auNM6bA8vsddN4gGQhpHK6l8cXAOoBXuzZRE2Alpu-I');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE2NjU0OTg0MSwiaWF0IjoxNjg2MzAyNTQ5ODQxfQ.IAQbH8cWicncHS-01B0WAoy8h4Qd331gyfOmyUbIsro');
INSERT INTO `currentuser` VALUES (54, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtbnpkbmFAMTYzLmNvbSIsImV4cCI6MTY4NzQyMTU0NjUwOSwiaWF0IjoxNjg2NTU3NTQ2NTA5fQ.cJe3IDWafuMXkxcmusZSwyPBhVUo-tH9OyVn1xVLna4');
INSERT INTO `currentuser` VALUES (58, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMuY29tIiwiZXhwIjoxNzY2ODQ1NDQ5MDA2LCJpYXQiOjE3NjU5ODE0NDkwMDZ9.VyzfRAy47Fp9BuxAHfQHJ2QDI2ldpCj46rs9MZcgjWw');
INSERT INTO `currentuser` VALUES (58, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMuY29tIiwiZXhwIjoxNzY2ODQ4NjYxNjYzLCJpYXQiOjE3NjU5ODQ2NjE2NjN9.bnuB1qdob_RVJzoPC0T22ofn-mVjDVL-YlzgNZ4-oHQ');
INSERT INTO `currentuser` VALUES (58, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMuY29tIiwiZXhwIjoxNzY2ODUyMjU3NDM3LCJpYXQiOjE3NjU5ODgyNTc0Mzd9.IqfLRbS6yuSNTgK54q4xARLeSlZIRZwwCadFOTPwNN0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `gId` int NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `gName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `gCount` int NOT NULL COMMENT '商品库存数量',
  `gContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品描述',
  `gPrice` double(10, 2) NOT NULL COMMENT '商品价格',
  `uId` int NOT NULL COMMENT '售卖商品的用户ID',
  `gImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片URL地址',
  `gLevel` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品评价等级',
  PRIMARY KEY (`gId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (100, '计算机组成原理', 3, '408考研必备', 25.00, 58, '/upload/1765989288256_8210.jpg', 4);
INSERT INTO `goods` VALUES (101, '数据结构', 5, '计算机考研必备', 20.00, 58, '/upload/1765989331066_7074.jpg', 3);
INSERT INTO `goods` VALUES (102, '大学物理', 10, '11', 25.00, 58, '/upload/1766125412283_9242.jpg', 3);

-- ----------------------------
-- Table structure for goods_image_backup
-- ----------------------------
DROP TABLE IF EXISTS `goods_image_backup`;
CREATE TABLE `goods_image_backup`  (
  `gId` int NOT NULL DEFAULT 0 COMMENT '商品ID',
  `gName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `gCount` int NOT NULL COMMENT '商品库存数量',
  `gContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品描述',
  `gPrice` double(10, 2) NOT NULL COMMENT '商品价格',
  `uId` int NOT NULL COMMENT '售卖商品的用户ID',
  `gImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品图片URL地址',
  `gLevel` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品评价等级'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_image_backup
-- ----------------------------
INSERT INTO `goods_image_backup` VALUES (12, '商品4', 398, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (13, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (14, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (15, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (16, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (17, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (18, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (19, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (20, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (21, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (22, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (23, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (24, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (25, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (26, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (27, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (28, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (29, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (30, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (31, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (32, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (33, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (34, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (35, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (36, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (37, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (38, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (39, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (40, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (41, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (42, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (43, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (44, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (45, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (46, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (47, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (48, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (49, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (50, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (51, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (52, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (53, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (54, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (55, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (56, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (57, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (58, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (59, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (60, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (61, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (62, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (63, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (64, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (65, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (66, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (67, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (68, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (69, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (72, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (73, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (74, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (75, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods_image_backup` VALUES (76, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods_image_backup` VALUES (77, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods_image_backup` VALUES (78, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods_image_backup` VALUES (79, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `dId` int NOT NULL AUTO_INCREMENT COMMENT '订单ID，自增',
  `dStatue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单支付状态',
  `dDate` datetime NOT NULL COMMENT '订单创建的日期',
  `dAmount` double(5, 2) NOT NULL COMMENT '订单所涉及的金额',
  `dCount` int NOT NULL COMMENT '商品数量',
  `sId` int NOT NULL COMMENT '出售该商品的用户ID',
  `bId` int NOT NULL COMMENT '购买该商品的用户ID',
  `gId` int NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`dId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 354 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (349, 1, '2025-12-16 23:30:24', 199.99, 1, 2, 58, 2);
INSERT INTO `order` VALUES (350, 0, '2025-12-17 19:09:16', 399.99, 1, 4, 58, 12);
INSERT INTO `order` VALUES (351, 1, '2025-12-17 21:30:53', 5.00, 1, 58, 59, 89);
INSERT INTO `order` VALUES (352, 0, '2025-12-17 22:36:28', 25.00, 1, 58, 58, 90);
INSERT INTO `order` VALUES (353, 0, '2025-12-19 14:23:41', 25.00, 1, 58, 58, 102);

-- ----------------------------
-- Table structure for profit
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit`  (
  `dId` int NOT NULL COMMENT '订单ID',
  `profit` double(5, 2) NOT NULL COMMENT ' 平台从该笔交易中所得收益'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profit
-- ----------------------------
INSERT INTO `profit` VALUES (332, 4.00);
INSERT INTO `profit` VALUES (333, 4.00);
INSERT INTO `profit` VALUES (334, 4.00);
INSERT INTO `profit` VALUES (335, 6.00);
INSERT INTO `profit` VALUES (336, 6.00);
INSERT INTO `profit` VALUES (337, 6.00);
INSERT INTO `profit` VALUES (338, 8.00);
INSERT INTO `profit` VALUES (339, 8.00);
INSERT INTO `profit` VALUES (1, 1.00);
INSERT INTO `profit` VALUES (3, 1.00);
INSERT INTO `profit` VALUES (5, 1.00);
INSERT INTO `profit` VALUES (7, 1.10);
INSERT INTO `profit` VALUES (9, 1.10);
INSERT INTO `profit` VALUES (11, 0.02);
INSERT INTO `profit` VALUES (13, 0.02);
INSERT INTO `profit` VALUES (15, 0.02);
INSERT INTO `profit` VALUES (17, 0.10);
INSERT INTO `profit` VALUES (19, 0.10);
INSERT INTO `profit` VALUES (21, 0.05);
INSERT INTO `profit` VALUES (23, 0.05);
INSERT INTO `profit` VALUES (25, 0.05);
INSERT INTO `profit` VALUES (27, 0.20);
INSERT INTO `profit` VALUES (29, 0.20);
INSERT INTO `profit` VALUES (31, 0.09);
INSERT INTO `profit` VALUES (33, 0.09);
INSERT INTO `profit` VALUES (35, 0.09);
INSERT INTO `profit` VALUES (37, 0.32);
INSERT INTO `profit` VALUES (39, 0.32);
INSERT INTO `profit` VALUES (41, 0.35);
INSERT INTO `profit` VALUES (43, 0.35);
INSERT INTO `profit` VALUES (45, 0.35);
INSERT INTO `profit` VALUES (47, 0.88);
INSERT INTO `profit` VALUES (49, 0.88);
INSERT INTO `profit` VALUES (51, 1.00);
INSERT INTO `profit` VALUES (53, 1.00);
INSERT INTO `profit` VALUES (55, 1.00);
INSERT INTO `profit` VALUES (57, 1.10);
INSERT INTO `profit` VALUES (59, 1.10);
INSERT INTO `profit` VALUES (61, 0.02);
INSERT INTO `profit` VALUES (63, 0.02);
INSERT INTO `profit` VALUES (65, 0.02);
INSERT INTO `profit` VALUES (67, 0.10);
INSERT INTO `profit` VALUES (69, 0.10);
INSERT INTO `profit` VALUES (71, 0.05);
INSERT INTO `profit` VALUES (73, 0.05);
INSERT INTO `profit` VALUES (75, 0.05);
INSERT INTO `profit` VALUES (77, 0.20);
INSERT INTO `profit` VALUES (79, 0.20);
INSERT INTO `profit` VALUES (81, 0.09);
INSERT INTO `profit` VALUES (83, 0.09);
INSERT INTO `profit` VALUES (85, 0.09);
INSERT INTO `profit` VALUES (87, 0.32);
INSERT INTO `profit` VALUES (89, 0.32);
INSERT INTO `profit` VALUES (91, 0.35);
INSERT INTO `profit` VALUES (93, 0.35);
INSERT INTO `profit` VALUES (97, 0.88);
INSERT INTO `profit` VALUES (99, 0.88);
INSERT INTO `profit` VALUES (101, 1.00);
INSERT INTO `profit` VALUES (103, 1.00);
INSERT INTO `profit` VALUES (105, 1.00);
INSERT INTO `profit` VALUES (107, 1.10);
INSERT INTO `profit` VALUES (109, 1.10);
INSERT INTO `profit` VALUES (111, 0.02);
INSERT INTO `profit` VALUES (113, 0.02);
INSERT INTO `profit` VALUES (115, 0.02);
INSERT INTO `profit` VALUES (117, 0.10);
INSERT INTO `profit` VALUES (119, 0.10);
INSERT INTO `profit` VALUES (121, 0.05);
INSERT INTO `profit` VALUES (123, 0.05);
INSERT INTO `profit` VALUES (125, 0.05);
INSERT INTO `profit` VALUES (127, 0.20);
INSERT INTO `profit` VALUES (129, 0.20);
INSERT INTO `profit` VALUES (131, 0.09);
INSERT INTO `profit` VALUES (133, 0.09);
INSERT INTO `profit` VALUES (135, 0.09);
INSERT INTO `profit` VALUES (137, 0.32);
INSERT INTO `profit` VALUES (139, 0.32);
INSERT INTO `profit` VALUES (141, 0.35);
INSERT INTO `profit` VALUES (143, 0.35);
INSERT INTO `profit` VALUES (145, 0.35);
INSERT INTO `profit` VALUES (147, 0.88);
INSERT INTO `profit` VALUES (149, 0.88);
INSERT INTO `profit` VALUES (151, 1.00);
INSERT INTO `profit` VALUES (153, 1.98);
INSERT INTO `profit` VALUES (155, 1.00);
INSERT INTO `profit` VALUES (157, 1.10);
INSERT INTO `profit` VALUES (159, 1.10);
INSERT INTO `profit` VALUES (161, 0.02);
INSERT INTO `profit` VALUES (163, 0.02);
INSERT INTO `profit` VALUES (165, 0.02);
INSERT INTO `profit` VALUES (167, 0.10);
INSERT INTO `profit` VALUES (169, 0.10);
INSERT INTO `profit` VALUES (171, 0.05);
INSERT INTO `profit` VALUES (173, 0.05);
INSERT INTO `profit` VALUES (175, 0.05);
INSERT INTO `profit` VALUES (177, 0.20);
INSERT INTO `profit` VALUES (179, 0.20);
INSERT INTO `profit` VALUES (181, 0.09);
INSERT INTO `profit` VALUES (183, 0.09);
INSERT INTO `profit` VALUES (185, 0.09);
INSERT INTO `profit` VALUES (187, 0.32);
INSERT INTO `profit` VALUES (189, 0.32);
INSERT INTO `profit` VALUES (191, 0.35);
INSERT INTO `profit` VALUES (193, 0.35);
INSERT INTO `profit` VALUES (195, 0.35);
INSERT INTO `profit` VALUES (197, 0.88);
INSERT INTO `profit` VALUES (199, 0.88);
INSERT INTO `profit` VALUES (201, 0.75);
INSERT INTO `profit` VALUES (203, 1.00);
INSERT INTO `profit` VALUES (205, 1.00);
INSERT INTO `profit` VALUES (207, 1.10);
INSERT INTO `profit` VALUES (209, 1.10);
INSERT INTO `profit` VALUES (211, 0.02);
INSERT INTO `profit` VALUES (213, 0.02);
INSERT INTO `profit` VALUES (215, 0.02);
INSERT INTO `profit` VALUES (217, 0.10);
INSERT INTO `profit` VALUES (219, 0.10);
INSERT INTO `profit` VALUES (221, 0.05);
INSERT INTO `profit` VALUES (223, 0.05);
INSERT INTO `profit` VALUES (225, 0.05);
INSERT INTO `profit` VALUES (227, 0.20);
INSERT INTO `profit` VALUES (229, 0.20);
INSERT INTO `profit` VALUES (231, 0.09);
INSERT INTO `profit` VALUES (233, 0.09);
INSERT INTO `profit` VALUES (235, 0.09);
INSERT INTO `profit` VALUES (236, 1.00);
INSERT INTO `profit` VALUES (238, 1.00);
INSERT INTO `profit` VALUES (240, 1.00);
INSERT INTO `profit` VALUES (242, 1.10);
INSERT INTO `profit` VALUES (244, 1.10);
INSERT INTO `profit` VALUES (246, 0.02);
INSERT INTO `profit` VALUES (248, 0.02);
INSERT INTO `profit` VALUES (250, 0.02);
INSERT INTO `profit` VALUES (252, 0.10);
INSERT INTO `profit` VALUES (254, 0.10);
INSERT INTO `profit` VALUES (256, 0.05);
INSERT INTO `profit` VALUES (258, 0.05);
INSERT INTO `profit` VALUES (260, 0.05);
INSERT INTO `profit` VALUES (262, 0.20);
INSERT INTO `profit` VALUES (264, 0.20);
INSERT INTO `profit` VALUES (266, 0.09);
INSERT INTO `profit` VALUES (268, 0.09);
INSERT INTO `profit` VALUES (270, 0.09);
INSERT INTO `profit` VALUES (271, 1.00);
INSERT INTO `profit` VALUES (273, 1.00);
INSERT INTO `profit` VALUES (275, 1.00);
INSERT INTO `profit` VALUES (277, 1.10);
INSERT INTO `profit` VALUES (279, 1.10);
INSERT INTO `profit` VALUES (281, 0.02);
INSERT INTO `profit` VALUES (283, 0.02);
INSERT INTO `profit` VALUES (285, 0.02);
INSERT INTO `profit` VALUES (287, 0.10);
INSERT INTO `profit` VALUES (289, 0.10);
INSERT INTO `profit` VALUES (291, 0.05);
INSERT INTO `profit` VALUES (293, 0.05);
INSERT INTO `profit` VALUES (295, 0.05);
INSERT INTO `profit` VALUES (297, 0.20);
INSERT INTO `profit` VALUES (299, 0.20);
INSERT INTO `profit` VALUES (301, 0.09);
INSERT INTO `profit` VALUES (303, 0.09);
INSERT INTO `profit` VALUES (305, 0.09);
INSERT INTO `profit` VALUES (306, 1.00);
INSERT INTO `profit` VALUES (308, 1.00);
INSERT INTO `profit` VALUES (310, 1.00);
INSERT INTO `profit` VALUES (312, 1.10);
INSERT INTO `profit` VALUES (314, 1.10);
INSERT INTO `profit` VALUES (316, 0.02);
INSERT INTO `profit` VALUES (317, 1.00);
INSERT INTO `profit` VALUES (319, 1.00);
INSERT INTO `profit` VALUES (321, 1.00);
INSERT INTO `profit` VALUES (323, 1.10);
INSERT INTO `profit` VALUES (325, 1.10);
INSERT INTO `profit` VALUES (327, 0.02);
INSERT INTO `profit` VALUES (328, 2.00);
INSERT INTO `profit` VALUES (330, 2.00);
INSERT INTO `profit` VALUES (332, 2.00);
INSERT INTO `profit` VALUES (333, 2.00);
INSERT INTO `profit` VALUES (334, 2.00);
INSERT INTO `profit` VALUES (335, 3.00);
INSERT INTO `profit` VALUES (336, 3.00);
INSERT INTO `profit` VALUES (337, 3.00);
INSERT INTO `profit` VALUES (338, 4.00);
INSERT INTO `profit` VALUES (339, 4.00);
INSERT INTO `profit` VALUES (349, 2.00);
INSERT INTO `profit` VALUES (351, 0.05);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uId` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uPhone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户联系方式',
  `uNickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `uEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户邮箱',
  `uPassword` varchar(78) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `uIsVerify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否进行了实名验证',
  `uAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户校园的地址',
  `uLevel` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户评价等级',
  PRIMARY KEY (`uId`, `uEmail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (58, '15852869088', '123', '123.com', '$2a$10$jzgm0/UojSCEELN1y9EXhuuNJOtLBd8uZE5Qn3FFttSbvllCcAnIS', 0, '日本', 0);
INSERT INTO `user` VALUES (59, '18952533360', '456', '456.com', '$2a$10$sDVOP5C1hcgE8KhV6.3JN.KVIctsOvFUJyGk4MedqE6CutfytGpaq', 0, '东京', 0);

-- ----------------------------
-- Function structure for fun_init_profit
-- ----------------------------
DROP FUNCTION IF EXISTS `fun_init_profit`;
delimiter ;;
CREATE FUNCTION `fun_init_profit`()
 RETURNS varchar(50) CHARSET utf8mb4
  DETERMINISTIC
BEGIN
    DECLARE done INT DEFAULT 0;  
    DECLARE order_id INT;            
    DECLARE order_status TINYINT;    
    DECLARE order_amount DOUBLE;     
    DECLARE profit1 DOUBLE;          
    DECLARE factor FLOAT DEFAULT 0.01;
    DECLARE cur CURSOR FOR SELECT `order`.dId,`order`.dStatue,`order`.dAmount FROM `order` WHERE `order`.dStatue = 1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
		FETCH cur INTO order_id, order_status, order_amount; 
		WHILE done != 1 DO	
       IF order_status = 1 THEN
            SET profit1 = round(order_amount * factor,2);
            INSERT INTO profit VALUES (order_id, profit1);
       END IF;
	 FETCH cur INTO order_id, order_status, order_amount; 
    END WHILE;
    CLOSE cur;  
    RETURN '初始化完成';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_sLevel_by_uId
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_sLevel_by_uId`;
delimiter ;;
CREATE PROCEDURE `get_sLevel_by_uId`(IN `in_uId` int)
BEGIN
	select `goods`.uId,floor(avg(pSellerOfLevel)) as avgSellerLevel
	from `comment`,`goods`
	where `comment`.gId in (
		select `goods`.gId
		from `goods`
		where `goods`.uId = `in_uId`) and `goods`.gId = `comment`.gId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_user_by_token
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_user_by_token`;
delimiter ;;
CREATE PROCEDURE `get_user_by_token`(IN `in_token` varchar(255))
BEGIN
	  select `user`.*
		from `user`,`currentuser`
		where `user`.uId = `currentuser`.uId AND `currentuser`.token = `in_token`;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comment
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_update_goods_level`;
delimiter ;;
CREATE TRIGGER `trg_update_goods_level` AFTER INSERT ON `comment` FOR EACH ROW BEGIN 
     UPDATE `goods` SET gLevel = FLOOR((
		     SELECT AVG(pGoodsOfLevel) FROM `comment` 
			      WHERE `comment`.gId = NEW.gId))
     WHERE gId=NEW.gId;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comment
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_update_host_level`;
delimiter ;;
CREATE TRIGGER `trg_update_host_level` AFTER INSERT ON `comment` FOR EACH ROW BEGIN
    UPDATE `user` SET uLevel = FLOOR((
      SELECT AVG(pSellerOfLevel) FROM `comment` WHERE pId = NEW.pId))
      WHERE uId = (
      SELECT g.uId FROM `goods` g JOIN `comment` c WHERE g.gId=c.gId AND c.pId=NEW.pId);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table goods
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_delete_comments`;
delimiter ;;
CREATE TRIGGER `trg_delete_comments` AFTER DELETE ON `goods` FOR EACH ROW begin
  delete from `comment` where `comment`.gId = old.gId;
	
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_check_inventory`;
delimiter ;;
CREATE TRIGGER `trg_check_inventory` BEFORE INSERT ON `order` FOR EACH ROW BEGIN
    DECLARE vCount INT;
    
    SELECT gCount INTO vCount FROM `goods` WHERE gId = NEW.gId;
    
-- 订单的商品数量大于商品的库存量时，触发器会使用 SIGNAL 语句来返回 SQLSTATE '45000'，表示自定义的异常状态，同时设置 MESSAGE_TEXT 为 '商品库存不足'，表示异常信息
		IF NEW.dCount > vCount THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = '商品库存不足';
    ELSE
        UPDATE `goods` SET gCount = vCount - NEW.dCount WHERE gId = NEW.gId;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_calc_profit1`;
delimiter ;;
CREATE TRIGGER `trg_calc_profit1` AFTER INSERT ON `order` FOR EACH ROW BEGIN
     IF NEW.dStatue = 1 THEN
          INSERT INTO profit (dId,profit) VALUES (NEW.dId,round(NEW.dAmount * 0.01,2));
END IF;
     
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_calc_profit2`;
delimiter ;;
CREATE TRIGGER `trg_calc_profit2` AFTER UPDATE ON `order` FOR EACH ROW BEGIN
     IF NEW.dStatue = 1 AND OLD.dStatue = 0 THEN
          INSERT INTO profit (dId,profit) VALUES (NEW.dId,round(NEW.dAmount * 0.01,2));
END IF;
     
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
