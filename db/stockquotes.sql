/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : stockquotes

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-08-10 16:13:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for stockdailyquotes
-- ----------------------------
DROP TABLE IF EXISTS `stockdailyquotes`;
CREATE TABLE `stockdailyquotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockCode` varchar(10) NOT NULL,
  `stockSuffix` varchar(2) NOT NULL,
  `stockName` varchar(10) NOT NULL,
  `open` decimal(11,2) NOT NULL,
  `high` decimal(11,2) NOT NULL,
  `low` decimal(11,2) NOT NULL,
  `close` decimal(11,2) NOT NULL,
  `volume` int(11) NOT NULL,
  `tradingDate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockdailyquotes
-- ----------------------------
INSERT INTO `stockdailyquotes` VALUES ('211', '000001', 'sz', '平安银行', '10.71', '10.75', '10.64', '10.64', '41838792', '1459353600');
INSERT INTO `stockdailyquotes` VALUES ('212', '000001', 'sz', '平安银行', '10.48', '10.70', '10.47', '10.70', '53970000', '1459267200');
INSERT INTO `stockdailyquotes` VALUES ('213', '000001', 'sz', '平安银行', '10.51', '10.52', '10.38', '10.43', '31831788', '1459180800');
INSERT INTO `stockdailyquotes` VALUES ('214', '000001', 'sz', '平安银行', '10.62', '10.65', '10.45', '10.48', '35862100', '1459094400');
INSERT INTO `stockdailyquotes` VALUES ('215', '000001', 'sz', '平安银行', '10.51', '10.60', '10.50', '10.59', '23707048', '1458835200');
INSERT INTO `stockdailyquotes` VALUES ('216', '000001', 'sz', '平安银行', '10.61', '10.63', '10.50', '10.52', '37240624', '1458748800');
INSERT INTO `stockdailyquotes` VALUES ('217', '000001', 'sz', '平安银行', '10.71', '10.77', '10.61', '10.70', '43027816', '1458662400');
INSERT INTO `stockdailyquotes` VALUES ('218', '000001', 'sz', '平安银行', '10.77', '10.94', '10.69', '10.72', '62548248', '1458576000');
INSERT INTO `stockdailyquotes` VALUES ('219', '000001', 'sz', '平安银行', '10.55', '10.86', '10.55', '10.80', '92043280', '1458489600');
INSERT INTO `stockdailyquotes` VALUES ('220', '000001', 'sz', '平安银行', '10.42', '10.57', '10.40', '10.54', '79721584', '1458230400');
INSERT INTO `stockdailyquotes` VALUES ('221', '000001', 'sz', '平安银行', '10.36', '10.48', '10.30', '10.42', '61099640', '1458144000');
INSERT INTO `stockdailyquotes` VALUES ('222', '000001', 'sz', '平安银行', '10.27', '10.45', '10.25', '10.35', '66488620', '1458057600');
INSERT INTO `stockdailyquotes` VALUES ('223', '000001', 'sz', '平安银行', '10.28', '10.36', '10.16', '10.32', '41792036', '1457971200');
INSERT INTO `stockdailyquotes` VALUES ('224', '000001', 'sz', '平安银行', '10.21', '10.46', '10.21', '10.26', '65515824', '1457884800');
INSERT INTO `stockdailyquotes` VALUES ('225', '000001', 'sz', '平安银行', '10.10', '10.22', '10.04', '10.16', '38373672', '1457625600');
INSERT INTO `stockdailyquotes` VALUES ('226', '000001', 'sz', '平安银行', '10.24', '10.35', '10.13', '10.15', '47402032', '1457539200');
INSERT INTO `stockdailyquotes` VALUES ('227', '000001', 'sz', '平安银行', '10.14', '10.22', '10.04', '10.17', '32590064', '1457452800');
INSERT INTO `stockdailyquotes` VALUES ('228', '000001', 'sz', '平安银行', '10.36', '10.36', '9.94', '10.28', '64315648', '1457366400');
INSERT INTO `stockdailyquotes` VALUES ('229', '000001', 'sz', '平安银行', '10.35', '10.49', '10.30', '10.34', '60635296', '1457280000');
INSERT INTO `stockdailyquotes` VALUES ('230', '000001', 'sz', '平安银行', '10.09', '10.50', '10.07', '10.40', '138124912', '1457020800');
INSERT INTO `stockdailyquotes` VALUES ('231', '000001', 'sz', '平安银行', '10.09', '10.18', '10.04', '10.11', '55308940', '1456934400');
INSERT INTO `stockdailyquotes` VALUES ('232', '000001', 'sz', '平安银行', '9.75', '10.13', '9.72', '10.10', '67661376', '1456848000');
INSERT INTO `stockdailyquotes` VALUES ('233', '000001', 'sz', '平安银行', '9.62', '9.77', '9.58', '9.70', '37791080', '1456761600');
INSERT INTO `stockdailyquotes` VALUES ('234', '000001', 'sz', '平安银行', '9.79', '9.81', '9.42', '9.56', '56689640', '1456675200');
INSERT INTO `stockdailyquotes` VALUES ('235', '000001', 'sz', '平安银行', '9.77', '9.83', '9.66', '9.79', '39215440', '1456416000');
INSERT INTO `stockdailyquotes` VALUES ('236', '000001', 'sz', '平安银行', '10.12', '10.13', '9.60', '9.67', '62207284', '1456329600');
INSERT INTO `stockdailyquotes` VALUES ('237', '000001', 'sz', '平安银行', '10.06', '10.15', '10.01', '10.15', '30010360', '1456243200');
INSERT INTO `stockdailyquotes` VALUES ('238', '000001', 'sz', '平安银行', '10.29', '10.29', '10.05', '10.12', '42587436', '1456156800');
INSERT INTO `stockdailyquotes` VALUES ('239', '000001', 'sz', '平安银行', '10.13', '10.31', '10.06', '10.29', '61773944', '1456070400');
INSERT INTO `stockdailyquotes` VALUES ('240', '000001', 'sz', '平安银行', '10.09', '10.14', '9.99', '10.04', '31889824', '1455811200');
INSERT INTO `stockdailyquotes` VALUES ('241', '000001', 'sz', '平安银行', '10.18', '10.22', '10.09', '10.09', '40617824', '1455724800');
INSERT INTO `stockdailyquotes` VALUES ('242', '000001', 'sz', '平安银行', '10.03', '10.22', '9.99', '10.15', '58516704', '1455638400');
INSERT INTO `stockdailyquotes` VALUES ('243', '000001', 'sz', '平安银行', '9.84', '10.03', '9.83', '10.01', '42838640', '1455552000');
INSERT INTO `stockdailyquotes` VALUES ('244', '000001', 'sz', '平安银行', '9.66', '9.85', '9.65', '9.79', '27849946', '1455465600');
INSERT INTO `stockdailyquotes` VALUES ('245', '000001', 'sz', '平安银行', '9.96', '9.97', '9.91', '9.92', '27089334', '1454601600');
INSERT INTO `stockdailyquotes` VALUES ('246', '000001', 'sz', '平安银行', '9.89', '10.00', '9.88', '9.95', '37309948', '1454515200');
INSERT INTO `stockdailyquotes` VALUES ('247', '000001', 'sz', '平安银行', '9.85', '9.89', '9.77', '9.85', '27457216', '1454428800');
INSERT INTO `stockdailyquotes` VALUES ('248', '000001', 'sz', '平安银行', '9.80', '10.03', '9.78', '9.95', '36910416', '1454342400');
INSERT INTO `stockdailyquotes` VALUES ('249', '000001', 'sz', '平安银行', '9.98', '10.01', '9.74', '9.80', '41773216', '1454256000');
INSERT INTO `stockdailyquotes` VALUES ('250', '000001', 'sz', '平安银行', '9.74', '10.08', '9.69', '10.00', '54443576', '1453996800');
INSERT INTO `stockdailyquotes` VALUES ('251', '000001', 'sz', '平安银行', '9.82', '9.89', '9.65', '9.69', '30254078', '1453910400');
INSERT INTO `stockdailyquotes` VALUES ('252', '000001', 'sz', '平安银行', '9.93', '9.98', '9.60', '9.88', '56903704', '1453824000');
INSERT INTO `stockdailyquotes` VALUES ('253', '000001', 'sz', '平安银行', '10.32', '10.32', '9.86', '9.87', '64790112', '1453737600');
INSERT INTO `stockdailyquotes` VALUES ('254', '000001', 'sz', '平安银行', '10.40', '10.44', '10.33', '10.37', '37643172', '1453651200');
INSERT INTO `stockdailyquotes` VALUES ('255', '000001', 'sz', '平安银行', '10.40', '10.45', '10.22', '10.40', '46675216', '1453392000');
INSERT INTO `stockdailyquotes` VALUES ('256', '000001', 'sz', '平安银行', '10.48', '10.75', '10.32', '10.32', '60614512', '1453305600');
INSERT INTO `stockdailyquotes` VALUES ('257', '000001', 'sz', '平安银行', '10.70', '10.80', '10.44', '10.54', '60375248', '1453219200');
INSERT INTO `stockdailyquotes` VALUES ('258', '000001', 'sz', '平安银行', '10.45', '10.78', '10.41', '10.71', '50110908', '1453132800');
INSERT INTO `stockdailyquotes` VALUES ('259', '000001', 'sz', '平安银行', '10.34', '10.56', '10.30', '10.41', '42104088', '1453046400');
INSERT INTO `stockdailyquotes` VALUES ('260', '000001', 'sz', '平安银行', '10.66', '10.80', '10.42', '10.46', '44820216', '1452787200');
INSERT INTO `stockdailyquotes` VALUES ('261', '000001', 'sz', '平安银行', '10.59', '10.80', '10.48', '10.77', '66631456', '1452700800');
INSERT INTO `stockdailyquotes` VALUES ('262', '000001', 'sz', '平安银行', '10.89', '10.94', '10.70', '10.71', '39170948', '1452614400');
INSERT INTO `stockdailyquotes` VALUES ('263', '000001', 'sz', '平安银行', '10.83', '10.91', '10.64', '10.81', '56164232', '1452528000');
INSERT INTO `stockdailyquotes` VALUES ('264', '000001', 'sz', '平安银行', '11.00', '11.08', '10.68', '10.76', '73201400', '1452441600');
INSERT INTO `stockdailyquotes` VALUES ('265', '000001', 'sz', '平安银行', '11.21', '11.29', '10.90', '11.12', '74752760', '1452182400');
INSERT INTO `stockdailyquotes` VALUES ('266', '000001', 'sz', '平安银行', '11.41', '11.41', '10.91', '10.94', '17476110', '1452096000');
INSERT INTO `stockdailyquotes` VALUES ('267', '000001', 'sz', '平安银行', '11.42', '11.56', '11.39', '11.53', '51570644', '1452009600');
INSERT INTO `stockdailyquotes` VALUES ('268', '000001', 'sz', '平安银行', '11.27', '11.57', '11.15', '11.40', '66326996', '1451923200');
INSERT INTO `stockdailyquotes` VALUES ('269', '000001', 'sz', '平安银行', '12.00', '12.03', '11.23', '11.33', '56349788', '1451836800');
