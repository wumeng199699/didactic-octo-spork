/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50720
Source Host           : rm-bp1vy9a80af682440lo.mysql.rds.aliyuncs.com:3306
Source Database       : feishu

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-06-17 21:01:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authors
-- ----------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `authornumber` int(11) NOT NULL,
  `author` char(20) NOT NULL,
  `authorstate` char(20) NOT NULL,
  PRIMARY KEY (`authornumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作家表';

-- ----------------------------
-- Records of authors
-- ----------------------------
INSERT INTO `authors` VALUES ('1', '明月珰', '非签约作家');
INSERT INTO `authors` VALUES ('2', '蜘蛛', '非签约作家');
INSERT INTO `authors` VALUES ('3', '酒精过敏', '非签约作家');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `booknumber` int(12) NOT NULL,
  `bookname` char(20) DEFAULT NULL,
  `author` char(20) DEFAULT NULL,
  `bookword` int(50) DEFAULT NULL,
  `bookstyle` char(50) DEFAULT NULL,
  `bookintroduce` varchar(150) DEFAULT NULL,
  `booktime` datetime DEFAULT NULL,
  `bookstate` varchar(32) DEFAULT NULL,
  `bookother` varchar(32) DEFAULT NULL,
  `bookgrade` int(12) DEFAULT NULL,
  `picture` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`booknumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='书籍表';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '七星彩', '明月珰', '100000', '古代言情', '她是富商之女纪澄，原本性格纯真，因经历了祝吉军的威胁强娶，并害得二哥被打断腿的事后，下定决心要嫁入高门。借沈府老太太六十大寿之际，纪澄住进了姑母家中。从此以后，纪澄的人生开启了逆转模式，从曾经受人百般宠爱的千金小姐，变成寄居在别人屋檐下，不得不低头的不受宠姑娘。纪澄小心翼翼地与府中姐妹和王家、苏家姐', '2017-07-13 17:15:07', '未完结', null, '9', 'https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/h%3D160/sign=da313a540433874483c52b7a610fd937/2e2eb9389b504fc2f977d401eddde71190ef6d8d.jpg');
INSERT INTO `book` VALUES ('2', '十宗罪6', '蜘蛛', '150000', '悬疑推理', '回到公安局，包斩陷入深深思考，可怜天下父母心，父母与孩子事情，人体蜈蚣嫌犯：孩子家长犯罪动机简简单单，只是报复，加祥警方调查平日四名失踪女孩的矛盾，关于同学的描述发现线索，包斩推测案件缘由，隐秘校园暴力事件观点，动摇雨衣光头男人，鱼线四名女生牵着街上爬行，这是羞辱监控视频，警方局长下令派出所，紧急出', '2018-01-01 20:37:57', '已完结', null, '9', 'https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=d008bc39bd3533fae1bb9b7cc9ba967a/7c1ed21b0ef41bd564beddc35dda81cb39db3d13.jpg');
INSERT INTO `book` VALUES ('3', '独游', '酒精过敏', '1062307', '玄幻奇幻', '主角是一个有了灵魂的NPC（电脑人物），全书写的是他混迹在玩家之中，以一个游戏“原住民”的眼光去看待玩家们的奇奇怪怪不可思议的一些行为和事迹，并在和玩家的交往中感受到别样的不同。', '2014-01-15 20:46:10', '已完结', null, '8', 'https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=a97555428794a4c20e23e0293ef51bac/b64543a98226cffc61ea0bffb9014a90f703eabf.jpg');

