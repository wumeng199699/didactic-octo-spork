<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jdbcutil.dao.*" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <link rel="stylesheet" href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/shouye.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/dixian.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>首页</title>
    <script>
        /*
        function search(){
            var zhonglei =$("input[name = 'zhonglei']:checked").val();
            if(zhonglei=="book"){
            	<!--
        	    searchform.action="do_sousuo.jsp";
        	    searchform.sumbit();
        	    -->
            }
            if(zhonglei=="author"){
            	<!--
        	    searchform.action="do_search.jsp";
        	    searchform.sumbit();
        	    -->
            }
        }
        */
    </script>
</head>

<body>
<div class="background-img">
    <div class="row" style="margin:0;width:100%;">
	    <div class="col-md-4">
			<h2>&nbsp&nbsp飞阅续书小说网</h2>
		</div>
		<div class="col-md-5">
			<div class="sousuolan">
				<form id="searchform" method="post" name="biaodan" autocomplete="on" action="do_sousuo.jsp">
					<input type="radio" name="zhonglei" value="book"  checked="checked"/>书名
					<input type="radio" name="zhonglei" value="author" />作者&nbsp
					<input class="sousuo" type="search" name="sousuo" placeholder="请输入要搜索的内容" style="width: 70%;" />
					<button class="button" type="submit" value="search">搜索</button>
				</form>
			</div>
		</div>
		<div class="col-md-3">
			<ul>
				<li>
					<a href="about.html">关于</a>
				</li>
				<c:if test="${user!=null}">
			        <li class="dropbtn"><a class="a_dropbtn" href="">欢迎，${user.uname}</a>
				    	<div class="dropbtn-con">
				    		<a href="person.jsp">个人中心</a>
				    		<a href="logout">退出</a>
				    	</div>
				    </li>
				</c:if>
				<c:if test="${user==null}">
					<li>
						<a href="login.jsp">登录</a>
					</li>
				</c:if>
				<li>
					<a href="shoucang.html">收藏夹</a>
				</li>
            </ul>
		</div>
	</div>
	<div class="navcol">
		<ul>
			<li class="navhover" style="background-color: #C1E2B3; border:1px solid darkslategray;">
				<a href="shouye.jsp">--首页--</a>
			</li>
			<li>
					<a href="bookstore.jsp">--书库--</a>
			</li>
			<li>
					<a href="read.jsp">--阅读专区--</a>
			</li>
			<li>
					<a href="write.jsp">--续写专区--</a>
			</li>
		</ul>
	</div>
	<div class="clearfix"></div>
	<div class="warp">
        	<div class="nav">
				<ul>
					<li class="li1">
						<h3>作品分类</h3>
					</li>
					<li class="li2">
						<a href="xhqh"><span>玄幻奇幻</span></a>
						<a href="wxxx"><span>武侠仙侠</span></a>
					</li>
					<li class="li1">
						<a href="xdyq"><span>言情小说</span></a>
						<a href="gdyq"><span>穿越架空</span></a>
					</li>
					<li class="li2">
						<a href="kbly"><span>恐怖灵异</span></a>
						<a href="xytl"><span>悬疑推理</span></a>
					</li>
					<li class="li1">
						<a href="yxtr"><span>游戏同人</span></a>
						<a href="khmh"><span>科幻魔幻</span></a>
					</li>
					<li class="li2" style="border-bottom:1px solid #2F4F4F; border-bottom-left-radius:0.5em; border-bottom-right-radius:0.5em;">
						<a href="lsjs"><span>历史军事</span></a>
						<a href="qb"><span>全部小说</span></a>
					</li>
				</ul>
			</div>
    <div class="mod-tab">
    	<ul id="list">
            <li class="tab-con" style="opacity: 1">
                    <span class="pic">
                        <a href="#" style="background-image: url(img/1.jpg)"></a>
                    </span>
            </li>
            <li class="tab-con" style="opacity: 1">
                    <span class="pic">
                        <a href="#" style="background-image: url(img/2.jpg)"></a>
                    </span>
            </li>
            <li class="tab-con" style="opacity: 1">
                    <span class="pic">
                        <a href="#" style="background-image: url(img/3.jpg)"></a>
                    </span>
            </li>
            <li class="tab-con" style="opacity: 1">
                    <span class="pic">
                        <a href="#" style="background-image: url(img/4.jpg)"></a>
                    </span>
            </li>
            <li class="tab-con" style="opacity: 1">
                    <span class="pic">
                        <a href="#" style="background-image: url(img/5.jpg)"></a>
                    </span>
            </li>
        </ul>
        <div id="gb-tab" class="gb-tab">
            <a href="javascript:;" class="item2"></a>
            <a href="javascript:;" class="item"></a>
            <a href="javascript:;" class="item"></a>
            <a href="javascript:;" class="item"></a>
            <a href="javascript:;" class="item"></a>
        </div>
        <a href="javascript:;" id="prev" class="arrow"><</a>
        <a href="javascript:;" id="next" class="arrow">></a>
    </div>
