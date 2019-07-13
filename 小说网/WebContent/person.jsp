<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jdbcutil.dao.*" %>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet" href="css/person.css" rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet" href="css/dixian.css" rel="stylesheet" type="text/css" media="all" />
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
						<a href="shouye.jsp">首页</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="person-img">
			<div class="navcol">
				<ul>
					<li class"person_b">
						<b class="person">个人中心</b>
					</li>
					<li class="navhover" style="background-color: #C1E2B3; border:1px solid darkslategray;">
						<a href="person.jsp">我的书架</a>
					</li>
					<li >
						<a href="gerenziliao.jsp">个人资料</a>
					</li>
					<li >
						<a href="gerenziliao.jsp">关于</a>
					</li>
				</ul>
			</div>
			<div class="shujia">
				<button type="button" class="btn btn-primary">全部</button>
				<a type="button" class="btn btn-default" href="yuedushujia.jsp">读书</a>
				<a type="button" class="btn btn-default" href="xuxieshujia.jsp">续写</a>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>书名</th>
							<th>作者</th>
							<th>类别</th>
							<th>状态</th>
							<th>最新章节</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						    <%
					            Statement st=null;
					            ResultSet rs=null;
					            

					        
					            Connection conn=null;
					            Jdbc jdbc=new Jdbc();
					            conn=jdbc.getConnection();
					            st=conn.createStatement();
					           
					            
					            String SQL="select * from xbook where xbookauther = '阿凡达'";
					            rs=st.executeQuery(SQL);
					            
					            
					            while(rs.next()){
					        
					         
					       %>
							<td>#</td>
							<td>
							    <%
							        String a=rs.getString("xbooknumber");
							        int b=Integer.parseInt(a);
							        if(b==2){
							    %>
							    十宗罪6
							    <%
							        }
							        if(b==5){
							    %>
							    浮生物语
							    <%} %>
							</td>
							<td><%=rs.getString("xbookauther") %></td>
							<td>
							    <%
							        if(b==2){
							    %>
							    悬疑推理
							    <%
							        }
							        if(b==5){
							    %>
							    古代言情
							    <%} %>
							</td>
							<td>未完结</td>
							<td><%=rs.getString("xname") %></td>
						</tr>
						<%} %>
					</tbody>
				</table>
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