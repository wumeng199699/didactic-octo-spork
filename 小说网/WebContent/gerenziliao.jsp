<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet" href="css/person.css" rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet" href="css/dixian.css" rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<meta charset="UTF-8">
		<title>个人中心</title>
	</head>

	<body>
		<div class="row" style="margin:0;width:100%;">
			<div class="col-md-4">
				<h2>&nbsp&nbsp飞阅续书小说网</h2>
			</div>
			<div class="col-md-5">
				<div class="sousuolan">
					<form id="form1" action="do_sousuo.jsp" method="post" name="sousuobiaodan" autocomplete="on">
						<input type="radio" name="zhonglei" checked="checked">书名
						<input type="radio" name="zhonglei">作者
						<input class="sousuo" type="search" name="sousuo" placeholder="请输入要搜索的内容" style="width: 70%;" />
						<button class="button" type="submit" value="搜索">搜索</button>
					</form>
				</div>
			</div>
			<div class="col-md-3">
				<ul>
					<li>
						<a href="about.jsp">关于</a>
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
						<a href="shouye.html">首页</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="person-img">
			<div class="navcol">
				<ul>
					<li>
						<b class="person">个人中心</b>
					</li>
					<li>
						<a href="person.jsp">我的书架</a>
					</li>
					<li class="navhover" style="background-color: #C1E2B3;">
						<a href="gerenziliao.jsp">个人资料</a>
					</li>
					<li >
						<a href="gerenziliao.jsp">关于</a>
					</li>
				</ul>
			</div>
			<div class="ziliao">
				<div class="head">
					<div class="leftb">
						<img src="img/头像.jpg" style="border-radius: 50%;max-height: 100%;max-width: 100%;" alt/>
					</div>
					<div class="rightb">
						<p class="nicheng">阿凡达</p>
						<p class="dengji">(书童)</p>
						<p style="color: grey;font-size: 18px;float: left;">个性签名：</p>
						<p class="qianming">还没有想说的~</p>
						<p style="color: grey;font-size: 18px;float: left;">可投票数：</p>
						<p class="piao">0</p>
					</div>
				</div>
				<div class="xiugai">
					<p class="xiaobiao">账 号：</p>
					<p style="text-align: left;">555</p>
					<form class="form-inline">
						<div class="form-group">
							<label class="xiaobiao">昵           称：</label>
							<input type="text" class="form-control" id="exampleInputName2" placeholder="请输入您的称呼">
						</div>
					</form>
					<p class="xiaobiao" style="width: 100%;text-align: left;">性 别：
						<label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 男
                    </label>
						<label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 女
                    </label>
					</p>
					<p class="xiaobiao" style="text-align: left;float: left;">生日：</p>
					<select class="form-control"style="width: 25%;float: left;">
						<option>1980年</option>
						<option>1981年</option>
						<option>1982年</option>
						<option>1983年</option>
						<option>1984年</option>
						<option>1985年</option>
						<option>1986年</option>
						<option>1987年</option>
						<option>1988年</option>
						<option>1989年</option>
						<option>1990年</option>
						<option>1991年</option>
						<option>1992年</option>
						<option>1993年</option>
						<option>1994年</option>
						<option>1995年</option>
						<option>1996年</option>
						<option>1997年</option>
						<option>1998年</option>
						<option>1999年</option>
						<option>2000年</option>
						<option>2001年</option>
						<option>2002年</option>
						<option>2003年</option>
						<option>2004年</option>
						<option>2005年</option>
						<option>2006年</option>
						<option>2007年</option>
						<option>2008年</option>
					</select>
					<select class="form-control"style="width: 25%;float: left;">
						<option>1月</option>
						<option>2月</option>
						<option>3月</option>
						<option>4月</option>
						<option>5月</option>
						<option>6月</option>
						<option>7月</option>
						<option>8月</option>
						<option>9月</option>
						<option>10月</option>
						<option>11月</option>
						<option>12月</option>
				    </select>
				    <select class="form-control"style="width: 25%;">
				    	<option>1日</option>
				    	<option>2日</option>
				    	<option>3日</option>
				    	<option>4日</option>
				    	<option>5日</option>
				    	<option>6日</option>
				    	<option>7日</option>
				    	<option>8日</option>
				    	<option>9日</option>
				    	<option>0日</option>
				    	<option>11日</option>
				    	<option>12日</option>
				    	<option>13日</option>
				    	<option>14日</option>
				    	<option>15日</option>
				    	<option>16日</option>
				    	<option>17日</option>
				    	<option>18日</option>
				    	<option>19日</option>
				    	<option>20日</option>
				    	<option>21日</option>
				    	<option>22日</option>
				    	<option>23日</option>
				    	<option>24日</option>
				    	<option>25日</option>
				    	<option>26日</option>
				    	<option>27日</option>
				    	<option>28日</option>
				    	<option>29日</option>
				    	<option>30日</option>
				    	<option>31日</option>
				    </select>
				    <p class="xiaobiao"style="text-align: left;float: left;width: 100%;">签名：
				    <textarea class="form-control" rows="3"style="width: 90%;float: right;padding-right: 60px;"></textarea>
				    </p>
			        <button type="button" class="btn btn-success"style="float: left;margin-left: 300px;">提交</button>
				</div>
			</div>
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