</div>
<div class="clearfix"></div>
<div id="container" class="container-font">
			<div class="xuxie-tuijian">
				<h1 style="text-align: center;">本周续写强推</h1>
				<ul style="font-size:20px;">
					<li><a href="book.jsp?bbk=2">十宗罪6</a></li>
					<li><a href="book.jsp?bbk=1">七星彩</a></li>
					<li><a href="book.jsp?bbk=5">浮生物语</a></li>
				</ul>
			</div>
			<div class="gonggao">
				<h1>公告栏</h2>
				<a href="shuming">穿越时空续写完成，欢迎点评指点！</a>
			</div>
			<div class="yuedu-tuijian">
				<h1 style="text-align: center;">本周阅读强推</h4>
				<ul style="font-size:20px;">
					<li><a href="book.jsp?bbk=1">七星彩</a></li>
					<li><a href="book.jsp?bbk=3">独游</a></li>
					<li><a href="book.jsp?bbk=2">十宗罪6</a></li>
				</ul>
			</div>
		</div>	
<div class="clearfix"></div>		
<div class="ranking">
			<div class="rank">
				<h1 class="biaoti-bang">阅读风云榜</h1>
				<div class="book-list">
					<li class="no1">
						<div class="no1-text">
							<h3>NO.1</h3>
							<a href="第一">暗夜</a>
							<p>12345月票</p>
							<ul>
							    <a href="类型">都市</a>
							    <i>·</i>
							    <a href="作者">刘家村花</a>
							</ul>
						</div>
					</li>
					<li class="no2">
						<h3>2</h3>
						<a href="第二" class="num-book">农家悍媳</a>
					</li>
					<li class="no3">
						<h3>3</h3>
						<a href="第三" class="num-book">最强僵尸系统</a>
					</li>
					<li class="no">
						<h3>4</h3>
						<a href="第四" class="num-book">都市最强兵王</a>
					</li>
					<li class="no">
						<h3>5</h3>
						<a href="第五" class="num-book">恰似寒光遇骄阳</a>
					</li>
					<li class="no">
						<h3>6</h3>
						<a href="第六" class="num-book">全职法师</a>
					</li>
					<li class="no">
						<h3>7</h3>
						<a href="第七" class="num-book">伏天氏</a>
					</li>
					<li class="no">
						<h3>8</h3>
						<a href="第八" class="num-book">帝霸</a>
					</li>
					
				</div>
			</div>
			<div class="rank">
				<h1 class="biaoti-bang">一周热销榜</h1>
				<div class="book-list">
					<li class="no1">
						<div class="no1-text">
							<h3>NO.1</h3>
							<a href="第一">绿色</a>
							<p>超高人气</p>
							<ul>
							    <a href="类型">热血</a>
							    <i>·</i>
							    <a href="作者">刘家村花</a>
							</ul>
						</div>
					</li>
					<li class="no2">
						<h3>2</h3>
						<a href="第二" class="num-book">斗罗大陆</a>
					</li>
					<li class="no3">
						<h3>3</h3>
						<a href="第三" class="num-book">斗破苍穹</a>
					</li>
					<li class="no">
						<h3>4</h3>
						<a href="第四" class="num-book">圣墟</a>
					</li>
					<li class="no">
						<h3>5</h3>
						<a href="第五" class="num-book">牧神记</a>
					</li>
					<li class="no">
						<h3>6</h3>
						<a href="第六" class="num-book">万古神帝</a>
					</li>
					<li class="no">
						<h3>7</h3>
						<a href="第七" class="num-book">大主宰</a>
					</li>
					<li class="no">
						<h3>8</h3>
						<a href="第八" class="num-book">龙王传说</a>
					</li>
					
				</div>
			</div>
			<div class="rank">
				<h1 class="biaoti-bang">月票飞升榜</h1>
				<div class="book-list">
					<li class="no1">
						<div class="no1-text">
							<h3>NO.1</h3>
							<a href="第一">叶子</a>
							<p>88888+月票</p>
							<ul>
							    <a href="类型">青春</a>
							    <i>·</i>
							    <a href="作者">刘家村花</a>
							</ul>
						</div>
					</li>
					<li class="no2">
						<h3>2</h3>
						<a href="第二" class="num-book">十宗罪6</a>
					</li>
					<li class="no3">
						<h3>3</h3>
						<a href="第三" class="num-book">七星彩</a>
					</li>
					<li class="no">
						<h3>4</h3>
						<a href="第四" class="num-book">汉乡</a>
					</li>
					<li class="no">
						<h3>5</h3>
						<a href="第五" class="num-book">三寸人间</a>
					</li>
					<li class="no">
						<h3>6</h3>
						<a href="第六" class="num-book">儒道至圣</a>
					</li>
					<li class="no">
						<h3>7</h3>
						<a href="第七" class="num-book">全球高武</a>
					</li>
					<li class="no">
						<h3>8</h3>
						<a href="第八" class="num-book">不灭龙帝</a>
					</li>
					
				</div>
			</div>
			<div class="rank">
				<h1 class="biaoti-bang">一周点击榜</h1>
				<div class="book-list">
					<li class="no1">
						<div class="no1-text">
							<h3>NO.1</h3>
							<a href="第一">少年</a>
							<p>9999点击量</p>
							<ul>
							    <a href="类型">校园</a>
							    <i>·</i>
							    <a href="作者">刘家村花</a>
							</ul>
						</div>
					</li>
					<li class="no2">
						<h3>2</h3>
						<a href="第二" class="num-book">十宗罪6</a>
					</li>
					<li class="no3">
						<h3>3</h3>
						<a href="第三" class="num-book">七星彩</a>
					</li>
					<li class="no">
						<h3>4</h3>
						<a href="第四" class="num-book">我是至尊</a>
					</li>
					<li class="no">
						<h3>5</h3>
						<a href="第五" class="num-book">妖龙古帝</a>
					</li>
					<li class="no">
						<h3>6</h3>
						<a href="第六" class="num-book">花颜策</a>
					</li>
					<li class="no">
						<h3>7</h3>
						<a href="第七" class="num-book">奶爸的异界餐厅</a>
					</li>
					<li class="no">
						<h3>8</h3>
						<a href="第八" class="num-book">神医弃女：冷王的绝宠悍妃</a>
					</li>
					
			    </div>
			</div>
			<div class="rank">
				<h1 class="biaoti-bang">续写风云榜</h1>
				<div class="book-list">
					<li class="no1">
						<div class="no1-text">
							<h3>NO.1</h3>
							<a href="第一">十宗罪6</a>
							<p>9999月票</p>
							<ul>
							    <a href="类型">恐怖</a>
							    <i>·</i>
							    <a href="作者">蜘蛛</a>
							</ul>
						</div>
					</li>
					<li class="no2">
						<h3>2</h3>
						<a href="第二" class="num-book">七星彩</a>
					</li>
					<li class="no3">
						<h3>3</h3>
						<a href="第三" class="num-book">太古剑帝诀</a>
					</li>
					<li class="no">
						<h3>4</h3>
						<a href="第四" class="num-book">我是巨人</a>
					</li>
					<li class="no">
						<h3>5</h3>
						<a href="第五" class="num-book">伏天氏</a>
					</li>
					<li class="no">
						<h3>6</h3>
						<a href="第六" class="num-book">凡人修仙之仙界篇</a>
					</li>
					<li class="no">
						<h3>7</h3>
						<a href="第七" class="num-book">帝霸</a>
					</li>
					<li class="no">
						<h3>8</h3>
						<a href="第八" class="num-book">武破九荒</a>
					</li>
					
			    </div>
			</div>
		</div>
		<div class="clearfix"></div>			
		</div>
		<div class="clearfix"></div>
		<div class="dixian">
			<div class="guanyuwomen">
				<p>研发团队：X小队</p>
				<p>负   责  人：叶安</p>
				<p>联系电话：5324196</p>
				<p>出   版  社：中国石油大学出版社</p>
			</div>
			<div class="hezuo">
				<p>小说来源：纵横中文网     红袖添香</p>
				<p>潇湘书院    逐浪小说网       塔读文学</p>
				<p>其他小说网站....</p>
			</div>
			<div class="erweima">
				<img src="img/二维码.jpg"style="height: 100%;width: 100%;" />
			</div>
			<div class="huanying">
				<p>欢迎使用飞阅续书网！</p>
			</div>
		</div>
</body>

</html>