-- ----------------------------
-- Table structure for bookcomment
-- ----------------------------
DROP TABLE IF EXISTS `bookcomment`;
CREATE TABLE `bookcomment` (
  `booknumber` int(12) NOT NULL,
  `bookcomment` char(200) DEFAULT NULL,
  PRIMARY KEY (`booknumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='书籍评论';

-- ----------------------------
-- Records of bookcomment
-- ----------------------------

-- ----------------------------
-- Table structure for favoritebook
-- ----------------------------
DROP TABLE IF EXISTS `favoritebook`;
CREATE TABLE `favoritebook` (
  `usernumber` int(12) DEFAULT NULL,
  `booknumber` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏夹';

-- ----------------------------
-- Records of favoritebook
-- ----------------------------

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `usernumber` int(12) DEFAULT NULL,
  `booknumber` int(12) DEFAULT NULL,
  `bookpage` int(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史纪录';

-- ----------------------------
-- Records of history
-- ----------------------------

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `nodename` char(12) DEFAULT NULL,
  `zjnumber` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of node
-- ----------------------------
INSERT INTO `node` VALUES ('白景玉', '2.1');
INSERT INTO `node` VALUES ('画龙', '2.1');
INSERT INTO `node` VALUES ('包斩', '2.1');
INSERT INTO `node` VALUES ('苏眉', '2.1');
INSERT INTO `node` VALUES ('梁教授', '2.1');
INSERT INTO `node` VALUES ('女孩', '2.1');
INSERT INTO `node` VALUES ('主陪', '2.1');
INSERT INTO `node` VALUES ('郝局长', '2.1');

-- ----------------------------
-- Table structure for rankinglist
-- ----------------------------
DROP TABLE IF EXISTS `rankinglist`;
CREATE TABLE `rankinglist` (
  `booknumber` int(12) NOT NULL,
  `bookname` char(20) DEFAULT NULL,
  `bookgrade` int(12) DEFAULT NULL,
  `looknumber` int(32) DEFAULT NULL,
  PRIMARY KEY (`booknumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排行榜';

-- ----------------------------
-- Records of rankinglist
-- ----------------------------
INSERT INTO `rankinglist` VALUES ('1', '七星彩', '9', null);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `zjnumber` double(20,5) unsigned zerofill NOT NULL,
  `booknumber` int(12) DEFAULT NULL,
  `bookname` char(20) NOT NULL,
  `zhangjie` int(11) NOT NULL,
  `zj` char(20) DEFAULT NULL,
  `zjname` char(32) NOT NULL,
  `source` char(40) NOT NULL,
  `zjintroduce` char(40) DEFAULT NULL,
  PRIMARY KEY (`zjnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('00000000000001.10000', '1', '七星彩', '1', '第一章', '下马威', 'E:/小说/言情/七星彩/第一章.txt', null);
INSERT INTO `resource` VALUES ('00000000000001.20000', '1', '七星彩', '2', '第二章', '论斤两', 'E:/小说/言情/七星彩/第二章.txt', '“这是阿澄吧？三年前见着时还是个小娃娃。现在都长成大姑娘了，你生得真好，这模样将');
INSERT INTO `resource` VALUES ('00000000000001.30000', '1', '七星彩', '3', '第三章', '坏小孩', 'E:/小说/言情/七星彩/第三章.txt', null);
INSERT INTO `resource` VALUES ('00000000000002.10000', '2', '十宗罪6', '1', null, '衣锦还乡', 'E:/小说/悬疑侦探/十宗罪6/第一章.txt', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uphone` int(20) NOT NULL,
  `upassword` char(20) NOT NULL,
  `uname` char(20) NOT NULL,
  PRIMARY KEY (`uphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '1');
INSERT INTO `user` VALUES ('2', '123456', '1401110001');
INSERT INTO `user` VALUES ('110', '1100', '阿金');
INSERT INTO `user` VALUES ('119', 'abc', '阿莉');
INSERT INTO `user` VALUES ('120', '123a', '阿捷');
INSERT INTO `user` VALUES ('130', '222', '阿嘉');
INSERT INTO `user` VALUES ('190', '888', '阿凤');
INSERT INTO `user` VALUES ('465', '123', '123');
INSERT INTO `user` VALUES ('555', '555', '阿凡达');
INSERT INTO `user` VALUES ('963', '963', '阿帆');
INSERT INTO `user` VALUES ('12132', '1', '1');
INSERT INTO `user` VALUES ('123123', 'test', 'test');
INSERT INTO `user` VALUES ('1234567', '1234567', '孟捷');
INSERT INTO `user` VALUES ('12345678', '1', '1');

-- ----------------------------
-- Table structure for xbook
-- ----------------------------
DROP TABLE IF EXISTS `xbook`;
CREATE TABLE `xbook` (
  `xbooknumber` int(12) NOT NULL,
  `xbookname` char(20) DEFAULT NULL,
  `xbookauther` char(20) DEFAULT NULL,
  `xbookbeijing` char(150) DEFAULT NULL,
  `xbookstyle` varchar(32) DEFAULT NULL,
  `xbooktime` datetime DEFAULT NULL,
  PRIMARY KEY (`xbooknumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='可续写小说';

-- ----------------------------
-- Records of xbook
-- ----------------------------

-- ----------------------------
-- Table structure for 十宗罪
-- ----------------------------
DROP TABLE IF EXISTS `十宗罪`;
CREATE TABLE `十宗罪` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `内容` text,
  `摘要` text,
  `续写` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 十宗罪
-- ----------------------------

-- ----------------------------
-- Table structure for 超时空之城
-- ----------------------------
DROP TABLE IF EXISTS `超时空之城`;
CREATE TABLE `超时空之城` (
  `章节编号` int(11) NOT NULL AUTO_INCREMENT,
  `章节名` varchar(32) DEFAULT NULL,
  `章节内容` text,
  `是否续写` int(11) DEFAULT '0',
  PRIMARY KEY (`章节编号`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 超时空之城
-- ----------------------------
INSERT INTO `超时空之城` VALUES ('1', '时空之城', '“氧气就要用光了，爸，妈，儿子不孝，你们的养育之恩，只能来生再报了……”\n　　“飞船只剩下百分之三的能量，无法将我的尸骨带回地球，不过也好，作为一名宇航员，长眠于宇宙也算是个不错的归宿。只可惜，这里没法通信，儿子临死之前就是想要跟你们二老说几句话，也无法做到……”\n　　“还有林璇，我竟然一直到死，都没能开口说出‘我爱你’……”\n　　放下录音笔，纪明回忆起了自己这短暂的一生：出生于一个普通家庭，上学时成绩一般。因为在机械操作方面颇有天赋被保送成为宇航员，经过三年训练，年仅二十一岁的他便击败所有对手，获得了人类第一次登陆火星的机会。\n　　靠着过硬的专业知识，他倒是成功着陆，并且分批将探索资料送了回去。\n　　这样只要成功返航，他就能成为航天英雄，可以无视身份差距，向自己喜欢的女孩表白。\n　　然而命运偏偏就是喜欢捉弄人：在他想要返航的时候，地球和火星之间突然出现了传说中的黑洞毫无疑问，这种连光都无法逃逸出去的神秘天体，一出现就把他所乘坐的飞船给吸了住。\n　　徒劳挣扎了二十多天，飞船能量耗尽，氧气也即将用完。\n　　纪明几乎看到，死神已经微笑着在冲自己招手。\n　　“我死之后，也不知道她还会不会记得，曾经有个叫纪明的男孩，一直很喜欢她……”离死亡越来越近，纪明反倒平静了下来。看着黑洞，他好奇道：“密度无限大，体积无限小，连时间与空间都能扭曲，这究竟是一种什么样的存在呢？”\n　　说着，他猛地加速，用那仅剩的百分之三能量往黑洞中心冲了过去。\n　　下一刻，光芒、能量、物质，一切都不复存在。\n　　时空扭曲成了一个沙漏，但又像是镜子一样，折射着完全对称的两边。\n　　而纪明，他的身躯在一瞬间分解，又透过沙漏，组成了另一个完全不同的自己其实也没有什么不同，真要较真的话，就是宇宙间的一切物质、联系都随他远去，被喷射出去的他并没有掉落在离这最近的火星上，而是穿过一条真正漆黑的黑洞，落到了一个未知的空间。\n　　而与此同时，仿佛是受未知空间影响，火星上空的黑洞猛地开始收缩，几个呼吸的时间便消失不见了。\n　　周围的一切都恢复平静，好似之前那个黑洞，从来就没有出现过一样。\n　　“这，这是什么情况？”穿过黑洞以后，纪明从一个巨大的旋窝中被排斥了出来。\n　　这个旋窝无比巨大，它散发着光和热，就是跟太阳比起来，也不逞多让。而在旋窝下方，遥遥的可以看到一片四方形陆地。陆地的引力少说也有地球数十倍，因为受它牵引的纪明，下落起来竟然变成了流星！\n　　是的，一个燃烧着火焰，拖着长长尾巴的流星。\n　　不过奇怪的是，高速飞行中的纪明，却并没有感到任何不适。\n　　陆地与自己的距离越来越近，渐渐地，他发现那似乎并不是什么陆地，而是一座巨大的城池！\n　　这座城酷似中国古代的都城，正中心是一个广场，广场中间有一个迷你型的旋窝。这个旋窝跟天空上方的那个一模一样，只是体积小了无数倍。不过，在给纪明的感觉上，它却比上方的那个大漩涡还要深不可测。\n　　在引力的作用下，纪明摔在了古城大街上，但并没有想象中的撞击，而是直接融了进去。\n　　就像电视里放的穿墙术、土遁术一样。\n　　紧接着，来不及多想，他便出现在了一个银白色座位上。\n　　这是一个王座一样的宽椅，通体银白，但却显得比黄金还要高贵。座位的靠背也是一个旋窝，不过靠在上面并不会被吸住，反而宛如沙发靠背一样舒服。另外，也不知道是不是错觉，纪明总感觉自己似乎掌控了整座城。\n　　接着心念一动，整座城里的一草一木便都呈现在了他脑中。\n　　直到这时，他才发现这座城里，竟然根本没有人！\n　　“恭喜主人，您已经成为了极巅超神器‘时空之城’的城主，我是您的侍女小萝，很高兴能够服侍您。”突然，前方的一道白光闪过，一个十四五岁的少女凭空显化了出来。对此，纪明下意识地瞪眼道：“神器？这……难道你是传说中的器灵？”\n　　岂料，小萝闻言，却不屑道：“我可不是那种低级生命，而且，时空之城也不可能有器灵。”\n　　“额。”纪明一愣。\n　　“我是伴随这座城一起出生的‘超生命’，在生命层次上等同于‘神’，拥有着掌控时空的神通呢！”小萝一脸傲然地说。但下一秒，她就挠着头，干笑道：“当然了，跟城主大人您是不能比的您作为极巅超神器‘时空之城’的主人，超然于时空之上，永恒不朽，是无尽世界中层次最高的生命！”\n　　纪明忍不住翻起了白眼。\n　　“你不信？”\n　　“我可能信吗？”\n　　“其实我也不怎么信，明明只是一个很普通的凡人，怎么就能让这‘时空之城’认主呢？”小萝好奇地打量着纪明，说：“但事实就是这样，这座城以及它所属的一切，包过我，都已经完全属于您。”\n　　“真属于我？”\n　　“当然。”\n　　“包括你在内？”\n　　“嗯。”\n　　“那我问你一个问题：我该怎样做，才能够回去？”纪明问。立马，小萝摇了摇头，说：“不知道，我从来没有出去过，根本不知道外面的世界是什么样子。不过，你是从时空漩涡里出来的，如果原路返回的话，应该是能够出去的。”\n　　说着，她指了指上方的那个大漩涡。\n　　“那也就是说，我回不去了？”上方的旋窝高得跟太阳一样，纪明可不认为自己还能爬上去。\n　　“怎么可能？”摇了摇头，小萝一脸郑重地说：“您是极巅超神器‘时空之城’的主人，拥有着凌驾于时空之上的力量，只要您想去，别说空间上的距离了，就是时间上的距离，也不可能阻挡得了您！”\n　　说到这里，小萝顿了一下，又说：“当然，那得在时空之城能量足够的前提下。”\n　　对此，纪明不等她说出来，就直接道：“目前时空之城的能量并不足，对吧？”\n　　“嗯，极巅超神器的消耗特别大，以我们现在所拥有的能量，根本无法进行空间传送。”小萝点了点头，说。\n　　“你总说‘极巅超神器’，那到底是什么东西？”纪明疑惑道。\n　　神器、超神器什么的，他倒是不陌生，毕竟地球上从不缺神话传说。但是极巅超神器，他却是第一次听说。而且，他真正见到的神器，也只有时空之城这一件，没有对比，心里也自然就没有什么概念。\n　　听到询问，小萝立马说：“就是最高级的神器啦。”\n　　“怎么个高级法？”纪明追问。\n　　“这个，怎么形容呢……盘古和鸿钧你应该听说过吧？”小萝想了一下，说：“如果你能够进入他们的世界，并且找到那个世界的天道，那么时空之城就可以轻易将其捕捉，使整个世界都归你所有。”\n　　“到那时候，如果你愿意的话，完全可以量产造化玉蝶和盘古斧，要多少有多少。”\n　　“啊？”纪明瞬间张大了嘴巴。\n　　“不过，一切的前提，是你要拥有足够的‘时空能量’，不然别说复制盘古斧，你连前往洪荒世界都做不到。”小萝顿了一下，接着说：“获得‘时空能量’的方法很简单，只要前往无尽世界，将它们征服，把里面的天才都给接引到时空城，就会有源源不断的‘时空能量’了。”\n　　“征服世界？”纪明忍不住翻白眼。\n　　这个要是还算简单，那这个世界上就不存在什么难事儿了。\n　　“不是你想的那种征服，只是找到‘世界意志’，然后用时空之城捕捉而已。”立马，小萝说：“捕捉环节您不用考虑，时空之城作为极巅超神器，任何世界都能够轻易捕捉，唯一难的，只是如何找出‘世界意志’。”\n　　“好吧！”虽然不懂，但纪明感觉，好像很厉害的样子。\n　　“对了，无尽世界到底是什么？”纪明问。\n　　“就是一个个世界啦，比如果那些只存在于幻想中的世界，它们其实都是存在的，只不过没人能够穿过‘次元壁垒’到达那里而已。还有平行世界，世间生灵的每一个选择，甚至每一个想法，都会使时空产生分流，进而形成很多看似一样，但其实完全不同的世界。再者就是本源世界，本源世界的时空不会分流，幻想也与现实完全隔绝，往往这样的世界，都不存在神灵和修行者。不过本源世界一旦诞生神灵，那就是真正的神明，最低级的本源神灵都可以轻易灭掉次元世界的至高神！”\n　　“听起来好像很有趣。”有关于无尽世界的说法，纪明还是第一次听说。\n　　“据说在本源之上，还有一个叫做‘唯一真界’的世界。”小萝有些不太确定地说：“无尽世界里的一切都会在‘唯一真界’映射出来，但两者永远都不会产生交集，就好似对‘唯一真界’来说，整个无尽世界，都是虚幻的！”\n　　“……”纪明只能当故事来听。\n　　“不过这都跟我们没有什么关系啦，时空之城超然于一切之上，只要时空能量足够，就算是打开唯一真界的大门，也轻而易举。”小萝说着，突然脸色一正，道：“城主大人，请问您寂寞吗？”\n　　“啊？”纪明一愣。\n　　“我们现有的时空能量刚好够进入一个次元世界，请您选择一个进入吧！”小萝看着纪明，说：“对了，只能进入低武世界，拥有超自然力量的世界我们暂时还进不去。另外，这个世界必须能人辈出，不然接引不到人才是小事儿，捕捉之后没有时空能量可就麻烦了。”\n', '0');
INSERT INTO `超时空之城` VALUES ('2', null, null, '1');
INSERT INTO `超时空之城` VALUES ('3', null, null, '1');
