/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50015
Source Host           : localhost:3306
Source Database       : questionnaire_survey

Target Server Type    : MYSQL
Target Server Version : 50015
File Encoding         : 65001

Date: 2018-05-13 11:11:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `account` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '1234', 'admin');

-- ----------------------------
-- Table structure for checkbox_answer_count
-- ----------------------------
DROP TABLE IF EXISTS `checkbox_answer_count`;
CREATE TABLE `checkbox_answer_count` (
  `checkbox_answer_count_id` varchar(255) NOT NULL,
  `checkbox_answer_count` int(255) default NULL,
  `design_checkbox_option_id` varchar(255) default NULL,
  PRIMARY KEY  (`checkbox_answer_count_id`),
  KEY `foreign key_design_checkbox_option_id` (`design_checkbox_option_id`),
  CONSTRAINT `foreign key_design_checkbox_option_id` FOREIGN KEY (`design_checkbox_option_id`) REFERENCES `design_checkbox_option` (`design_checkbox_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkbox_answer_count
-- ----------------------------

-- ----------------------------
-- Table structure for design_checkbox
-- ----------------------------
DROP TABLE IF EXISTS `design_checkbox`;
CREATE TABLE `design_checkbox` (
  `design_checkbox_id` varchar(255) NOT NULL,
  `design_checkbox_content` varchar(255) default NULL,
  PRIMARY KEY  (`design_checkbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of design_checkbox
-- ----------------------------
INSERT INTO `design_checkbox` VALUES ('1dd6ca21-4477-44ac-8baa-99c36204bfeb', '您最喜欢XX公众号的哪个功能？');
INSERT INTO `design_checkbox` VALUES ('1e21ef8e-72f0-445e-bfa2-e7d50c72d31a', '测试多选题');
INSERT INTO `design_checkbox` VALUES ('dd493e0b-a692-4703-a704-0961785ee3e0', '您最喜欢XX公众号哪些方面的消息推送？');

-- ----------------------------
-- Table structure for design_checkbox_option
-- ----------------------------
DROP TABLE IF EXISTS `design_checkbox_option`;
CREATE TABLE `design_checkbox_option` (
  `design_checkbox_option_id` varchar(255) NOT NULL,
  `design_checkbox_id` varchar(255) default NULL,
  `design_checkbox_order` int(255) default NULL,
  `design_checkbox_option_content` varchar(255) default NULL,
  PRIMARY KEY  (`design_checkbox_option_id`),
  KEY `foreign key_design_checkbox_id` (`design_checkbox_id`),
  CONSTRAINT `foreign key_design_checkbox_id` FOREIGN KEY (`design_checkbox_id`) REFERENCES `design_checkbox` (`design_checkbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of design_checkbox_option
-- ----------------------------
INSERT INTO `design_checkbox_option` VALUES ('2ccbb77a-e271-41ae-a083-8316efc0b1cd', '1e21ef8e-72f0-445e-bfa2-e7d50c72d31a', '2', '2');
INSERT INTO `design_checkbox_option` VALUES ('2d171281-a7db-45fd-82f2-a8a71e3f2c1b', '1dd6ca21-4477-44ac-8baa-99c36204bfeb', '1', '查成绩');
INSERT INTO `design_checkbox_option` VALUES ('3502f400-404e-4f79-8154-fdb40681acc5', '1e21ef8e-72f0-445e-bfa2-e7d50c72d31a', '3', '3');
INSERT INTO `design_checkbox_option` VALUES ('4794ae18-e69e-41b6-90d2-8ec0be154e42', '1e21ef8e-72f0-445e-bfa2-e7d50c72d31a', '4', '4');
INSERT INTO `design_checkbox_option` VALUES ('4a763913-4993-4549-a4cb-7bf4a89c674b', 'dd493e0b-a692-4703-a704-0961785ee3e0', '3', '原创文章');
INSERT INTO `design_checkbox_option` VALUES ('579dba5b-f344-428f-9dec-b1c07feac058', '1e21ef8e-72f0-445e-bfa2-e7d50c72d31a', '1', '1');
INSERT INTO `design_checkbox_option` VALUES ('a3eb221e-e6fd-42cc-8ca2-1b5c7d941b31', 'dd493e0b-a692-4703-a704-0961785ee3e0', '1', '学校通知');
INSERT INTO `design_checkbox_option` VALUES ('b534362d-ba42-4bfe-9746-b4138d39825b', '1dd6ca21-4477-44ac-8baa-99c36204bfeb', '2', '校花校草');
INSERT INTO `design_checkbox_option` VALUES ('c0e50dfe-ea07-429d-bbdc-1e7fb6eb82ad', '1dd6ca21-4477-44ac-8baa-99c36204bfeb', '4', '校园街景');
INSERT INTO `design_checkbox_option` VALUES ('e4e9fec5-53c5-4646-9b40-832cab366113', '1dd6ca21-4477-44ac-8baa-99c36204bfeb', '3', '表白墙');
INSERT INTO `design_checkbox_option` VALUES ('fae0e4d5-e24f-4eae-ac92-38e7cf06d06d', 'dd493e0b-a692-4703-a704-0961785ee3e0', '2', '社团活动');

-- ----------------------------
-- Table structure for design_single
-- ----------------------------
DROP TABLE IF EXISTS `design_single`;
CREATE TABLE `design_single` (
  `design_single_id` varchar(255) NOT NULL,
  `design_single_content` varchar(255) default NULL,
  PRIMARY KEY  (`design_single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of design_single
-- ----------------------------
INSERT INTO `design_single` VALUES ('1a2cd3a6-a4fc-4798-86b3-01787cd2f767', '薛中然公众号粉丝调查');
INSERT INTO `design_single` VALUES ('2ed4ac51-3afc-48d4-b196-6425282fe225', '测试单选题');
INSERT INTO `design_single` VALUES ('4d1e0233-b57e-44ab-bbe4-13fadc0fbe20', '您关注了多少个公众号？');
INSERT INTO `design_single` VALUES ('7d3df5a3-6d27-4719-803f-d8024ae2de52', '您觉得XX公众号推送频率多少可以接受？');
INSERT INTO `design_single` VALUES ('a57085e5-7d7a-41d9-a664-4c797441d773', '您最喜欢什么形式的消息推送？');
INSERT INTO `design_single` VALUES ('f4eb0114-ebb4-4687-97e3-29474c6d74ae', '您一般在什么时间查看我们的推送内容？');

-- ----------------------------
-- Table structure for design_single_option
-- ----------------------------
DROP TABLE IF EXISTS `design_single_option`;
CREATE TABLE `design_single_option` (
  `design_single_option_id` varchar(255) NOT NULL,
  `design_single_id` varchar(255) default NULL,
  `design_single_order` int(255) default NULL,
  `design_single_option_content` varchar(255) default NULL,
  PRIMARY KEY  (`design_single_option_id`),
  KEY `foreign key_design_single_id` (`design_single_id`),
  CONSTRAINT `foreign key_design_single_id` FOREIGN KEY (`design_single_id`) REFERENCES `design_single` (`design_single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of design_single_option
-- ----------------------------
INSERT INTO `design_single_option` VALUES ('005e08b7-b9f4-4c39-8d7c-1885877091f0', '4d1e0233-b57e-44ab-bbe4-13fadc0fbe20', '1', '10个以内');
INSERT INTO `design_single_option` VALUES ('12cf368d-eb9f-49a7-8dff-81ab771d73b1', '7d3df5a3-6d27-4719-803f-d8024ae2de52', '3', '一周两次');
INSERT INTO `design_single_option` VALUES ('1711f637-6e33-4377-880e-40b49227ba72', 'f4eb0114-ebb4-4687-97e3-29474c6d74ae', '1', '早上起床后');
INSERT INTO `design_single_option` VALUES ('2676fd6e-959c-479b-9e2d-30416abe3486', '1a2cd3a6-a4fc-4798-86b3-01787cd2f767', '2', '相关文章');
INSERT INTO `design_single_option` VALUES ('3095e403-ed26-48d4-8de5-b586c6a7aca5', '7d3df5a3-6d27-4719-803f-d8024ae2de52', '1', '每天一次');
INSERT INTO `design_single_option` VALUES ('41749b03-b7c8-47dc-a034-93c346d956bc', 'a57085e5-7d7a-41d9-a664-4c797441d773', '3', '视频消息');
INSERT INTO `design_single_option` VALUES ('43166a6a-e0ba-43d2-ace4-9bf213b9228c', '1a2cd3a6-a4fc-4798-86b3-01787cd2f767', '3', '二维码扫描');
INSERT INTO `design_single_option` VALUES ('4e0a93e2-30e2-4687-9321-8c202da21c8d', 'a57085e5-7d7a-41d9-a664-4c797441d773', '2', '图文欣赏');
INSERT INTO `design_single_option` VALUES ('5d929e1d-b039-4ee8-b14a-454c00d7e54f', 'f4eb0114-ebb4-4687-97e3-29474c6d74ae', '4', '晚上睡觉前');
INSERT INTO `design_single_option` VALUES ('68583a39-192a-473a-aac9-c968c3a58bc1', '7d3df5a3-6d27-4719-803f-d8024ae2de52', '4', '一周一次');
INSERT INTO `design_single_option` VALUES ('70c27d53-5ccf-47cf-a353-9f3e747a6488', '2ed4ac51-3afc-48d4-b196-6425282fe225', '1', '1');
INSERT INTO `design_single_option` VALUES ('75fdcce6-3bf0-41aa-9374-95e9ffb5339f', '2ed4ac51-3afc-48d4-b196-6425282fe225', '4', '4');
INSERT INTO `design_single_option` VALUES ('84752eed-3d9b-4b47-9d91-c7679f138170', '7d3df5a3-6d27-4719-803f-d8024ae2de52', '2', '两天一次');
INSERT INTO `design_single_option` VALUES ('8e0d9c53-0a1a-4c79-a55c-7f93618dae26', '1a2cd3a6-a4fc-4798-86b3-01787cd2f767', '1', '朋友推荐');
INSERT INTO `design_single_option` VALUES ('98c57551-9fe4-4290-8e5c-7c475b878499', 'a57085e5-7d7a-41d9-a664-4c797441d773', '4', '语音消息');
INSERT INTO `design_single_option` VALUES ('a0299a61-6315-444e-88e9-04809af0d7eb', '2ed4ac51-3afc-48d4-b196-6425282fe225', '2', '2');
INSERT INTO `design_single_option` VALUES ('a5b3f76d-d38e-4b86-be18-045493907c0d', '2ed4ac51-3afc-48d4-b196-6425282fe225', '3', '3');
INSERT INTO `design_single_option` VALUES ('b98086eb-361d-4cb4-b98b-bbe47b4abc88', '1a2cd3a6-a4fc-4798-86b3-01787cd2f767', '4', '主动搜索');
INSERT INTO `design_single_option` VALUES ('cc34f0bb-ee6d-4e15-8465-6641ffbb6ee0', '4d1e0233-b57e-44ab-bbe4-13fadc0fbe20', '2', '10—20个');
INSERT INTO `design_single_option` VALUES ('cda18c7f-759a-4e7c-9d46-adc362859563', '4d1e0233-b57e-44ab-bbe4-13fadc0fbe20', '3', '太多了，没有数过');
INSERT INTO `design_single_option` VALUES ('d1f3224b-ff9b-4bda-8d5f-bd54be3c2b1f', 'a57085e5-7d7a-41d9-a664-4c797441d773', '1', '纯文字');
INSERT INTO `design_single_option` VALUES ('e1d91a27-e9f0-4fb1-85b6-125289ecfcd8', 'f4eb0114-ebb4-4687-97e3-29474c6d74ae', '2', '中午休息时');
INSERT INTO `design_single_option` VALUES ('faa8a920-a895-4684-81ab-5d3561b79683', 'f4eb0114-ebb4-4687-97e3-29474c6d74ae', '3', '上课时间');

-- ----------------------------
-- Table structure for design_templet
-- ----------------------------
DROP TABLE IF EXISTS `design_templet`;
CREATE TABLE `design_templet` (
  `design_templet_id` varchar(255) NOT NULL,
  `design_templet_name` varchar(255) default NULL,
  `finish_time` datetime default NULL,
  `start_recovery_time` datetime default NULL,
  `end_recovery_time` datetime default NULL,
  `state` int(255) default NULL,
  `link` varchar(255) default NULL,
  `user_id` varchar(255) default NULL,
  PRIMARY KEY  (`design_templet_id`),
  KEY `foreign key_user_id` (`user_id`),
  CONSTRAINT `foreign key_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of design_templet
-- ----------------------------
INSERT INTO `design_templet` VALUES ('3681c296-7a0a-45fa-9724-09716438aa04', '薛中然公众号粉丝调查', '2018-05-08 18:04:43', null, null, '1', null, '6e100bfb-9f08-4643-b328-cf0bc7078e54');

-- ----------------------------
-- Table structure for design_templet_index
-- ----------------------------
DROP TABLE IF EXISTS `design_templet_index`;
CREATE TABLE `design_templet_index` (
  `design_templet_index_id` varchar(255) NOT NULL,
  `design_templet_index_sign` int(255) default NULL,
  `design_templet_index_order` int(255) default NULL,
  `design_exercise_id` varchar(255) default NULL,
  `design_templet_id` varchar(255) default NULL,
  PRIMARY KEY  (`design_templet_index_id`),
  KEY `foreign key_design_templet_id` (`design_templet_id`),
  CONSTRAINT `foreign key_design_templet_id` FOREIGN KEY (`design_templet_id`) REFERENCES `design_templet` (`design_templet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of design_templet_index
-- ----------------------------
INSERT INTO `design_templet_index` VALUES ('0799fc91-5228-47d7-9558-4813bf254788', '3', '4', '973f7fab-ac50-4b74-bd59-b10cf5988b20', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('09e2bee0-4b93-47af-b769-8a6a52a5c96b', '1', '2', 'f4eb0114-ebb4-4687-97e3-29474c6d74ae', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('2e06db82-44d1-427d-8a33-0ed2c6161964', '3', '5', '24ae05c9-0f56-45c0-9182-753d3b003fd0', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('3dcc83f8-245c-4eb7-908d-972f0d870827', '1', '4', '7d3df5a3-6d27-4719-803f-d8024ae2de52', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('49c90322-109e-4c5d-9bdd-9a0974efacbf', '3', '3', '3a8106de-c8a4-44fb-bede-a4cb680a5b85', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('50b64c22-eb07-4564-b5b8-fb3109b9acd4', '3', '1', '938d9d77-b035-419a-9379-28368d2386d9', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('5d0015ae-6441-4e94-bd0d-5da9c7dc523d', '1', '5', '4d1e0233-b57e-44ab-bbe4-13fadc0fbe20', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('6df6104a-00f8-451c-af3a-bef241b95980', '1', '6', '2ed4ac51-3afc-48d4-b196-6425282fe225', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('75e8a29c-d934-46cd-9a78-91a50d4aa915', '1', '1', '1a2cd3a6-a4fc-4798-86b3-01787cd2f767', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('921b674c-c096-40b9-ac32-de18d910d92b', '2', '3', '1e21ef8e-72f0-445e-bfa2-e7d50c72d31a', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('9b152448-f1ed-4f2a-a41b-6a42482a96dc', '2', '2', 'dd493e0b-a692-4703-a704-0961785ee3e0', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('bf56c3da-6aa0-4e4e-b948-12203f9d3e50', '1', '3', 'a57085e5-7d7a-41d9-a664-4c797441d773', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('e58674cf-e152-4840-91f7-8fb7974150c4', '3', '2', 'e3d51bd4-b9e5-40bb-a0ec-da5484ebeef8', '3681c296-7a0a-45fa-9724-09716438aa04');
INSERT INTO `design_templet_index` VALUES ('f56c0755-23dc-4eee-8322-bfdf52fd71e4', '2', '1', '1dd6ca21-4477-44ac-8baa-99c36204bfeb', '3681c296-7a0a-45fa-9724-09716438aa04');

-- ----------------------------
-- Table structure for design_text
-- ----------------------------
DROP TABLE IF EXISTS `design_text`;
CREATE TABLE `design_text` (
  `design_text_id` varchar(255) NOT NULL,
  `design_text_content` varchar(255) default NULL,
  PRIMARY KEY  (`design_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of design_text
-- ----------------------------
INSERT INTO `design_text` VALUES ('24ae05c9-0f56-45c0-9182-753d3b003fd0', '测试文本题');
INSERT INTO `design_text` VALUES ('3a8106de-c8a4-44fb-bede-a4cb680a5b85', '您的昵称是？');
INSERT INTO `design_text` VALUES ('938d9d77-b035-419a-9379-28368d2386d9', '您希望我们公众号新增什么板块/功能？');
INSERT INTO `design_text` VALUES ('973f7fab-ac50-4b74-bd59-b10cf5988b20', '您的联系方式（方便奖品发放）是？');
INSERT INTO `design_text` VALUES ('e3d51bd4-b9e5-40bb-a0ec-da5484ebeef8', '您对我们的公众号有什么意见或建议？');

-- ----------------------------
-- Table structure for dict_checkbox
-- ----------------------------
DROP TABLE IF EXISTS `dict_checkbox`;
CREATE TABLE `dict_checkbox` (
  `dict_checkbox_id` varchar(255) NOT NULL,
  `dict_checkbox_content` varchar(255) default NULL,
  PRIMARY KEY  (`dict_checkbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_checkbox
-- ----------------------------
INSERT INTO `dict_checkbox` VALUES ('006e7817-516b-45dc-bb98-ac608a621bb7', '您是否希望在就餐时有以下音乐伴随？');
INSERT INTO `dict_checkbox` VALUES ('1055edfa-dffe-4da5-911c-f121f88885a4', '你参与过以下哪些购物网站的“双十一”狂欢活动？');
INSERT INTO `dict_checkbox` VALUES ('14df2952-2d19-44ee-909b-a2d3b0a0b967', '您平时习惯在以下哪里讨论游戏？');
INSERT INTO `dict_checkbox` VALUES ('17ffc543-621a-4dc5-9a6f-0802f727621f', '你目前所使用的手机通信运营商');
INSERT INTO `dict_checkbox` VALUES ('1b35ccf1-da02-473a-a821-1e6cfcabb338', '您最近两个月网购过下列哪些种类的商品？');
INSERT INTO `dict_checkbox` VALUES ('1f6c691f-ca33-4d4a-9746-e76978f4379b', '咖啡吧，您希望咖啡吧提供哪些出品？');
INSERT INTO `dict_checkbox` VALUES ('20d7ea58-e287-4b73-8b39-4e1f435a1b66', '您选择某一网站主要看中的因素？');
INSERT INTO `dict_checkbox` VALUES ('23a42994-94fc-46ce-9ad9-a1e3c96f7e11', '您觉得本餐厅最大的三个特点是？');
INSERT INTO `dict_checkbox` VALUES ('2503be90-00a4-404f-b0ce-1c6b955bd0b6', '您目前通常会在哪些网上商城上购物？');
INSERT INTO `dict_checkbox` VALUES ('29b1d238-21fd-453b-aa2e-ae1afee12d86', '您选择网络购物的原因？');
INSERT INTO `dict_checkbox` VALUES ('33590734-5eb1-4a72-9015-86df802db0b8', '您最喜欢XX公众号的哪个功能？');
INSERT INTO `dict_checkbox` VALUES ('39f0bf92-4830-4013-9b42-7fddd7094c3f', '你通过哪种途径得知网的“双十一”广告？');
INSERT INTO `dict_checkbox` VALUES ('3d2a7ca4-f611-464c-beb9-eb23f9299d23', '您经常选择的就餐地点？');
INSERT INTO `dict_checkbox` VALUES ('3d35a24e-9778-44eb-948a-b60af15c6477', '下列哪种方式会让您对某一款游戏感兴趣？（最多选三项）');
INSERT INTO `dict_checkbox` VALUES ('3f065301-165d-4346-84e2-86fc3703646d', '在您的外卖经历中，您觉得存在的哪些问题是？');
INSERT INTO `dict_checkbox` VALUES ('4b0aa915-f930-42ca-8d4b-075165754e09', '在您就餐过程中，最关心的是？');
INSERT INTO `dict_checkbox` VALUES ('4bcbcb4c-a36e-42af-9ab0-89e6c2fe0744', '您是否需要以下增值服务？');
INSERT INTO `dict_checkbox` VALUES ('4c26248f-ada6-42ab-915b-887b99a7fcf9', '以下菜品中，哪类是您更常品尝的款式？');
INSERT INTO `dict_checkbox` VALUES ('4e3fc384-4c45-44b0-92be-950f4e11e236', '你一般选择哪些途径进行网络购物？');
INSERT INTO `dict_checkbox` VALUES ('56b90015-b498-42e7-8942-3a59a566ed61', '以下哪些因素会刺激你在旅游电子商务网站中消费');
INSERT INTO `dict_checkbox` VALUES ('58653180-6269-4b25-9833-5257dc9b18b8', '您在本餐厅进餐时，最关心的问题是？');
INSERT INTO `dict_checkbox` VALUES ('58b00776-c741-4d9d-ae4b-b3e8fc46fa7a', '你希望未来的手机游戏是怎样的？');
INSERT INTO `dict_checkbox` VALUES ('5cc1be21-5a68-4349-a373-74feb2be09f6', '您认为哪些情况使你在《xx》中感到快乐？');
INSERT INTO `dict_checkbox` VALUES ('662c784f-5a59-48a7-b3b1-88cab73306de', '你在“双十一”消费中遇到过哪些问题？');
INSERT INTO `dict_checkbox` VALUES ('66aaeadf-0f00-4a27-8b83-9387d0dc9867', '您最喜欢XX公众号哪些方面的消息推送？');
INSERT INTO `dict_checkbox` VALUES ('66b07e8b-3cc6-445a-b69e-c97ce2f0aee5', '您出外就餐的主要原因是？');
INSERT INTO `dict_checkbox` VALUES ('6ce488f4-a2c4-4258-a812-c9840f859997', '您希望我们提供哪个时段供餐？');
INSERT INTO `dict_checkbox` VALUES ('6ef8712a-cb03-4178-b60d-72a32553ca53', '您对网购的礼物最不满意或最担心的是？');
INSERT INTO `dict_checkbox` VALUES ('798ed145-c127-498e-bb6a-a60a997d1278', '玩手机游戏时，你会关注它的开发商和运营商？');
INSERT INTO `dict_checkbox` VALUES ('7bfb1d58-a330-4492-b306-38f149138a7e', 'VIP包间，您希望我们提供哪些服务？');
INSERT INTO `dict_checkbox` VALUES ('7e1c931a-a66a-473e-b193-5960f852cd02', '您经常在外就餐的原因?');
INSERT INTO `dict_checkbox` VALUES ('8008672d-ed22-4942-a71f-c3ecb18b55c3', '在xx餐厅就餐前，您是通过什么途径得知我们的 ?');
INSERT INTO `dict_checkbox` VALUES ('906327df-871c-4864-b667-1e4410cf01db', '你认为目前手机游戏有哪些不足');
INSERT INTO `dict_checkbox` VALUES ('90f65005-92ed-43be-af64-96433b287cb7', '您会对哪些手机游戏相关内容感兴趣？（最多选三项）');
INSERT INTO `dict_checkbox` VALUES ('9986762c-a6ae-425b-b486-e51d699a8a41', '如果开通在线外卖功能，您餐厅愿意进行哪些宣传推广的措施呢？');
INSERT INTO `dict_checkbox` VALUES ('a076a988-cbd6-45b1-a0e0-b6b0569fa114', '您最喜欢的手机游戏画面风格是');
INSERT INTO `dict_checkbox` VALUES ('a1638daa-b1ca-43e4-a6ec-d32ad583681f', '您喜欢哪类型的外卖餐饮？');
INSERT INTO `dict_checkbox` VALUES ('a351a884-6e18-4644-8f7d-a857096e1f12', '你是通过哪些途径认识这些旅游电子商务网站的');
INSERT INTO `dict_checkbox` VALUES ('a8beb748-9842-4c4d-9c20-d54081f8decd', '你浏览旅游电子商务网站时，最关注的内容是');
INSERT INTO `dict_checkbox` VALUES ('ab2d2348-8e8e-4e73-a097-10bb47f9e1cd', '你认为使用客服外包有哪些好处');
INSERT INTO `dict_checkbox` VALUES ('ae2b029c-419d-4d98-b28a-f7fc06f8d9f9', '你经常浏览的旅游电子商务网站都有哪些');
INSERT INTO `dict_checkbox` VALUES ('b1b559fa-cbd8-4658-95ee-815148b96760', '为什么您会选择这些就餐地点呢？');
INSERT INTO `dict_checkbox` VALUES ('b4b6bbf5-c7e1-4d20-ac17-0d4ee11c49ae', '你在网购时出现过哪些问题？(可多选)');
INSERT INTO `dict_checkbox` VALUES ('b7ec8f04-eef8-4c7b-9326-257c607069f5', '在哪些网站进行过购物');
INSERT INTO `dict_checkbox` VALUES ('b7f8b67f-83cf-4feb-a433-a39fd2193e50', '是什么让您决定玩《xx》？');
INSERT INTO `dict_checkbox` VALUES ('bbcf727d-e7ad-4556-9017-d7f8540442b2', '您购买或赠送圣诞礼物的目的');
INSERT INTO `dict_checkbox` VALUES ('c02648dc-7f48-4d79-a22d-01bd478d382b', '你觉得通过旅游电子商务网站消费有哪些不足');
INSERT INTO `dict_checkbox` VALUES ('c2996526-3ef7-4bed-a794-fb6cbe145f34', '您在外就餐时，选择本餐厅的比率约是？');
INSERT INTO `dict_checkbox` VALUES ('c8bde4be-c63b-4363-befe-1b85775e985d', '您为什么会选择与第三方配送公司进行合作');
INSERT INTO `dict_checkbox` VALUES ('cc1469b4-1dae-4748-b8ce-c67aab7c23b0', '您喜欢哪类型的特色餐饮？');
INSERT INTO `dict_checkbox` VALUES ('d6b2603a-b156-4f62-a400-8855cdf949e5', '您会在什么时间玩手机游戏？ （最多选三项）');
INSERT INTO `dict_checkbox` VALUES ('d877a968-c37c-4e11-b010-706ed66a0bb8', '您最常用的手机游戏下载方式？');
INSERT INTO `dict_checkbox` VALUES ('e5fd5fc2-146d-4f40-a8cb-5b282cb7cdd6', '你认为智能手机的普及给手机游戏带来了什么影响？');
INSERT INTO `dict_checkbox` VALUES ('eadd81d2-45ba-4930-a74d-4b42484070c1', '对于餐厅选择，您注重它的：');
INSERT INTO `dict_checkbox` VALUES ('ec526232-675a-4ade-9bb2-fd9fd41a26b5', '请问您不愿意开通的原因是');
INSERT INTO `dict_checkbox` VALUES ('ecb89a8a-0777-4499-b8ff-dfe863bf6d59', '你觉得双十一最吸引你去网上购物的影响因素有？');
INSERT INTO `dict_checkbox` VALUES ('fcd05ba3-6fa1-489a-8639-cb29b515cdf3', '你通过什么途径得知“双十一”狂欢活动的？');
INSERT INTO `dict_checkbox` VALUES ('fea4f7c1-f0d9-4ef4-8ab7-89c6712c958f', '您更喜欢通过哪种渠道了解游戏：');
INSERT INTO `dict_checkbox` VALUES ('fed9dd6f-08b1-47fb-8659-960eccd20a38', '您是否玩过以下手机游戏');
INSERT INTO `dict_checkbox` VALUES ('ff16829e-9949-4953-b1ad-58032ba9621c', '您会选择哪种类型的礼物');
INSERT INTO `dict_checkbox` VALUES ('fffa21e0-be7f-4fd0-a139-afd48c05a03e', '在就餐过程中，哪些因素会让您很不满意？');

-- ----------------------------
-- Table structure for dict_checkbox_option
-- ----------------------------
DROP TABLE IF EXISTS `dict_checkbox_option`;
CREATE TABLE `dict_checkbox_option` (
  `dict_checkbox_option_id` varchar(255) NOT NULL,
  `dict_checkbox_id` varchar(255) default NULL,
  `dict_checkbox_order` int(255) default NULL,
  `dict_checkbox_option_content` varchar(255) default NULL,
  PRIMARY KEY  (`dict_checkbox_option_id`),
  KEY `foreign key_dict_checkbox_option_dict_checkbox_id` (`dict_checkbox_id`),
  CONSTRAINT `foreign key_dict_checkbox_option_dict_checkbox_id` FOREIGN KEY (`dict_checkbox_id`) REFERENCES `dict_checkbox` (`dict_checkbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_checkbox_option
-- ----------------------------
INSERT INTO `dict_checkbox_option` VALUES ('00a8605a-1fbd-4aed-932f-189ffc7775ed', 'c8bde4be-c63b-4363-befe-1b85775e985d', '2', '配送更专业');
INSERT INTO `dict_checkbox_option` VALUES ('02d0c9b4-585a-4280-a5f3-87365e6f6d12', 'b4b6bbf5-c7e1-4d20-ac17-0d4ee11c49ae', '4', '实际产品与图文不符');
INSERT INTO `dict_checkbox_option` VALUES ('03c2f4f6-fcf3-46c9-90e6-2759ed4e399e', 'a1638daa-b1ca-43e4-a6ec-d32ad583681f', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('047a94e9-773b-45e8-9a3a-71ffaf4db441', 'fffa21e0-be7f-4fd0-a139-afd48c05a03e', '3', '另外收费的项目没有事先提醒');
INSERT INTO `dict_checkbox_option` VALUES ('056291ea-baca-4cdc-a2ae-d0aef6bd5e21', '9986762c-a6ae-425b-b486-e51d699a8a41', '1', '优先配送');
INSERT INTO `dict_checkbox_option` VALUES ('05939177-a1fc-4b49-b120-5986f114dc6f', '9986762c-a6ae-425b-b486-e51d699a8a41', '3', '赠送代金券/积分');
INSERT INTO `dict_checkbox_option` VALUES ('05cbf5de-c53b-41b2-b701-b8ea3e994c21', 'ff16829e-9949-4953-b1ad-58032ba9621c', '1', '衣服');
INSERT INTO `dict_checkbox_option` VALUES ('0671f6c2-0959-4065-b983-31dc46b71bb8', '17ffc543-621a-4dc5-9a6f-0802f727621f', '2', '中国联通');
INSERT INTO `dict_checkbox_option` VALUES ('08682101-1b28-4587-a2a0-4f46ab9b8fd9', 'a351a884-6e18-4644-8f7d-a857096e1f12', '4', '互联网');
INSERT INTO `dict_checkbox_option` VALUES ('0871e383-5349-4e51-8666-52e13e69be3c', '4b0aa915-f930-42ca-8d4b-075165754e09', '2', '菜肴口味');
INSERT INTO `dict_checkbox_option` VALUES ('08f78177-aea6-42ed-b8d5-c7c63e73b414', 'c2996526-3ef7-4bed-a794-fb6cbe145f34', '1', '20%以下');
INSERT INTO `dict_checkbox_option` VALUES ('099ab26c-bf3b-41f1-a6dc-96e9247e4004', 'a351a884-6e18-4644-8f7d-a857096e1f12', '5', '亲朋好友的推荐');
INSERT INTO `dict_checkbox_option` VALUES ('09bf7422-e1bf-4f96-92c5-81249f3df15d', '66aaeadf-0f00-4a27-8b83-9387d0dc9867', '3', '原创文章');
INSERT INTO `dict_checkbox_option` VALUES ('0a56135e-91f3-4035-967a-856a698c860f', '33590734-5eb1-4a72-9015-86df802db0b8', '3', '表白墙');
INSERT INTO `dict_checkbox_option` VALUES ('0a610450-6ea6-4ef8-99a0-5c760b4d8303', '1b35ccf1-da02-473a-a821-1e6cfcabb338', '3', '粮油食品、休闲食品');
INSERT INTO `dict_checkbox_option` VALUES ('0a92632f-4b4f-4c09-ae0c-321a49fd3c9e', 'c8bde4be-c63b-4363-befe-1b85775e985d', '4', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('0c344b3b-9de9-41fa-93a1-0d5e13c9209c', 'ff16829e-9949-4953-b1ad-58032ba9621c', '3', '化妆护肤');
INSERT INTO `dict_checkbox_option` VALUES ('0c7d1966-8588-4641-96e1-d913783cc4d6', '7e1c931a-a66a-473e-b193-5960f852cd02', '4', '休闲放松');
INSERT INTO `dict_checkbox_option` VALUES ('0cf30808-29e2-48f0-8848-72bcb7bbd0f5', 'fed9dd6f-08b1-47fb-8659-960eccd20a38', '1', '天天酷跑');
INSERT INTO `dict_checkbox_option` VALUES ('0d2f2d0e-5c1f-4087-817f-a189d1f1a716', 'a8beb748-9842-4c4d-9c20-d54081f8decd', '5', '时间安排');
INSERT INTO `dict_checkbox_option` VALUES ('0e0a6f10-08bd-4808-a0e0-7fcea05701d1', 'cc1469b4-1dae-4748-b8ce-c67aab7c23b0', '1', '烧烤类');
INSERT INTO `dict_checkbox_option` VALUES ('0e65a475-d25d-4c0f-b3f5-9a4ef55413b0', '1055edfa-dffe-4da5-911c-f121f88885a4', '6', '苏宁易购');
INSERT INTO `dict_checkbox_option` VALUES ('0f896e88-1ee6-4f99-87b1-f7e721c508ff', 'eadd81d2-45ba-4930-a74d-4b42484070c1', '2', '口味');
INSERT INTO `dict_checkbox_option` VALUES ('10ecbeb4-554b-4da2-b441-fd939765b370', '4bcbcb4c-a36e-42af-9ab0-89e6c2fe0744', '1', '自助餐');
INSERT INTO `dict_checkbox_option` VALUES ('140e7742-b644-4ad0-ac0f-d4d93d67fdc7', '58653180-6269-4b25-9833-5257dc9b18b8', '5', '环境礼节');
INSERT INTO `dict_checkbox_option` VALUES ('14a78afe-7ea7-4d0c-8bf1-b357c8a1e299', '2503be90-00a4-404f-b0ce-1c6b955bd0b6', '1', '淘宝');
INSERT INTO `dict_checkbox_option` VALUES ('160d1de3-97cb-46b8-a5c5-82b60641537d', 'bbcf727d-e7ad-4556-9017-d7f8540442b2', '2', '有实用性');
INSERT INTO `dict_checkbox_option` VALUES ('17323ad7-5608-43eb-8b6f-88c0e99d2826', '4e3fc384-4c45-44b0-92be-950f4e11e236', '2', '公司及个体户');
INSERT INTO `dict_checkbox_option` VALUES ('17418a76-f737-42ec-a847-ea39b77c326f', '9986762c-a6ae-425b-b486-e51d699a8a41', '4', '升级为本餐厅会员');
INSERT INTO `dict_checkbox_option` VALUES ('17688242-511d-409f-938c-e073efb6470d', '39f0bf92-4830-4013-9b42-7fddd7094c3f', '5', '朋友告诉');
INSERT INTO `dict_checkbox_option` VALUES ('17d7ad8a-5fb4-4242-9680-ca74ebe65859', 'a076a988-cbd6-45b1-a0e0-b6b0569fa114', '3', '科幻宇宙');
INSERT INTO `dict_checkbox_option` VALUES ('196cb421-9365-4e32-b591-da48ac6778b8', '6ce488f4-a2c4-4258-a812-c9840f859997', '1', '早餐');
INSERT INTO `dict_checkbox_option` VALUES ('1a0fbe45-e842-4f93-a444-099512553e68', '1b35ccf1-da02-473a-a821-1e6cfcabb338', '1', '数码电子');
INSERT INTO `dict_checkbox_option` VALUES ('1c229f25-a3b6-421b-9987-0f4afb3fbcec', 'd6b2603a-b156-4f62-a400-8855cdf949e5', '5', '周末休息');
INSERT INTO `dict_checkbox_option` VALUES ('1c833b85-d3a5-4585-aa96-bca12e87a917', 'd6b2603a-b156-4f62-a400-8855cdf949e5', '4', '睡觉前');
INSERT INTO `dict_checkbox_option` VALUES ('1dce9241-586a-4271-8bd4-823c0feec932', '20d7ea58-e287-4b73-8b39-4e1f435a1b66', '2', '商品丰富，可以一次性购买多类商品，省运费');
INSERT INTO `dict_checkbox_option` VALUES ('1dd17e9d-85f2-4f48-a6d4-7aacb2e3f043', 'ff16829e-9949-4953-b1ad-58032ba9621c', '4', '珠宝首饰');
INSERT INTO `dict_checkbox_option` VALUES ('1f69214d-0143-4e40-8202-ada7bb7f92a8', '14df2952-2d19-44ee-909b-a2d3b0a0b967', '1', '百度贴吧');
INSERT INTO `dict_checkbox_option` VALUES ('2013c2c6-1295-4a36-a11e-98dec1353bab', 'c2996526-3ef7-4bed-a794-fb6cbe145f34', '4', '61-80%');
INSERT INTO `dict_checkbox_option` VALUES ('209c2978-abab-4a70-a172-a82120a08da8', 'eadd81d2-45ba-4930-a74d-4b42484070c1', '4', '卫生条件');
INSERT INTO `dict_checkbox_option` VALUES ('21135c63-bc05-4711-b182-8112be7e272f', '4c26248f-ada6-42ab-915b-887b99a7fcf9', '6', '日韩料理');
INSERT INTO `dict_checkbox_option` VALUES ('21c0a913-a262-4abe-9124-cb46dc17cbab', '3d2a7ca4-f611-464c-beb9-eb23f9299d23', '2', '异国风情（泰国菜、日韩料理等）');
INSERT INTO `dict_checkbox_option` VALUES ('236212a3-b1d4-4cf3-a743-fafcd618bd3d', '3d2a7ca4-f611-464c-beb9-eb23f9299d23', '1', '地方特色餐厅（川湘菜、粤菜）');
INSERT INTO `dict_checkbox_option` VALUES ('2539dd0a-cb3b-4952-953b-ee0d526e43d7', 'c02648dc-7f48-4d79-a22d-01bd478d382b', '4', '信息的可靠性');
INSERT INTO `dict_checkbox_option` VALUES ('25fc4bb6-f0ec-4b93-84b1-f4f74951ac38', '90f65005-92ed-43be-af64-96433b287cb7', '4', '游戏周边');
INSERT INTO `dict_checkbox_option` VALUES ('28f9d5f9-f621-4394-b65e-d78fc70fa134', 'b4b6bbf5-c7e1-4d20-ac17-0d4ee11c49ae', '3', '退换货问题');
INSERT INTO `dict_checkbox_option` VALUES ('292808c0-ee8d-4c01-9311-9a70d77f5c28', 'ecb89a8a-0777-4499-b8ff-dfe863bf6d59', '3', '感到新奇');
INSERT INTO `dict_checkbox_option` VALUES ('2931acf5-f41f-4be6-84d9-381dc12b8fc9', '4c26248f-ada6-42ab-915b-887b99a7fcf9', '5', '西餐');
INSERT INTO `dict_checkbox_option` VALUES ('29c5ff07-9d34-4661-b206-e81dec64457c', '1f6c691f-ca33-4d4a-9746-e76978f4379b', '4', '时令冷/热饮');
INSERT INTO `dict_checkbox_option` VALUES ('2b31e09c-6897-475f-8c2a-42b592fa032e', '4c26248f-ada6-42ab-915b-887b99a7fcf9', '3', '其他地方菜系（江浙菜、西北菜等）');
INSERT INTO `dict_checkbox_option` VALUES ('2bfccdd1-ac16-48a1-81f1-5d73eeed2036', 'b1b559fa-cbd8-4658-95ee-815148b96760', '2', '口味适合');
INSERT INTO `dict_checkbox_option` VALUES ('2c23dfca-6130-4c2c-8277-538b5bd6dbe5', '33590734-5eb1-4a72-9015-86df802db0b8', '2', '校花校草');
INSERT INTO `dict_checkbox_option` VALUES ('2cfb4326-730c-4554-95c6-dee34b20c27e', 'd6b2603a-b156-4f62-a400-8855cdf949e5', '6', '课余时间');
INSERT INTO `dict_checkbox_option` VALUES ('2d858025-d4e1-4af4-bfa0-8ff592e3ce47', 'ff16829e-9949-4953-b1ad-58032ba9621c', '2', '箱包鞋履');
INSERT INTO `dict_checkbox_option` VALUES ('2d8d740a-8188-4f42-827d-45e719fc39f4', 'ae2b029c-419d-4d98-b28a-f7fc06f8d9f9', '5', '艺龙网');
INSERT INTO `dict_checkbox_option` VALUES ('2f76dad8-addc-435f-992b-a495e322d20f', '8008672d-ed22-4942-a71f-c3ecb18b55c3', '6', '走路经过时发现的');
INSERT INTO `dict_checkbox_option` VALUES ('31ecd6b6-db8b-42b4-959d-df0e456b989e', '7bfb1d58-a330-4492-b306-38f149138a7e', '1', '西式宴请');
INSERT INTO `dict_checkbox_option` VALUES ('32fa6876-eee5-4411-912a-faf4599de243', '1f6c691f-ca33-4d4a-9746-e76978f4379b', '5', '无');
INSERT INTO `dict_checkbox_option` VALUES ('33129d7f-75a6-45ff-9cc4-d7c28eb07cb7', '798ed145-c127-498e-bb6a-a60a997d1278', '3', '偶尔');
INSERT INTO `dict_checkbox_option` VALUES ('34419579-bebc-4add-9e59-20ab66f280ab', '906327df-871c-4864-b667-1e4410cf01db', '6', '手机游戏产品用户和手机游戏终端用户之间的矛盾');
INSERT INTO `dict_checkbox_option` VALUES ('344d7127-0ede-4d29-8b27-81700f48e5a7', 'bbcf727d-e7ad-4556-9017-d7f8540442b2', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('346f292b-59da-40f6-b718-2dbb3ae3045d', 'b7f8b67f-83cf-4feb-a433-a39fd2193e50', '6', '服务器人数');
INSERT INTO `dict_checkbox_option` VALUES ('34f73929-a874-46ff-b277-07e4da05ca80', 'c02648dc-7f48-4d79-a22d-01bd478d382b', '2', '操作较困难');
INSERT INTO `dict_checkbox_option` VALUES ('359bda5b-f1e9-42e8-8b5f-cc7cac83ff65', '5cc1be21-5a68-4349-a373-74feb2be09f6', '3', '在游戏中认识志同道合的朋友');
INSERT INTO `dict_checkbox_option` VALUES ('359ed8de-6071-451b-b524-64a2aa77ee00', 'a8beb748-9842-4c4d-9c20-d54081f8decd', '4', '可靠性');
INSERT INTO `dict_checkbox_option` VALUES ('36cdfa1e-2352-41cd-ba2f-868a4a782749', '906327df-871c-4864-b667-1e4410cf01db', '1', '追求低成本和短期利益，游戏质量粗糙');
INSERT INTO `dict_checkbox_option` VALUES ('37acbf33-78b4-49b1-b642-fec2e15ade12', 'eadd81d2-45ba-4930-a74d-4b42484070c1', '5', '服务周到');
INSERT INTO `dict_checkbox_option` VALUES ('3849adf7-f7f2-49fe-9e61-971bd78ba7e0', '3d2a7ca4-f611-464c-beb9-eb23f9299d23', '4', '火锅店');
INSERT INTO `dict_checkbox_option` VALUES ('390d3416-6740-4ee5-a0e8-eea3b60f3ad1', '9986762c-a6ae-425b-b486-e51d699a8a41', '2', '价格优惠');
INSERT INTO `dict_checkbox_option` VALUES ('3a2c657c-a67f-48f6-a2e2-cfef7d427c6a', '006e7817-516b-45dc-bb98-ac608a621bb7', '3', '流行音乐');
INSERT INTO `dict_checkbox_option` VALUES ('3ad65812-5fb0-4771-a822-aa5c7d267b4d', '1b35ccf1-da02-473a-a821-1e6cfcabb338', '2', '服装、鞋、包 时尚配饰（手表、项链等）');
INSERT INTO `dict_checkbox_option` VALUES ('3b75ba9a-bbdb-46f4-b71e-f8b12b299b9d', 'cc1469b4-1dae-4748-b8ce-c67aab7c23b0', '4', '小吃类');
INSERT INTO `dict_checkbox_option` VALUES ('3bce5da8-5774-4040-9fad-990042681f7e', '90f65005-92ed-43be-af64-96433b287cb7', '1', '游戏礼包');
INSERT INTO `dict_checkbox_option` VALUES ('3bf2cf5d-c99f-4910-a089-dedeb34b1d6a', '6ce488f4-a2c4-4258-a812-c9840f859997', '5', '夜宵');
INSERT INTO `dict_checkbox_option` VALUES ('3d0bad71-6cff-49e2-a01e-a652db5812c2', '29b1d238-21fd-453b-aa2e-ae1afee12d86', '3', '商品种类丰富，选择范围广');
INSERT INTO `dict_checkbox_option` VALUES ('3e05c7dc-9a41-4502-a015-b392950165cc', '56b90015-b498-42e7-8942-3a59a566ed61', '1', '亲友推荐');
INSERT INTO `dict_checkbox_option` VALUES ('3f03a588-97d5-47c2-8e75-ea3f538cb1b0', '56b90015-b498-42e7-8942-3a59a566ed61', '2', '社交网站，经验论坛的介绍');
INSERT INTO `dict_checkbox_option` VALUES ('407559fa-4d4e-4195-a7bf-1da708259de0', '20d7ea58-e287-4b73-8b39-4e1f435a1b66', '4', '有正品保证/品质有保证');
INSERT INTO `dict_checkbox_option` VALUES ('40f1c886-22a8-49a0-9a08-f949afa78d0d', 'a8beb748-9842-4c4d-9c20-d54081f8decd', '3', '支付安全');
INSERT INTO `dict_checkbox_option` VALUES ('414e14bb-5079-4c78-b03a-008c2a627b86', '1f6c691f-ca33-4d4a-9746-e76978f4379b', '1', '咖啡，饮品');
INSERT INTO `dict_checkbox_option` VALUES ('44844b83-863e-40d6-8429-f23f3515a8ef', 'b1b559fa-cbd8-4658-95ee-815148b96760', '1', '价格便宜');
INSERT INTO `dict_checkbox_option` VALUES ('4534a1ef-69d1-446e-82fe-f248b25e8a77', '23a42994-94fc-46ce-9ad9-a1e3c96f7e11', '5', '方便快捷');
INSERT INTO `dict_checkbox_option` VALUES ('47203749-84c3-4ecf-9767-146141391178', '58653180-6269-4b25-9833-5257dc9b18b8', '2', '服务质量');
INSERT INTO `dict_checkbox_option` VALUES ('47779c93-7872-4007-a40c-d18fb6545ec4', '17ffc543-621a-4dc5-9a6f-0802f727621f', '1', '中国移动');
INSERT INTO `dict_checkbox_option` VALUES ('478e8c3a-d703-4d93-8c2f-6b6e34b80ff1', '20d7ea58-e287-4b73-8b39-4e1f435a1b66', '1', '价格比其它网站低');
INSERT INTO `dict_checkbox_option` VALUES ('4861a7f8-e0e6-4892-b7fe-c7fc98ee6e74', '3d35a24e-9778-44eb-948a-b60af15c6477', '1', '海报等平面广告');
INSERT INTO `dict_checkbox_option` VALUES ('48f783ae-1189-4e91-bd71-7a88f25f3a87', '56b90015-b498-42e7-8942-3a59a566ed61', '5', '网页上自动弹出的小广告');
INSERT INTO `dict_checkbox_option` VALUES ('4d4d74d3-8700-47f3-9ea5-aec451498e61', 'ec526232-675a-4ade-9bb2-fd9fd41a26b5', '2', '我们是连锁店，需要总部同意才能在网上开外卖功能');
INSERT INTO `dict_checkbox_option` VALUES ('4d7d5707-fc2b-4425-877c-969dfa1481ea', 'c2996526-3ef7-4bed-a794-fb6cbe145f34', '3', '41-60%');
INSERT INTO `dict_checkbox_option` VALUES ('4e3edd22-c453-4cb5-a6e9-0986423d3ea7', 'bbcf727d-e7ad-4556-9017-d7f8540442b2', '1', '收藏观赏性');
INSERT INTO `dict_checkbox_option` VALUES ('4e5ae3a5-95c2-44b2-8dbb-fba89d309ab9', '6ce488f4-a2c4-4258-a812-c9840f859997', '4', '晚餐');
INSERT INTO `dict_checkbox_option` VALUES ('4ecf6a47-01d4-469f-960a-e0b6e023eaf2', 'a076a988-cbd6-45b1-a0e0-b6b0569fa114', '4', '现代战争');
INSERT INTO `dict_checkbox_option` VALUES ('500520f0-8fdc-4e7d-b724-a9ccc57a5be1', '3d35a24e-9778-44eb-948a-b60af15c6477', '4', '图文信息推荐');
INSERT INTO `dict_checkbox_option` VALUES ('502687bf-b909-4eec-8bb2-38fa3a4757cc', 'ff16829e-9949-4953-b1ad-58032ba9621c', '5', '数码产品');
INSERT INTO `dict_checkbox_option` VALUES ('5042ef79-0249-48d1-a0cf-54212a7a7aec', '798ed145-c127-498e-bb6a-a60a997d1278', '1', '会关注');
INSERT INTO `dict_checkbox_option` VALUES ('530844bc-949e-4cb3-bc50-a7827257381b', 'ab2d2348-8e8e-4e73-a097-10bb47f9e1cd', '1', '降低成本');
INSERT INTO `dict_checkbox_option` VALUES ('541daf31-abae-4d64-a9cb-af33aed2b4b3', '662c784f-5a59-48a7-b3b1-88cab73306de', '5', '产品以次充好');
INSERT INTO `dict_checkbox_option` VALUES ('555d8494-e9d9-442a-ba31-b1a25be3bccb', '5cc1be21-5a68-4349-a373-74feb2be09f6', '6', '攻城群战');
INSERT INTO `dict_checkbox_option` VALUES ('55ebf889-70a5-4d58-94a8-5ddee5c24f9d', '6ef8712a-cb03-4178-b60d-72a32553ca53', '3', '包装太差，无法当礼物送人');
INSERT INTO `dict_checkbox_option` VALUES ('574741c4-06a3-4a22-be83-bcfe3c80ff83', '7e1c931a-a66a-473e-b193-5960f852cd02', '5', '品尝特色美食');
INSERT INTO `dict_checkbox_option` VALUES ('58145a92-5cf5-41ca-b6f6-e1e557e1bb5d', 'ec526232-675a-4ade-9bb2-fd9fd41a26b5', '1', '店里太忙，外卖单配送不过来');
INSERT INTO `dict_checkbox_option` VALUES ('5820e768-6fdc-4b8c-8576-53234c04fa12', '33590734-5eb1-4a72-9015-86df802db0b8', '4', '校园街景');
INSERT INTO `dict_checkbox_option` VALUES ('59185d63-de30-4903-9863-b4e074884e88', '1055edfa-dffe-4da5-911c-f121f88885a4', '1', '淘宝网');
INSERT INTO `dict_checkbox_option` VALUES ('598562bc-8c5c-4a4c-91de-c20bed6760b9', '1055edfa-dffe-4da5-911c-f121f88885a4', '4', '京东商城');
INSERT INTO `dict_checkbox_option` VALUES ('5a570e1c-26eb-414d-93be-00baebb5b00f', '17ffc543-621a-4dc5-9a6f-0802f727621f', '3', '中国电信');
INSERT INTO `dict_checkbox_option` VALUES ('5b7d8c5b-b97d-4dec-b55f-383d0a5db661', 'b7f8b67f-83cf-4feb-a433-a39fd2193e50', '1', '游戏画面、音效');
INSERT INTO `dict_checkbox_option` VALUES ('5c1b1554-e3ef-4fc7-a29b-13faddf475fa', 'd6b2603a-b156-4f62-a400-8855cdf949e5', '1', '上下班路上');
INSERT INTO `dict_checkbox_option` VALUES ('5d44d1fe-021c-4f7e-b7df-364faa33d296', 'cc1469b4-1dae-4748-b8ce-c67aab7c23b0', '6', '异国风味类（泰国菜、印度菜等）');
INSERT INTO `dict_checkbox_option` VALUES ('5d532b47-db79-432f-bab5-1f3d729c8f9b', '1055edfa-dffe-4da5-911c-f121f88885a4', '3', '唯品会');
INSERT INTO `dict_checkbox_option` VALUES ('5d796203-74ad-41db-b075-1a34e71fd128', 'fcd05ba3-6fa1-489a-8639-cb29b515cdf3', '4', '网络');
INSERT INTO `dict_checkbox_option` VALUES ('5da7a71c-4358-4119-b7ac-4e7a1d6d636d', '9986762c-a6ae-425b-b486-e51d699a8a41', '6', '店员推荐');
INSERT INTO `dict_checkbox_option` VALUES ('5ee24bb7-ac05-425a-8328-e126e4917176', 'fed9dd6f-08b1-47fb-8659-960eccd20a38', '2', '欢乐斗地主');
INSERT INTO `dict_checkbox_option` VALUES ('5f493113-19b7-4d7d-b131-30cee3ca84db', 'b7f8b67f-83cf-4feb-a433-a39fd2193e50', '2', '游戏剧情、题材');
INSERT INTO `dict_checkbox_option` VALUES ('603670ae-253b-4bca-aaf3-b7081cc5bc67', '6ce488f4-a2c4-4258-a812-c9840f859997', '2', '午餐');
INSERT INTO `dict_checkbox_option` VALUES ('61487c58-9df8-426d-a338-89c543f6f212', '006e7817-516b-45dc-bb98-ac608a621bb7', '4', '古典音乐');
INSERT INTO `dict_checkbox_option` VALUES ('61785ab7-42ed-48be-95d0-0cb4abf5edd7', 'ae2b029c-419d-4d98-b28a-f7fc06f8d9f9', '3', '驴妈妈网');
INSERT INTO `dict_checkbox_option` VALUES ('62eb1841-0e23-475e-9df9-068f6d2be071', '4bcbcb4c-a36e-42af-9ab0-89e6c2fe0744', '3', 'VIP包间');
INSERT INTO `dict_checkbox_option` VALUES ('63c39852-2f1d-43aa-9e68-c8eb4a095392', '6ef8712a-cb03-4178-b60d-72a32553ca53', '2', '产品质量与实物相关太大');
INSERT INTO `dict_checkbox_option` VALUES ('641f4fee-e8a4-49db-a8ce-41470d7b67c3', 'fcd05ba3-6fa1-489a-8639-cb29b515cdf3', '3', '电视');
INSERT INTO `dict_checkbox_option` VALUES ('655b46ba-913d-487f-b067-68fc999e21e4', '2503be90-00a4-404f-b0ce-1c6b955bd0b6', '6', '唯品会');
INSERT INTO `dict_checkbox_option` VALUES ('687bad50-3374-4896-ad3b-07f5c83963b8', 'b1b559fa-cbd8-4658-95ee-815148b96760', '6', '交通便利');
INSERT INTO `dict_checkbox_option` VALUES ('6995aa9a-a215-47be-8515-65351708fc1b', '4c26248f-ada6-42ab-915b-887b99a7fcf9', '2', '川湘菜');
INSERT INTO `dict_checkbox_option` VALUES ('699dfa2e-2d1d-4349-98e6-518aa09e6232', 'b1b559fa-cbd8-4658-95ee-815148b96760', '5', '方便快捷');
INSERT INTO `dict_checkbox_option` VALUES ('69d9b92b-7758-4b6e-9c30-2b6904b68fc5', '90f65005-92ed-43be-af64-96433b287cb7', '2', '游戏攻略');
INSERT INTO `dict_checkbox_option` VALUES ('6bf28e18-d994-4a0d-848a-156dd26dd374', 'fea4f7c1-f0d9-4ef4-8ab7-89c6712c958f', '1', '新闻发布');
INSERT INTO `dict_checkbox_option` VALUES ('6c7dff79-f558-4af7-abdb-bda7aeefa3f4', '4e3fc384-4c45-44b0-92be-950f4e11e236', '5', '通过聊天工具和人交易（QQ、MSN等）');
INSERT INTO `dict_checkbox_option` VALUES ('6c8a7a24-2f04-4327-84a5-21a9eaa18085', 'd877a968-c37c-4e11-b010-706ed66a0bb8', '1', '游戏官网下载');
INSERT INTO `dict_checkbox_option` VALUES ('6cff4857-e45f-4e6a-92de-e4b09b7096a5', '23a42994-94fc-46ce-9ad9-a1e3c96f7e11', '6', '交通便利');
INSERT INTO `dict_checkbox_option` VALUES ('6d63061e-4dd7-4f42-9088-c9ee4258685b', 'b7ec8f04-eef8-4c7b-9326-257c607069f5', '5', '聚美优品');
INSERT INTO `dict_checkbox_option` VALUES ('6f10da83-c5ac-4f60-976f-ff32fad3bbac', '006e7817-516b-45dc-bb98-ac608a621bb7', '2', '轻音乐伴奏，无人声');
INSERT INTO `dict_checkbox_option` VALUES ('7262ca03-948c-4980-829e-c8f47e76c975', '3d2a7ca4-f611-464c-beb9-eb23f9299d23', '3', '私房菜馆快餐店');
INSERT INTO `dict_checkbox_option` VALUES ('7268a651-104d-4272-8aff-73daec50f11f', '58b00776-c741-4d9d-ae4b-b3e8fc46fa7a', '4', '有新手演练的环节');
INSERT INTO `dict_checkbox_option` VALUES ('72dbc113-5559-419c-9210-196043c60eb7', '906327df-871c-4864-b667-1e4410cf01db', '5', '资费标准单一，价格的多样化不足');
INSERT INTO `dict_checkbox_option` VALUES ('73a89c23-cfd8-4ecb-9f7f-16c6894f1eae', '7e1c931a-a66a-473e-b193-5960f852cd02', '1', '没有时间自己做饭');
INSERT INTO `dict_checkbox_option` VALUES ('74831654-406e-4f29-a107-202e4483eac2', 'b1b559fa-cbd8-4658-95ee-815148b96760', '4', '服务周到');
INSERT INTO `dict_checkbox_option` VALUES ('74fcca8c-834d-4e93-88e2-f04637380ced', 'ec526232-675a-4ade-9bb2-fd9fd41a26b5', '4', '自助填写信息比较麻烦');
INSERT INTO `dict_checkbox_option` VALUES ('75359e73-cdf7-42e7-8473-27f59aaea1c9', 'e5fd5fc2-146d-4f40-a8cb-5b282cb7cdd6', '3', '更丰富的游戏内容');
INSERT INTO `dict_checkbox_option` VALUES ('755b4fa3-3ec4-4092-94f9-eb3c4521a91e', 'ecb89a8a-0777-4499-b8ff-dfe863bf6d59', '2', '为了使用活动的优惠券现金券');
INSERT INTO `dict_checkbox_option` VALUES ('75793ed3-1d86-4e8c-8c7f-b29c9e70571b', '58b00776-c741-4d9d-ae4b-b3e8fc46fa7a', '3', '有专业的手机游戏平台');
INSERT INTO `dict_checkbox_option` VALUES ('75cee6ee-0ad3-4327-a2aa-c61ef685bd7e', '29b1d238-21fd-453b-aa2e-ae1afee12d86', '2', '方便，不用出门');
INSERT INTO `dict_checkbox_option` VALUES ('76152873-0f3d-4c7c-926e-dada2febb73d', 'a076a988-cbd6-45b1-a0e0-b6b0569fa114', '2', '中国仙侠');
INSERT INTO `dict_checkbox_option` VALUES ('76511b49-fa47-4562-b4a7-0ed94044d309', '1f6c691f-ca33-4d4a-9746-e76978f4379b', '3', '西式简餐');
INSERT INTO `dict_checkbox_option` VALUES ('778e74a7-d409-46d5-b478-cbf83ca76803', 'ab2d2348-8e8e-4e73-a097-10bb47f9e1cd', '4', '没有太多好处');
INSERT INTO `dict_checkbox_option` VALUES ('77b67ef9-7799-4be7-bf28-f58c20896cbb', '90f65005-92ed-43be-af64-96433b287cb7', '3', '游戏视频');
INSERT INTO `dict_checkbox_option` VALUES ('79197ae9-1d4e-4114-ae75-9680fe5a052c', 'cc1469b4-1dae-4748-b8ce-c67aab7c23b0', '3', '蒸煮类');
INSERT INTO `dict_checkbox_option` VALUES ('7919f4eb-772f-4f1b-8a1d-fe08f5b71ece', 'e5fd5fc2-146d-4f40-a8cb-5b282cb7cdd6', '2', '更便捷的操作');
INSERT INTO `dict_checkbox_option` VALUES ('796eafb9-2ef3-4fa9-b103-bd251508b450', '3d35a24e-9778-44eb-948a-b60af15c6477', '5', '朋友推荐');
INSERT INTO `dict_checkbox_option` VALUES ('7a04a50e-af0c-4c08-9340-ffaf29b374ca', '66b07e8b-3cc6-445a-b69e-c97ce2f0aee5', '5', '就想好好犒劳自己，放松下心情');
INSERT INTO `dict_checkbox_option` VALUES ('7ad86d24-2dc5-4251-90e6-e138a1e8a550', 'c2996526-3ef7-4bed-a794-fb6cbe145f34', '5', '81-100%');
INSERT INTO `dict_checkbox_option` VALUES ('7b63668b-5f75-4a97-bc87-9a494e1c00db', 'c2996526-3ef7-4bed-a794-fb6cbe145f34', '2', '21-40%');
INSERT INTO `dict_checkbox_option` VALUES ('7bfb4898-c138-4fd0-9e34-6c4fe680477b', '14df2952-2d19-44ee-909b-a2d3b0a0b967', '4', '面对面');
INSERT INTO `dict_checkbox_option` VALUES ('7c50dde5-1de6-4e0a-a8c8-af83a021f434', '58b00776-c741-4d9d-ae4b-b3e8fc46fa7a', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('7c96f6f6-1678-42d0-a1b9-0e9f1d9ebd03', '20d7ea58-e287-4b73-8b39-4e1f435a1b66', '5', '用户评价好');
INSERT INTO `dict_checkbox_option` VALUES ('7ec59475-25d7-4d89-95b0-dbb3efd8be70', 'eadd81d2-45ba-4930-a74d-4b42484070c1', '1', '价格');
INSERT INTO `dict_checkbox_option` VALUES ('7ed9d9b1-02a3-4b5e-a656-d5846526e140', 'fcd05ba3-6fa1-489a-8639-cb29b515cdf3', '1', '户外灯箱广告');
INSERT INTO `dict_checkbox_option` VALUES ('7f4bc8c7-57f8-419f-b950-b7dff273816a', '2503be90-00a4-404f-b0ce-1c6b955bd0b6', '5', '聚美优品');
INSERT INTO `dict_checkbox_option` VALUES ('7f6bb413-0c06-4dcf-8d60-c1d17911cba7', 'a8beb748-9842-4c4d-9c20-d54081f8decd', '1', '价格');
INSERT INTO `dict_checkbox_option` VALUES ('80779a8a-c871-40c0-a6aa-47f85389d874', 'a1638daa-b1ca-43e4-a6ec-d32ad583681f', '2', '烘焙类');
INSERT INTO `dict_checkbox_option` VALUES ('81c66fa5-6cad-49ed-a153-15152f810922', 'ae2b029c-419d-4d98-b28a-f7fc06f8d9f9', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('84a57f69-0203-43d6-acae-9bef83b0b35e', 'b4b6bbf5-c7e1-4d20-ac17-0d4ee11c49ae', '1', '没问题');
INSERT INTO `dict_checkbox_option` VALUES ('858c7ce4-8b15-4af4-9fa7-30c49880e16e', '58b00776-c741-4d9d-ae4b-b3e8fc46fa7a', '1', '持续提升手机游戏用户体验');
INSERT INTO `dict_checkbox_option` VALUES ('860599bf-257e-46c4-b24e-ec44d8a5f01f', '4bcbcb4c-a36e-42af-9ab0-89e6c2fe0744', '2', '咖啡吧');
INSERT INTO `dict_checkbox_option` VALUES ('86466e4a-4ffb-4a35-9de1-df213c8f7a79', '1b35ccf1-da02-473a-a821-1e6cfcabb338', '5', '机票酒店');
INSERT INTO `dict_checkbox_option` VALUES ('87426c49-0a62-4dc1-b7be-55771aa5ee47', '58653180-6269-4b25-9833-5257dc9b18b8', '1', '餐厅环境');
INSERT INTO `dict_checkbox_option` VALUES ('876a466f-9bec-4582-89e6-025e9312e138', 'd877a968-c37c-4e11-b010-706ed66a0bb8', '2', '百度搜索');
INSERT INTO `dict_checkbox_option` VALUES ('877f5db7-2474-48c3-9200-019a5d444220', 'd6b2603a-b156-4f62-a400-8855cdf949e5', '2', '吃饭时间');
INSERT INTO `dict_checkbox_option` VALUES ('8812c5ec-4615-4a50-8b8c-afef8528bdb3', 'ae2b029c-419d-4d98-b28a-f7fc06f8d9f9', '2', '途牛网');
INSERT INTO `dict_checkbox_option` VALUES ('884ecc6e-1120-4254-aecc-377e90010f58', 'ff16829e-9949-4953-b1ad-58032ba9621c', '6', '个性小玩物');
INSERT INTO `dict_checkbox_option` VALUES ('89791845-fac9-45ef-9727-0c0c874b478d', '3d2a7ca4-f611-464c-beb9-eb23f9299d23', '6', '大排档');
INSERT INTO `dict_checkbox_option` VALUES ('8a75c942-9186-4a89-ae0e-b97ddc610b59', 'b7f8b67f-83cf-4feb-a433-a39fd2193e50', '5', '角色成长');
INSERT INTO `dict_checkbox_option` VALUES ('8bb95d55-2dea-4307-813a-3faf55d5852f', '8008672d-ed22-4942-a71f-c3ecb18b55c3', '4', '促销优惠券');
INSERT INTO `dict_checkbox_option` VALUES ('8c011882-1b6e-4e04-b863-8233df9999b0', 'ec526232-675a-4ade-9bb2-fd9fd41a26b5', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('8c5f85be-73e1-4a5d-933b-99211e4270f2', 'c02648dc-7f48-4d79-a22d-01bd478d382b', '1', '电话或电脑普及率的问题');
INSERT INTO `dict_checkbox_option` VALUES ('8dc13a8c-d836-4f34-afb7-2ebe3a0557f2', '006e7817-516b-45dc-bb98-ac608a621bb7', '5', '民俗音乐');
INSERT INTO `dict_checkbox_option` VALUES ('8e66d0fd-e56d-4af9-ac90-0329bfca3e7f', '8008672d-ed22-4942-a71f-c3ecb18b55c3', '1', '亲友推荐');
INSERT INTO `dict_checkbox_option` VALUES ('8f87590d-982d-4103-9069-f6157626a397', 'e5fd5fc2-146d-4f40-a8cb-5b282cb7cdd6', '1', '精美的画面');
INSERT INTO `dict_checkbox_option` VALUES ('8f95581c-c573-49c8-b70f-146da822aa38', 'fea4f7c1-f0d9-4ef4-8ab7-89c6712c958f', '2', '论坛讨论');
INSERT INTO `dict_checkbox_option` VALUES ('8fcc0c1e-2c37-43c4-959f-13c7d3d4173b', 'cc1469b4-1dae-4748-b8ce-c67aab7c23b0', '5', '西餐厅');
INSERT INTO `dict_checkbox_option` VALUES ('911ef8ae-fedf-44aa-8a61-87ed32e09201', '7e1c931a-a66a-473e-b193-5960f852cd02', '3', '交际应酬');
INSERT INTO `dict_checkbox_option` VALUES ('91bfcafc-2126-4e3b-9a9c-5071eeda045e', 'fcd05ba3-6fa1-489a-8639-cb29b515cdf3', '5', '朋友告诉');
INSERT INTO `dict_checkbox_option` VALUES ('949f20f3-11d1-4489-a446-f8268cf11657', '5cc1be21-5a68-4349-a373-74feb2be09f6', '5', '独自发展或者游历，达成更高的等级');
INSERT INTO `dict_checkbox_option` VALUES ('94a1c6dc-de23-4363-99d4-7d9efb526699', 'b7ec8f04-eef8-4c7b-9326-257c607069f5', '1', '淘宝网');
INSERT INTO `dict_checkbox_option` VALUES ('95e78b84-10ea-4705-8780-a7027032a426', '5cc1be21-5a68-4349-a373-74feb2be09f6', '1', '击败其他玩家，抢占更多的财富和地盘');
INSERT INTO `dict_checkbox_option` VALUES ('962e3c51-23c0-410d-b954-5297acdb275e', 'a8beb748-9842-4c4d-9c20-d54081f8decd', '2', '景点路线');
INSERT INTO `dict_checkbox_option` VALUES ('983e4a2b-01d8-4e40-9715-5f044c39120c', 'c02648dc-7f48-4d79-a22d-01bd478d382b', '3', '网络安全性问题');
INSERT INTO `dict_checkbox_option` VALUES ('984beaae-8885-4a20-a99f-28fb20673e0c', '6ef8712a-cb03-4178-b60d-72a32553ca53', '1', '配送是龟速，慢');
INSERT INTO `dict_checkbox_option` VALUES ('9869a5b1-de22-49b7-8e54-b383a6348084', '58b00776-c741-4d9d-ae4b-b3e8fc46fa7a', '5', '能与更多好友PK');
INSERT INTO `dict_checkbox_option` VALUES ('99c2bc36-9fcd-4546-ad7d-b00bae554bc8', '66b07e8b-3cc6-445a-b69e-c97ce2f0aee5', '3', '朋友相邀');
INSERT INTO `dict_checkbox_option` VALUES ('99ef6be6-535d-4541-9b77-d8203c5d50f7', '23a42994-94fc-46ce-9ad9-a1e3c96f7e11', '4', '服务周到');
INSERT INTO `dict_checkbox_option` VALUES ('9a479a4c-8052-430a-9817-2b6e535fcfaa', '2503be90-00a4-404f-b0ce-1c6b955bd0b6', '4', '亚马逊');
INSERT INTO `dict_checkbox_option` VALUES ('9af2b04c-a8b1-42bb-9016-31da7eb89947', '6ef8712a-cb03-4178-b60d-72a32553ca53', '5', '不能代写贺卡，礼物少了点情趣');
INSERT INTO `dict_checkbox_option` VALUES ('9c19c914-8a95-4f14-880a-b6a639cf8c21', '39f0bf92-4830-4013-9b42-7fddd7094c3f', '2', '报纸杂志');
INSERT INTO `dict_checkbox_option` VALUES ('9cba9236-f438-4799-afc6-ef218a16b6bd', 'bbcf727d-e7ad-4556-9017-d7f8540442b2', '3', '馈赠朋友');
INSERT INTO `dict_checkbox_option` VALUES ('9f8c414e-e49b-49c1-b31d-69327f9091c1', '23a42994-94fc-46ce-9ad9-a1e3c96f7e11', '3', '卫生好');
INSERT INTO `dict_checkbox_option` VALUES ('9ffc1f80-62ec-432d-80a7-6b4ec1ad3f26', 'eadd81d2-45ba-4930-a74d-4b42484070c1', '3', '方便快捷');
INSERT INTO `dict_checkbox_option` VALUES ('a05a8dcb-b7a8-42a3-8825-3b829eed9ce7', '56b90015-b498-42e7-8942-3a59a566ed61', '4', '旅游杂志或期刊的介绍');
INSERT INTO `dict_checkbox_option` VALUES ('a0f2cdf7-628d-4ce9-83eb-10157596702a', 'b7ec8f04-eef8-4c7b-9326-257c607069f5', '2', '天猫商城');
INSERT INTO `dict_checkbox_option` VALUES ('a0fb326e-ed9e-42fc-aa36-c7a9ac30af4b', 'e5fd5fc2-146d-4f40-a8cb-5b282cb7cdd6', '4', '更流畅的游戏速度');
INSERT INTO `dict_checkbox_option` VALUES ('a4b37ac5-3fb5-4f45-836e-2ec0ef365abd', '58653180-6269-4b25-9833-5257dc9b18b8', '3', '服务效率');
INSERT INTO `dict_checkbox_option` VALUES ('a4b85860-bc55-4611-b3d9-1331cb1e1cea', 'a076a988-cbd6-45b1-a0e0-b6b0569fa114', '5', '生活写实');
INSERT INTO `dict_checkbox_option` VALUES ('a501d1ac-d7f5-499f-b9a1-e4584fc80214', '8008672d-ed22-4942-a71f-c3ecb18b55c3', '3', '团购活动');
INSERT INTO `dict_checkbox_option` VALUES ('a50e5bfb-fae4-4c55-b4a9-3410c5457559', 'd877a968-c37c-4e11-b010-706ed66a0bb8', '4', '91');
INSERT INTO `dict_checkbox_option` VALUES ('a55d8c50-74f4-4f3d-af14-7c68deda54db', '3f065301-165d-4346-84e2-86fc3703646d', '5', '卫生不佳');
INSERT INTO `dict_checkbox_option` VALUES ('a7c8ddec-4874-41f7-8e44-406eda91230e', 'fffa21e0-be7f-4fd0-a139-afd48c05a03e', '1', '服务人员怠慢');
INSERT INTO `dict_checkbox_option` VALUES ('aa052954-aa71-4ad1-96d3-a97683e9bfd8', '4e3fc384-4c45-44b0-92be-950f4e11e236', '4', '电子交易平台（如淘宝、网易等）');
INSERT INTO `dict_checkbox_option` VALUES ('aa15a38d-8923-4d86-8a9e-80a996764172', '29b1d238-21fd-453b-aa2e-ae1afee12d86', '5', '质量有保证');
INSERT INTO `dict_checkbox_option` VALUES ('aa6259a5-86de-4c84-aa96-21995e06c59c', '6ef8712a-cb03-4178-b60d-72a32553ca53', '6', '代写祝福的字太丑，感觉整个人都不好了');
INSERT INTO `dict_checkbox_option` VALUES ('ac3cc20d-37eb-4f44-8e0f-c3b07fc1b004', '6ce488f4-a2c4-4258-a812-c9840f859997', '3', '下午茶');
INSERT INTO `dict_checkbox_option` VALUES ('ad56234b-3502-4d4e-b822-a98376b2215c', '7e1c931a-a66a-473e-b193-5960f852cd02', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('ad6e2455-18e7-487e-9c76-62588f8c6203', '4b0aa915-f930-42ca-8d4b-075165754e09', '1', '分量大小');
INSERT INTO `dict_checkbox_option` VALUES ('ae694b21-8dd5-47fc-8455-50310e51b0b3', '3f065301-165d-4346-84e2-86fc3703646d', '2', '菜品与图片不符');
INSERT INTO `dict_checkbox_option` VALUES ('af3378b3-9832-452c-8694-a2d19dbab27d', '14df2952-2d19-44ee-909b-a2d3b0a0b967', '3', '多玩等媒体专区');
INSERT INTO `dict_checkbox_option` VALUES ('afdb7c7f-736c-4e1e-958c-78db0569693c', '4c26248f-ada6-42ab-915b-887b99a7fcf9', '4', '火锅');
INSERT INTO `dict_checkbox_option` VALUES ('b056c784-40fe-4442-ba50-1a3dd98612c6', 'd877a968-c37c-4e11-b010-706ed66a0bb8', '3', '豌豆荚');
INSERT INTO `dict_checkbox_option` VALUES ('b0a58b6e-e251-4807-846c-3d4727a82678', '2503be90-00a4-404f-b0ce-1c6b955bd0b6', '3', '京东商城');
INSERT INTO `dict_checkbox_option` VALUES ('b0b89000-bcbf-465c-a42f-5dd50f2b1eb7', '58b00776-c741-4d9d-ae4b-b3e8fc46fa7a', '2', '智能化');
INSERT INTO `dict_checkbox_option` VALUES ('b1073d40-6857-47d6-808b-aab4d1e5b63e', 'cc1469b4-1dae-4748-b8ce-c67aab7c23b0', '2', '火锅类');
INSERT INTO `dict_checkbox_option` VALUES ('b13403af-ec3c-4779-bcdf-0d95ff13a9fd', 'eadd81d2-45ba-4930-a74d-4b42484070c1', '6', '交通便利');
INSERT INTO `dict_checkbox_option` VALUES ('b1400c40-d2f0-4f81-ae63-efacf8611643', '4c26248f-ada6-42ab-915b-887b99a7fcf9', '1', '粤菜');
INSERT INTO `dict_checkbox_option` VALUES ('b165dc20-9e53-4616-bbb8-2fb38e79e836', 'a351a884-6e18-4644-8f7d-a857096e1f12', '1', '电视');
INSERT INTO `dict_checkbox_option` VALUES ('b1b26cd4-4a2a-4f64-aba9-8fe3b078d7b3', 'fffa21e0-be7f-4fd0-a139-afd48c05a03e', '2', '等餐时间过长');
INSERT INTO `dict_checkbox_option` VALUES ('b1c198f1-cf4b-4d38-bd41-bacbcf85c5a5', 'a1638daa-b1ca-43e4-a6ec-d32ad583681f', '4', '中餐馆');
INSERT INTO `dict_checkbox_option` VALUES ('b1f13bd1-e8d7-427a-b6e5-86cc152ebd59', '4b0aa915-f930-42ca-8d4b-075165754e09', '4', '冷热搭配');
INSERT INTO `dict_checkbox_option` VALUES ('b21fe723-2900-443d-a086-0ea26e74f22c', '3f065301-165d-4346-84e2-86fc3703646d', '4', '份量太少');
INSERT INTO `dict_checkbox_option` VALUES ('b251b500-5658-498c-b1e3-46c27d36ec24', 'bbcf727d-e7ad-4556-9017-d7f8540442b2', '5', '气氛');
INSERT INTO `dict_checkbox_option` VALUES ('b34d0944-4a55-43c7-b434-393fa829b0d4', '3f065301-165d-4346-84e2-86fc3703646d', '3', '味道不好');
INSERT INTO `dict_checkbox_option` VALUES ('b3e452bd-f737-492f-8e7a-df786a9d3999', '4e3fc384-4c45-44b0-92be-950f4e11e236', '3', '自己建立的销售网站');
INSERT INTO `dict_checkbox_option` VALUES ('b4372b34-3dd8-4b05-a350-fe7770837621', 'ecb89a8a-0777-4499-b8ff-dfe863bf6d59', '1', '价格吸引');
INSERT INTO `dict_checkbox_option` VALUES ('b479a918-e542-42d3-b598-b0049b828721', '5cc1be21-5a68-4349-a373-74feb2be09f6', '2', '游戏获得现实物品');
INSERT INTO `dict_checkbox_option` VALUES ('b5b36c8e-d3b8-49ee-876b-4fa72fab5999', '39f0bf92-4830-4013-9b42-7fddd7094c3f', '3', '电视');
INSERT INTO `dict_checkbox_option` VALUES ('b60d3cc7-ed3f-4b72-be77-3d0a3994151f', '662c784f-5a59-48a7-b3b1-88cab73306de', '3', '物流紧张，延时发货');
INSERT INTO `dict_checkbox_option` VALUES ('b7809418-2906-441a-b431-d6167109e8bc', '4e3fc384-4c45-44b0-92be-950f4e11e236', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('b79540f7-73f7-4323-adeb-a0c94f964293', '3f065301-165d-4346-84e2-86fc3703646d', '1', '送餐速度慢');
INSERT INTO `dict_checkbox_option` VALUES ('b9302f19-e531-404a-b311-1ae95a947dad', 'a076a988-cbd6-45b1-a0e0-b6b0569fa114', '1', '日本风格');
INSERT INTO `dict_checkbox_option` VALUES ('b9bfcba6-dab8-4e6c-9e68-2de2b48d4a12', 'b7ec8f04-eef8-4c7b-9326-257c607069f5', '6', '苏宁易购');
INSERT INTO `dict_checkbox_option` VALUES ('bac3181e-a464-451f-b5cf-107ffd8a54bf', 'fcd05ba3-6fa1-489a-8639-cb29b515cdf3', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('bc45ecd6-e950-4bd5-b4a3-3bfc30aff3f5', '906327df-871c-4864-b667-1e4410cf01db', '4', '忽视用户的体验和习惯方式');
INSERT INTO `dict_checkbox_option` VALUES ('bc6388c5-89df-441f-8e10-b19f8a15e7a1', '3d35a24e-9778-44eb-948a-b60af15c6477', '3', '视频推荐');
INSERT INTO `dict_checkbox_option` VALUES ('bc8e69d6-0465-4082-bb9d-8dc93085ecb6', '4e3fc384-4c45-44b0-92be-950f4e11e236', '1', '门户网站建立的商城（如淘宝商城等）');
INSERT INTO `dict_checkbox_option` VALUES ('bd3615c8-7793-4901-a39a-394c455f8728', 'd6b2603a-b156-4f62-a400-8855cdf949e5', '3', '下班回家后');
INSERT INTO `dict_checkbox_option` VALUES ('bd6d4ca6-96d8-4567-9f14-cda142bef21b', 'ec526232-675a-4ade-9bb2-fd9fd41a26b5', '5', '操作不熟悉，不方便');
INSERT INTO `dict_checkbox_option` VALUES ('bea8d735-bee7-4dca-88ba-cdb95690689e', 'b4b6bbf5-c7e1-4d20-ac17-0d4ee11c49ae', '5', '买到假冒伪劣产品');
INSERT INTO `dict_checkbox_option` VALUES ('bf19a27f-74fc-4572-bfa3-d14a25e53455', '1f6c691f-ca33-4d4a-9746-e76978f4379b', '2', '西点，甜点');
INSERT INTO `dict_checkbox_option` VALUES ('bf9e1019-84cc-45e1-823f-4fdd33ebe7b3', '66b07e8b-3cc6-445a-b69e-c97ce2f0aee5', '2', '在外就餐方便');
INSERT INTO `dict_checkbox_option` VALUES ('c0f7a4f8-be7f-4e07-bc42-71def79ea20c', 'a1638daa-b1ca-43e4-a6ec-d32ad583681f', '3', '快餐类');
INSERT INTO `dict_checkbox_option` VALUES ('c36eaee3-7501-47c6-812e-8490d3699311', '58653180-6269-4b25-9833-5257dc9b18b8', '4', '礼貌待客');
INSERT INTO `dict_checkbox_option` VALUES ('c407807b-a320-449f-ba19-ec81f305ed5d', 'ec526232-675a-4ade-9bb2-fd9fd41a26b5', '3', '设备条件不够');
INSERT INTO `dict_checkbox_option` VALUES ('c45deb77-c3ca-455c-8bea-bbfc25fcc32d', 'ab2d2348-8e8e-4e73-a097-10bb47f9e1cd', '5', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('c6b6d3de-2ad5-4611-bc7b-cf57f566dd82', 'b1b559fa-cbd8-4658-95ee-815148b96760', '3', '卫生好');
INSERT INTO `dict_checkbox_option` VALUES ('c72abf64-1444-4503-952a-e2dd04b0f7fc', '1055edfa-dffe-4da5-911c-f121f88885a4', '5', '聚美优品');
INSERT INTO `dict_checkbox_option` VALUES ('c7506f2c-7e50-4107-86f5-b6a98316aad5', '906327df-871c-4864-b667-1e4410cf01db', '3', '不重视市场的宣传和推广工作');
INSERT INTO `dict_checkbox_option` VALUES ('c81beae8-1f98-462b-9613-26e4637742af', '29b1d238-21fd-453b-aa2e-ae1afee12d86', '1', '价格便宜');
INSERT INTO `dict_checkbox_option` VALUES ('c8b50b7a-af57-46a4-b952-81821e4128e9', 'ab2d2348-8e8e-4e73-a097-10bb47f9e1cd', '2', '服务更专业');
INSERT INTO `dict_checkbox_option` VALUES ('c9bf7aaf-900d-4016-aa88-e52303a198ef', '4b0aa915-f930-42ca-8d4b-075165754e09', '3', '菜品装饰');
INSERT INTO `dict_checkbox_option` VALUES ('ca665f99-91a3-4efa-9fff-1ed434d0a468', '1b35ccf1-da02-473a-a821-1e6cfcabb338', '6', '手机话费');
INSERT INTO `dict_checkbox_option` VALUES ('cb79630f-f668-4b7e-a81e-26447189b93c', '66b07e8b-3cc6-445a-b69e-c97ce2f0aee5', '4', '部门聚餐');
INSERT INTO `dict_checkbox_option` VALUES ('cc0f0e6f-26cc-4964-9990-8f80abb497cc', 'b4b6bbf5-c7e1-4d20-ac17-0d4ee11c49ae', '2', '产品质量问题');
INSERT INTO `dict_checkbox_option` VALUES ('cd4632bf-0b34-4357-8b52-c4423f7fc3c3', 'a1638daa-b1ca-43e4-a6ec-d32ad583681f', '1', '煎炸类');
INSERT INTO `dict_checkbox_option` VALUES ('cd58ed43-b4a9-4e87-a3de-e531844b8e17', '8008672d-ed22-4942-a71f-c3ecb18b55c3', '5', '宣传广告');
INSERT INTO `dict_checkbox_option` VALUES ('cd94556e-5cd0-4745-babf-f5795100423b', '798ed145-c127-498e-bb6a-a60a997d1278', '2', '不会关注，好玩就行');
INSERT INTO `dict_checkbox_option` VALUES ('cdbd6f56-43ce-4726-814d-66816789f50f', '8008672d-ed22-4942-a71f-c3ecb18b55c3', '2', '网络推荐');
INSERT INTO `dict_checkbox_option` VALUES ('ce235733-a132-4f9b-be06-7366edafd69c', 'b7ec8f04-eef8-4c7b-9326-257c607069f5', '4', '京东商城');
INSERT INTO `dict_checkbox_option` VALUES ('ceae9b47-153e-4757-9359-030c50513287', 'a8beb748-9842-4c4d-9c20-d54081f8decd', '6', '服务质量不可靠的，都不借鉴');
INSERT INTO `dict_checkbox_option` VALUES ('d07c329e-a370-4d4e-b3af-c0d0a8d21f81', '006e7817-516b-45dc-bb98-ac608a621bb7', '6', '电台电视');
INSERT INTO `dict_checkbox_option` VALUES ('d1058c2c-7249-4e49-aa69-dae5ac9702aa', '2503be90-00a4-404f-b0ce-1c6b955bd0b6', '2', '天猫');
INSERT INTO `dict_checkbox_option` VALUES ('d23f5caf-641f-4b11-bf17-f18e2110d5b3', 'a1638daa-b1ca-43e4-a6ec-d32ad583681f', '5', '日韩料理');
INSERT INTO `dict_checkbox_option` VALUES ('d39920df-882d-49e1-a58c-2d186b0a4d4b', '006e7817-516b-45dc-bb98-ac608a621bb7', '1', '不需要音乐');
INSERT INTO `dict_checkbox_option` VALUES ('d53dd25a-1525-4132-9c06-4de86896c3aa', 'bbcf727d-e7ad-4556-9017-d7f8540442b2', '4', '感受节日');
INSERT INTO `dict_checkbox_option` VALUES ('d54142d8-5681-4a3d-98f3-20479c49fd13', '1b35ccf1-da02-473a-a821-1e6cfcabb338', '4', '图书、音像制品');
INSERT INTO `dict_checkbox_option` VALUES ('d59edae5-9357-413f-8c6e-33656a9c6ca9', '23a42994-94fc-46ce-9ad9-a1e3c96f7e11', '1', '价格便宜');
INSERT INTO `dict_checkbox_option` VALUES ('d5c1e0ec-a030-4533-8f34-5f7a515bcaee', '662c784f-5a59-48a7-b3b1-88cab73306de', '2', '先涨价后降价的假优惠');
INSERT INTO `dict_checkbox_option` VALUES ('d6744f9c-65ff-473a-837a-0aa2c2be3a09', '39f0bf92-4830-4013-9b42-7fddd7094c3f', '1', '户外灯箱广告');
INSERT INTO `dict_checkbox_option` VALUES ('d7105d70-d2f7-4212-9b7d-f34ee0b8fc8e', 'ae2b029c-419d-4d98-b28a-f7fc06f8d9f9', '1', '携程网');
INSERT INTO `dict_checkbox_option` VALUES ('d8e71df9-93a0-4f69-b662-12f8b919c5ba', 'b7f8b67f-83cf-4feb-a433-a39fd2193e50', '3', '战斗系统');
INSERT INTO `dict_checkbox_option` VALUES ('d95ee63d-1068-4e45-9c54-964fa44d2224', 'c8bde4be-c63b-4363-befe-1b85775e985d', '1', '节省配送的人力成本');
INSERT INTO `dict_checkbox_option` VALUES ('daf404cb-d158-47d3-9cd4-bdc6200f39ec', '1055edfa-dffe-4da5-911c-f121f88885a4', '2', '天猫商城');
INSERT INTO `dict_checkbox_option` VALUES ('db8e5a65-fbad-4961-af1d-3496d97fbd85', 'ae2b029c-419d-4d98-b28a-f7fc06f8d9f9', '4', '去哪儿网');
INSERT INTO `dict_checkbox_option` VALUES ('db901421-6e8b-4b5f-ae35-d279c52af1ce', '29b1d238-21fd-453b-aa2e-ae1afee12d86', '4', '紧跟潮流，时尚');
INSERT INTO `dict_checkbox_option` VALUES ('e1ef7c0d-d1f8-4baa-8f0d-a59eda5e685f', '66aaeadf-0f00-4a27-8b83-9387d0dc9867', '2', '社团活动');
INSERT INTO `dict_checkbox_option` VALUES ('e2f2c5d3-760a-41d7-9a84-cc5d2e925e13', '66b07e8b-3cc6-445a-b69e-c97ce2f0aee5', '1', '休息时间少，紧张');
INSERT INTO `dict_checkbox_option` VALUES ('e34bc433-b38e-405f-9bae-0cb0fc3679aa', '20d7ea58-e287-4b73-8b39-4e1f435a1b66', '3', '网站品牌知名度高');
INSERT INTO `dict_checkbox_option` VALUES ('e3927c8f-60e9-4db9-836f-ddfae5960b0d', '20d7ea58-e287-4b73-8b39-4e1f435a1b66', '6', '自己以往的购物经历');
INSERT INTO `dict_checkbox_option` VALUES ('e3b07264-cbc9-46e9-a21b-836fe262a0be', '14df2952-2d19-44ee-909b-a2d3b0a0b967', '2', '游戏论坛');
INSERT INTO `dict_checkbox_option` VALUES ('e48d247d-a947-4f87-a317-08222899df50', 'c8bde4be-c63b-4363-befe-1b85775e985d', '3', '有专门的网站和电话，不需要我们自己操作');
INSERT INTO `dict_checkbox_option` VALUES ('e6aaba71-10b2-4f0e-b24b-e8a43b1369d5', '7bfb1d58-a330-4492-b306-38f149138a7e', '2', '中式宴请');
INSERT INTO `dict_checkbox_option` VALUES ('e73b1a1e-f5b4-44af-adb9-15e694bf0768', 'b7ec8f04-eef8-4c7b-9326-257c607069f5', '3', '唯品会');
INSERT INTO `dict_checkbox_option` VALUES ('e7c7e20b-1b65-4e7a-8d8b-ed84d855ebbb', '662c784f-5a59-48a7-b3b1-88cab73306de', '6', '没遇到过');
INSERT INTO `dict_checkbox_option` VALUES ('e7efac55-e54d-42dd-8de9-6186570cdbb3', 'a351a884-6e18-4644-8f7d-a857096e1f12', '3', '人员推销');
INSERT INTO `dict_checkbox_option` VALUES ('e80b12a7-d725-4c0e-855a-6ce78b9039ec', '56b90015-b498-42e7-8942-3a59a566ed61', '3', '团购网站的介绍');
INSERT INTO `dict_checkbox_option` VALUES ('e873bb66-713a-42bd-b1f2-5f9b53a0a0f0', 'b7f8b67f-83cf-4feb-a433-a39fd2193e50', '4', '关卡设计');
INSERT INTO `dict_checkbox_option` VALUES ('e8a0af1c-7fe0-4eb5-b7be-9c3484612844', '5cc1be21-5a68-4349-a373-74feb2be09f6', '4', '以优惠价格在线团购');
INSERT INTO `dict_checkbox_option` VALUES ('e945731b-5981-4dce-abeb-11ec147bef47', '9986762c-a6ae-425b-b486-e51d699a8a41', '5', '店内海报宣传');
INSERT INTO `dict_checkbox_option` VALUES ('eb686838-f464-4b5d-b22d-24f5207e6437', '7e1c931a-a66a-473e-b193-5960f852cd02', '2', '朋友邀请');
INSERT INTO `dict_checkbox_option` VALUES ('ebbc1685-5388-484f-9437-6198e7f15514', 'a351a884-6e18-4644-8f7d-a857096e1f12', '2', '报刊等媒体');
INSERT INTO `dict_checkbox_option` VALUES ('ec633942-c864-4017-ac44-882081b590d1', '3f065301-165d-4346-84e2-86fc3703646d', '6', '包装不良（有食物或汁水洒出来）');
INSERT INTO `dict_checkbox_option` VALUES ('ece1ceb0-8148-4ac8-af92-74618773e3c6', '66b07e8b-3cc6-445a-b69e-c97ce2f0aee5', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('f023dc90-c8b2-4d15-a564-3e601964ce58', 'ab2d2348-8e8e-4e73-a097-10bb47f9e1cd', '3', '可全天值班');
INSERT INTO `dict_checkbox_option` VALUES ('f28f8e54-7244-4ef9-8ad1-56930d2f85e3', '39f0bf92-4830-4013-9b42-7fddd7094c3f', '4', '网络');
INSERT INTO `dict_checkbox_option` VALUES ('f390b0c0-410e-4a73-bf94-12641df0c864', 'ecb89a8a-0777-4499-b8ff-dfe863bf6d59', '5', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('f41fc670-7722-4fb0-8fc0-c2bbf13f765b', '662c784f-5a59-48a7-b3b1-88cab73306de', '1', '容易缺货');
INSERT INTO `dict_checkbox_option` VALUES ('f42f37ac-0911-4330-a2c3-fe6de6e46f9e', 'fcd05ba3-6fa1-489a-8639-cb29b515cdf3', '2', '报纸杂志');
INSERT INTO `dict_checkbox_option` VALUES ('f51de6c0-7cda-4e1b-9791-c097efd770f4', '29b1d238-21fd-453b-aa2e-ae1afee12d86', '6', '有很多顾客的评价，口碑可真实查看');
INSERT INTO `dict_checkbox_option` VALUES ('f57f4777-6e94-46b6-9edb-e3e4d71fc73f', 'e5fd5fc2-146d-4f40-a8cb-5b282cb7cdd6', '5', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('f614102b-4346-4932-bb57-e8b7a004afcf', 'fea4f7c1-f0d9-4ef4-8ab7-89c6712c958f', '3', '朋友推荐');
INSERT INTO `dict_checkbox_option` VALUES ('f7112e8e-681b-4e97-be09-a4341ab23d2b', '3d35a24e-9778-44eb-948a-b60af15c6477', '2', '视频广告');
INSERT INTO `dict_checkbox_option` VALUES ('f72e383a-bbdf-4c90-9a7b-8a8c8770a3f9', '7bfb1d58-a330-4492-b306-38f149138a7e', '3', '无');
INSERT INTO `dict_checkbox_option` VALUES ('f80f75b8-287d-4171-8c19-a8b0f6291d95', 'a076a988-cbd6-45b1-a0e0-b6b0569fa114', '6', '像素风');
INSERT INTO `dict_checkbox_option` VALUES ('f851411f-a851-4286-85f1-9fb2b384289d', '3d2a7ca4-f611-464c-beb9-eb23f9299d23', '5', '小吃店');
INSERT INTO `dict_checkbox_option` VALUES ('f89a57c5-55b1-4bb3-8c0d-4d7988b1977d', '662c784f-5a59-48a7-b3b1-88cab73306de', '4', '退换货困难，理赔困难');
INSERT INTO `dict_checkbox_option` VALUES ('fa86a705-093f-49fb-bd02-b61e34264f96', '6ef8712a-cb03-4178-b60d-72a32553ca53', '4', '送货和收货时间不确定，惊喜变成了担忧');
INSERT INTO `dict_checkbox_option` VALUES ('fb2909a4-49a0-4d04-813a-6cdb811a8c34', '66aaeadf-0f00-4a27-8b83-9387d0dc9867', '1', '学校通知');
INSERT INTO `dict_checkbox_option` VALUES ('fcefcc06-cf3c-43f1-90ee-3945da91b3bb', '906327df-871c-4864-b667-1e4410cf01db', '2', '手机游戏的同质化严重，创新不够');
INSERT INTO `dict_checkbox_option` VALUES ('fd358cc7-7f1f-4937-8eb9-bf3930309a50', '90f65005-92ed-43be-af64-96433b287cb7', '5', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('fd38a3e2-3dec-44a0-a802-8eea46ecce73', '39f0bf92-4830-4013-9b42-7fddd7094c3f', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('fe4ea1f9-db17-4283-a039-df38f54aa739', 'ecb89a8a-0777-4499-b8ff-dfe863bf6d59', '4', '正好有购物需求');
INSERT INTO `dict_checkbox_option` VALUES ('fe618e0f-9af3-485e-9e72-69a91d67f525', '33590734-5eb1-4a72-9015-86df802db0b8', '1', '查成绩');
INSERT INTO `dict_checkbox_option` VALUES ('ff5d0568-8fd9-4f6d-a72b-168d79180895', '3d35a24e-9778-44eb-948a-b60af15c6477', '6', '其他');
INSERT INTO `dict_checkbox_option` VALUES ('ff97d753-961d-4022-aace-14d9b82657c7', '23a42994-94fc-46ce-9ad9-a1e3c96f7e11', '2', '口味适合');

-- ----------------------------
-- Table structure for dict_single
-- ----------------------------
DROP TABLE IF EXISTS `dict_single`;
CREATE TABLE `dict_single` (
  `dict_single_id` varchar(255) NOT NULL,
  `dict_single_content` varchar(255) default NULL,
  PRIMARY KEY  (`dict_single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_single
-- ----------------------------
INSERT INTO `dict_single` VALUES ('006e4ece-664c-4952-8af2-e4889f68bcad', '请问您的职业是？');
INSERT INTO `dict_single` VALUES ('016b2f16-5469-44f4-831c-ed1d243f7bde', '您是否有在圣诞节送礼物给别人的经历');
INSERT INTO `dict_single` VALUES ('02496906-550b-4ab3-9cd4-dee74e4d692d', '对于玩过的游戏，您会去搜索和观看相关视频吗？');
INSERT INTO `dict_single` VALUES ('03983091-a933-4d5c-8608-30a9037b4f92', '您是否有享受过充值返利？');
INSERT INTO `dict_single` VALUES ('04ad9a7a-0b30-43ba-a530-3ec4ba9f7570', '你的性别');
INSERT INTO `dict_single` VALUES ('07b00b8a-a879-464b-8217-6dddf0be8565', '您的年龄段是？');
INSERT INTO `dict_single` VALUES ('092acbb0-6413-4be3-9c36-6fbd9eadf3e0', '您外出就餐的频率?');
INSERT INTO `dict_single` VALUES ('0a53698b-ce75-414c-8d8f-a15d8820e64f', '你觉得网络购物可靠吗？');
INSERT INTO `dict_single` VALUES ('0ae16ace-2a55-42c7-8740-d5992377391f', '如果xx网开通餐厅外卖的自助上线功能，让您可以在电脑上自助填写餐厅信息、外卖菜单，更新到xx网上，您愿意参与吗？您需要配备智能手机或电脑，自行录入菜单、修改菜单等');
INSERT INTO `dict_single` VALUES ('0ec95e69-ea3f-473c-80bb-98bee2673254', 'XX公众号粉丝调查');
INSERT INTO `dict_single` VALUES ('1131124e-1a61-4ce4-9943-20489a75062b', '您一般通过什么方式订外卖？');
INSERT INTO `dict_single` VALUES ('158e824a-4fd2-417b-a4c7-1666db4e966d', '网购时，你一般会使用快捷支付还是网银支付');
INSERT INTO `dict_single` VALUES ('198e27b8-b0f0-4cc1-8bc6-a2dd060705ed', '如果出现以上的问题时，你会选择？');
INSERT INTO `dict_single` VALUES ('1a50e2d8-1e16-492e-bff9-af49b4d6ad01', '您会关注手机游戏相关视频吗？');
INSERT INTO `dict_single` VALUES ('1a6af376-670a-42d1-b980-53841e625845', '您的性别？');
INSERT INTO `dict_single` VALUES ('1d26fd6f-ff03-401a-89ca-3e84396a2451', '您的年龄？');
INSERT INTO `dict_single` VALUES ('2115787f-12bf-42d3-a094-c791ae866893', '您希望餐厅多久推出一次新菜品？');
INSERT INTO `dict_single` VALUES ('2326b31d-f5b8-4515-ad05-6e8f164ca1c0', '你会在网吧等公共场所登录自己的网银账号吗？');
INSERT INTO `dict_single` VALUES ('2abe2d00-ab25-4599-af04-95e0d6328b7b', '您在什么情况下会选择叫外卖呢？');
INSERT INTO `dict_single` VALUES ('2be6723d-09b7-4385-9a02-4ea6c6cee47d', '您是怎么知道《xx》的？');
INSERT INTO `dict_single` VALUES ('328e8fe1-39df-4c44-8bf3-cc021c6edd45', '您了解主题餐厅吗？主题餐厅是通过一个或多个主题为吸引标志的饮食场所，希望人们身临其中的时候，经过观察和联想，进入期望的主题情境，譬如“亲临”世界的另一端、重温某段历史、了解一种陌生的文化等。');
INSERT INTO `dict_single` VALUES ('3688f5d3-d066-4013-bbbc-18bc588823cf', '目前店铺有几个客服提供服务');
INSERT INTO `dict_single` VALUES ('371fdd03-6ae1-4ab2-b007-ca4424e5098d', '在您的餐厅，外卖订单的数量平均每天约是');
INSERT INTO `dict_single` VALUES ('44787abe-ec76-4fbb-8d6f-5f4c731de92b', '您的年龄：');
INSERT INTO `dict_single` VALUES ('44f91b92-307a-4a8d-a421-cb9fd3d55869', '您参加xx网“双十一”活动的原因是');
INSERT INTO `dict_single` VALUES ('451693b2-71f9-4fde-82c1-09189a5b7c99', '请问您注重餐厅提供的贴心服务吗？（如菜点多了服务员会提醒，加辣或免辣的区分等）');
INSERT INTO `dict_single` VALUES ('45a57880-4c9e-4a4d-ac9b-0cb250ae011c', '您希望外卖公司提供的菜品组合？');
INSERT INTO `dict_single` VALUES ('4776ee89-d3ed-4f1e-b5b0-6be3f8cfd39a', '您的月收入（或生活费）?');
INSERT INTO `dict_single` VALUES ('47c5914a-e692-4f56-adbb-dd24a5b5034c', '请问您的餐厅是否提供外卖服务');
INSERT INTO `dict_single` VALUES ('4a9e03c2-a006-40f0-adf6-d445d2640535', '您最倾向于哪种环境下用餐？');
INSERT INTO `dict_single` VALUES ('4eb4058f-6687-479c-b5d8-e223a4585ef5', '如果餐厅满座需等位，您愿意等待的时间是？');
INSERT INTO `dict_single` VALUES ('4ef1c569-04ca-4c21-819f-16304683be9f', '您希望主题餐厅布局形式是？');
INSERT INTO `dict_single` VALUES ('4fe788ce-9f15-406d-937c-8fe588e7ecd0', '您在xx网每月店铺的成交额是');
INSERT INTO `dict_single` VALUES ('501c350e-76c3-4538-b530-2bbcf36d5126', '你能接受通过旅游电子商务网站获取信息吗');
INSERT INTO `dict_single` VALUES ('50ad3170-bbef-433a-8068-8cd475df830e', '餐厅装修风格，您跟喜欢在哪种环境下就餐？');
INSERT INTO `dict_single` VALUES ('51da3b64-3d7b-498c-92fc-f3ad6472e22b', '您的性别');
INSERT INTO `dict_single` VALUES ('5428caac-a7b7-4a70-85eb-adbd9feb8db5', '您还在哪些平台有店铺');
INSERT INTO `dict_single` VALUES ('5542ee4e-b39d-44a5-bf27-b3e212b775bd', '您最喜欢什么形式的消息推送？');
INSERT INTO `dict_single` VALUES ('5c0650dd-d600-4e78-a302-f1b054f055dd', '您的年龄');
INSERT INTO `dict_single` VALUES ('5ce95d51-ff2f-41f9-8fd3-7be53204a58e', '对于新游戏，观看相关视频后您会去下载吗？');
INSERT INTO `dict_single` VALUES ('5d92509c-1cd2-4325-8380-a8c1e82454ef', '您对外卖服务最看重的是哪方面？');
INSERT INTO `dict_single` VALUES ('5e0763f3-da15-41cc-bdfd-ce008aa8037b', '您的个人月收入（从各种途径得到的全部收入总和，包括零花钱）（或每月生活费）');
INSERT INTO `dict_single` VALUES ('5e596710-ac88-4626-a74c-e0f7c4fd7837', '您的职业：');
INSERT INTO `dict_single` VALUES ('611977aa-dbc4-4e8f-8b41-d7b70808f8f3', '您现有或规划的外卖配送员是');
INSERT INTO `dict_single` VALUES ('61849069-e90e-4b98-ac40-d35254513667', '上网的频率');
INSERT INTO `dict_single` VALUES ('66f54704-6209-45db-89a8-8d59189ce851', '您是否知道手游能提供充值返利的福利？');
INSERT INTO `dict_single` VALUES ('69be5e7b-feaa-44d0-8d60-50f002be1092', '您关注了多少个公众号？');
INSERT INTO `dict_single` VALUES ('6e3c77f5-2bb4-43d0-9a1a-14b808815526', '对于卖家发过来的链接你会随便点开并输入网银进行支付吗?');
INSERT INTO `dict_single` VALUES ('6ffd0688-bf93-4b81-ab67-f19b094882cd', '外出就餐时您经常遇到客满需等位的情况吗？');
INSERT INTO `dict_single` VALUES ('701a0cef-cb7d-4eee-afd7-6ce2763b1b67', '那您一般光顾的餐厅是否能做到食品安全？');
INSERT INTO `dict_single` VALUES ('73c08103-2e3d-4245-941a-d1dd012184ed', '您的年龄是？');
INSERT INTO `dict_single` VALUES ('747141c0-cc85-48a1-9b3b-263456d00de7', '您一般外出就餐花费的时间？');
INSERT INTO `dict_single` VALUES ('7bd2a964-11cf-4bb5-a2b4-a3da35d98444', '若必须重新练号才能获得充值返利的权利，您会？');
INSERT INTO `dict_single` VALUES ('7c2f8cc8-5f42-4f19-921a-8cd61a181f5c', '在工作日时，您午餐的选择是');
INSERT INTO `dict_single` VALUES ('7d01bdb4-645e-41a4-abee-5dde61fa4b66', '餐厅的采光和照明，哪种感觉让你更舒服？');
INSERT INTO `dict_single` VALUES ('7ee9f605-2295-4e79-b650-533f3c11dfaa', '您的性别：');
INSERT INTO `dict_single` VALUES ('80f6fb89-773d-4a09-b9d8-3d3af4a20df1', '您目前的职业是');
INSERT INTO `dict_single` VALUES ('8755c3f6-6986-43fd-8b1c-5cdfff216124', '为此，您一周会光顾多少次自助餐厅？');
INSERT INTO `dict_single` VALUES ('890cf746-2ef2-42e5-8c2b-0c7b3444bf1a', '您玩游戏常用的手机系统是？');
INSERT INTO `dict_single` VALUES ('89b675cf-7afe-4c20-918a-e6853781742b', '鉴收包裹时，您有先验货后鉴收的习惯吗？');
INSERT INTO `dict_single` VALUES ('8ed311bf-f123-4158-9845-8d488cbff04b', '你期待今年圣诞节吗？');
INSERT INTO `dict_single` VALUES ('8f52e733-0383-469b-a5a3-0b26ae2466bc', '你有没有一张专用的网银卡且上面仅存一定数额的资金');
INSERT INTO `dict_single` VALUES ('92b23137-8607-4a8a-b51b-d4c08011494b', '您的性别');
INSERT INTO `dict_single` VALUES ('9518604c-06ad-4387-a582-da12b73155a2', '您是否愿意在开通在线外卖业务，让用户可以在网上下单您餐厅的外卖');
INSERT INTO `dict_single` VALUES ('95c46607-1bb0-4f39-a81e-1edb704a48df', '最近三个月内，您叫外卖的频率更接近于？');
INSERT INTO `dict_single` VALUES ('9be8179e-d307-4a32-9c46-ba819049499f', '最近半年，您网购东西的频率是？');
INSERT INTO `dict_single` VALUES ('9ed54563-255d-4f7e-a065-36e4d61380a7', '您在《xx》的级别是？');
INSERT INTO `dict_single` VALUES ('a15b771e-03a2-4eb8-a42e-a8ee25c920d9', '您更喜欢哪类主题餐厅？');
INSERT INTO `dict_single` VALUES ('a392155e-b00b-4cd7-8438-e7afe5469f69', '您想送礼物给谁或最想收到谁送的礼物');
INSERT INTO `dict_single` VALUES ('a3da6efe-373a-4a80-8e09-63818119f299', '您的月收入为？（或每月生活费）');
INSERT INTO `dict_single` VALUES ('a60379c8-9ea5-4616-a12c-f718a946ae06', '入驻xx网的时间');
INSERT INTO `dict_single` VALUES ('a9c57a45-d872-422d-919a-d52fd61df983', '后续玩新区或玩新手游时，您是否会寻求充值返利的权利？');
INSERT INTO `dict_single` VALUES ('acf63e91-bd66-45f5-bb07-7623d703c447', '您午餐花费的时间一般为？');
INSERT INTO `dict_single` VALUES ('aeb5a052-1404-443d-b122-bd0d451098b0', '您是否参加了去年的xx网“双十一”活动');
INSERT INTO `dict_single` VALUES ('af770185-c116-45b8-93d8-a33b212f3a7d', '您的月收入（或生活费）?');
INSERT INTO `dict_single` VALUES ('afad54df-6ef5-4796-8167-14366a206f12', '请问您玩手游的过程中是否有过充值或购买等付费行为？');
INSERT INTO `dict_single` VALUES ('b4be244e-ebfd-4619-97cd-3c128db9cdf0', '在最近半年里，您每月大概花了多少钱在网上购物上？');
INSERT INTO `dict_single` VALUES ('b7c20082-18b5-43b7-be27-24736ea9d4e3', '您对本餐厅菜肴价格是否合理？');
INSERT INTO `dict_single` VALUES ('b8022dba-bbc0-4030-8755-b998c1965581', '您享受的返利比率是？');
INSERT INTO `dict_single` VALUES ('b9da7a65-6ee6-4d5b-9ca8-cce335a45e55', '您的年龄?');
INSERT INTO `dict_single` VALUES ('bbcb64b1-3ede-4c76-a3a5-23e8e6108c7e', '您手机里的游戏是否有通过付费下载？');
INSERT INTO `dict_single` VALUES ('bdf4a9dc-d3f6-424a-87e9-81b7bc11bbd0', '你的学历');
INSERT INTO `dict_single` VALUES ('c2a9d495-4611-4813-b098-c66862ea3bf8', '你喜欢网购吗？');
INSERT INTO `dict_single` VALUES ('cbe0482f-fdd7-4674-8ecb-63d53becb25a', '您是否玩手机游戏');
INSERT INTO `dict_single` VALUES ('cbe1a215-37c3-44bc-a06f-6e498e3287e4', '您是否经常困扰中午应该吃什么？');
INSERT INTO `dict_single` VALUES ('cc8adef6-cbe2-43af-8bf5-8bd0998aa68f', '您能接受的午餐价格？');
INSERT INTO `dict_single` VALUES ('ce311856-2525-4345-a454-8a2d31bce474', '您经常选择的餐饮消费档次?');
INSERT INTO `dict_single` VALUES ('cee316a7-6239-45fd-b89d-64277f061881', '遇到外卖服务不满意的情况，您会怎样处理？');
INSERT INTO `dict_single` VALUES ('d0c33f45-0c82-4923-9f8c-ac3876ef37fe', '您觉得XX公众号推送频率多少可以接受？');
INSERT INTO `dict_single` VALUES ('d46a6c0e-5132-4cd6-8aea-1f3aebfe0069', '你平时是否网购？');
INSERT INTO `dict_single` VALUES ('d565533d-0340-470c-975e-94baf64f3edb', '一家外卖餐厅能够提供菜品所含的卡路里和营养，您是否会感兴趣？');
INSERT INTO `dict_single` VALUES ('d868bee1-6218-4c52-84a6-8164cba114e0', '你的个人月收入（或每月生活费）');
INSERT INTO `dict_single` VALUES ('da826fd9-4727-46cf-b420-c70a72853c6a', '您是否希望通过饮食来控制体重？');
INSERT INTO `dict_single` VALUES ('dc8fca03-9ba7-40a7-84cf-3c5a04de6ddf', '您觉得食品安全是首位吗');
INSERT INTO `dict_single` VALUES ('df8bab63-591a-4102-8b2b-0a6a55434190', '为此，您一次消费愿意支付多少元？');
INSERT INTO `dict_single` VALUES ('dfbea56f-b913-4763-9d84-f24d1108e55c', '平时是否利用手机或者电脑上网');
INSERT INTO `dict_single` VALUES ('e0e9e41c-15d5-4730-9b33-e32c671592b1', '您的性别是？');
INSERT INTO `dict_single` VALUES ('e516d5ce-c4f9-4028-9375-dccff80d8639', '您了解的大多数餐厅中，能否按承诺提供优质菜品与服务？（如食材是否新鲜、服务是否到位等）');
INSERT INTO `dict_single` VALUES ('e58d0978-2199-4fb7-8b76-060dbfffdea9', '关于圣诞节的描述，你最认同的一点是？');
INSERT INTO `dict_single` VALUES ('e7302960-6cd6-4e62-93b5-95174578e5ba', '网购时，你会在意卖家的信誉度以及买家的评论吗？');
INSERT INTO `dict_single` VALUES ('e97d6d0b-64de-46e7-be3d-8e41eabc2bb4', '您最近玩过手机游戏吗？');
INSERT INTO `dict_single` VALUES ('eb67b2c4-78c4-4417-9f87-7d89f8fb7eca', '您一般通过什么途径知道外卖店？');
INSERT INTO `dict_single` VALUES ('eee83190-4b01-4771-b7b7-4dd8121cac34', '您没有参加xx网“双十一”的原因');
INSERT INTO `dict_single` VALUES ('f0dc9833-ad01-4380-833e-4d286cbf33d5', '你的职业');
INSERT INTO `dict_single` VALUES ('f1f4ecbc-6d1f-458b-b745-d8d11477d5a1', '是否使用过外包服务');
INSERT INTO `dict_single` VALUES ('f207f32a-2c36-4e38-ba41-daec12946783', '餐厅员工的质素是否会影响你再一次消费？');
INSERT INTO `dict_single` VALUES ('f21f38d1-1fb8-4c1f-a038-e152d5ad6611', '您周围的人参加双十一后，最普遍的反响是');
INSERT INTO `dict_single` VALUES ('f297bfe0-87e8-422e-8448-62e6e1164b87', '在您的餐厅，到店堂食的顾客平均每天约有');
INSERT INTO `dict_single` VALUES ('f2f3974a-1011-4beb-8151-fd19ed68f95e', '手机系统类型');
INSERT INTO `dict_single` VALUES ('f3187047-bced-4b4d-a86d-0f5c2eaa1200', '您觉得就餐时服务员应与您保持的距离应保持？');
INSERT INTO `dict_single` VALUES ('f34a3fb9-4058-43e4-93f7-6a928bf8b759', '您一般在什么时间查看我们的推送内容？');
INSERT INTO `dict_single` VALUES ('f3707e67-c37b-492a-87a6-bb19ebe0242b', '您希望主题餐厅的就餐形式是？');
INSERT INTO `dict_single` VALUES ('f4133528-28c8-4f97-9baf-4925af0084e2', '请选择性别');
INSERT INTO `dict_single` VALUES ('f5ab4a62-7b1b-43d0-b7bb-da380d2ddbbf', '如果有充值需要，您是否愿意尝试了解充值返利？');
INSERT INTO `dict_single` VALUES ('f6d4fc71-5b2f-4156-ae2d-0562cb5a227d', '您的性别？');

-- ----------------------------
-- Table structure for dict_single_option
-- ----------------------------
DROP TABLE IF EXISTS `dict_single_option`;
CREATE TABLE `dict_single_option` (
  `dict_single_option_id` varchar(255) NOT NULL,
  `dict_single_id` varchar(255) default NULL,
  `dict_single_order` int(255) default NULL,
  `dict_single_option_content` varchar(255) default NULL,
  PRIMARY KEY  (`dict_single_option_id`),
  KEY `foreign key_dict_single_option_dict_single_option_id` (`dict_single_id`),
  CONSTRAINT `foreign key_dict_single_option_dict_single_option_id` FOREIGN KEY (`dict_single_id`) REFERENCES `dict_single` (`dict_single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_single_option
-- ----------------------------
INSERT INTO `dict_single_option` VALUES ('00c47b45-ccab-4968-9fb0-e6b7d5534355', 'eee83190-4b01-4771-b7b7-4dd8121cac34', '2', '觉得这只是商家的宣传手段');
INSERT INTO `dict_single_option` VALUES ('0108d61d-60a6-47da-95ea-d32c00a7b63e', '5ce95d51-ff2f-41f9-8fd3-7be53204a58e', '2', '不会');
INSERT INTO `dict_single_option` VALUES ('02f801a7-1515-4084-9439-d30471a1b5d4', 'f297bfe0-87e8-422e-8448-62e6e1164b87', '2', '101-200人次');
INSERT INTO `dict_single_option` VALUES ('040931a7-8824-40ac-b5de-a03897873590', '747141c0-cc85-48a1-9b3b-263456d00de7', '2', '30-60分钟');
INSERT INTO `dict_single_option` VALUES ('04426863-439d-49b7-8c7e-1130dd7ece76', '2326b31d-f5b8-4515-ad05-6e8f164ca1c0', '1', '会');
INSERT INTO `dict_single_option` VALUES ('0470a181-0986-4b51-8c6a-02de5a8e11e6', 'f1f4ecbc-6d1f-458b-b745-d8d11477d5a1', '2', '否');
INSERT INTO `dict_single_option` VALUES ('052331c2-91b1-4126-93af-3372694e53d4', 'f6d4fc71-5b2f-4156-ae2d-0562cb5a227d', '1', '男');
INSERT INTO `dict_single_option` VALUES ('05fe7181-7e53-4519-b885-568b0762171b', 'a60379c8-9ea5-4616-a12c-f718a946ae06', '1', '小于1年');
INSERT INTO `dict_single_option` VALUES ('06f07c62-c1a8-46d6-81bd-12419901c1ff', 'bdf4a9dc-d3f6-424a-87e9-81b7bc11bbd0', '1', '初中及以下');
INSERT INTO `dict_single_option` VALUES ('088e7d0e-017b-4e10-a617-ce1544849d5d', '9be8179e-d307-4a32-9c46-ba819049499f', '2', '每周都会看');
INSERT INTO `dict_single_option` VALUES ('08fefba5-9c44-4630-881c-e82a2c390b90', '4ef1c569-04ca-4c21-819f-16304683be9f', '4', '都有');
INSERT INTO `dict_single_option` VALUES ('093b4496-1efb-4404-ac36-5d12807850b8', '747141c0-cc85-48a1-9b3b-263456d00de7', '3', '1小时-1个半小时');
INSERT INTO `dict_single_option` VALUES ('0bf96612-a5c0-4366-b387-52d4db3341b8', 'a15b771e-03a2-4eb8-a42e-a8ee25c920d9', '4', '以商务为主题');
INSERT INTO `dict_single_option` VALUES ('0c0f5ffd-b7e8-47f2-96e3-be7b60639068', 'a392155e-b00b-4cd7-8438-e7afe5469f69', '3', '父母');
INSERT INTO `dict_single_option` VALUES ('0c6b24d3-40e7-4f08-8eb8-7472df72deab', '501c350e-76c3-4538-b530-2bbcf36d5126', '1', '非常能接受');
INSERT INTO `dict_single_option` VALUES ('0e79f859-f413-4838-bd54-1345f3a6b359', 'acf63e91-bd66-45f5-bb07-7623d703c447', '1', '30分钟以内');
INSERT INTO `dict_single_option` VALUES ('0f439814-bb62-4fbb-bffa-e26de0997a37', 'cbe0482f-fdd7-4674-8ecb-63d53becb25a', '2', '不玩');
INSERT INTO `dict_single_option` VALUES ('0f7e5573-64b5-4442-8114-f66e137cb843', '66f54704-6209-45db-89a8-8d59189ce851', '1', '是');
INSERT INTO `dict_single_option` VALUES ('0f9f3942-ca3e-42d8-a1b8-1916640a1c38', '2abe2d00-ab25-4599-af04-95e0d6328b7b', '4', '没人一起吃饭');
INSERT INTO `dict_single_option` VALUES ('10f54c77-4a98-4b3b-8603-2ab08f33bec6', 'afad54df-6ef5-4796-8167-14366a206f12', '2', '有');
INSERT INTO `dict_single_option` VALUES ('11814c82-9380-4a23-bed2-279bd45289b2', 'f0dc9833-ad01-4380-833e-4d286cbf33d5', '2', '政府/机关干部/公务员');
INSERT INTO `dict_single_option` VALUES ('123926b9-52db-4efa-9950-19b8ca8aa9c0', '5542ee4e-b39d-44a5-bf27-b3e212b775bd', '1', '纯文字');
INSERT INTO `dict_single_option` VALUES ('123db4c7-6aa9-456a-8902-81c17fdde028', '7bd2a964-11cf-4bb5-a2b4-a3da35d98444', '2', '等想换区或换游戏时再考虑');
INSERT INTO `dict_single_option` VALUES ('127a58ac-89f6-41a3-b35b-6150ec154627', 'cee316a7-6239-45fd-b89d-64277f061881', '2', '到店/电话与老板沟通');
INSERT INTO `dict_single_option` VALUES ('12886e6c-b6e6-436a-9fe6-d3cfb96fe26d', 'e97d6d0b-64de-46e7-be3d-8e41eabc2bb4', '1', '每天都玩');
INSERT INTO `dict_single_option` VALUES ('12b5ecd0-8522-4e0f-bf83-5c59892cb7e2', 'da826fd9-4727-46cf-b420-c70a72853c6a', '1', '是');
INSERT INTO `dict_single_option` VALUES ('1718c356-a109-42b7-878f-dccdcb493269', 'b4be244e-ebfd-4619-97cd-3c128db9cdf0', '2', '201-500元');
INSERT INTO `dict_single_option` VALUES ('17aedeba-0799-4a7a-a347-9fa7e5498f0f', '80f6fb89-773d-4a09-b9d8-3d3af4a20df1', '2', '政府/机关干部/公务员');
INSERT INTO `dict_single_option` VALUES ('180340f8-810d-440b-a3c4-f7ca501c7bf2', 'b8022dba-bbc0-4030-8755-b998c1965581', '4', '50%及以上');
INSERT INTO `dict_single_option` VALUES ('1858eb59-d1bf-4123-8ec5-1bc1084cbb48', 'd868bee1-6218-4c52-84a6-8164cba114e0', '3', '10001-20000元');
INSERT INTO `dict_single_option` VALUES ('19fdc7e7-d921-450b-92bf-a1740ccb7899', '8ed311bf-f123-4158-9845-8d488cbff04b', '3', '不期待');
INSERT INTO `dict_single_option` VALUES ('1a488fba-b167-4431-a7a1-836665f44029', '9ed54563-255d-4f7e-a065-36e4d61380a7', '4', '30级-60级');
INSERT INTO `dict_single_option` VALUES ('1ab0b8a5-ec04-4c49-b54d-e6affb2b3cc2', 'd868bee1-6218-4c52-84a6-8164cba114e0', '2', '1001-10000元');
INSERT INTO `dict_single_option` VALUES ('1b9a7907-cf09-4aa2-a1aa-f381ba7e82f3', '9518604c-06ad-4387-a582-da12b73155a2', '1', '愿意');
INSERT INTO `dict_single_option` VALUES ('1c2fc856-0680-475d-aca0-212eee983563', 'ce311856-2525-4345-a454-8a2d31bce474', '3', '特色小吃');
INSERT INTO `dict_single_option` VALUES ('1cbfa405-85a8-4ef5-b028-c33f943fdf24', '61849069-e90e-4b98-ac40-d35254513667', '2', '每周2-4次');
INSERT INTO `dict_single_option` VALUES ('1d27810e-6f59-4c02-9974-b729df1061de', '092acbb0-6413-4be3-9c36-6fbd9eadf3e0', '4', '每周2次或以上');
INSERT INTO `dict_single_option` VALUES ('1d2a20c2-d86c-43ca-b662-2157536a2b0e', 'b7c20082-18b5-43b7-be27-24736ea9d4e3', '4', '较低');
INSERT INTO `dict_single_option` VALUES ('1e9b375b-a35e-4e98-9bb4-eb5bb745cbf7', 'dc8fca03-9ba7-40a7-84cf-3c5a04de6ddf', '1', '是');
INSERT INTO `dict_single_option` VALUES ('20cd18d9-2174-43a9-8d7c-0d44b04429e0', '198e27b8-b0f0-4cc1-8bc6-a2dd060705ed', '4', '拨打当地的12315进行投诉维权');
INSERT INTO `dict_single_option` VALUES ('20e4d836-2d4f-4bbc-93f3-80b9a81e5e50', '69be5e7b-feaa-44d0-8d60-50f002be1092', '1', '10个以内');
INSERT INTO `dict_single_option` VALUES ('213cc6d9-6745-47db-af97-06ab8a397872', 'f2f3974a-1011-4beb-8151-fd19ed68f95e', '3', 'windows phone');
INSERT INTO `dict_single_option` VALUES ('22e059fd-de21-4364-8067-eaa7fbb6fedd', '0a53698b-ce75-414c-8d8f-a15d8820e64f', '2', '不可靠');
INSERT INTO `dict_single_option` VALUES ('235f07b4-676f-4654-ae35-f1f1932fe13c', 'd46a6c0e-5132-4cd6-8aea-1f3aebfe0069', '1', '是');
INSERT INTO `dict_single_option` VALUES ('23973383-65d6-4ad8-b40e-d227f943e3cd', '4eb4058f-6687-479c-b5d8-e223a4585ef5', '1', '15分钟内');
INSERT INTO `dict_single_option` VALUES ('242ce793-b11f-4f89-bad6-6533496f15ee', 'd565533d-0340-470c-975e-94baf64f3edb', '2', '否');
INSERT INTO `dict_single_option` VALUES ('2479281a-db4f-4c7b-8b96-2f14e01d8444', '371fdd03-6ae1-4ab2-b007-ca4424e5098d', '3', '21-40单');
INSERT INTO `dict_single_option` VALUES ('25f3e08d-27c5-4f26-8c89-ade3ccdb6a17', 'bbcb64b1-3ede-4c76-a3a5-23e8e6108c7e', '1', '有');
INSERT INTO `dict_single_option` VALUES ('2673567f-633c-4096-a66c-7ac27aecee81', 'f34a3fb9-4058-43e4-93f7-6a928bf8b759', '1', '早上起床后');
INSERT INTO `dict_single_option` VALUES ('2749eaa8-ab05-4479-b94d-d2f2c610161e', '04ad9a7a-0b30-43ba-a530-3ec4ba9f7570', '2', '女');
INSERT INTO `dict_single_option` VALUES ('2778c9bb-70e0-4148-9435-be1d42631615', '7bd2a964-11cf-4bb5-a2b4-a3da35d98444', '4', '麻烦，不再考虑');
INSERT INTO `dict_single_option` VALUES ('289133f6-9345-4d82-89ac-c27cbee9f26a', '69be5e7b-feaa-44d0-8d60-50f002be1092', '2', '10—20个');
INSERT INTO `dict_single_option` VALUES ('294fffe2-54c7-4575-b0e9-8f5a39a093d5', 'f6d4fc71-5b2f-4156-ae2d-0562cb5a227d', '2', '女');
INSERT INTO `dict_single_option` VALUES ('2998a447-0dd7-41b3-bd31-d893574ec885', 'cbe1a215-37c3-44bc-a06f-6e498e3287e4', '1', '是');
INSERT INTO `dict_single_option` VALUES ('2b42c007-baae-4bfa-85ef-6c82f6ef1f55', '016b2f16-5469-44f4-831c-ed1d243f7bde', '3', '没有，但打算送');
INSERT INTO `dict_single_option` VALUES ('2c1775f9-9286-48e2-8d6d-35b27a6fe749', 'bdf4a9dc-d3f6-424a-87e9-81b7bc11bbd0', '3', '大专');
INSERT INTO `dict_single_option` VALUES ('2c22adba-3a96-4aea-a4f0-99eb30201e61', 'f207f32a-2c36-4e38-ba41-daec12946783', '3', '受影响，如果不满意绝不再消费');
INSERT INTO `dict_single_option` VALUES ('2c2a7762-4bbf-4af2-8149-ecf27bf18a3e', 'cc8adef6-cbe2-43af-8bf5-8bd0998aa68f', '3', '31—50元');
INSERT INTO `dict_single_option` VALUES ('2ca5fd0b-a8c6-4c72-8b1f-9ff98ff5a158', 'eee83190-4b01-4771-b7b7-4dd8121cac34', '1', '没有购物需求');
INSERT INTO `dict_single_option` VALUES ('2cdcf396-6c0f-48e7-92fe-a181269140b2', 'a3da6efe-373a-4a80-8e09-63818119f299', '2', '1001-10000元');
INSERT INTO `dict_single_option` VALUES ('2d6989c4-c77f-4ec4-9319-b130695ba3d5', 'a15b771e-03a2-4eb8-a42e-a8ee25c920d9', '3', '以怀旧为主题');
INSERT INTO `dict_single_option` VALUES ('2da5a952-d63d-424e-b6e4-490049fb78ae', 'b9da7a65-6ee6-4d5b-9ca8-cce335a45e55', '1', '20岁及以下');
INSERT INTO `dict_single_option` VALUES ('2f339b4c-9770-4a59-84d9-b5078f75ad60', '3688f5d3-d066-4013-bbbc-18bc588823cf', '3', '4-5个');
INSERT INTO `dict_single_option` VALUES ('2fb8dcb1-2ca9-4da2-831b-688b85e98b45', '006e4ece-664c-4952-8af2-e4889f68bcad', '3', '企业管理者（包括基层及中高层管理者）');
INSERT INTO `dict_single_option` VALUES ('303031fe-49a3-44c7-97ad-be04aab807ce', 'e58d0978-2199-4fb7-8b76-060dbfffdea9', '3', '就让我一个人做安静的美男纸或女纸吧');
INSERT INTO `dict_single_option` VALUES ('30a45164-0adf-4f8d-96fb-483b55353e41', '4776ee89-d3ed-4f1e-b5b0-6be3f8cfd39a', '4', '20000元以上');
INSERT INTO `dict_single_option` VALUES ('3264ea52-361a-4b74-87ad-66a8b637129c', '5428caac-a7b7-4a70-85eb-adbd9feb8db5', '3', '京东');
INSERT INTO `dict_single_option` VALUES ('32c7a3a9-fba7-43b4-a76b-fb92b4ec57ab', '80f6fb89-773d-4a09-b9d8-3d3af4a20df1', '4', '普通职员（办公室/写字楼工作人员）');
INSERT INTO `dict_single_option` VALUES ('32cabbcb-31f7-4691-9441-0d53fd24773c', '07b00b8a-a879-464b-8217-6dddf0be8565', '4', '40岁以上');
INSERT INTO `dict_single_option` VALUES ('3423ded5-d5ae-4af7-8dc9-75ff5c5cb554', '4ef1c569-04ca-4c21-819f-16304683be9f', '3', '大厅');
INSERT INTO `dict_single_option` VALUES ('342d23da-7b81-4ecb-b3c5-551adc7bbf23', '0ec95e69-ea3f-473c-80bb-98bee2673254', '3', '二维码扫描');
INSERT INTO `dict_single_option` VALUES ('35e692ac-ad9d-4516-97d8-9e65cd9b89d0', '747141c0-cc85-48a1-9b3b-263456d00de7', '4', '一个半小时以上');
INSERT INTO `dict_single_option` VALUES ('362e3d73-304f-4689-bb96-a1310ec1e743', '7c2f8cc8-5f42-4f19-921a-8cd61a181f5c', '1', '公司餐厅');
INSERT INTO `dict_single_option` VALUES ('36d9a598-4778-4b9f-bf2b-6ccbef488f46', '5c0650dd-d600-4e78-a302-f1b054f055dd', '2', '21-30岁');
INSERT INTO `dict_single_option` VALUES ('375e5533-b15e-44cf-b094-93d69e43ad45', 'acf63e91-bd66-45f5-bb07-7623d703c447', '2', '30-60分钟');
INSERT INTO `dict_single_option` VALUES ('380d3172-f398-4f9a-bfbd-e0b1af8c3e35', '1131124e-1a61-4ce4-9943-20489a75062b', '4', '外卖App');
INSERT INTO `dict_single_option` VALUES ('38c71e57-ff3a-4b17-9be5-cafe4d50ae21', '50ad3170-bbef-433a-8068-8cd475df830e', '4', '主题文化特色');
INSERT INTO `dict_single_option` VALUES ('38e068e5-5b07-4553-9ada-6da85586e945', 'f4133528-28c8-4f97-9baf-4925af0084e2', '2', '女');
INSERT INTO `dict_single_option` VALUES ('393b33c8-c505-4106-98c8-a1f048527e9a', '9ed54563-255d-4f7e-a065-36e4d61380a7', '1', '1级-10级');
INSERT INTO `dict_single_option` VALUES ('398defaa-696b-4afa-bf6e-561133ebd2a9', '5e596710-ac88-4626-a74c-e0f7c4fd7837', '1', '在校学生');
INSERT INTO `dict_single_option` VALUES ('39e3a58e-d64d-48b7-9abc-6b7233eae15a', '501c350e-76c3-4538-b530-2bbcf36d5126', '4', '不能接受');
INSERT INTO `dict_single_option` VALUES ('3af44f12-f8b8-4a66-9a2c-6351002b2018', '9be8179e-d307-4a32-9c46-ba819049499f', '1', '每天都会看');
INSERT INTO `dict_single_option` VALUES ('3b02fc3b-ab0f-4c97-bcdd-a3aa61be22f5', '1131124e-1a61-4ce4-9943-20489a75062b', '3', '微信');
INSERT INTO `dict_single_option` VALUES ('3bcdc8ff-294f-4108-98fd-f04defab3362', '158e824a-4fd2-417b-a4c7-1666db4e966d', '2', '网银支付');
INSERT INTO `dict_single_option` VALUES ('3c0faaa5-1b3a-45dd-8230-94a212f76dc1', '1a50e2d8-1e16-492e-bff9-af49b4d6ad01', '1', '喜欢，经常看');
INSERT INTO `dict_single_option` VALUES ('3d327f6b-2f1c-4838-81f8-3e970dc1e4c3', '69be5e7b-feaa-44d0-8d60-50f002be1092', '3', '太多了，没有数过');
INSERT INTO `dict_single_option` VALUES ('3d68ada6-8b69-44bd-bf87-f3fa58ebea63', '2115787f-12bf-42d3-a094-c791ae866893', '2', '三月1次');
INSERT INTO `dict_single_option` VALUES ('3d944a09-71f0-48c6-9b3b-2a85cc3bc428', 'eee83190-4b01-4771-b7b7-4dd8121cac34', '4', '物流太慢');
INSERT INTO `dict_single_option` VALUES ('3f10ef65-51ae-42b2-9785-8c4146d443f1', '006e4ece-664c-4952-8af2-e4889f68bcad', '4', '普通职员（办公室/写字楼工作人员）');
INSERT INTO `dict_single_option` VALUES ('411d0dc7-e0df-44c9-96b1-f9fbe9ba94cf', '371fdd03-6ae1-4ab2-b007-ca4424e5098d', '1', '1-10单');
INSERT INTO `dict_single_option` VALUES ('419c6163-4f00-4c03-ba24-9df509c79cd5', '0ae16ace-2a55-42c7-8740-d5992377391f', '1', '愿意，我们很需要这样的功能');
INSERT INTO `dict_single_option` VALUES ('41a2eba8-9b4c-4737-a5ef-00664dda1210', '6e3c77f5-2bb4-43d0-9a1a-14b808815526', '1', '会');
INSERT INTO `dict_single_option` VALUES ('4213a918-4feb-49f8-99dd-78865209049e', 'a392155e-b00b-4cd7-8438-e7afe5469f69', '1', '恋人');
INSERT INTO `dict_single_option` VALUES ('446037e0-8a3a-4cc5-94a4-a8a13f1680a7', '451693b2-71f9-4fde-82c1-09189a5b7c99', '3', '无所谓');
INSERT INTO `dict_single_option` VALUES ('449992d3-2e9d-4f24-bbe5-f748e30e3fb4', 'aeb5a052-1404-443d-b122-bd0d451098b0', '1', '是');
INSERT INTO `dict_single_option` VALUES ('4561dff7-4a83-4342-b969-ebb871f63ae2', '5ce95d51-ff2f-41f9-8fd3-7be53204a58e', '1', '会');
INSERT INTO `dict_single_option` VALUES ('45bfd419-4ef4-419d-972f-202ce1bbd833', '701a0cef-cb7d-4eee-afd7-6ce2763b1b67', '2', '不能');
INSERT INTO `dict_single_option` VALUES ('47cf6dc4-b915-4ae6-95fa-5aa88a81fa7a', '50ad3170-bbef-433a-8068-8cd475df830e', '2', '商务休闲');
INSERT INTO `dict_single_option` VALUES ('47d27445-32e5-4683-affb-950626593ddf', 'da826fd9-4727-46cf-b420-c70a72853c6a', '2', '否');
INSERT INTO `dict_single_option` VALUES ('47d5cc22-8112-4a23-ae0d-8679bd525db9', 'df8bab63-591a-4102-8b2b-0a6a55434190', '2', '30-50元');
INSERT INTO `dict_single_option` VALUES ('47eee60a-1032-42d3-a8ce-d58800822fb9', '7bd2a964-11cf-4bb5-a2b4-a3da35d98444', '3', '朋友或公会组织一起玩时再考虑');
INSERT INTO `dict_single_option` VALUES ('4a3acf21-047e-4dc7-afcd-8747f7243b9d', '5ce95d51-ff2f-41f9-8fd3-7be53204a58e', '3', '也许会');
INSERT INTO `dict_single_option` VALUES ('4acbd4db-da30-4d34-afd7-25a25dc45ed8', '4eb4058f-6687-479c-b5d8-e223a4585ef5', '4', '不等，直接换餐厅');
INSERT INTO `dict_single_option` VALUES ('4b80d207-0210-4aba-a899-8cf1245a26be', 'df8bab63-591a-4102-8b2b-0a6a55434190', '1', '30元以下');
INSERT INTO `dict_single_option` VALUES ('4b87684d-8289-49e8-9f64-9c6f74e33f80', 'afad54df-6ef5-4796-8167-14366a206f12', '1', '没有');
INSERT INTO `dict_single_option` VALUES ('4c7a60d5-0310-4faf-ad7e-4f37613c888f', '95c46607-1bb0-4f39-a81e-1edb704a48df', '4', '5次/周');
INSERT INTO `dict_single_option` VALUES ('4cc05301-e1f3-4478-b5ec-d0e55a908f80', '73c08103-2e3d-4245-941a-d1dd012184ed', '3', '31-40岁');
INSERT INTO `dict_single_option` VALUES ('4d062bba-5828-4873-97f2-0df52f4075f5', '4ef1c569-04ca-4c21-819f-16304683be9f', '2', '卡座');
INSERT INTO `dict_single_option` VALUES ('4e906b02-86cf-4a8f-913b-37be38ff0af6', 'b7c20082-18b5-43b7-be27-24736ea9d4e3', '2', '适中');
INSERT INTO `dict_single_option` VALUES ('4ebdfaa9-a65e-4ee4-b395-704c2db48988', '4eb4058f-6687-479c-b5d8-e223a4585ef5', '3', '30到45分钟');
INSERT INTO `dict_single_option` VALUES ('51138afc-b14a-4b37-b4f7-182b6c5bd995', 'e0e9e41c-15d5-4730-9b33-e32c671592b1', '2', '女');
INSERT INTO `dict_single_option` VALUES ('514a39aa-64d7-463c-be2d-98c758b1dafc', '198e27b8-b0f0-4cc1-8bc6-a2dd060705ed', '1', '忍气吞声，直接给差评');
INSERT INTO `dict_single_option` VALUES ('518f5159-c0c8-4bfd-b216-e18d7e6ea8f6', 'ce311856-2525-4345-a454-8a2d31bce474', '1', '高档餐');
INSERT INTO `dict_single_option` VALUES ('52d47d91-d163-4b25-bdb1-aea18a260978', '44f91b92-307a-4a8d-a421-cb9fd3d55869', '2', '网络宣传声势浩大');
INSERT INTO `dict_single_option` VALUES ('53b8eb21-fc39-4db7-a17f-9f52084620c6', '61849069-e90e-4b98-ac40-d35254513667', '3', '每周1次');
INSERT INTO `dict_single_option` VALUES ('54590d5d-ab9d-401f-bd81-99e5d8064367', '4776ee89-d3ed-4f1e-b5b0-6be3f8cfd39a', '3', '10001-20000元');
INSERT INTO `dict_single_option` VALUES ('547f7263-a957-4ca2-ae91-8666a7c037fe', '4a9e03c2-a006-40f0-adf6-d445d2640535', '1', '安静的');
INSERT INTO `dict_single_option` VALUES ('551cf92e-4029-4750-8462-cc84684b0f10', 'f297bfe0-87e8-422e-8448-62e6e1164b87', '3', '201-400人次');
INSERT INTO `dict_single_option` VALUES ('55a69b41-f16b-4087-b8ff-108f0696fb5e', 'd868bee1-6218-4c52-84a6-8164cba114e0', '4', '20000元以上');
INSERT INTO `dict_single_option` VALUES ('55c40ede-beb3-4436-b6d1-711e9f97bcc3', 'b8022dba-bbc0-4030-8755-b998c1965581', '2', '30%');
INSERT INTO `dict_single_option` VALUES ('55e5344c-dd5c-429d-a56d-ce13ff24f2db', 'e97d6d0b-64de-46e7-be3d-8e41eabc2bb4', '4', '没玩过但感兴趣');
INSERT INTO `dict_single_option` VALUES ('56610419-00a9-443e-b15d-0cde6dbad0f3', '1a50e2d8-1e16-492e-bff9-af49b4d6ad01', '4', '不感兴趣');
INSERT INTO `dict_single_option` VALUES ('56e35052-a4f6-4341-96b4-edeb01d167d8', '7ee9f605-2295-4e79-b650-533f3c11dfaa', '2', '女');
INSERT INTO `dict_single_option` VALUES ('5702f581-587f-4a56-8aa0-fe96293c7c5e', '0ec95e69-ea3f-473c-80bb-98bee2673254', '1', '朋友推荐');
INSERT INTO `dict_single_option` VALUES ('578ced85-8344-460b-a09b-3a6dbc3b41a6', '89b675cf-7afe-4c20-918a-e6853781742b', '2', '没有');
INSERT INTO `dict_single_option` VALUES ('57a68f81-fbc8-496f-9fdb-6a9c9648e0ea', '95c46607-1bb0-4f39-a81e-1edb704a48df', '1', '0次');
INSERT INTO `dict_single_option` VALUES ('57d2bb9f-58f8-4fa8-82d1-b8312ed1838c', '7d01bdb4-645e-41a4-abee-5dde61fa4b66', '1', '明亮通透');
INSERT INTO `dict_single_option` VALUES ('581d9c9d-5441-4ed9-8143-f6f7f8ffa7a1', 'cee316a7-6239-45fd-b89d-64277f061881', '3', '向食品监管部门投诉');
INSERT INTO `dict_single_option` VALUES ('582432c3-000f-456e-8c4b-1a7dd7c4a6d2', 'f3707e67-c37b-492a-87a6-bb19ebe0242b', '3', '套餐式');
INSERT INTO `dict_single_option` VALUES ('58605599-21d7-47e7-bda0-3171f4fe5d81', '5542ee4e-b39d-44a5-bf27-b3e212b775bd', '3', '视频消息');
INSERT INTO `dict_single_option` VALUES ('58d5c653-a62a-4efe-bc7b-045aca53d7cd', 'e97d6d0b-64de-46e7-be3d-8e41eabc2bb4', '3', '偶尔会玩');
INSERT INTO `dict_single_option` VALUES ('5a10d956-3fff-47d9-9b18-da57fa1bb238', '5428caac-a7b7-4a70-85eb-adbd9feb8db5', '4', '亚马逊');
INSERT INTO `dict_single_option` VALUES ('5a1a636d-eb04-499d-a115-090f65b78671', 'c2a9d495-4611-4813-b098-c66862ea3bf8', '2', '不喜欢');
INSERT INTO `dict_single_option` VALUES ('5dcc0335-9a3f-4083-b200-e2e5616cf26d', '1a6af376-670a-42d1-b980-53841e625845', '1', '男');
INSERT INTO `dict_single_option` VALUES ('5ee1f195-fa62-4d3b-88a4-d8a2b6cbeab8', 'f3187047-bced-4b4d-a86d-0f5c2eaa1200', '1', '桌边');
INSERT INTO `dict_single_option` VALUES ('5ee3b719-b8f8-4112-ab1a-1344961c3896', '80f6fb89-773d-4a09-b9d8-3d3af4a20df1', '1', '在校学生');
INSERT INTO `dict_single_option` VALUES ('5ef0d213-42fc-4bec-998b-65f09b57437e', '5e596710-ac88-4626-a74c-e0f7c4fd7837', '4', '普通职员（办公室/写字楼工作人员）');
INSERT INTO `dict_single_option` VALUES ('5f6e03aa-dcfa-4678-a010-cd595448c944', 'b9da7a65-6ee6-4d5b-9ca8-cce335a45e55', '4', '40岁以上');
INSERT INTO `dict_single_option` VALUES ('5f75c847-eb44-4981-be79-e7ddd5675c06', '61849069-e90e-4b98-ac40-d35254513667', '1', '每周5次或更多');
INSERT INTO `dict_single_option` VALUES ('6004dc5f-c51e-4a22-98fb-cc1ad299183e', 'c2a9d495-4611-4813-b098-c66862ea3bf8', '1', '喜欢');
INSERT INTO `dict_single_option` VALUES ('60f25772-edb4-4422-b684-65faebc917e6', 'f297bfe0-87e8-422e-8448-62e6e1164b87', '4', '400人次以上');
INSERT INTO `dict_single_option` VALUES ('63c58d3a-9f91-4043-bdd6-0ed017633fb9', '4776ee89-d3ed-4f1e-b5b0-6be3f8cfd39a', '1', '1000元以下');
INSERT INTO `dict_single_option` VALUES ('63cc6592-3228-419b-8a1f-c269317ba921', 'bbcb64b1-3ede-4c76-a3a5-23e8e6108c7e', '2', '没有');
INSERT INTO `dict_single_option` VALUES ('650eb002-9347-4156-b32b-4a2721cdb396', '89b675cf-7afe-4c20-918a-e6853781742b', '3', '偶尔有');
INSERT INTO `dict_single_option` VALUES ('65459479-4b59-4116-8a3e-be67abfc3111', '44f91b92-307a-4a8d-a421-cb9fd3d55869', '1', '受周围人的影响');
INSERT INTO `dict_single_option` VALUES ('65a6e896-959a-4289-9ad0-e74d7bc45c18', 'a60379c8-9ea5-4616-a12c-f718a946ae06', '3', '2-3年');
INSERT INTO `dict_single_option` VALUES ('661cba98-8116-4e31-ae1b-4de5d57412c2', '8ed311bf-f123-4158-9845-8d488cbff04b', '1', '很期待');
INSERT INTO `dict_single_option` VALUES ('66200c3e-3329-4826-b072-eb23dc380e78', '371fdd03-6ae1-4ab2-b007-ca4424e5098d', '2', '11-20单');
INSERT INTO `dict_single_option` VALUES ('6832c87e-30c1-489e-8a0b-5b699e4e0de6', '611977aa-dbc4-4e8f-8b41-d7b70808f8f3', '2', '全部是有第三方人员（如“点我吧”等外送公司）');
INSERT INTO `dict_single_option` VALUES ('686fd917-806c-4003-8739-d070083df486', '45a57880-4c9e-4a4d-ac9b-0cb250ae011c', '2', '两荤两素');
INSERT INTO `dict_single_option` VALUES ('68fdeba6-9777-4280-97b4-c33b48486fa1', 'acf63e91-bd66-45f5-bb07-7623d703c447', '4', '一个半小时以上');
INSERT INTO `dict_single_option` VALUES ('698849e7-ce6f-41cf-84b7-1be7dd66b625', '03983091-a933-4d5c-8608-30a9037b4f92', '1', '有');
INSERT INTO `dict_single_option` VALUES ('6df55788-09a9-41b0-9de3-68e9394faafa', '5c0650dd-d600-4e78-a302-f1b054f055dd', '4', '40岁及以上');
INSERT INTO `dict_single_option` VALUES ('6e248ec4-140e-4c54-abf0-5f06d81f1d54', 'd565533d-0340-470c-975e-94baf64f3edb', '3', '无所谓');
INSERT INTO `dict_single_option` VALUES ('6f7ac17e-02db-4d7b-8e41-aa335c42f010', '0ec95e69-ea3f-473c-80bb-98bee2673254', '2', '相关文章');
INSERT INTO `dict_single_option` VALUES ('6f80e3ae-5375-4c32-92e5-8c749b535ca2', '1d26fd6f-ff03-401a-89ca-3e84396a2451', '1', '20岁及以下');
INSERT INTO `dict_single_option` VALUES ('6fcc39ef-bc0c-46f7-9233-d1ced3e71868', 'f21f38d1-1fb8-4c1f-a038-e152d5ad6611', '1', '非常满意');
INSERT INTO `dict_single_option` VALUES ('704b41e6-2267-4b63-9c06-361d60435f48', '4fe788ce-9f15-406d-937c-8fe588e7ecd0', '1', '小于5W');
INSERT INTO `dict_single_option` VALUES ('7096875b-4270-4282-8b77-0639f3640d18', 'df8bab63-591a-4102-8b2b-0a6a55434190', '3', '50-100元');
INSERT INTO `dict_single_option` VALUES ('71c78069-29af-436b-8738-e1c3b42ebdec', '9ed54563-255d-4f7e-a065-36e4d61380a7', '2', '11级-20级');
INSERT INTO `dict_single_option` VALUES ('71fde1e1-a9c7-407f-9725-5b5d97e13e6b', '6ffd0688-bf93-4b81-ab67-f19b094882cd', '2', '偶尔有');
INSERT INTO `dict_single_option` VALUES ('7210dc6a-a30a-470b-a97e-00b3a4ce3608', '701a0cef-cb7d-4eee-afd7-6ce2763b1b67', '3', '没注意');
INSERT INTO `dict_single_option` VALUES ('721852bc-55da-4d0f-ad46-a0d721da0197', 'a3da6efe-373a-4a80-8e09-63818119f299', '1', '1000元以下');
INSERT INTO `dict_single_option` VALUES ('72e3a87a-65c4-4cd9-96ca-de94e5da68f7', '4fe788ce-9f15-406d-937c-8fe588e7ecd0', '3', '10W-50W');
INSERT INTO `dict_single_option` VALUES ('7378b25c-dd3c-4fcd-a684-b17996242db7', '8f52e733-0383-469b-a5a3-0b26ae2466bc', '2', '没有');
INSERT INTO `dict_single_option` VALUES ('743fac69-2372-468c-ad84-1bcaa3c16acf', 'b4be244e-ebfd-4619-97cd-3c128db9cdf0', '1', '100-200元');
INSERT INTO `dict_single_option` VALUES ('74479f68-7bc6-4c49-bf43-c1a625589be2', '092acbb0-6413-4be3-9c36-6fbd9eadf3e0', '1', '一个月1次');
INSERT INTO `dict_single_option` VALUES ('768f1db8-8bed-4e84-aace-9bb866136331', '5428caac-a7b7-4a70-85eb-adbd9feb8db5', '1', '淘宝');
INSERT INTO `dict_single_option` VALUES ('76c26175-7dc1-4de7-98a3-fb0a16e93b59', 'a15b771e-03a2-4eb8-a42e-a8ee25c920d9', '2', '以休闲为主题');
INSERT INTO `dict_single_option` VALUES ('771b4de5-83fc-45e1-8ed4-83af871617ec', '371fdd03-6ae1-4ab2-b007-ca4424e5098d', '4', '40单以上');
INSERT INTO `dict_single_option` VALUES ('78945589-1d81-4e06-8060-1b9afa6e30e9', '44787abe-ec76-4fbb-8d6f-5f4c731de92b', '2', '21-30岁');
INSERT INTO `dict_single_option` VALUES ('78c38597-ebb5-4957-b6e3-6ede893fe72a', 'af770185-c116-45b8-93d8-a33b212f3a7d', '1', '1000元以下');
INSERT INTO `dict_single_option` VALUES ('78ea8e84-3efd-4d37-8de1-d79fac5e7f80', '73c08103-2e3d-4245-941a-d1dd012184ed', '1', '20岁及以下');
INSERT INTO `dict_single_option` VALUES ('7926c812-dafe-44f7-80e3-f6c25fe5c88f', 'dfbea56f-b913-4763-9d84-f24d1108e55c', '2', '不是');
INSERT INTO `dict_single_option` VALUES ('7a963edc-f0bb-4dd1-b869-1ae67df77e4f', 'cc8adef6-cbe2-43af-8bf5-8bd0998aa68f', '1', '15元以内');
INSERT INTO `dict_single_option` VALUES ('7ad67c6a-1e4e-4e1d-87ea-3c421feaeced', 'f3707e67-c37b-492a-87a6-bb19ebe0242b', '2', '自助式');
INSERT INTO `dict_single_option` VALUES ('7b828b7d-2f68-4626-98b2-59edd4ac199c', '5428caac-a7b7-4a70-85eb-adbd9feb8db5', '2', '天猫');
INSERT INTO `dict_single_option` VALUES ('7bd9e6c5-df81-4671-bff1-47a4a89b160c', 'd0c33f45-0c82-4923-9f8c-ac3876ef37fe', '3', '一周两次');
INSERT INTO `dict_single_option` VALUES ('7c5fe366-042f-4aa1-af53-abd76650bb87', '890cf746-2ef2-42e5-8c2b-0c7b3444bf1a', '3', 'windows phone');
INSERT INTO `dict_single_option` VALUES ('7c7f7edf-0b46-4f9c-a86c-13716f8e3afb', 'e7302960-6cd6-4e62-93b5-95174578e5ba', '2', '不在意');
INSERT INTO `dict_single_option` VALUES ('7ceb5615-aadf-4cd1-a9d4-64b70d7d8a74', '95c46607-1bb0-4f39-a81e-1edb704a48df', '3', '3次/周');
INSERT INTO `dict_single_option` VALUES ('7cfd554e-01fb-4d6f-b956-b62de4bd1462', 'af770185-c116-45b8-93d8-a33b212f3a7d', '2', '1001-10000元');
INSERT INTO `dict_single_option` VALUES ('7d29ef79-2df1-480e-9b20-bf3b409b128c', '92b23137-8607-4a8a-b51b-d4c08011494b', '2', '女');
INSERT INTO `dict_single_option` VALUES ('7d2d7c59-d13a-460f-989e-00fc05e159fa', 'f1f4ecbc-6d1f-458b-b745-d8d11477d5a1', '1', '是');
INSERT INTO `dict_single_option` VALUES ('7d31ff17-52d5-4e4d-9f9a-680f5755d42d', 'f21f38d1-1fb8-4c1f-a038-e152d5ad6611', '2', '觉得没什么特别的');
INSERT INTO `dict_single_option` VALUES ('7e131fe5-ebc1-44a0-9d6b-8ea765ca0620', '44f91b92-307a-4a8d-a421-cb9fd3d55869', '3', '有购物的需求');
INSERT INTO `dict_single_option` VALUES ('7fe7b2f4-f38b-45cf-89ea-6b26dc2acba8', 'e97d6d0b-64de-46e7-be3d-8e41eabc2bb4', '2', '每周都玩');
INSERT INTO `dict_single_option` VALUES ('800e6517-54d2-4d7b-9a76-b15b119c45c0', '50ad3170-bbef-433a-8068-8cd475df830e', '1', '简约时尚');
INSERT INTO `dict_single_option` VALUES ('80991280-c0a1-4df9-b258-68de26039fcc', 'f34a3fb9-4058-43e4-93f7-6a928bf8b759', '4', '晚上睡觉前');
INSERT INTO `dict_single_option` VALUES ('80f1e397-6628-48fa-bbf3-6c0089d6ba3b', '92b23137-8607-4a8a-b51b-d4c08011494b', '1', '男');
INSERT INTO `dict_single_option` VALUES ('81ffa8c2-ce05-43b0-b918-95dfe63828c2', '04ad9a7a-0b30-43ba-a530-3ec4ba9f7570', '1', '男');
INSERT INTO `dict_single_option` VALUES ('8251024a-d32e-443c-9a24-3adea8e1aae3', 'f21f38d1-1fb8-4c1f-a038-e152d5ad6611', '4', '不清楚');
INSERT INTO `dict_single_option` VALUES ('837b687a-fa89-4447-97b9-ae42d6e9dabb', '4776ee89-d3ed-4f1e-b5b0-6be3f8cfd39a', '2', '1001-10000元');
INSERT INTO `dict_single_option` VALUES ('83dd35be-f70e-44d1-a613-3d72decaac41', 'eb67b2c4-78c4-4417-9f87-7d89f8fb7eca', '1', '传单广告');
INSERT INTO `dict_single_option` VALUES ('84f582c1-143c-48e0-8d48-b381bc9c1b15', '4fe788ce-9f15-406d-937c-8fe588e7ecd0', '2', '5W-10W');
INSERT INTO `dict_single_option` VALUES ('87e0f890-ad57-4bda-9431-a39f8021a7be', 'dfbea56f-b913-4763-9d84-f24d1108e55c', '1', '是');
INSERT INTO `dict_single_option` VALUES ('88399cfb-5277-466b-80a4-5c0e026ca508', '1d26fd6f-ff03-401a-89ca-3e84396a2451', '4', '40岁及以上');
INSERT INTO `dict_single_option` VALUES ('8a55c541-4937-41c4-bff3-63bbe8a1dff9', '6e3c77f5-2bb4-43d0-9a1a-14b808815526', '2', '不会');
INSERT INTO `dict_single_option` VALUES ('8ab28a0e-8742-4020-ada0-15654ed4a02c', '4a9e03c2-a006-40f0-adf6-d445d2640535', '3', '有电视看的');
INSERT INTO `dict_single_option` VALUES ('8b2d1306-3ff9-48ac-be8c-aada748adad8', '2abe2d00-ab25-4599-af04-95e0d6328b7b', '2', '工作/学习太忙时');
INSERT INTO `dict_single_option` VALUES ('8be0beee-98d5-4894-827c-fa2ac4b51846', '451693b2-71f9-4fde-82c1-09189a5b7c99', '1', '注重');
INSERT INTO `dict_single_option` VALUES ('8dc5109b-3cf3-46b9-b94d-4c81c9990972', '0ec95e69-ea3f-473c-80bb-98bee2673254', '4', '主动搜索');
INSERT INTO `dict_single_option` VALUES ('8e3136da-6db1-4974-9640-5cf8a05e7568', 'f2f3974a-1011-4beb-8151-fd19ed68f95e', '1', 'IOS');
INSERT INTO `dict_single_option` VALUES ('8e7d22ea-80a7-48a6-b011-88cc45674b4c', '9ed54563-255d-4f7e-a065-36e4d61380a7', '3', '20级-30级');
INSERT INTO `dict_single_option` VALUES ('8f968781-0cad-4320-b591-e1fffa4d084a', '2abe2d00-ab25-4599-af04-95e0d6328b7b', '1', '不想出门');
INSERT INTO `dict_single_option` VALUES ('90577660-7557-458c-a091-3bb755a98602', 'f5ab4a62-7b1b-43d0-b7bb-da380d2ddbbf', '1', '愿意');
INSERT INTO `dict_single_option` VALUES ('90c672e7-49e8-449d-9372-b4ff5711112b', '5e0763f3-da15-41cc-bdfd-ce008aa8037b', '3', '10001-20000元');
INSERT INTO `dict_single_option` VALUES ('91bc43c2-3f0f-456f-b90f-fd55c699c8da', 'f2f3974a-1011-4beb-8151-fd19ed68f95e', '2', 'Android');
INSERT INTO `dict_single_option` VALUES ('9212b26e-3ced-48eb-ae2b-49e6c2d86b40', 'b9da7a65-6ee6-4d5b-9ca8-cce335a45e55', '2', '21-30 岁');
INSERT INTO `dict_single_option` VALUES ('922a2d26-38b6-4a0d-b837-981a53e841b4', '89b675cf-7afe-4c20-918a-e6853781742b', '1', '一直都有');
INSERT INTO `dict_single_option` VALUES ('92b2cc07-df6e-4192-b299-0d26d5f85094', '5d92509c-1cd2-4325-8380-a8c1e82454ef', '1', '健康');
INSERT INTO `dict_single_option` VALUES ('92e17e77-5222-4a2b-9940-aab9b9607a08', '02496906-550b-4ab3-9cd4-dee74e4d692d', '1', '会');
INSERT INTO `dict_single_option` VALUES ('94f664b2-875b-443a-aa63-a28367cb20e0', '016b2f16-5469-44f4-831c-ed1d243f7bde', '1', '有');
INSERT INTO `dict_single_option` VALUES ('95c80a9d-67eb-491d-bcf2-03194a43729d', 'a60379c8-9ea5-4616-a12c-f718a946ae06', '4', '3年以上');
INSERT INTO `dict_single_option` VALUES ('977183e5-04be-4869-8a59-cb4148673a6b', '1131124e-1a61-4ce4-9943-20489a75062b', '1', '手机/电话');
INSERT INTO `dict_single_option` VALUES ('97c5de9c-52ad-45d8-98f4-330bf9c7049f', '8f52e733-0383-469b-a5a3-0b26ae2466bc', '1', '有');
INSERT INTO `dict_single_option` VALUES ('995d6b67-970b-41a4-9f4e-4c7fbb0ef9fc', 'd0c33f45-0c82-4923-9f8c-ac3876ef37fe', '2', '两天一次');
INSERT INTO `dict_single_option` VALUES ('9963d6f7-c825-4551-9680-a97a0bb0c0be', '8ed311bf-f123-4158-9845-8d488cbff04b', '4', '很不期待');
INSERT INTO `dict_single_option` VALUES ('99d85682-ee0b-4622-8cef-663571923cdf', 'af770185-c116-45b8-93d8-a33b212f3a7d', '4', '20000元以上');
INSERT INTO `dict_single_option` VALUES ('9a6f6e32-3f52-47ee-8425-e67bb6630018', '198e27b8-b0f0-4cc1-8bc6-a2dd060705ed', '3', '向淘宝客服投诉解决');
INSERT INTO `dict_single_option` VALUES ('9acf97fc-e728-48ff-9eff-d10b07c46598', '747141c0-cc85-48a1-9b3b-263456d00de7', '1', '30分钟以内');
INSERT INTO `dict_single_option` VALUES ('9b4f8624-753e-4b55-89e9-5e5f65589713', '016b2f16-5469-44f4-831c-ed1d243f7bde', '2', '无');
INSERT INTO `dict_single_option` VALUES ('9bdc990f-4cf7-41fe-a846-a9258d98905a', '50ad3170-bbef-433a-8068-8cd475df830e', '3', '高档气派');
INSERT INTO `dict_single_option` VALUES ('9cab248f-80e7-4751-96db-181ebf7e2668', '3688f5d3-d066-4013-bbbc-18bc588823cf', '2', '2-3个');
INSERT INTO `dict_single_option` VALUES ('9d5521b4-af01-42bb-91b8-a4cf3b689e03', '07b00b8a-a879-464b-8217-6dddf0be8565', '2', '21-30岁');
INSERT INTO `dict_single_option` VALUES ('9e2a7cb9-6951-484f-96cd-27585ea9163a', '006e4ece-664c-4952-8af2-e4889f68bcad', '1', '在校学生');
INSERT INTO `dict_single_option` VALUES ('9e2baafe-837d-4a5b-b4b9-b3d1434d17a1', '9be8179e-d307-4a32-9c46-ba819049499f', '4', '每年都会看');
INSERT INTO `dict_single_option` VALUES ('9e6b7ce7-2167-47dd-9e54-2a0aa2e259f8', '4a9e03c2-a006-40f0-adf6-d445d2640535', '4', '有空调的');
INSERT INTO `dict_single_option` VALUES ('9ec6df0d-a061-47d5-ab29-8ee9d9b62827', 'f3707e67-c37b-492a-87a6-bb19ebe0242b', '1', '点餐制');
INSERT INTO `dict_single_option` VALUES ('9f887d77-0f84-47ea-b9d5-703244fd582a', 'd565533d-0340-470c-975e-94baf64f3edb', '1', '是');
INSERT INTO `dict_single_option` VALUES ('9fc005b5-29ba-4932-a798-42431924c257', '5542ee4e-b39d-44a5-bf27-b3e212b775bd', '2', '图文欣赏');
INSERT INTO `dict_single_option` VALUES ('9fea0649-80d0-4f1d-84bd-3e145bc19259', 'cbe0482f-fdd7-4674-8ecb-63d53becb25a', '1', '玩');
INSERT INTO `dict_single_option` VALUES ('a00650b1-e333-43ad-9b44-6f6e22e27b2e', 'b7c20082-18b5-43b7-be27-24736ea9d4e3', '1', '过高');
INSERT INTO `dict_single_option` VALUES ('a018528b-bf05-4152-8901-ff680632448e', 'e516d5ce-c4f9-4028-9375-dccff80d8639', '1', '不能');
INSERT INTO `dict_single_option` VALUES ('a0204b58-57eb-47de-81c2-31bc66efe266', '9be8179e-d307-4a32-9c46-ba819049499f', '3', '每月都会看');
INSERT INTO `dict_single_option` VALUES ('a1709cd6-8fcb-425f-bf63-bff6607fd02f', 'acf63e91-bd66-45f5-bb07-7623d703c447', '3', '1小时-1个半小时');
INSERT INTO `dict_single_option` VALUES ('a1af4e8c-6637-4419-ba53-cdb6e75a47ae', 'ce311856-2525-4345-a454-8a2d31bce474', '4', '小摊小贩');
INSERT INTO `dict_single_option` VALUES ('a1da1fb3-cea0-44fb-84c9-07a5b3c6ebc5', '1131124e-1a61-4ce4-9943-20489a75062b', '2', '网上订餐');
INSERT INTO `dict_single_option` VALUES ('a21c5de4-a948-4d74-91e0-5234622a6203', '7bd2a964-11cf-4bb5-a2b4-a3da35d98444', '1', '立即重新练号');
INSERT INTO `dict_single_option` VALUES ('a2f0400c-b2b8-4225-95af-db5c311fa9de', 'e58d0978-2199-4fb7-8b76-060dbfffdea9', '1', '和朋友狂欢happy的节日');
INSERT INTO `dict_single_option` VALUES ('a353c873-cf7b-4422-a516-cc931021348a', '7c2f8cc8-5f42-4f19-921a-8cd61a181f5c', '2', '上餐馆');
INSERT INTO `dict_single_option` VALUES ('a4599be1-fd62-45ae-86af-015541fdbc6a', '5542ee4e-b39d-44a5-bf27-b3e212b775bd', '4', '语音消息');
INSERT INTO `dict_single_option` VALUES ('a5048fe9-5e46-45a7-b385-6d38b8cd46fb', '7ee9f605-2295-4e79-b650-533f3c11dfaa', '1', '男');
INSERT INTO `dict_single_option` VALUES ('a715ab4e-fa12-441b-b736-eb93a87303db', '2be6723d-09b7-4385-9a02-4ea6c6cee47d', '3', '博客微博');
INSERT INTO `dict_single_option` VALUES ('a75fa7a1-c9bc-4160-8e2a-e9efddb6b5fc', 'bdf4a9dc-d3f6-424a-87e9-81b7bc11bbd0', '2', '高中/中专');
INSERT INTO `dict_single_option` VALUES ('a7c993df-577c-4d26-8a10-095e1a15a87e', '0a53698b-ce75-414c-8d8f-a15d8820e64f', '1', '可靠');
INSERT INTO `dict_single_option` VALUES ('a819ad26-6e5a-476b-b5ed-11b1fe81ab0e', 'dc8fca03-9ba7-40a7-84cf-3c5a04de6ddf', '2', '否');
INSERT INTO `dict_single_option` VALUES ('a93c1c67-a254-4cd0-a00d-2ea26f9336cc', 'b4be244e-ebfd-4619-97cd-3c128db9cdf0', '4', '1001-2000元');
INSERT INTO `dict_single_option` VALUES ('a990e964-8c20-42fe-9be3-6cd800aa051f', 'e7302960-6cd6-4e62-93b5-95174578e5ba', '1', '在意');
INSERT INTO `dict_single_option` VALUES ('a9c4218d-f0dd-41cd-8716-2eafb0679dfa', '8755c3f6-6986-43fd-8b1c-5cdfff216124', '1', '2次以下');
INSERT INTO `dict_single_option` VALUES ('ab4823d8-4e1f-40d7-8bd7-94ea0a827b65', '4eb4058f-6687-479c-b5d8-e223a4585ef5', '2', '15-30分钟');
INSERT INTO `dict_single_option` VALUES ('abcbe156-6893-4318-bf66-b00b0dbd7ada', 'a9c57a45-d872-422d-919a-d52fd61df983', '1', '是');
INSERT INTO `dict_single_option` VALUES ('ac19137f-6f2e-4b55-a4fe-8d16fd035e74', 'f4133528-28c8-4f97-9baf-4925af0084e2', '1', '男');
INSERT INTO `dict_single_option` VALUES ('ac20b055-e4da-48fa-bddd-921eeb851fc6', '02496906-550b-4ab3-9cd4-dee74e4d692d', '2', '不会');
INSERT INTO `dict_single_option` VALUES ('aced988a-c497-4acc-94f3-f3e92fef4b4f', '4fe788ce-9f15-406d-937c-8fe588e7ecd0', '4', '50W-100W');
INSERT INTO `dict_single_option` VALUES ('ad08dbf8-5049-4f2d-9e30-46fe2fcd3be8', '501c350e-76c3-4538-b530-2bbcf36d5126', '2', '能接受');
INSERT INTO `dict_single_option` VALUES ('b04970fe-9e27-49ba-9ad1-d146cf9de00d', '890cf746-2ef2-42e5-8c2b-0c7b3444bf1a', '2', 'Android');
INSERT INTO `dict_single_option` VALUES ('b07fd374-2347-4df9-a2db-68864548adb1', 'cc8adef6-cbe2-43af-8bf5-8bd0998aa68f', '4', '50元以上');
INSERT INTO `dict_single_option` VALUES ('b15ceb25-ba50-4a21-a2f7-e26bd907ffef', '328e8fe1-39df-4c44-8bf3-cc021c6edd45', '1', '喜欢');
INSERT INTO `dict_single_option` VALUES ('b1bfa8c0-809e-4371-902e-b2af6e9510ae', '8755c3f6-6986-43fd-8b1c-5cdfff216124', '4', '10次以上');
INSERT INTO `dict_single_option` VALUES ('b2749d58-9b11-4bb2-8aa1-e8590e63ede2', 'b8022dba-bbc0-4030-8755-b998c1965581', '3', '40%');
INSERT INTO `dict_single_option` VALUES ('b2dbf397-fda0-483a-bb91-a72f89223495', 'af770185-c116-45b8-93d8-a33b212f3a7d', '3', '10001-20000元');
INSERT INTO `dict_single_option` VALUES ('b2e3b602-fb3d-46ea-b892-b1fbdb0f5398', 'f297bfe0-87e8-422e-8448-62e6e1164b87', '1', '0-100人次');
INSERT INTO `dict_single_option` VALUES ('b41fac81-cf6e-41e5-a5b1-45f222927f0f', 'b4be244e-ebfd-4619-97cd-3c128db9cdf0', '3', '501-1000元');
INSERT INTO `dict_single_option` VALUES ('b5aeb4bc-da5b-45f2-ae3d-2d8397f2ddac', 'e58d0978-2199-4fb7-8b76-060dbfffdea9', '2', '最适合跟恋人一起享受浪漫时光');
INSERT INTO `dict_single_option` VALUES ('b61762ba-fd06-407d-8648-52f4c4787469', '2be6723d-09b7-4385-9a02-4ea6c6cee47d', '1', '朋友推荐');
INSERT INTO `dict_single_option` VALUES ('b6300e39-7d92-485c-bd0b-e50868708912', '4ef1c569-04ca-4c21-819f-16304683be9f', '1', '包间');
INSERT INTO `dict_single_option` VALUES ('b682f0c6-04d2-45c0-b15d-2f423e989907', '328e8fe1-39df-4c44-8bf3-cc021c6edd45', '2', '有兴趣');
INSERT INTO `dict_single_option` VALUES ('b703eafa-1a50-4594-b2b9-7bc3e9cd9e00', '3688f5d3-d066-4013-bbbc-18bc588823cf', '1', '1个');
INSERT INTO `dict_single_option` VALUES ('b780ad9f-8aec-4023-afd5-bbea4dab79f2', 'f5ab4a62-7b1b-43d0-b7bb-da380d2ddbbf', '2', '不愿意');
INSERT INTO `dict_single_option` VALUES ('b7ec59d7-41b1-47b5-8c0b-aa63f297abc2', '890cf746-2ef2-42e5-8c2b-0c7b3444bf1a', '4', 'black Berry');
INSERT INTO `dict_single_option` VALUES ('bb9b3358-3be7-4f85-8e1a-bcb06387e39e', '1a50e2d8-1e16-492e-bff9-af49b4d6ad01', '3', '没看过但感兴趣');
INSERT INTO `dict_single_option` VALUES ('bd809849-f0ff-44b1-8713-28913bae41a6', 'f2f3974a-1011-4beb-8151-fd19ed68f95e', '4', 'black Berry');
INSERT INTO `dict_single_option` VALUES ('bed646c6-4357-4d83-8027-6c4afaab8e26', 'cc8adef6-cbe2-43af-8bf5-8bd0998aa68f', '2', '16—30元');
INSERT INTO `dict_single_option` VALUES ('beddbfab-5ca6-4274-9653-b2c16c779dcc', 'cbe1a215-37c3-44bc-a06f-6e498e3287e4', '2', '否');
INSERT INTO `dict_single_option` VALUES ('bf9c522e-9298-405e-87ba-5f832acc2059', '45a57880-4c9e-4a4d-ac9b-0cb250ae011c', '3', '盖浇饭');
INSERT INTO `dict_single_option` VALUES ('c05b6f35-ddfb-44ac-987f-a402c210e752', 'd0c33f45-0c82-4923-9f8c-ac3876ef37fe', '4', '一周一次');
INSERT INTO `dict_single_option` VALUES ('c0b08c57-381f-419f-a8b4-d54fe3aeea2a', '4a9e03c2-a006-40f0-adf6-d445d2640535', '2', '有音乐的');
INSERT INTO `dict_single_option` VALUES ('c0ffb223-950c-4eb7-b9ff-2272159190ef', '95c46607-1bb0-4f39-a81e-1edb704a48df', '2', '1次/周');
INSERT INTO `dict_single_option` VALUES ('c1de30a1-98f1-4ad2-84fe-6ef860ae51ee', '47c5914a-e692-4f56-adbb-dd24a5b5034c', '3', '正计划提供');
INSERT INTO `dict_single_option` VALUES ('c218acec-2e5d-451b-aae5-0ae273d0ad8e', '2326b31d-f5b8-4515-ad05-6e8f164ca1c0', '2', '不会');
INSERT INTO `dict_single_option` VALUES ('c22e175b-f238-4213-95cd-f7b3d0c4eb29', 'f207f32a-2c36-4e38-ba41-daec12946783', '1', '不会影响');
INSERT INTO `dict_single_option` VALUES ('c22f5e8e-9d9d-4b6c-901e-0a36ef7d2a69', 'd868bee1-6218-4c52-84a6-8164cba114e0', '1', '1000元以下');
INSERT INTO `dict_single_option` VALUES ('c4904b9e-c92f-411d-847d-014498714a57', '73c08103-2e3d-4245-941a-d1dd012184ed', '4', '40岁及以上');
INSERT INTO `dict_single_option` VALUES ('c4a076f2-b946-4fba-a8eb-4d9ee14e8648', '3688f5d3-d066-4013-bbbc-18bc588823cf', '4', '5个以上');
INSERT INTO `dict_single_option` VALUES ('c4ed0857-3481-4be2-8935-cebca89b667f', '73c08103-2e3d-4245-941a-d1dd012184ed', '2', '21-30岁');
INSERT INTO `dict_single_option` VALUES ('c51f1d97-b828-4d4b-b457-18fc14d99c37', '2abe2d00-ab25-4599-af04-95e0d6328b7b', '3', '想换个口味');
INSERT INTO `dict_single_option` VALUES ('c5d08e4d-b4e8-4f72-9a9b-d5b2ed5e784e', 'eb67b2c4-78c4-4417-9f87-7d89f8fb7eca', '3', '上网查询');
INSERT INTO `dict_single_option` VALUES ('c6321067-d7b2-4b9f-a023-46abcd6808e7', '006e4ece-664c-4952-8af2-e4889f68bcad', '2', '政府/机关干部/公务员');
INSERT INTO `dict_single_option` VALUES ('c7bb9427-7a54-4966-b24d-f8242bb7a920', 'e58d0978-2199-4fb7-8b76-060dbfffdea9', '4', '没兴趣，这个节日与我无关');
INSERT INTO `dict_single_option` VALUES ('c7d6335f-99d5-4aa4-8db8-ba750bc9fdbe', '47c5914a-e692-4f56-adbb-dd24a5b5034c', '1', '提供');
INSERT INTO `dict_single_option` VALUES ('c9d474c6-21a8-4173-8df1-221209f1c317', '5e0763f3-da15-41cc-bdfd-ce008aa8037b', '1', '1000元以下');
INSERT INTO `dict_single_option` VALUES ('ca9eacf5-3909-431f-a622-711c3fec3fcf', '1d26fd6f-ff03-401a-89ca-3e84396a2451', '2', '21-30岁');
INSERT INTO `dict_single_option` VALUES ('ca9eaf44-3f9a-4683-bb84-578704bb077a', '611977aa-dbc4-4e8f-8b41-d7b70808f8f3', '3', '有，以上两类都有');
INSERT INTO `dict_single_option` VALUES ('cc2768af-39c4-424f-a8cf-a7f120be35ec', '501c350e-76c3-4538-b530-2bbcf36d5126', '3', '一般');
INSERT INTO `dict_single_option` VALUES ('ccb67085-3a59-44d0-9535-3920765142fb', '5c0650dd-d600-4e78-a302-f1b054f055dd', '3', '31-40岁');
INSERT INTO `dict_single_option` VALUES ('cd08d317-96c3-4653-b953-4ab094148775', '44787abe-ec76-4fbb-8d6f-5f4c731de92b', '4', '40岁以上');
INSERT INTO `dict_single_option` VALUES ('ce28e8c9-8332-451d-ab57-4afb4f8ed962', '451693b2-71f9-4fde-82c1-09189a5b7c99', '2', '不注重');
INSERT INTO `dict_single_option` VALUES ('ced1b91e-f72b-4594-88c8-b6dc94becb3c', '092acbb0-6413-4be3-9c36-6fbd9eadf3e0', '2', '半个月1次');
INSERT INTO `dict_single_option` VALUES ('d0654e4f-bd72-49ba-b794-370a6e591cd9', '5e0763f3-da15-41cc-bdfd-ce008aa8037b', '2', '1001-10000元');
INSERT INTO `dict_single_option` VALUES ('d06d936b-0013-4b57-96e2-15d851175916', 'a9c57a45-d872-422d-919a-d52fd61df983', '2', '否');
INSERT INTO `dict_single_option` VALUES ('d09b779c-fe7b-4b94-8b56-282fe3a55279', 'eb67b2c4-78c4-4417-9f87-7d89f8fb7eca', '4', '走在路上，发现不错的店就会记下来');
INSERT INTO `dict_single_option` VALUES ('d0a432a9-3d5b-4c98-80e0-74117a5cf67e', '611977aa-dbc4-4e8f-8b41-d7b70808f8f3', '1', '全部是自己员工');
INSERT INTO `dict_single_option` VALUES ('d0e6ca7e-614a-4fe3-9abe-48618c4ed273', 'e516d5ce-c4f9-4028-9375-dccff80d8639', '3', '能');
INSERT INTO `dict_single_option` VALUES ('d106f268-85ce-4566-b5d5-1f87861ea436', 'aeb5a052-1404-443d-b122-bd0d451098b0', '2', '否');
INSERT INTO `dict_single_option` VALUES ('d19889a9-802c-42b5-a9ad-e787117fa260', '0ae16ace-2a55-42c7-8740-d5992377391f', '2', '不愿意');
INSERT INTO `dict_single_option` VALUES ('d19f4548-d994-4a92-88eb-69c035e054d4', 'd46a6c0e-5132-4cd6-8aea-1f3aebfe0069', '2', '否');
INSERT INTO `dict_single_option` VALUES ('d1b079c8-969a-4457-a67b-b90d654958e3', 'f21f38d1-1fb8-4c1f-a038-e152d5ad6611', '3', '觉得自己吃亏或是受骗了');
INSERT INTO `dict_single_option` VALUES ('d2d341b6-001b-4c49-b21f-9bec4dac1638', 'cee316a7-6239-45fd-b89d-64277f061881', '1', '向送餐员说明');
INSERT INTO `dict_single_option` VALUES ('d313c776-1dc3-483c-abe0-404135045fce', '9518604c-06ad-4387-a582-da12b73155a2', '2', '不愿意');
INSERT INTO `dict_single_option` VALUES ('d3743653-6719-4c32-b29e-f8d0f71297dc', '5d92509c-1cd2-4325-8380-a8c1e82454ef', '3', '速度');
INSERT INTO `dict_single_option` VALUES ('d3fba8a5-9e9a-4200-9fe0-f2f607a2cf7c', 'b7c20082-18b5-43b7-be27-24736ea9d4e3', '3', '合理');
INSERT INTO `dict_single_option` VALUES ('d4dd8ef9-52de-4a33-8beb-916c7366d2a3', '8755c3f6-6986-43fd-8b1c-5cdfff216124', '3', '6-10次');
INSERT INTO `dict_single_option` VALUES ('d50d87f1-7d7c-4b00-812f-64fd75edde71', '198e27b8-b0f0-4cc1-8bc6-a2dd060705ed', '2', '与卖家协商，要求退款或换货');
INSERT INTO `dict_single_option` VALUES ('d5337083-576a-4979-a9fb-55b7de1d3b48', 'a392155e-b00b-4cd7-8438-e7afe5469f69', '2', '老师');
INSERT INTO `dict_single_option` VALUES ('d6a9bc7f-a78a-4a34-9e1a-f240e2deae40', 'f3187047-bced-4b4d-a86d-0f5c2eaa1200', '2', '桌边稍远');
INSERT INTO `dict_single_option` VALUES ('d6df606b-cb09-4964-b464-5f50a627d86c', 'dc8fca03-9ba7-40a7-84cf-3c5a04de6ddf', '3', '无所谓');
INSERT INTO `dict_single_option` VALUES ('d70dc910-6574-480d-9345-067ee732f4c5', 'b9da7a65-6ee6-4d5b-9ca8-cce335a45e55', '3', '31-40 岁');
INSERT INTO `dict_single_option` VALUES ('d809273b-c11f-46a8-8d23-43e3e3e636d2', 'f207f32a-2c36-4e38-ba41-daec12946783', '2', '有一定影响，但不会因此而放弃选择该店进行再消费');
INSERT INTO `dict_single_option` VALUES ('d810b537-333e-4e6e-b334-d1f2ec057de3', '8ed311bf-f123-4158-9845-8d488cbff04b', '2', '一般');
INSERT INTO `dict_single_option` VALUES ('d9a18523-c0f3-4936-a801-e3a570b78d0d', '07b00b8a-a879-464b-8217-6dddf0be8565', '1', '20岁及以下');
INSERT INTO `dict_single_option` VALUES ('d9f1df38-2777-4d27-b55e-4f2b4d3adc54', '158e824a-4fd2-417b-a4c7-1666db4e966d', '1', '快捷支付');
INSERT INTO `dict_single_option` VALUES ('da35dcce-1939-4721-9ba5-83ed78843863', '2be6723d-09b7-4385-9a02-4ea6c6cee47d', '4', '微信朋友圈');
INSERT INTO `dict_single_option` VALUES ('da4da867-b66d-45a8-9404-42d149565b91', '1d26fd6f-ff03-401a-89ca-3e84396a2451', '3', '31-40岁');
INSERT INTO `dict_single_option` VALUES ('da8d7162-ff94-4e0f-af2e-2cf38ad2c92d', '5e596710-ac88-4626-a74c-e0f7c4fd7837', '3', '企业管理者（包括基层及中高层管理者）');
INSERT INTO `dict_single_option` VALUES ('daeb2297-7a84-42ee-8903-7e3f91d3178a', '092acbb0-6413-4be3-9c36-6fbd9eadf3e0', '3', '每周1次');
INSERT INTO `dict_single_option` VALUES ('ddd5fa04-fb76-4a5f-ac2f-52e8869d8e22', '61849069-e90e-4b98-ac40-d35254513667', '4', '几周或更长时间才1次');
INSERT INTO `dict_single_option` VALUES ('decaf74f-0c1b-400e-ae4b-3c468679b8be', '44787abe-ec76-4fbb-8d6f-5f4c731de92b', '1', '20岁及以下');
INSERT INTO `dict_single_option` VALUES ('df75a626-8c73-4d4d-aeff-35b7a5b53091', '7c2f8cc8-5f42-4f19-921a-8cd61a181f5c', '3', '叫外卖');
INSERT INTO `dict_single_option` VALUES ('e044dd3e-1a0e-487c-a19e-ac6ab0478ce6', 'df8bab63-591a-4102-8b2b-0a6a55434190', '4', '100元以上');
INSERT INTO `dict_single_option` VALUES ('e0c92260-48fc-41fb-90fc-dba0f3a259e2', '5e596710-ac88-4626-a74c-e0f7c4fd7837', '2', '政府/机关干部/公务员');
INSERT INTO `dict_single_option` VALUES ('e130bf44-b778-4a4f-87dd-3eee1e4da581', '7d01bdb4-645e-41a4-abee-5dde61fa4b66', '2', '柔和舒适');
INSERT INTO `dict_single_option` VALUES ('e16d7796-54d5-43b5-8420-4a987a21c347', '890cf746-2ef2-42e5-8c2b-0c7b3444bf1a', '1', 'IOS');
INSERT INTO `dict_single_option` VALUES ('e254d53c-e0c3-4bc5-94a0-6ae3ad23fa7a', 'f34a3fb9-4058-43e4-93f7-6a928bf8b759', '2', '中午休息时');
INSERT INTO `dict_single_option` VALUES ('e325d075-0dec-4213-b45b-627ce309fba9', 'a15b771e-03a2-4eb8-a42e-a8ee25c920d9', '1', '以浪漫为主题');
INSERT INTO `dict_single_option` VALUES ('e345f40e-6944-4828-bc30-4a2f83b8d715', 'f34a3fb9-4058-43e4-93f7-6a928bf8b759', '3', '上课时间');
INSERT INTO `dict_single_option` VALUES ('e3e812c8-135a-4cb3-bda8-53255fc0bb22', 'a3da6efe-373a-4a80-8e09-63818119f299', '4', '20000元以上');
INSERT INTO `dict_single_option` VALUES ('e4570b32-3b05-446b-a575-69a0f090d169', '328e8fe1-39df-4c44-8bf3-cc021c6edd45', '3', '不喜欢');
INSERT INTO `dict_single_option` VALUES ('e463118f-2118-47a6-ab23-23be48ab704d', '1a50e2d8-1e16-492e-bff9-af49b4d6ad01', '2', '一般，偶尔会看');
INSERT INTO `dict_single_option` VALUES ('e4fa79ce-3f17-475d-9fd2-79013c86c4b2', '7c2f8cc8-5f42-4f19-921a-8cd61a181f5c', '4', '自带');
INSERT INTO `dict_single_option` VALUES ('e50d0ee4-b225-48be-854e-674ea4262857', '701a0cef-cb7d-4eee-afd7-6ce2763b1b67', '1', '能');
INSERT INTO `dict_single_option` VALUES ('e59020f4-6013-4013-bbdd-b19a27e5bb0a', '8755c3f6-6986-43fd-8b1c-5cdfff216124', '2', '3-5次');
INSERT INTO `dict_single_option` VALUES ('e61559e1-42b3-4d49-90b9-98173079f7f3', 'f0dc9833-ad01-4380-833e-4d286cbf33d5', '1', '在校学生');
INSERT INTO `dict_single_option` VALUES ('e63c0530-5d6b-4d04-9312-90cee1a11535', '07b00b8a-a879-464b-8217-6dddf0be8565', '3', '31-40岁');
INSERT INTO `dict_single_option` VALUES ('e6da22ef-d8b4-45dd-b050-e3907df4db8a', '2115787f-12bf-42d3-a094-c791ae866893', '3', '半年到一年1次');
INSERT INTO `dict_single_option` VALUES ('e7a6663d-64e1-4f7d-b0bc-d9972619e14b', '51da3b64-3d7b-498c-92fc-f3ad6472e22b', '2', '女');
INSERT INTO `dict_single_option` VALUES ('e7bb5716-f7d2-45ac-a4ab-52a3b5bec91a', 'a3da6efe-373a-4a80-8e09-63818119f299', '3', '10001-20000元');
INSERT INTO `dict_single_option` VALUES ('e8582c49-7acc-476a-8da9-5536d79b7253', '44787abe-ec76-4fbb-8d6f-5f4c731de92b', '3', '31-40岁');
INSERT INTO `dict_single_option` VALUES ('e8e92ec6-6894-4431-a5cb-de1d169ea5e6', '2be6723d-09b7-4385-9a02-4ea6c6cee47d', '2', '论坛/贴吧');
INSERT INTO `dict_single_option` VALUES ('e8fb1c92-d020-451f-8d8a-1b302e51021c', 'e0e9e41c-15d5-4730-9b33-e32c671592b1', '1', '男');
INSERT INTO `dict_single_option` VALUES ('ea77f303-e957-4a39-ac8a-d4373737760a', '5d92509c-1cd2-4325-8380-a8c1e82454ef', '2', '口味');
INSERT INTO `dict_single_option` VALUES ('ea82013f-f13e-4470-82fc-59008d9e1aef', 'b8022dba-bbc0-4030-8755-b998c1965581', '1', '20%');
INSERT INTO `dict_single_option` VALUES ('eb9a2078-a21e-457a-b917-075fcea168e5', '2115787f-12bf-42d3-a094-c791ae866893', '1', '每月1次');
INSERT INTO `dict_single_option` VALUES ('ed9ec8bc-a8b3-4284-b780-51bef4a63c59', 'cee316a7-6239-45fd-b89d-64277f061881', '4', '放在心里，下次再也不买了');
INSERT INTO `dict_single_option` VALUES ('edd46ab7-35ee-4b28-bcba-cccb97afa3ca', 'f0dc9833-ad01-4380-833e-4d286cbf33d5', '4', '普通职员（办公室/写字楼工作人员）');
INSERT INTO `dict_single_option` VALUES ('ee49e45e-e7d7-4030-9629-47548f0b577c', 'd0c33f45-0c82-4923-9f8c-ac3876ef37fe', '1', '每天一次');
INSERT INTO `dict_single_option` VALUES ('eec7021a-1130-4b95-ba9c-30558c93fed1', 'e516d5ce-c4f9-4028-9375-dccff80d8639', '2', '一般');
INSERT INTO `dict_single_option` VALUES ('eec8f845-f878-41e5-abbc-015a893f4c22', 'f3187047-bced-4b4d-a86d-0f5c2eaa1200', '3', '不妨碍聚餐即可');
INSERT INTO `dict_single_option` VALUES ('efdaff83-7a30-4ae4-8086-dbbb10ecc8ee', '80f6fb89-773d-4a09-b9d8-3d3af4a20df1', '3', '企业管理者（包括基层及中高层管理者）');
INSERT INTO `dict_single_option` VALUES ('f085287b-9b05-47f4-b6d5-283cb5393d54', '1a6af376-670a-42d1-b980-53841e625845', '2', '女');
INSERT INTO `dict_single_option` VALUES ('f1776b54-b6ab-42bd-b616-2c437341c1ca', 'f0dc9833-ad01-4380-833e-4d286cbf33d5', '3', '企业管理者（包括基层及中高层管理者）');
INSERT INTO `dict_single_option` VALUES ('f1f45797-6bb0-4c66-8710-35f82bd24988', 'a392155e-b00b-4cd7-8438-e7afe5469f69', '4', '朋友');
INSERT INTO `dict_single_option` VALUES ('f356b2c0-d8db-433e-8157-d220be0bbe6c', 'eee83190-4b01-4771-b7b7-4dd8121cac34', '3', '不追求低价商品');
INSERT INTO `dict_single_option` VALUES ('f3ab1a82-c3fa-41a8-ad8b-442fcc8ba469', '7d01bdb4-645e-41a4-abee-5dde61fa4b66', '3', '静谧隐私');
INSERT INTO `dict_single_option` VALUES ('f3fc08e1-843a-4781-9ec1-47caa4381b1e', '47c5914a-e692-4f56-adbb-dd24a5b5034c', '2', '不提供');
INSERT INTO `dict_single_option` VALUES ('f5db5275-e798-4c5b-a7f3-f2d7e53d01b3', '51da3b64-3d7b-498c-92fc-f3ad6472e22b', '1', '男');
INSERT INTO `dict_single_option` VALUES ('f6ba2360-64e2-49c8-bb95-7765a71a7a80', '45a57880-4c9e-4a4d-ac9b-0cb250ae011c', '1', '一荤两素');
INSERT INTO `dict_single_option` VALUES ('f83d2a31-fcca-4a45-ab54-7030dc56e63c', '6ffd0688-bf93-4b81-ab67-f19b094882cd', '1', '没有');
INSERT INTO `dict_single_option` VALUES ('fb197c63-da5e-4fbf-b8f9-c1d6deeeabfa', '44f91b92-307a-4a8d-a421-cb9fd3d55869', '4', '其他');
INSERT INTO `dict_single_option` VALUES ('fb19e670-c9cd-4683-bc50-76e70c562b59', '66f54704-6209-45db-89a8-8d59189ce851', '2', '否');
INSERT INTO `dict_single_option` VALUES ('fb3a63d9-cd86-433c-a702-2789b4a014d3', '5c0650dd-d600-4e78-a302-f1b054f055dd', '1', '20岁及以下');
INSERT INTO `dict_single_option` VALUES ('fc3104a1-6f97-4db6-a41b-7f99eb5247e3', '5e0763f3-da15-41cc-bdfd-ce008aa8037b', '4', '20000元以上');
INSERT INTO `dict_single_option` VALUES ('fc48e9a2-dedc-4b32-b039-2e989278e3f5', 'eb67b2c4-78c4-4417-9f87-7d89f8fb7eca', '2', '朋友介绍');
INSERT INTO `dict_single_option` VALUES ('fc70fc90-9931-4448-84c7-777dab92fa2d', 'a60379c8-9ea5-4616-a12c-f718a946ae06', '2', '1-2年');
INSERT INTO `dict_single_option` VALUES ('fc78301b-3018-458f-9efe-3bf43fa744e2', '6ffd0688-bf93-4b81-ab67-f19b094882cd', '3', '经常有');
INSERT INTO `dict_single_option` VALUES ('fd7f5f70-5a50-48de-97ea-88da4d93389e', '03983091-a933-4d5c-8608-30a9037b4f92', '2', '没有');
INSERT INTO `dict_single_option` VALUES ('ff176236-e687-423b-84cb-34ecda7c9cfc', '6ffd0688-bf93-4b81-ab67-f19b094882cd', '4', '其他');
INSERT INTO `dict_single_option` VALUES ('ffc49622-077d-42c5-be09-6ffc4339e8eb', 'ce311856-2525-4345-a454-8a2d31bce474', '2', '大众化经济餐');

-- ----------------------------
-- Table structure for dict_templet
-- ----------------------------
DROP TABLE IF EXISTS `dict_templet`;
CREATE TABLE `dict_templet` (
  `dict_templet_id` varchar(255) NOT NULL,
  `dict_templet_name` varchar(255) default NULL,
  `sort_id` varchar(255) default NULL,
  PRIMARY KEY  (`dict_templet_id`),
  KEY `foreign key_dict_templet_sort_id` (`sort_id`),
  CONSTRAINT `foreign key_dict_templet_sort_id` FOREIGN KEY (`sort_id`) REFERENCES `sort` (`sort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_templet
-- ----------------------------
INSERT INTO `dict_templet` VALUES ('015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44', '网购消费者的行为习惯调查', '1');
INSERT INTO `dict_templet` VALUES ('2bc2a9a6-d960-450f-9812-d30bbc71ecf3', '“双十一”电商促销行为对消费者的影响', '1');
INSERT INTO `dict_templet` VALUES ('2d6a0eac-eccd-4975-9d2a-cd5191a2a991', '服务质量', '3');
INSERT INTO `dict_templet` VALUES ('32ef4650-5fd7-4ff8-9019-a2ee5b853c58', '商家自助在线外卖业务的需求调查', '3');
INSERT INTO `dict_templet` VALUES ('3ea37bc9-8aa5-4973-9ccb-51976434cb34', '充值返利', '1');
INSERT INTO `dict_templet` VALUES ('56b81486-d177-4256-8ccb-0aa3760be7db', '外卖需求', '3');
INSERT INTO `dict_templet` VALUES ('5acaf076-05ab-41db-bfba-251d4f500e66', '外出就餐调查', '3');
INSERT INTO `dict_templet` VALUES ('61d97de4-8115-40bb-8210-ac01a595530d', '主题餐厅', '3');
INSERT INTO `dict_templet` VALUES ('942573f3-3ac6-4c54-9029-ab1823dae20a', '网络商家的代运营需求调研', '1');
INSERT INTO `dict_templet` VALUES ('9a50db5e-74f2-43ce-ac1b-436bda740f39', '圣诞狂欢市场调查问卷', '1');
INSERT INTO `dict_templet` VALUES ('a7ff778a-f4b6-48e0-bcca-efa5760ac5b2', '手游用户偏好', '1');
INSERT INTO `dict_templet` VALUES ('bb891b8d-fd51-43db-9ccc-52d20dc3914d', '服务需求', '3');
INSERT INTO `dict_templet` VALUES ('bef6af46-2dfe-4645-8b00-4822ee4f25b4', 'XX公众号粉丝调查', '1');
INSERT INTO `dict_templet` VALUES ('c4bbb334-7b26-453f-866e-d9b2e84d232b', '“双十一”电商促销活动的参与情况调查', '1');
INSERT INTO `dict_templet` VALUES ('cf6b9a1b-ba58-4fb0-81e4-24b83a38e338', '网购用户的消费者维权意识', '1');
INSERT INTO `dict_templet` VALUES ('d05d9f46-3929-473d-8c13-567a4dd6f33d', '消费市场调查', '3');
INSERT INTO `dict_templet` VALUES ('d17661d1-407b-4307-a527-f6dcf429d928', '影响团购评价的因素分析', '1');
INSERT INTO `dict_templet` VALUES ('e6878f8c-8137-4f10-88b4-6698a69e494e', '旅游电子商务-消费心理与消费行为调查问卷', '1');
INSERT INTO `dict_templet` VALUES ('f03b5c6e-67fb-44f0-917e-3ce0644a0b27', '知名度美誉度调查', '1');
INSERT INTO `dict_templet` VALUES ('f8a30e68-3729-4cae-b226-14a57aeea3c3', '手游视频需求调查', '1');

-- ----------------------------
-- Table structure for dict_templet_index
-- ----------------------------
DROP TABLE IF EXISTS `dict_templet_index`;
CREATE TABLE `dict_templet_index` (
  `dict_templet_index_id` varchar(255) NOT NULL,
  `dict_templet_index_sign` int(255) default NULL,
  `dict_templet_index_order` int(255) default NULL,
  `dict_exercise_id` varchar(255) default NULL,
  `dict_templet_id` varchar(255) default NULL,
  PRIMARY KEY  (`dict_templet_index_id`),
  KEY `foreign ket_dict_templet_id` (`dict_templet_id`),
  CONSTRAINT `foreign ket_dict_templet_id` FOREIGN KEY (`dict_templet_id`) REFERENCES `dict_templet` (`dict_templet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_templet_index
-- ----------------------------
INSERT INTO `dict_templet_index` VALUES ('00882749-88f0-497c-91f8-26a8ac8d9319', '1', '3', '198e27b8-b0f0-4cc1-8bc6-a2dd060705ed', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('05614ad6-4af3-48a6-9177-6a5fe6c27254', '2', '3', '66b07e8b-3cc6-445a-b69e-c97ce2f0aee5', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('06812a6c-db2e-4380-a04a-d70cbac26670', '1', '3', '006e4ece-664c-4952-8af2-e4889f68bcad', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('069cf0d2-d4e7-4a4f-9de5-b7ca7dbb9c19', '3', '1', '9cdbe5f6-8c5f-4567-9713-484ab60d9d17', 'f03b5c6e-67fb-44f0-917e-3ce0644a0b27');
INSERT INTO `dict_templet_index` VALUES ('06af4ff4-acb8-47dd-95c1-222ec09d0311', '1', '7', '8f52e733-0383-469b-a5a3-0b26ae2466bc', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('07d25da2-d77f-4430-868d-6e2c07aa8edb', '1', '5', '8755c3f6-6986-43fd-8b1c-5cdfff216124', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('093ea6cd-af5d-4dc0-b6d9-c3a8c602c4fd', '1', '6', '016b2f16-5469-44f4-831c-ed1d243f7bde', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('0a88a524-f16b-4886-aaca-31f585de9e76', '2', '5', 'b1b559fa-cbd8-4658-95ee-815148b96760', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('0b6f5a09-4b07-464a-8194-f628eeda0c45', '1', '1', 'cbe0482f-fdd7-4674-8ecb-63d53becb25a', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('0e05fffa-94dd-42f0-bb94-a5ef3e84ef1e', '2', '3', 'a8beb748-9842-4c4d-9c20-d54081f8decd', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('0e91d66b-b9b3-4507-9835-035656c47bea', '2', '1', '4c26248f-ada6-42ab-915b-887b99a7fcf9', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('0f874248-6178-42a5-b739-56babaa789b4', '1', '5', 'b4be244e-ebfd-4619-97cd-3c128db9cdf0', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('1098734f-21fd-4835-809d-2deb42d178c2', '2', '4', '3d2a7ca4-f611-464c-beb9-eb23f9299d23', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('1283cafe-4b19-4024-b0ff-c5abd64b66a4', '2', '9', '906327df-871c-4864-b667-1e4410cf01db', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('1285dd4d-b940-4680-965e-90bdc8c9caf5', '1', '4', '44f91b92-307a-4a8d-a421-cb9fd3d55869', 'c4bbb334-7b26-453f-866e-d9b2e84d232b');
INSERT INTO `dict_templet_index` VALUES ('12b41413-e3ce-4888-9bac-e5b2e7dbd625', '1', '1', 'aeb5a052-1404-443d-b122-bd0d451098b0', 'c4bbb334-7b26-453f-866e-d9b2e84d232b');
INSERT INTO `dict_templet_index` VALUES ('15446cbb-ee9b-45f2-90f1-667e31fbaf2e', '1', '4', '89b675cf-7afe-4c20-918a-e6853781742b', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('1a294b5f-2234-4af6-ba99-55fdeea2c83a', '2', '2', 'fed9dd6f-08b1-47fb-8659-960eccd20a38', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('1bc0e2fe-6998-49b4-88b3-85d19f895709', '1', '1', '1a6af376-670a-42d1-b980-53841e625845', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('1def96cb-7109-48d5-839f-c65b3649dc68', '1', '11', 'd565533d-0340-470c-975e-94baf64f3edb', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('1e6c6032-84d3-491a-8fa9-ca58afc91309', '2', '2', 'fcd05ba3-6fa1-489a-8639-cb29b515cdf3', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('1eb534ed-9b8d-4903-a79d-f82ba0e798ec', '1', '1', '9ed54563-255d-4f7e-a065-36e4d61380a7', 'f03b5c6e-67fb-44f0-917e-3ce0644a0b27');
INSERT INTO `dict_templet_index` VALUES ('20ddf74d-abd7-4f35-aa54-a8ae57046142', '2', '7', '798ed145-c127-498e-bb6a-a60a997d1278', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('210416c2-1056-409e-a6f7-cdfe9e7329f5', '2', '2', 'cc1469b4-1dae-4748-b8ce-c67aab7c23b0', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('22f7a900-2298-401e-8ff7-aa2f70987bd5', '1', '9', '158e824a-4fd2-417b-a4c7-1666db4e966d', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('231c5aaf-e14f-4b92-a439-0e48d79d0dfb', '1', '4', '371fdd03-6ae1-4ab2-b007-ca4424e5098d', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('2383ea1a-a11c-4a8d-8bce-76b0bc30267a', '2', '3', 'ecb89a8a-0777-4499-b8ff-dfe863bf6d59', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('2405be65-0cd9-4a8c-be0e-577cd46fa8a4', '1', '2', '44787abe-ec76-4fbb-8d6f-5f4c731de92b', 'd17661d1-407b-4307-a527-f6dcf429d928');
INSERT INTO `dict_templet_index` VALUES ('25dd969b-a77b-4590-938f-02feab721a21', '3', '1', '489abc09-faff-4b6d-97c2-43e096195b16', '61d97de4-8115-40bb-8210-ac01a595530d');
INSERT INTO `dict_templet_index` VALUES ('25ff33cc-48fa-4cbb-b194-76f01e8a924f', '2', '1', 'bbcf727d-e7ad-4556-9017-d7f8540442b2', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('269e42eb-272b-40ea-ab70-3573418d09d5', '2', '3', '4b0aa915-f930-42ca-8d4b-075165754e09', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('27ff55ba-0816-4056-953a-e960541c90f7', '2', '4', 'fffa21e0-be7f-4fd0-a139-afd48c05a03e', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('29f8c421-d4c5-4382-a02e-f260bfe050a2', '2', '5', 'c02648dc-7f48-4d79-a22d-01bd478d382b', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('2b8030ca-b853-4f4a-afda-4cdc0b595c02', '1', '3', '4ef1c569-04ca-4c21-819f-16304683be9f', '61d97de4-8115-40bb-8210-ac01a595530d');
INSERT INTO `dict_templet_index` VALUES ('2bef924c-791b-428f-9aaa-9eaf40a932aa', '1', '6', 'f207f32a-2c36-4e38-ba41-daec12946783', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('2e482bf7-6802-41df-b069-2e38718ce227', '1', '5', 'd868bee1-6218-4c52-84a6-8164cba114e0', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('2f2f9a82-7f2a-43cf-bda2-53c67624a1ba', '2', '6', '1f6c691f-ca33-4d4a-9746-e76978f4379b', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('3021dcfd-9056-48c1-81f8-d0dee467c98e', '1', '4', '61849069-e90e-4b98-ac40-d35254513667', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('31bc8a84-4948-4225-9e9a-6e663f5a91c0', '3', '3', '0dad9f8c-d572-43e1-895c-31c9c3d77796', 'c4bbb334-7b26-453f-866e-d9b2e84d232b');
INSERT INTO `dict_templet_index` VALUES ('32b2876e-eae1-40af-864d-44e4f869e1da', '2', '1', '8008672d-ed22-4942-a71f-c3ecb18b55c3', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('3382de3e-0cdb-46b3-93e7-14289edc0795', '1', '6', '5ce95d51-ff2f-41f9-8fd3-7be53204a58e', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('3485e37b-4276-4c0a-a25d-7a6217daf8e4', '2', '1', 'eadd81d2-45ba-4930-a74d-4b42484070c1', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('34ca70e1-c776-4d51-892b-4b097d402996', '3', '2', 'c3d0e478-acd3-4209-80dd-a0516fda7420', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('36605bad-73af-401e-9d86-1dd1435ea564', '1', '5', '2abe2d00-ab25-4599-af04-95e0d6328b7b', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('380a8593-6b6a-4884-ab15-b6c388f99b36', '1', '3', '7c2f8cc8-5f42-4f19-921a-8cd61a181f5c', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('38ef0fec-af92-4caf-a1de-38a5f7d94601', '1', '1', '47c5914a-e692-4f56-adbb-dd24a5b5034c', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('3f9c8176-7c17-41dc-9857-cad896f1dba0', '2', '1', 'ae2b029c-419d-4d98-b28a-f7fc06f8d9f9', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('40fea0ff-cd76-4e8a-bd6a-5dc69a1d2173', '2', '5', '14df2952-2d19-44ee-909b-a2d3b0a0b967', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('45dc5b03-2155-441a-b6e3-be136421fc07', '1', '3', '5428caac-a7b7-4a70-85eb-adbd9feb8db5', '942573f3-3ac6-4c54-9029-ab1823dae20a');
INSERT INTO `dict_templet_index` VALUES ('45f44e07-14d8-4232-bbf9-391935b3ae8d', '3', '1', '2e658758-82f3-44b5-9759-ecd6d21a4192', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('464b7156-c9c0-4c67-ad94-9801b65df2f1', '1', '3', 'af770185-c116-45b8-93d8-a33b212f3a7d', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('46b5a552-2511-4fa2-ad53-fa2a4ecbff82', '1', '2', 'f34a3fb9-4058-43e4-93f7-6a928bf8b759', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('47030e89-6fba-44ea-959e-1b5ff8dba11e', '3', '2', '40b0bdf8-be25-4923-8ef3-a00118684f55', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('47a557c5-0f11-4f55-a8ba-bf7d4138aea6', '2', '2', 'd6b2603a-b156-4f62-a400-8855cdf949e5', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('49869a0b-10af-4d11-b523-2b16d7df91b4', '1', '2', '2be6723d-09b7-4385-9a02-4ea6c6cee47d', 'f03b5c6e-67fb-44f0-917e-3ce0644a0b27');
INSERT INTO `dict_templet_index` VALUES ('4a28bea6-92d3-444a-b19b-42e14e2e2b2b', '2', '1', 'c8bde4be-c63b-4363-befe-1b85775e985d', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('502580e6-7b1f-4f55-ba29-2f291fdeb1ee', '1', '1', 'f4133528-28c8-4f97-9baf-4925af0084e2', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('502dcf29-a7d2-47ca-9724-c546d7e3be48', '1', '7', '1131124e-1a61-4ce4-9943-20489a75062b', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('51362d09-b09c-41e5-93e0-fd7514aab6d6', '1', '14', 'cc8adef6-cbe2-43af-8bf5-8bd0998aa68f', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('518747b1-bdf7-4d80-a98a-5828cd373c30', '1', '2', 'f3187047-bced-4b4d-a86d-0f5c2eaa1200', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('534acb3c-2239-4eb4-bbae-d73acc9c66f1', '2', '4', '23a42994-94fc-46ce-9ad9-a1e3c96f7e11', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('5580317a-2060-4bff-9b31-792fddf048b8', '3', '1', 'feb76ecd-e1a6-4dc1-aea1-7d29e0089eb7', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('5851d6e9-8130-44ae-a2c5-7e97216668ca', '1', '9', '701a0cef-cb7d-4eee-afd7-6ce2763b1b67', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('59cb1f25-d8e0-4647-8950-871300557425', '3', '1', '337dcc05-9dc5-4e48-abcb-367da68dae70', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('59df2ce8-764c-4bd1-97ec-f17239f27a84', '1', '3', 'dfbea56f-b913-4763-9d84-f24d1108e55c', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('5c051b6e-cbbc-46dd-9832-deb3a49f5d0a', '2', '2', 'a351a884-6e18-4644-8f7d-a857096e1f12', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('5d4cd0e2-b913-45dc-b8d6-b75ba3a3f67b', '2', '2', '2503be90-00a4-404f-b0ce-1c6b955bd0b6', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('5dcde5d7-a73e-4103-bb3a-c450e3070fab', '1', '7', 'f5ab4a62-7b1b-43d0-b7bb-da380d2ddbbf', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('5e05db20-a42d-4d5c-902d-f801d831196e', '1', '3', '5e596710-ac88-4626-a74c-e0f7c4fd7837', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('5f8a34aa-fa5e-48e3-a575-0877eff37b2f', '1', '7', '02496906-550b-4ab3-9cd4-dee74e4d692d', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('6019757e-01b5-4d91-a9c3-a0c15a4337ce', '1', '4', '95c46607-1bb0-4f39-a81e-1edb704a48df', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('612c24eb-d671-4eba-969f-5321d746a1c1', '1', '5', '69be5e7b-feaa-44d0-8d60-50f002be1092', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('61434429-bcf3-421e-9e1e-a93ff5d0fe1e', '1', '4', 'e97d6d0b-64de-46e7-be3d-8e41eabc2bb4', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('631c8ed0-affa-4cf4-b39f-03eb765357b2', '2', '1', 'a1638daa-b1ca-43e4-a6ec-d32ad583681f', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('64ff5adc-f9d2-4aee-9fc2-b9d3585a09b9', '1', '10', 'da826fd9-4727-46cf-b420-c70a72853c6a', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('66fde042-6e11-4ecd-95ea-69f93934155f', '1', '5', '66f54704-6209-45db-89a8-8d59189ce851', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('688f88cf-0ba0-481b-960e-578b52ab7907', '1', '1', '328e8fe1-39df-4c44-8bf3-cc021c6edd45', '61d97de4-8115-40bb-8210-ac01a595530d');
INSERT INTO `dict_templet_index` VALUES ('68f1c7dd-efa8-4ec1-89f4-9c661f109fd3', '1', '3', '5542ee4e-b39d-44a5-bf27-b3e212b775bd', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('6914271f-849d-4809-ac01-962c54dd8be2', '2', '2', '6ce488f4-a2c4-4258-a812-c9840f859997', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('692ee67f-c74e-40e4-9d54-69a51e4196af', '1', '4', 'd0c33f45-0c82-4923-9f8c-ac3876ef37fe', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('6c7b9ac6-c7b9-445d-9db9-a42995c6c598', '1', '2', '6ffd0688-bf93-4b81-ab67-f19b094882cd', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('6f6ccebe-107c-40dd-b91a-09bf403099ee', '1', '3', '5e0763f3-da15-41cc-bdfd-ce008aa8037b', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('6f7d4c69-d7dc-4920-8338-58f4934a986f', '2', '3', '90f65005-92ed-43be-af64-96433b287cb7', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('772d2a0b-b3b4-498a-abee-58429725546e', '3', '4', '7bd0bd9c-9306-4d9b-b772-d9de39255e00', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('79c4e966-66d3-4820-9e2c-76a79349ae1a', '2', '4', '662c784f-5a59-48a7-b3b1-88cab73306de', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('7d5c43e6-33f6-418f-88d2-9675b55a6fbc', '1', '1', '092acbb0-6413-4be3-9c36-6fbd9eadf3e0', 'd05d9f46-3929-473d-8c13-567a4dd6f33d');
INSERT INTO `dict_templet_index` VALUES ('7eb484d4-d7c6-43dd-9540-d582f4020b67', '3', '1', 'f9aa711d-1018-4cd2-8bbc-7c147add22fd', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('7f229ea0-75dd-420a-855b-6dcd8f489d3d', '1', '2', '07b00b8a-a879-464b-8217-6dddf0be8565', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('7f30acc5-93ff-4588-a810-4c0a4e13fe6c', '2', '5', '1055edfa-dffe-4da5-911c-f121f88885a4', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('804b80f2-52e2-40be-9512-4223827254ec', '1', '2', 'b9da7a65-6ee6-4d5b-9ca8-cce335a45e55', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('810b5ad4-edbe-40ec-a584-95633877df7c', '1', '4', 'f2f3974a-1011-4beb-8151-fd19ed68f95e', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('81f8a5e9-9788-4abd-9c18-45aaf6857ca4', '1', '2', '4fe788ce-9f15-406d-937c-8fe588e7ecd0', '942573f3-3ac6-4c54-9029-ab1823dae20a');
INSERT INTO `dict_templet_index` VALUES ('828ad99d-0f62-405b-b56e-39971160f19e', '3', '2', '04c58ff1-75e5-4075-bab5-ce9acc269d2b', 'c4bbb334-7b26-453f-866e-d9b2e84d232b');
INSERT INTO `dict_templet_index` VALUES ('859a6a51-4832-4b44-b5dc-1e81c5ec6995', '2', '8', 'e5fd5fc2-146d-4f40-a8cb-5b282cb7cdd6', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('87628ae3-675a-4b19-98e0-d0674a56eae6', '1', '2', '80f6fb89-773d-4a09-b9d8-3d3af4a20df1', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('87b165ad-904e-4b24-b71f-fc92ea6a713a', '1', '2', 'e7302960-6cd6-4e62-93b5-95174578e5ba', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('88ed7b44-1b73-4c8b-a813-1ae9a215dceb', '2', '4', 'fea4f7c1-f0d9-4ef4-8ab7-89c6712c958f', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('890f7424-b3fc-4f4c-a745-7fc6b8e2690c', '3', '1', 'e5ede66e-04c7-4565-b783-28d5f7ec9991', 'c4bbb334-7b26-453f-866e-d9b2e84d232b');
INSERT INTO `dict_templet_index` VALUES ('892aaeff-c878-4bd2-b247-1ec548cba1cf', '1', '3', '2115787f-12bf-42d3-a094-c791ae866893', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('899ce3f7-e07e-43b0-a3f6-fb9c6afa2551', '1', '2', '73c08103-2e3d-4245-941a-d1dd012184ed', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('89b56571-61c4-41c5-932b-de3404bbb54b', '3', '2', '7825e3c0-5e72-4b81-a3ef-ffefa9d87049', '942573f3-3ac6-4c54-9029-ab1823dae20a');
INSERT INTO `dict_templet_index` VALUES ('89d4d411-0adc-4a30-b5be-c2067d25f21a', '2', '1', 'b7f8b67f-83cf-4feb-a433-a39fd2193e50', 'f03b5c6e-67fb-44f0-917e-3ce0644a0b27');
INSERT INTO `dict_templet_index` VALUES ('8ab20d70-affc-4bc7-94ce-4b10b6aaf1fe', '2', '3', '1b35ccf1-da02-473a-a821-1e6cfcabb338', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('92912d66-6385-4eeb-b602-159d874e61f4', '2', '6', '39f0bf92-4830-4013-9b42-7fddd7094c3f', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('936ea879-a23d-432b-b0c5-b2367bed7548', '2', '6', '17ffc543-621a-4dc5-9a6f-0802f727621f', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('94d5cbce-cd75-4dab-afa2-9056ef1b578f', '2', '3', '6ef8712a-cb03-4178-b60d-72a32553ca53', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('96d4a8cc-ce3c-4fc8-b6a1-3e58b5ede6e8', '1', '1', 'b7c20082-18b5-43b7-be27-24736ea9d4e3', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('96fe0949-6d4c-4bc5-958a-8c8a4c67c3e0', '1', '5', 'd46a6c0e-5132-4cd6-8aea-1f3aebfe0069', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('98c26775-356a-4389-9fb4-f7743bceb01b', '1', '9', '7bd2a964-11cf-4bb5-a2b4-a3da35d98444', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('9b099443-3d84-4066-b3b5-6bb3e2752a16', '1', '4', '8ed311bf-f123-4158-9845-8d488cbff04b', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('9c902bdd-27a1-4b23-b1f6-0e7636e10c71', '3', '3', 'b44d817d-07b8-4ad5-9450-280811d546a3', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('9c999331-0eb5-430d-a445-6e2dcf015b2d', '1', '1', '0ec95e69-ea3f-473c-80bb-98bee2673254', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('9d68e36d-74bf-4371-afdd-ee364293cdbe', '3', '2', '5b75aea8-d702-4b97-8570-1b02e6346fd9', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('9ee1b69b-9478-4287-9d28-b0ae3b8929a3', '1', '1', 'e0e9e41c-15d5-4730-9b33-e32c671592b1', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('9f7fa03d-3ae1-49c6-8909-4c2dd0e8bc60', '1', '2', 'f6d4fc71-5b2f-4156-ae2d-0562cb5a227d', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('9fe0238f-978b-445d-b33f-c91c65f52957', '1', '1', 'cbe1a215-37c3-44bc-a06f-6e498e3287e4', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('9fec72b1-6ed8-42ef-8164-a9e591e99bb4', '1', '1', 'c2a9d495-4611-4813-b098-c66862ea3bf8', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('a3c8d439-98bb-46af-bdc8-e3c0b00bef40', '2', '4', '56b90015-b498-42e7-8942-3a59a566ed61', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('a3fdb601-2123-4071-9cb1-46065930e006', '1', '3', 'f297bfe0-87e8-422e-8448-62e6e1164b87', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('a50a70ef-396d-4af9-b4da-41953ddefe25', '2', '1', '7e1c931a-a66a-473e-b193-5960f852cd02', 'd05d9f46-3929-473d-8c13-567a4dd6f33d');
INSERT INTO `dict_templet_index` VALUES ('a72c9c70-2db6-46a3-bff5-76d55befc936', '1', '1', '7ee9f605-2295-4e79-b650-533f3c11dfaa', 'd17661d1-407b-4307-a527-f6dcf429d928');
INSERT INTO `dict_templet_index` VALUES ('a798fc01-b743-4ac3-852d-262b46f4a889', '1', '2', '1d26fd6f-ff03-401a-89ca-3e84396a2451', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('a96ff63e-184e-4e69-b3c7-36c76b8744b0', '1', '4', 'f0dc9833-ad01-4380-833e-4d286cbf33d5', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('a994a8c1-6361-46fa-a5d4-4aa196dbc097', '1', '5', 'e58d0978-2199-4fb7-8b76-060dbfffdea9', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('aa7ef829-19fe-4c96-b99b-aabe90177361', '2', '1', 'b7ec8f04-eef8-4c7b-9326-257c607069f5', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('ab480559-a06b-49ca-b1a1-8b38957eee9b', '1', '5', '9518604c-06ad-4387-a582-da12b73155a2', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('ac069dfc-684e-4176-97d7-a4948c0cfb3b', '1', '5', '0a53698b-ce75-414c-8d8f-a15d8820e64f', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('acb942d4-37fe-44c0-af3a-6e51a82d9f0c', '2', '4', '4e3fc384-4c45-44b0-92be-950f4e11e236', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('acc008aa-cbad-4e2d-9cfc-e3125fce01c0', '1', '2', '7d01bdb4-645e-41a4-abee-5dde61fa4b66', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('ae0f7122-070b-4841-87e1-15c9d963166d', '1', '13', '45a57880-4c9e-4a4d-ac9b-0cb250ae011c', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('ae96558c-c57b-4f45-97e1-fa8583f599f0', '1', '4', '4a9e03c2-a006-40f0-adf6-d445d2640535', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('aebc8391-4c9f-42ef-ad6c-1415d2832225', '3', '2', '1128c69e-15e5-4745-966b-823b45c6f17d', '61d97de4-8115-40bb-8210-ac01a595530d');
INSERT INTO `dict_templet_index` VALUES ('af4835b7-8c48-49a6-a3af-8a5b9c7c8065', '1', '8', 'eb67b2c4-78c4-4417-9f87-7d89f8fb7eca', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('af7f5688-43a1-4874-92bc-954ccf3f4e8d', '1', '3', 'a3da6efe-373a-4a80-8e09-63818119f299', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('b29680d8-1086-4ba3-869c-7772405d158b', '1', '10', 'a9c57a45-d872-422d-919a-d52fd61df983', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('b2cf801b-36dc-4a7a-ac20-7ce3a13b0487', '1', '8', 'dc8fca03-9ba7-40a7-84cf-3c5a04de6ddf', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('b4a6f580-8207-4efc-96f0-a1a2ddc992d1', '1', '4', 'df8bab63-591a-4102-8b2b-0a6a55434190', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('b5516923-6bcf-4dbe-a7a8-fcbbfde7ee04', '1', '2', '5c0650dd-d600-4e78-a302-f1b054f055dd', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('b56b5088-fedd-4285-8585-d713b110662b', '1', '6', '03983091-a933-4d5c-8608-30a9037b4f92', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('b595c21e-21ab-40a2-880e-684b6d4ae69b', '1', '1', '04ad9a7a-0b30-43ba-a530-3ec4ba9f7570', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('b9011ff8-56c2-4775-b10f-f05aa206202d', '1', '12', '5d92509c-1cd2-4325-8380-a8c1e82454ef', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('b9ed0ab4-3f90-46a0-bea9-c5bee3a1b916', '1', '1', '50ad3170-bbef-433a-8068-8cd475df830e', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('ba6f31e6-9d03-49b1-8c43-c051775109ea', '2', '2', '58653180-6269-4b25-9833-5257dc9b18b8', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('babe93a1-31a0-43d9-8831-b26bf60eba24', '2', '5', '20d7ea58-e287-4b73-8b39-4e1f435a1b66', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('bb4f1046-d132-4ebe-b0bb-2a6bdaa0c60d', '2', '5', 'c2996526-3ef7-4bed-a794-fb6cbe145f34', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('bd8d586d-53b8-445a-a868-5d5876983275', '2', '10', '58b00776-c741-4d9d-ae4b-b3e8fc46fa7a', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('bdf3f701-2c26-45ed-9a5d-c87ce36d8e93', '1', '2', 'eee83190-4b01-4771-b7b7-4dd8121cac34', 'c4bbb334-7b26-453f-866e-d9b2e84d232b');
INSERT INTO `dict_templet_index` VALUES ('bfc0d3d4-6cac-4291-be4a-eb5d879c0844', '1', '6', 'acf63e91-bd66-45f5-bb07-7623d703c447', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('c29894a3-9f00-4593-a713-1d3264595d0b', '1', '2', 'ce311856-2525-4345-a454-8a2d31bce474', 'd05d9f46-3929-473d-8c13-567a4dd6f33d');
INSERT INTO `dict_templet_index` VALUES ('c4a71d83-7d9e-44b5-b6d8-79b61db4f2cc', '1', '2', 'a15b771e-03a2-4eb8-a42e-a8ee25c920d9', '61d97de4-8115-40bb-8210-ac01a595530d');
INSERT INTO `dict_templet_index` VALUES ('c4de595c-012a-4dcb-944d-7402f3d5a200', '2', '1', 'd877a968-c37c-4e11-b010-706ed66a0bb8', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('c7a7e80b-8aba-4374-a989-e9e298d86e9e', '2', '1', 'b4b6bbf5-c7e1-4d20-ac17-0d4ee11c49ae', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('c84db889-a379-42a4-b8f3-6b5715a55307', '1', '1', '51da3b64-3d7b-498c-92fc-f3ad6472e22b', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('c8509cd6-95c2-4f35-9c3f-fd4c05c0bd2d', '1', '4', 'afad54df-6ef5-4796-8167-14366a206f12', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('c8817cca-a642-4fd7-aead-1acee5f93a76', '1', '3', 'bdf4a9dc-d3f6-424a-87e9-81b7bc11bbd0', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('c94428c8-12ca-4516-9a8e-2649c0acb8ff', '2', '2', 'ec526232-675a-4ade-9bb2-fd9fd41a26b5', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('ca18e449-799e-4090-b156-367e973d5f30', '1', '3', 'f21f38d1-1fb8-4c1f-a038-e152d5ad6611', 'c4bbb334-7b26-453f-866e-d9b2e84d232b');
INSERT INTO `dict_templet_index` VALUES ('cbcb6084-96df-4ba8-b95a-68f17c194f5c', '2', '1', '29b1d238-21fd-453b-aa2e-ae1afee12d86', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('d1ac18ad-0d9c-4b57-a554-753595b845a1', '1', '7', '451693b2-71f9-4fde-82c1-09189a5b7c99', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('d3425dde-4009-486a-b27e-bdcfc40f46f2', '1', '5', 'f1f4ecbc-6d1f-458b-b745-d8d11477d5a1', '942573f3-3ac6-4c54-9029-ab1823dae20a');
INSERT INTO `dict_templet_index` VALUES ('d3b3dafa-9998-43dd-8108-badda27b533f', '3', '1', '8bbdff58-d0a1-42b9-9d8e-1fd13de3e0f8', '2d6a0eac-eccd-4975-9d2a-cd5191a2a991');
INSERT INTO `dict_templet_index` VALUES ('d41bc347-1c88-4f70-a5c2-2859d94333bf', '1', '5', '1a50e2d8-1e16-492e-bff9-af49b4d6ad01', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('d51bbf24-eb7e-4f86-93ec-bc67009a29b5', '2', '1', '3d35a24e-9778-44eb-948a-b60af15c6477', 'f8a30e68-3729-4cae-b226-14a57aeea3c3');
INSERT INTO `dict_templet_index` VALUES ('d6ad1d56-a87c-4dd3-80ee-bb33816c53d3', '2', '7', '7bfb1d58-a330-4492-b306-38f149138a7e', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('da9ac743-f404-4d19-9159-80b0f4c803a7', '1', '3', '4eb4058f-6687-479c-b5d8-e223a4585ef5', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('dcee253c-6e65-4369-9fbc-045b947fa5de', '2', '3', 'a076a988-cbd6-45b1-a0e0-b6b0569fa114', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('dd840f8c-5956-4990-a1a1-33645efc538c', '1', '4', 'f3707e67-c37b-492a-87a6-bb19ebe0242b', '61d97de4-8115-40bb-8210-ac01a595530d');
INSERT INTO `dict_templet_index` VALUES ('de5bf8f1-f75c-487e-af79-1457d693537f', '2', '2', 'ff16829e-9949-4953-b1ad-58032ba9621c', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('df88e8b2-785f-4e1e-a85b-2cf987a5dd74', '1', '4', '3688f5d3-d066-4013-bbbc-18bc588823cf', '942573f3-3ac6-4c54-9029-ab1823dae20a');
INSERT INTO `dict_templet_index` VALUES ('e0ffa8e1-3a69-40a6-ab1e-e9f1e6981492', '1', '1', '747141c0-cc85-48a1-9b3b-263456d00de7', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('e56fbf33-249e-4b45-89cd-5ad69145b535', '1', '9', 'cee316a7-6239-45fd-b89d-64277f061881', '56b81486-d177-4256-8ccb-0aa3760be7db');
INSERT INTO `dict_templet_index` VALUES ('e7595684-ed7f-4345-a443-f41e24bf1c63', '1', '1', 'a60379c8-9ea5-4616-a12c-f718a946ae06', '942573f3-3ac6-4c54-9029-ab1823dae20a');
INSERT INTO `dict_templet_index` VALUES ('e7dc04cf-527b-44ca-888d-b1c775e9aa03', '3', '1', '03b5a1ce-8835-464c-9e55-4492b0c53285', '2bc2a9a6-d960-450f-9812-d30bbc71ecf3');
INSERT INTO `dict_templet_index` VALUES ('ea6ffd48-0f99-466f-968e-242fcc4102b1', '2', '3', '9986762c-a6ae-425b-b486-e51d699a8a41', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('ea9e7f98-37d5-4394-a352-0b8f38cc972c', '1', '5', 'e516d5ce-c4f9-4028-9375-dccff80d8639', '5acaf076-05ab-41db-bfba-251d4f500e66');
INSERT INTO `dict_templet_index` VALUES ('eab322e6-eb08-4c44-8d51-9b3c14a2d334', '3', '1', 'ae82e96e-2952-41e3-969f-0c1ee68f9d56', '942573f3-3ac6-4c54-9029-ab1823dae20a');
INSERT INTO `dict_templet_index` VALUES ('eb7804c3-2744-4edf-89af-88aa64ec2e3b', '1', '6', '0ae16ace-2a55-42c7-8740-d5992377391f', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('ecec82d3-abd0-4321-a225-c224eb37983d', '1', '3', '4776ee89-d3ed-4f1e-b5b0-6be3f8cfd39a', 'd17661d1-407b-4307-a527-f6dcf429d928');
INSERT INTO `dict_templet_index` VALUES ('ed031cd8-f1d4-4152-acb4-29a3f28e7d5a', '2', '5', '4bcbcb4c-a36e-42af-9ab0-89e6c2fe0744', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('ed3ae9e5-a79a-4c44-9559-5c32ac6ccc41', '1', '8', '6e3c77f5-2bb4-43d0-9a1a-14b808815526', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('ed890bef-3b0d-45b8-a63f-cdaa30750c1c', '1', '2', '611977aa-dbc4-4e8f-8b41-d7b70808f8f3', '32ef4650-5fd7-4ff8-9019-a2ee5b853c58');
INSERT INTO `dict_templet_index` VALUES ('ee2f65a2-a7e7-48fa-aac6-82de2bb8af52', '2', '1', '33590734-5eb1-4a72-9015-86df802db0b8', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('ee5c8d43-648f-4044-b97f-1c778609f95a', '3', '3', '1a8e861e-7d4a-49f0-a23f-4f4acad797fb', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('ef1cee37-2665-4c06-8141-d138d434d60c', '2', '3', '006e7817-516b-45dc-bb98-ac608a621bb7', 'bb891b8d-fd51-43db-9ccc-52d20dc3914d');
INSERT INTO `dict_templet_index` VALUES ('ef961e91-c2dc-452e-bac6-ca1845de9b25', '1', '6', '501c350e-76c3-4538-b530-2bbcf36d5126', 'e6878f8c-8137-4f10-88b4-6698a69e494e');
INSERT INTO `dict_templet_index` VALUES ('efa5fa0e-3206-4275-b12a-599fb85c8517', '1', '3', 'bbcb64b1-3ede-4c76-a3a5-23e8e6108c7e', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('f15f4923-4bfe-4790-8208-be567a1199aa', '1', '2', '890cf746-2ef2-42e5-8c2b-0c7b3444bf1a', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('f27d1770-b758-4138-9cbb-0df03365618a', '3', '1', '8ffd39a5-07e7-4800-a495-829f0a73ad42', 'd05d9f46-3929-473d-8c13-567a4dd6f33d');
INSERT INTO `dict_templet_index` VALUES ('f2fcaeef-4db4-4b8c-acf5-a5e5662c4002', '1', '1', '92b23137-8607-4a8a-b51b-d4c08011494b', 'a7ff778a-f4b6-48e0-bcca-efa5760ac5b2');
INSERT INTO `dict_templet_index` VALUES ('f47c0bf4-f5ef-4e3c-8a4c-8fce9c9877de', '3', '1', '71393875-a809-4598-bdb7-8d4806d8f086', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('fa97cb42-1e62-412f-893f-3613713741e4', '1', '4', '9be8179e-d307-4a32-9c46-ba819049499f', '015f9fa2-5f5f-4adf-bc9f-9567d9ae4f44');
INSERT INTO `dict_templet_index` VALUES ('fbb501cc-2e4a-4860-96ef-e345bea6934f', '1', '6', '2326b31d-f5b8-4515-ad05-6e8f164ca1c0', 'cf6b9a1b-ba58-4fb0-81e4-24b83a38e338');
INSERT INTO `dict_templet_index` VALUES ('fd6fad71-7011-4bd0-b07f-587eaf1dc735', '2', '2', '66aaeadf-0f00-4a27-8b83-9387d0dc9867', 'bef6af46-2dfe-4645-8b00-4822ee4f25b4');
INSERT INTO `dict_templet_index` VALUES ('fd84ba00-a6ee-4a1c-8cb5-2c7f149066bd', '1', '8', 'b8022dba-bbc0-4030-8755-b998c1965581', '3ea37bc9-8aa5-4973-9ccb-51976434cb34');
INSERT INTO `dict_templet_index` VALUES ('fdbeb360-bb7d-4230-9f1e-ecfa3312d4e7', '2', '1', 'ab2d2348-8e8e-4e73-a097-10bb47f9e1cd', '942573f3-3ac6-4c54-9029-ab1823dae20a');
INSERT INTO `dict_templet_index` VALUES ('ff0cf04a-01b6-4645-9a4f-7f29c88090b5', '3', '1', 'd7bd99ab-145a-472c-9e0c-32e890baa19b', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('ff1279d5-db87-431d-99ec-de9d575cd5e4', '2', '2', '5cc1be21-5a68-4349-a373-74feb2be09f6', 'f03b5c6e-67fb-44f0-917e-3ce0644a0b27');
INSERT INTO `dict_templet_index` VALUES ('ff3bf727-894e-4c73-9aac-602c3d179094', '1', '7', 'a392155e-b00b-4cd7-8438-e7afe5469f69', '9a50db5e-74f2-43ce-ac1b-436bda740f39');
INSERT INTO `dict_templet_index` VALUES ('ff5f50d3-fd96-48a3-98fe-b1df26298443', '2', '2', '3f065301-165d-4346-84e2-86fc3703646d', '56b81486-d177-4256-8ccb-0aa3760be7db');

-- ----------------------------
-- Table structure for dict_text
-- ----------------------------
DROP TABLE IF EXISTS `dict_text`;
CREATE TABLE `dict_text` (
  `dict_text_id` varchar(255) NOT NULL,
  `dict_text_content` varchar(255) default NULL,
  PRIMARY KEY  (`dict_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_text
-- ----------------------------
INSERT INTO `dict_text` VALUES ('03b5a1ce-8835-464c-9e55-4492b0c53285', '你对“双十一”的建议和意见是？');
INSERT INTO `dict_text` VALUES ('04c58ff1-75e5-4075-bab5-ce9acc269d2b', '您对参加xx网“双十一”活动的消费者有什么建议？');
INSERT INTO `dict_text` VALUES ('0dad9f8c-d572-43e1-895c-31c9c3d77796', '您对参加xx网“双十一”活动的商家或企业有什么建议？');
INSERT INTO `dict_text` VALUES ('1128c69e-15e5-4745-966b-823b45c6f17d', '您平时最爱吃的菜肴？');
INSERT INTO `dict_text` VALUES ('1a8e861e-7d4a-49f0-a23f-4f4acad797fb', '您的昵称是？');
INSERT INTO `dict_text` VALUES ('2e658758-82f3-44b5-9759-ecd6d21a4192', '感谢您填写本问卷，欢迎您留下联系方式，如果有后续调查或者业务合作需求我们将会主动和您联系：）');
INSERT INTO `dict_text` VALUES ('337dcc05-9dc5-4e48-abcb-367da68dae70', '您对我国网络购物的发展还有哪些期待和建议');
INSERT INTO `dict_text` VALUES ('40b0bdf8-be25-4923-8ef3-a00118684f55', '您对我们的公众号有什么意见或建议？');
INSERT INTO `dict_text` VALUES ('489abc09-faff-4b6d-97c2-43e096195b16', '您外出就餐经常点的菜品？');
INSERT INTO `dict_text` VALUES ('5b75aea8-d702-4b97-8570-1b02e6346fd9', '关于手游充值返利，您还有哪些顾虑或建议？');
INSERT INTO `dict_text` VALUES ('71393875-a809-4598-bdb7-8d4806d8f086', '您不愿意的原因是');
INSERT INTO `dict_text` VALUES ('7825e3c0-5e72-4b81-a3ef-ffefa9d87049', '代运营每个月需支付多少费用');
INSERT INTO `dict_text` VALUES ('7bd0bd9c-9306-4d9b-b772-d9de39255e00', '您的联系方式（方便奖品发放）是？');
INSERT INTO `dict_text` VALUES ('8bbdff58-d0a1-42b9-9d8e-1fd13de3e0f8', '您对我们餐饮服务的意见和建议');
INSERT INTO `dict_text` VALUES ('8ffd39a5-07e7-4800-a495-829f0a73ad42', '您的居住城市是');
INSERT INTO `dict_text` VALUES ('9cdbe5f6-8c5f-4567-9713-484ab60d9d17', '您觉得《xx》哪些还需要改进？请为我们提供您的详细建议。');
INSERT INTO `dict_text` VALUES ('ae82e96e-2952-41e3-969f-0c1ee68f9d56', '目前合作的代运营公司名称');
INSERT INTO `dict_text` VALUES ('b44d817d-07b8-4ad5-9450-280811d546a3', '您“不会”搜索和观看的原因是');
INSERT INTO `dict_text` VALUES ('c3d0e478-acd3-4209-80dd-a0516fda7420', '您“也许会”观看的原因是');
INSERT INTO `dict_text` VALUES ('d7bd99ab-145a-472c-9e0c-32e890baa19b', '如果您对圣诞节还有什么想法，请写下来告诉我们吧！');
INSERT INTO `dict_text` VALUES ('e5ede66e-04c7-4565-b783-28d5f7ec9991', '您对xx网“双十一”热潮有什么看法？');
INSERT INTO `dict_text` VALUES ('f9aa711d-1018-4cd2-8bbc-7c147add22fd', '您希望我们公众号新增什么板块/功能？');
INSERT INTO `dict_text` VALUES ('feb76ecd-e1a6-4dc1-aea1-7d29e0089eb7', '您“不会”观看的原因是');

-- ----------------------------
-- Table structure for single_answer_count
-- ----------------------------
DROP TABLE IF EXISTS `single_answer_count`;
CREATE TABLE `single_answer_count` (
  `single_answer_count_id` varchar(255) NOT NULL,
  `single_answer_count` int(255) default NULL,
  `design_single_option_id` varchar(255) default NULL,
  PRIMARY KEY  (`single_answer_count_id`),
  KEY `foreign key_design_single_option_id` (`design_single_option_id`),
  CONSTRAINT `foreign key_design_single_option_id` FOREIGN KEY (`design_single_option_id`) REFERENCES `design_single_option` (`design_single_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of single_answer_count
-- ----------------------------

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `sort_id` varchar(255) NOT NULL,
  `sort_name` varchar(255) default NULL,
  PRIMARY KEY  (`sort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('1', '互联网');
INSERT INTO `sort` VALUES ('2', '生活商业');
INSERT INTO `sort` VALUES ('3', '食品保健');
INSERT INTO `sort` VALUES ('4', '娱乐');
INSERT INTO `sort` VALUES ('5', '个人');
INSERT INTO `sort` VALUES ('6', '企业');

-- ----------------------------
-- Table structure for text_answer
-- ----------------------------
DROP TABLE IF EXISTS `text_answer`;
CREATE TABLE `text_answer` (
  `text_answer_id` varchar(255) NOT NULL,
  `design_text_id` varchar(255) default NULL,
  `text_answer_content` varchar(255) default NULL,
  PRIMARY KEY  (`text_answer_id`),
  KEY `foreign key_text_answer_design_text_id` (`design_text_id`),
  CONSTRAINT `foreign key_text_answer_design_text_id` FOREIGN KEY (`design_text_id`) REFERENCES `design_text` (`design_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of text_answer
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `account` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `birthday` date default NULL,
  `phone` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `photo` varchar(255) default NULL,
  `state` int(255) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6e100bfb-9f08-4643-b328-cf0bc7078e54', 'admin', '1234', '王军岩', '男', '1995-10-16', '18743102774', '1062837400@qq.com', 'ed1632a1-e18a-4008-9e66-e81d05fd4d68.jpg', '1');
INSERT INTO `user` VALUES ('c5337055-7ae7-4227-b4f7-d65e94b45575', 'test', '0000', '王军岩', '男', '1950-01-01', '18743102774', '1062837400@qq.com', 'logo.jpg', '1');

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `user_login_log_id` varchar(255) NOT NULL,
  `user_login_time` datetime default NULL,
  `user_login_account` varchar(255) default NULL,
  `user_login_result_id` varchar(255) default NULL,
  PRIMARY KEY  (`user_login_log_id`),
  KEY `foreign key_user_login_log_user_login_result_id` (`user_login_result_id`),
  CONSTRAINT `foreign key_user_login_log_user_login_result_id` FOREIGN KEY (`user_login_result_id`) REFERENCES `user_login_result` (`user_login_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_log
-- ----------------------------
INSERT INTO `user_login_log` VALUES ('5581920f-a917-4dde-8629-730c0a12dea1', '2018-05-08 18:02:44', 'admin', '4');
INSERT INTO `user_login_log` VALUES ('8119c6f2-60fb-4907-921d-268df72b2171', '2018-05-13 11:09:21', 'admin', '4');

-- ----------------------------
-- Table structure for user_login_result
-- ----------------------------
DROP TABLE IF EXISTS `user_login_result`;
CREATE TABLE `user_login_result` (
  `user_login_result_id` varchar(255) NOT NULL,
  `user_login_result_show` varchar(255) default NULL,
  PRIMARY KEY  (`user_login_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_result
-- ----------------------------
INSERT INTO `user_login_result` VALUES ('1', '验证码错误，登录失败');
INSERT INTO `user_login_result` VALUES ('2', '账号或密码错误，登录失败');
INSERT INTO `user_login_result` VALUES ('3', '账号已被冻结，登陆失败');
INSERT INTO `user_login_result` VALUES ('4', '登录成功');

-- ----------------------------
-- Table structure for user_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `user_operate_log`;
CREATE TABLE `user_operate_log` (
  `user_operate_log_id` varchar(255) NOT NULL,
  `user_operate_time` datetime default NULL,
  `user_operate_account` varchar(255) default NULL,
  `user_operate_project_id` varchar(255) default NULL,
  PRIMARY KEY  (`user_operate_log_id`),
  KEY `foreign key_user_operate_log_user_operate_project_id` (`user_operate_project_id`),
  CONSTRAINT `foreign key_user_operate_log_user_operate_project_id` FOREIGN KEY (`user_operate_project_id`) REFERENCES `user_operate_project` (`user_operate_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operate_log
-- ----------------------------
INSERT INTO `user_operate_log` VALUES ('1e72ff4f-fd8e-49b1-b4bb-645010ea1e22', '2018-05-08 18:04:43', 'admin', '1');
INSERT INTO `user_operate_log` VALUES ('61c91cbf-914b-4db9-9ca6-4cb356118b09', '2018-05-13 11:09:47', 'admin', '7');

-- ----------------------------
-- Table structure for user_operate_project
-- ----------------------------
DROP TABLE IF EXISTS `user_operate_project`;
CREATE TABLE `user_operate_project` (
  `user_operate_project_id` varchar(255) NOT NULL,
  `user_operate_project_show` varchar(255) default NULL,
  PRIMARY KEY  (`user_operate_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operate_project
-- ----------------------------
INSERT INTO `user_operate_project` VALUES ('1', '创建模板');
INSERT INTO `user_operate_project` VALUES ('2', '修改模板');
INSERT INTO `user_operate_project` VALUES ('3', '删除模板');
INSERT INTO `user_operate_project` VALUES ('4', '开始回收');
INSERT INTO `user_operate_project` VALUES ('5', '继续回收');
INSERT INTO `user_operate_project` VALUES ('6', '结束回收');
INSERT INTO `user_operate_project` VALUES ('7', '查看结果');
