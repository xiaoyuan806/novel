/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80022
Source Host           : localhost:3306
Source Database       : noveldb

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2022-06-24 08:34:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrators
-- ----------------------------
DROP TABLE IF EXISTS `administrators`;
CREATE TABLE `administrators` (
  `id` int NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrators
-- ----------------------------
INSERT INTO `administrators` VALUES ('1', 'zy123456', '123456');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `novelid` int NOT NULL,
  `userid` int NOT NULL,
  `novelname` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('11112', '2', '1', '张三奇遇记', 'logo.png');
INSERT INTO `history` VALUES ('11113', '1', '1', '我在异界当君王', 'wozaiyijiedangjunwang.png');
INSERT INTO `history` VALUES ('11114', '2', '1', '无上武修', 'wushangwuxiu.png');
INSERT INTO `history` VALUES ('11115', '3', '1', '超能国宝', 'chaonengguobao.png');
INSERT INTO `history` VALUES ('11116', '4', '1', '穿越从末世开始', 'chuanyuecongmoshikaishi.png');
INSERT INTO `history` VALUES ('11117', '5', '1', '出马仙诡闻录', 'chumaxianguiwenlu.png');
INSERT INTO `history` VALUES ('11118', '2', '1', '无上武修', 'wushangwuxiu.png');

-- ----------------------------
-- Table structure for novel
-- ----------------------------
DROP TABLE IF EXISTS `novel`;
CREATE TABLE `novel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `novelid` int DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `novstate` varchar(255) DEFAULT NULL,
  `hit` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `novelid` (`novelid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel
-- ----------------------------
INSERT INTO `novel` VALUES ('1', '1', 'wozaiyijiedangjunwang.png', '我在异界当君王', '穿越异界，开局就是君王', '萌新也要冲', '奇幻', '2020', '连载中', '3');
INSERT INTO `novel` VALUES ('2', '2', 'wushangwuxiu.png', '无上武修', '太古封印下的大陆，让武修完全被排斥于仙界，古老的血脉受激后一点点苏醒，重开登仙之路。红颜相伴，前尘忆恋。我本无心争这名利是非，奈何总被推到风口浪尖，既然如此，那就睁大眼睛瞧仔细，在一次次化险为夷，浴火重生后，我是如何主宰沉浮，纵横这万千世界。', '哪根葱', '武侠', '2021', '连载中', '4');
INSERT INTO `novel` VALUES ('3', '3', 'chaonengguobao.png', '超能国宝', '奇葩外星人，奇葩穿越成国宝文物，灭世的启示，他们决定组团拯救，对抗、矛盾、背叛、陷害、撕裂、忠诚……从恶里滋生善，还是善被恶吞噬？', '潇潇雨歧', '都市', '2020', '连载中', '3');
INSERT INTO `novel` VALUES ('4', '4', 'chuanyuecongmoshikaishi.png', '穿越从末世开始', '意外回到五亿年前的地球，体会到科技带给人类的便利与繁华，另外还有末世。从亚星带着美女机器人在陌生的星球，踏上寻找回家的路。', '大叔还行', '科幻', '2019', '已完结', '8');
INSERT INTO `novel` VALUES ('5', '5', 'chumaxianguiwenlu.png', '出马仙诡闻录', '我叫李啸铁，在我出生九天后，有只黑猫趴在我的胸口，三天不动。\r\n或许从那时起，就注定了我不平凡的一生。\r\n我叫李啸铁，在我出生九天后，有只黑猫趴在我的胸口，三天不动。\r\n或许从那时起，就注定了我不平凡的一生。\r\n我叫李啸铁，在我出生九天后，有只黑猫趴在我的胸口，三天不动。\r\n或许从那时起，就注定了我不平凡的一生。', '树下的喵', '悬疑', '2020', '连载中', '2');
INSERT INTO `novel` VALUES ('6', '6', 'chuanyueshouji.png', '穿越手记', '无意间发现一本爷爷留下的笔记，上面记录着一些令人匪夷所思的事情。不知什么原因我和小姑妈突然被人追捕，在逃亡过程中我和瘦猴莫名的来到了另一世界，也就是爷爷笔记中所提到的异世！来到异世后，我居然稀里糊涂的当了新郎，而且新娘子梦灵还很漂亮！只是新婚次日便传来了恶耗，梦灵舅舅连同二十多名内阁官员被人枪杀！！！！！！', '冷月花琦', '奇幻', '2020', '连载中', '1');
INSERT INTO `novel` VALUES ('7', '7', 'huolongdezhutiandixiacheng.png', '火龙的诸天地下城', '被赶出家门的火龙罗宾·阿尔瓦·利安德尔·斯考特·尼古拉斯无意之中得到了一个地下城核心，于是决定像他父亲一样踏上地下城领主之路；\r\n不过他的地下城貌似和其他领主有些不一样，居然能连接到不属于他们这个大千世界的其他世界；\r\n从此，火龙罗宾·阿尔瓦·利安德尔·斯考特·尼古拉斯踏上了与其他地下城领主截然不同的修行之路！', '建木通天', '奇幻', '2019', '已完结', '1');
INSERT INTO `novel` VALUES ('8', '8', 'zouyizaozhejianghu.png', '走一遭这江湖', '跳个崖没想到来到了这现代世界，睡个觉没想到来到了这修真世界。谢子天，一个平凡又不平凡的少侠；谢子天，一个沙雕却又较真的少年；他说：“我只想平平淡淡过完这一生，想日子过得开心点，不想再活得这么累。”而他说：“我也想尝尝那什么都拿第一的滋味，我不想再平庸，不想再这么没用。”', '梦壬', '奇幻', '2020', '连载中', '1');
INSERT INTO `novel` VALUES ('9', '9', 'wandaolongshen.png', '万道龙神', '林枫带着前世记忆和万古最强功法重归少年时代！\r\n“重活一世，我不会再让亲人与好友惨死空留遗憾！” \r\n修龙神之诀，炼真龙之体；绘惊世神符，震惊世人；夺逆天造化，败圣地天骄！', '苏九叶', '奇幻', '2021', '连载中', '1');
INSERT INTO `novel` VALUES ('10', '10', 'taibaixingjun.png', '\r\n太白星君', '山村少年突遭命中大劫，不曾想福祸相依，竟是得了齐天的大造化。\r\n有些人，今生注定不是池中之物，待到化龙之时，神仙换我做做又有何妨？！', '雪隐山河', '奇幻', '2020', '连载中', '0');
INSERT INTO `novel` VALUES ('11', '11', 'heianzhisheng.png', '黑暗之声', '封印了千年的黑灵欲再次兴风作浪？还要问问小爷我！逆天的脉络、传奇的身世、团结的伙伴、艰辛的修行，造就了铁一般的团队。混乱的世间、金钱的诱惑、权力的任性、感人的爱情，让这个修行界再次风起云涌！', '随风漂流的筝', '奇幻', '2019', '连载中', '0');
INSERT INTO `novel` VALUES ('12', '12', 'zouxiashentandewangzhe.png', '走下神坛的王者', '走下神坛的王者－－诸神之战，为保全性命，撕裂空间，肉身被毁，在凡界泥槃重生，待我荣耀归来之日，便是我重新踏上神坛之日。里面有一个个鲜活的人物，有着许多的奇幻逸事。等级秩序：灵期 元期 玄期 武期……', '左z挚爱', '奇幻', '2018', '连载中', '0');
INSERT INTO `novel` VALUES ('13', '13', 'zhuhutianxia.png', '逐狐天下', '这世上，妖魔一日不绝，就断不了猎魔人的身影。\r\n而有猎魔者的地方，当也不会缺了盗猎者的存在。\r\n万年前，猎狐一族斩杀了乱世魔王，从此威名千古。', '瑰渭', '武侠', '2020', '已完结', '0');
INSERT INTO `novel` VALUES ('14', '14', 'kuangshige.png', '旷世歌', '“对于神灵来说，你我只不过是猪圈里的猪，任人宰割罢了。”\r\n“数千万年的演化，神灵驯养了人类，成功让人类沦为他们的盘中餐、口中食。”\r\n“可，我们不是猪，即便是猪也要当一只能咬人的猪。”\r\n所以这注定是一个一群人反抗命运、反抗奴役的故事。', '荒落', '武侠', '2021', '已完结', '1');
INSERT INTO `novel` VALUES ('15', '15', 'jiutianfengshenbang.png', '九天封神榜', '如果有一天我站在山巅，我希望我的身后有你\r\n如果有一天我创造神话，我希望我的神话中有你\r\n如果有一天我成为传说，我希望你是传说的一部分\r\n如果有一天我站在山巅，我希望我的身后有你\r\n如果有一天我创造神话，我希望我的神话中有你\r\n如果有一天我成为传说，我希望你是传说的一部分\r\n如果有一天我站在山巅，我希望我的身后有你\r\n如果有一天我创造神话，我希望我的神话中有你\r\n如果有一天我成为传说，我希望你是传说的一部分', '千秋浩然', '武侠', '2018', '连载中', '19');
INSERT INTO `novel` VALUES ('16', '16', 'hanxiawuchen.png', '函夏无尘', '花中香，梦中魂。纷纷扬扬遗孤种。魑魅猖，七鬼恶。群魔乱舞，狼奔豕突。祸祸祸。\r\n\r\n残云卷，烟云散。坎坎坷坷铸赤胆。寒暑往，龙凤翔。函夏一统，种花梦圆。贺贺贺。', '苍存', '武侠', '2019', '连载中', '0');
INSERT INTO `novel` VALUES ('17', '17', 'tiandaozuiren.png', '天道罪人', '道化于形，藏道其心，汝有苍穹念，缘何斩众生？\r\n吾生是罪，死是罪，不生不死，罪上加罪！', '空钓夜', '武侠', '2021', '连载中', '0');
INSERT INTO `novel` VALUES ('18', '18', 'haoranxianfeng.png', '浩然衔风', '无人之境，笑语含混不清。\r\n天地倒置，大道异曲同工。\r\n须知少年凌云志，曾许天下第一流', '人间一两风', '武侠', '2020', '连载中', '0');
INSERT INTO `novel` VALUES ('19', '19', 'jiujianzifang.png', '酒剑四方', '凡夫俗子有几多岁月。\r\n一入江湖岁月催。\r\n垂髫小儿至独挡四方。', '凉凉不加班', '武侠', '2021', '连载中', '0');
INSERT INTO `novel` VALUES ('20', '20', 'shangmenmingwang.png', '上门冥王', '乞丐？上门女婿？不！他是顶级豪门叶赫那拉家族万亿资产的唯一继承人，叶赫那拉.金乌，是遗落民间的苍龙明珠，更是地狱少主冥王转世。于家，他是宠妻暖男，神医神棍，于国，他是战神冥王，调千万阴兵，护万万生灵。手握最烂底牌，打出惊天王炸！', '傅家公子', '都市', '2018', '已完结', '0');
INSERT INTO `novel` VALUES ('21', '21', 'quanzhiguanjia.png', '全职管家', '作为一个优秀的管家，必须掌握高超的厨艺，盖世神功，妙手医术。总之全能的，徐铭不知自己来自哪里，他应聘成为周家的管家，且看他如何纵横都市。', '逍遥狸猫神', '都市', '2019', '连载中', '0');
INSERT INTO `novel` VALUES ('22', '22', 'dushizhikuangshaozongheng.png', '都市之狂少纵横', '一朝邪脉启，横推天下敌！\r\n年少不轻狂，老来何以话秋凉？', '天生有邪', '都市', '2019', '连载中', '0');
INSERT INTO `novel` VALUES ('23', '23', 'juepinxianzuunzhuixu.png', '绝品仙尊赘婿', '南天仙域的最强仙尊—太玄仙尊一睁眼，居然重生在一位同名同姓的，废物上门女婿身上。\r\n上一世，郑少歌妄图进入过去的时空长河中，将陨落的师尊“百花仙王”找回来，最终消亡在时空长河之中。\r\n本以为就此身死道消，不成想一缕神魂脱离时空长河，重生在世俗界一位废物上门女婿身上。', '葡萄要吐皮', '都市', '2020', '连载中', '0');
INSERT INTO `novel` VALUES ('24', '24', 'huayuzhihuhangjinniandai.png', '华娱之黄金年代', '1984年的春天，一个厨子走进了红楼梦演员培训班，从此开启了一段传奇经历', '慎思量', '都市', '2020', '连载中', '0');
INSERT INTO `novel` VALUES ('25', '25', 'zuiqiangxiaohuang.png', '\r\n最强枭皇', '混沌时代，万年神灵之战之后，一切都恢复正常，殊不知一代枭皇就此隐姓埋名，当他再次醒来的时候，发现世界已经改变，进入到高科技装备时代，他还能适应这个五颜六色的世界吗？面对这个陌生的世界，他该何去何从呢？', '孟元辰', '都市', '2021', '连载中', '0');
INSERT INTO `novel` VALUES ('26', '26', 'zhenguoyisheng.png', '镇国医圣', '六年前，他是第一天骄，却遭人陷害。六年后，他是享誉华夏的医圣，权财双绝，武道巅峰。\r\n如今，他王者归来，君临天下……', '花小厨', '都市', '2021', '连载中', '0');
INSERT INTO `novel` VALUES ('27', '27', 'gaowuzhanji.png', '高武战纪', '万通筋骨贴让你拥有万通之体，一通万通；风油精让你拥有风一样的速度，快到飞起；藿香正气液让你浩然正气护身，万法不侵；生姜红糖水让你气血之力勃发，刀剑不伤；小水枪biubiubiu射出水线，贯穿力惊人……\r\n一切常见的东西，在这里都拥有不常见的效果，这些奇奇怪怪的东西，究竟是道德的沦丧，还是人性的扭曲？', '捉鳖', '科幻', '2018', '已完结', '0');
INSERT INTO `novel` VALUES ('28', '28', 'xuannengjiyuan.png', '玄能纪元', '当高等文明的科技繁衍到巅峰。\r\n迈入到新的纪元历程。\r\n玄能纪元历001年，借助庞大的宇宙资源能量合成改造系统。', '沐梓晓龙', '科幻', '2019', '已完结', '0');
INSERT INTO `novel` VALUES ('29', '29', 'shijieyouyouyouhuimiele.png', '世界又又又毁灭了', '故事的开端，要从某个破桶实验开始。\r\n和其它所有实验一样，桶中的生物以为自己的文明就会这样一直延续下去。\r\n怎么可能！所以我就给他们来了点刺激的。', '岚焰', '科幻', '2018', '连载中', '0');
INSERT INTO `novel` VALUES ('30', '30', 'wangyouzhibusijianshen.png', '网游之不死剑神', '我，林清，一名平平无奇的大学毕业生，原本已经过上了每天朝不保夕三餐无底的生活，但直到那天一场意外的发生，我重新觉醒了曾经被现实所磨平的游戏天赋，带着不屈的梦想我来到了幻世这款游戏之中', '妖王大叔', '科幻', '2019', '连载中', '0');
INSERT INTO `novel` VALUES ('31', '31', 'lieshaxingqiu.png', '猎杀星球', '距离太阳系一光年的地方出现了一个高速运动且可供时间旅行的虫洞，科学家召集人员精心计划了一次时间之旅。罗斯是一位优秀的宇航员，但在这次航行中却是完全不同的，而且所有的一切都是未知的，在他们正准备穿越虫洞时，他们的飞船却意外被虫洞另一段穿越过来的巨型物质撞到，罗斯进入了救生艇，成功飞出了即将毁灭的飞船，却因为为了掩护其他人撤离而落入了虫洞。', '听风落叶', '科幻', '2020', '连载中', '0');
INSERT INTO `novel` VALUES ('32', '32', 'heixiehuanxiang.png', '黑械幻想', '冰冷的金属从伤口拔出的气味。随着一道暗红色的弧线，在空气中蔓延，荡漾着撕心裂肺般的嘶吼。\r\n当爱德华的惨叫脱力到戛然而止，双眼也不由自主地溢满了泪水，如同在大腿伤口上肆意流淌的血液！但是这些痛楚依然无法让他分心，因为在爱德华逐渐朦胧的视野中，那半机械半生物的阴影依然尽忠职守地谋划着如何终结他的生命。', '萧风朝', '科幻', '2020', '连载中', '0');
INSERT INTO `novel` VALUES ('33', '33', 'wozhenshicikea.png', '我真是刺客啊', '杨逸影成为执行者，穿梭各个世界完成任务。\r\n潜行暗杀的刺客信条，刀光剑影的倚天屠龙…\r\n欢迎来到，世界的交汇，强者的摇篮。', '我有四知', '科幻', '2021', '连载中', '0');
INSERT INTO `novel` VALUES ('34', '34', 'shenmohuangyyan.png', '神魔谎言', '主界定天使与恶魔，谁又来界定主？真实之下，黑与白的战斗永无停歇。光明、黑暗、世俗之间的战争，在看不见的地方悄然发生。\r\n梦与现实的交织中，我寻找着真正的自己，并探索着混沌的真理。朋友和敌人都在等待，等待我的答案，选择既是方向，也是界线。\r\n时间会混淆历史，立场决定着角色，当我醒来，续写我未完的恶魔传说。', '火考刀田一', '悬疑', '2018', '已完结', '0');
INSERT INTO `novel` VALUES ('35', '35', 'yipaitianshi.png', '一派天师', '我本可以像正常人一样，有一个无忧无虑的生活，可是就在我五岁的时候，因为好奇去鬼屋探险，而被阴魂缠身，恰好一个过路的道士救了我，并收我为徒，从此我就感觉我上了一条无法离开的贼船了，踏上了一条不归路，因此我便有了一些奇怪的身份，说的好听一点是个一代天师，说的不好听一点那就是一个被地府官员压榨的奴隶。认识了许多的奇能异士，精神都不是很正常的人，经历了许多常人无法理解的灵异事件，恐怖的都市传说，神秘的重生人，阴暗的夺胎人，长生不死的人，五大仙家，赶尸人，轮回的秘密，可怕的游戏。', '小知之', '悬疑', '2019', '已完结', '0');
INSERT INTO `novel` VALUES ('36', '36', 'linshigongpoanxiaozu.png', '临时工破案小组', '一个个看似简单的案件背后却深藏重重疑云，一个个看似奇葩的临时工却屡破奇案。\r\n女主播直播被虏？嫌疑人凭空消失？连环杀手，商业间谍，看似毫无联系，却又暗藏玄机……\r\n无异能，无系统，推理只能发现凶手，证据才能伸张正义。', '维生素碧二', '悬疑', '2019', '连载中', '0');
INSERT INTO `novel` VALUES ('37', '37', 'emengchaoshi.png', '噩梦超市', '我已经大学毕业五年了，目前在一家全市连锁的超市工作。\r\n公司里的员工，大多数都是一些中年女性，年轻的都很少，更别提像我这样的应届大学生了。\r\n可能大多数人都觉得，在超市做个结账的收银员是一件十分没前途，还丢人的工作。', '铺达', '悬疑', '2020', '连载中', '0');
INSERT INTO `novel` VALUES ('38', '38', 'dongbeibaojiaxian.png', '东北保家仙', '瞎眼刘老头死而复生，成为白尸，黄皮子借纸人开口，鬼火漫山，有恶灵索命害人，你信也好不信也好，一本奇书残经，记录着整件事情的过往，这个故事，发生在东北农村乡下大洼村……', '降不住的男人', '悬疑', '2020', '连载中', '0');
INSERT INTO `novel` VALUES ('39', '39', 'lingtandangan.png', '灵探档案', '接二连三的案件，死状诡异的尸体，晦暗莫测的踪迹......\r\n本是灵珩城中墨灵局的成员顾小凡被下放到M城做个小警探，本想随遇而安，却屡遇诡案。\r\n破案的同时，一份尘封多年的档案让隐藏在背后的黑暗渐渐浮出水面......', '差不多是块小饼干', '悬疑', '2021', '连载中', '0');
INSERT INTO `novel` VALUES ('40', '40', 'shaonianshenxiang.png', '少年神相', '八百年前，祖先为了解决宗族灾难，修改了我的命格，让我成为了不世出的天才。如今，一场怪病带走了我的爷爷，同时也拉开了灾难的序幕，为了给爷爷报仇，找出真凶，我踏上了找寻真相的路程。江湖宁静不在，各路高手逐一浮出，背后究竟是谁人指挥？山医命相卜，五脉齐出，究竟是所为何事？且看我吴明如何匡扶家族，报仇雪恨。', '子不语怪兽', '悬疑', '2021', '连载中', '0');

-- ----------------------------
-- Table structure for novelnews
-- ----------------------------
DROP TABLE IF EXISTS `novelnews`;
CREATE TABLE `novelnews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `novelnew` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novelnews
-- ----------------------------
INSERT INTO `novelnews` VALUES ('1', 'ssssss', 'novelnews');
INSERT INTO `novelnews` VALUES ('2', 'wwwwwwwwww', 'novelnews2');
INSERT INTO `novelnews` VALUES ('3', 'aaaaaaaaaa', 'novelnews3');
INSERT INTO `novelnews` VALUES ('4', 'dddddddddd', 'novelnews4');
INSERT INTO `novelnews` VALUES ('5', 'fffffffff', 'novelnews5');
INSERT INTO `novelnews` VALUES ('6', 'bbbbbbbbb', 'novelnews6');
INSERT INTO `novelnews` VALUES ('7', 'qqqqqqqqqqq', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'cqy123456', '123456', '男', '18');
INSERT INTO `user` VALUES ('2', 'ty123456', '123456', 'nan', '18');
INSERT INTO `user` VALUES ('3', 'nm123456', '123456', '男', '19');
INSERT INTO `user` VALUES ('4', 'cv123456', '134566', '男', '15');

-- ----------------------------
-- View structure for novelview
-- ----------------------------
DROP VIEW IF EXISTS `novelview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `novelview` AS select `novel`.`id` AS `id`,`novel`.`novelid` AS `novelid`,`novel`.`pic` AS `pic`,`novel`.`name` AS `name`,`novel`.`introduction` AS `introduction`,`novel`.`author` AS `author`,`novel`.`type` AS `type`,`novel`.`date` AS `date`,`novel`.`novstate` AS `novstate`,`novel`.`hit` AS `hit` from `novel` ;
DROP TRIGGER IF EXISTS `INSER`;
DELIMITER ;;
CREATE TRIGGER `INSER` AFTER INSERT ON `novel` FOR EACH ROW BEGIN
   UPDATE novel SET novelid=new.id;
END
;;
DELIMITER ;
