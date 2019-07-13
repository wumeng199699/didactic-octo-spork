<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
		<link rel="stylesheet" href="css/dixian.css" rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<meta charset="UTF-8">
		<title>首页</title>
	</head>
	<body>
		<div class="row" style="margin:0;width:100%;">
			<div class="col-md-4">
				<h2>&nbsp&nbsp飞阅续书小说网</h2>
			</div>
			<div class="col-md-5">
				<div class="sousuolan">
				<form action="do_sousuo.jsp"method="post"name="biaodan"autocomplete="on">
				    <input type="radio" name="zhonglei" checked="checked">书名
				    <input type="radio" name="zhonglei">作者&nbsp
					<input class="sousuo" type="search" name="sousuo"placeholder="请输入要搜索的内容" style="width: 70%;"/>
			        <button class="button" type="submit" value="搜索">搜索</button>
				</form>
				</div>
			</div>
			<div class="col-md-3">
				<ul>
				    <li><a href="about.html">关于</a></li>
					<c:if test="${user!=null}">
					<li class="dropbtn"><a class="a_dropbtn" href="">欢迎，${user.uname}</a>
				    	<div class="dropbtn-con">
				    		<a href="person.html">个人中心</a>
				    		<a href="logout">退出</a>
				    	</div>
				    </li>
				</c:if>
				<c:if test="${user==null}">
					<li>
						<a href="login.jsp">登录</a>
					</li>
				</c:if>
				    <li><a href="shoucang.jsp">收藏夹</a></li>
				</ul>
			</div>
		</div>
		<div class="navcol">
				<ul>
					<li>
						<a href="shouye.jsp">--首页--</a>
					</li>
					<li class="navhover" style="background-color: #C1E2B3;  border:1px solid darkslategray;">
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
		<div class="select">
			<div class="selectline"></div>
			<div class="nrselect">
				<a class="current store" href="javascript:void(0)" booktyle="0">阅读专区</a>
				<span>|</span>
				<a class="store" href="javascript:void(0)" booktyle="1">续写专区</a>
			</div>
			<div class="selectline"></div>
			<div class="kind">
			       <div class="bz">作品分类：</div>
			       <div class="nz">
			       	<a class="current store" href="javascript:void(0)" categoryid="0">全部作品</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">玄幻奇幻</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">武侠仙侠</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">言情小说</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">穿越架空</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">恐怖灵异</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">悬疑推理</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">游戏同人</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">科幻魔幻</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">历史军事</a>
			       </div>
			</div>
			<div class="kind">
			       <div class="bz">写作进度：</div>
			       <div class="nz">
			       	<a class="current store" href="javascript:void(0)" categoryid="0">全部</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">连载中</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">已完结</a>
			       </div>
			</div>
			<div class="kind">
			       <div class="bz">作品字数：</div>
			       <div class="nz">
			       	<a class="current store" href="javascript:void(0)" categoryid="0">全部</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">30万字以下</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">30万-50万</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">50万-100万</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">100万-200万</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">200万以上</a>
			       </div>
			</div>
			<div class="kind">
			       <div class="bz">更新时间：</div>
			       <div class="nz">
			       	<a class="current store" href="javascript:void(0)" categoryid="0">全部</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">三日内</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">一周内</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">一月内</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">半年内</a>
			       </div>
			</div>
			<div class="kind">
			       <div class="bz">其他：</div>
			       <div class="nz">
			       	<a class="current store" href="javascript:void(0)" categoryid="0">全部</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">免费</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">VIP</a>
			       	<a class="store" href="javascript:void(0)" categoryid="">只看签约</a>
			       </div>
			</div>
			<div class="selectline"></div>
			<div class="selectlist">
				<div class="bz">搜索条件</div>
				<div class="nz">
					<a class="store" href="javascript:void(0)">总收藏</a>
					<a class="store" href="javascript:void(0)">总字数</a>
					<a class="current store" href="javascript:void(0)">更新时间</a>
				</div>
			</div>
			<div class="selectline"></div>
		</div>
		<div class="clearfix"></div>
		<div class="book-select">
		    
		</div>
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