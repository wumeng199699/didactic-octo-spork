<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="com.jdbcutil.dao.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/dixian.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<meta charset="UTF-8">
    <title>小说搜索</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String Sousuo= request.getParameter("sousuo");
    System.out.println(Sousuo);
    Statement st=null;
    ResultSet rs=null;
    Connection conn=null;
    Statement st1=null;
    ResultSet rs1=null;
    Jdbc jdbc=new Jdbc();
    conn=jdbc.getConnection();
    st1=conn.createStatement();
    Search search=new Search();
    rs=search.search(Sousuo, conn);
    if(rs.next()){
 %>
    		       <div class="row" style="margin:0;width:100%;">
    					<div class="col-md-4">
    						<h2>&nbsp&nbsp飞阅续书小说网</h2>
    					</div>
    					<div class="col-md-5">
    						<div class="sousuolan">
    						<form id="form1" action="do_sousuo.jsp"method="post"name="sousuobiaodan"autocomplete="on">
    						    <input type="radio" name="zhonglei" checked="checked">书名
    						    <input type="radio" name="zhonglei">作者
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
    						    <li><a href="shouye.jsp">首页</a></li>
    						</ul>
    					</div>
    				</div>
    				<div class="container">
    					<div class="col-md-9">
    						<div class="jieguo">
    							<span>--搜索结果--</span>
    							    <%
    							        String SQL="select Booknumber from book where bookname='"+Sousuo+"'or author='"+Sousuo+"'";
    							        rs1=st1.executeQuery(SQL);
    							        if(rs1.next()){
    							        
    							    %>
    							    <a href="book.jsp?bbk=<%=rs1.getString("Booknumber") %>"><h4><%=rs.getString("bookname") %></h4></a>
    							    <%} %>
    							    <p>作者：<%=rs.getString("author") %>字数：<%=rs.getString("bookword") %>更新时间：<%=rs.getString("booktime") %></p>
    						</div>
    					</div>
    					<div class="tuijian">
    						<span>--小说推荐--</span>
    						<div class="tuijian-neirong">
    							<img src="img/书11.jpg" class="xiaoshuotu" />
    							<p>书名：精进</p>
    							<p>作者：采铜</p>
    							<p>状态：完结</p>
    							<img src="img/书22.jpg" class="xiaoshuotu" />
    							<p>书名：呐喊</p>
    							<p>作者：曼尼·斯坦伯格</p>
    							<p>状态：完结</p>
    							<img src="img/书33.jpg" class="xiaoshuotu" />
    							<p>书名：做个侃爷</p>
    							<p>作者：帕特里克·金</p>
    							<p>状态：完结</p>
    						</div>
    						<a href="shouye.jsp">更多>></a>
    					</div>
    				</div>
<%    }
    else{
%>
    	<div class="row">
		<div class="col-md-4">
			<h2>&nbsp&nbsp飞阅续书小说网</h2>
		</div>
		<div class="col-md-5">
			<div class="sousuolan">
			<form id="form1" action="do_sousuo.jsp"method="post"name="sousuobiaodan"autocomplete="on">
			    <input type="radio" name="zhonglei" checked="checked">书名
			    <input type="radio" name="zhonglei">作者
				<input class="sousuo" type="search" name="sousuo"placeholder="请输入要搜索的内容" style="width: 70%;"/>
				<button class="button" type="submit" value="搜索">搜索</button>
			</form>
			</div>
		</div>
		<div class="col-md-3">
			<ul>
			    <li><a href="about.html">关于</a></li>
			    <li><a href="login.jsp">登录</a></li>
			    <li><a href="shouye.jsp">首页</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="col-md-9">
			<div class="jieguo">
				<span>--搜索结果--</span>
				    <h4>无法搜到相应结果！！！</h4>
			</div>
		</div>
		<div class="tuijian">
			<span>--小说推荐--</span>
			<div class="tuijian-neirong">
				<img src="" class="xiaoshuotu" />
				<p>书名：</p>
				<p>作者：</p>
				<p>状态：</p>
				<img src="" class="xiaoshuotu" />
				<p>书名：</p>
				<p>作者：</p>
				<p>状态：</p>
				<img src="" class="xiaoshuotu" />
				<p>书名：</p>
				<p>作者：</p>
				<p>状态：</p>
			</div>
			<a href="shouye.jsp">更多>></a>
		</div>
	</div>
<%}     
    jdbc.closeConnection();
    %>
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