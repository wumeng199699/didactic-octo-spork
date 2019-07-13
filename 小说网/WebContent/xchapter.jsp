<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="css/dixian.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<meta charset="UTF-8">
<title>章节</title>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jdbcutil.dao.*" %>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<script language="JavaScript">
			window.onload=function(){
				var words=document.getElementById("content");
				var small=document.getElementById("small");
				var middle=document.getElementById("middle");
				var big=document.getElementById("big");
				var size=18;
				small.onclick=function(){
					size=14
					words.style.fontSize=size+'px';
				}
				middle.onclick=function(){
					size=18
					words.style.fontSize=size+'px';
				}
				big.onclick=function(){
					size=22
					words.style.fontSize=size+'px';
				}
			}
		</script>
<style type="text/css">
       #content{
           white-space: pre-wrap;       /* css-3 */
		   white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
		   white-space: -o-pre-wrap;    /* Opera 7 */
		   word-wrap: break-word;       /* Internet Explorer 5.5+ */
		   word-break:break-all;
           
           overflow:hidden;
		   background-color: #c1e2b3;
		   border:1px solid #c1e2b3;
		   font-size: 18px;
		   font-family: "微软雅黑";
           
       }
</style>
</head>
<body>
<%
    String Bbb=request.getParameter("Booknumber");
   
    Statement st=null;
    ResultSet rs=null;
    Connection conn=null;
    Jdbc jdbc=new Jdbc();
    conn=jdbc.getConnection();
    st = conn.createStatement();
    
    
%>
<div class="row" style="margin:0;width:100%;">
			<div class="col-md-5">
				<div class="row-tit">
				<h2>飞阅续书小说网</h2>
				</div>
				<div class="row-ind">
				<ul>
				    <li><a href="shouye.jsp">首页</a></li>
				    <li class="dropdown">
				    	<a class="droptn" href="">分类</a>
				    	<div class="dropdown-content">
				    	<a href="">玄幻奇幻</a>
				    	<a href="">言情小说</a>
				    	<a href="">恐怖灵异</a>
				    	<a href="">悬疑推理</a>
				    	<a href="">游戏同人</a>
				    	<a href="">科幻魔幻</a>
				    	<a href="">历史军事</a>
				    	</div>
				    </li>
				    <li><a href="bookstore.jsp">书库</a></li>
				    <li><a href="read.jsp">阅读专区</a></li>
				    <li><a href="write.jsp">续写专区</a></li>
				</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="sousuolan">
				<form action="do_sousuo.jsp"method="post"name="biaodan"autocomplete="on">
				    <input type="radio" name="zhonglei" checked="checked">书名
				    <input type="radio" name="zhonglei">作者&nbsp
					<input class="sousuo" type="search" name="sousuo"placeholder="请输入要搜索的内容" style="width: 60%;"/>
			        <button class="button" type="submit" value="搜索">搜索</button>
				</form>
				</div>
			</div>
			<div class="col-md-3">
				<ul>
				    <li><a href="about.jsp">关于</a></li>
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
				    <li><a href="shoucang.jsp">收藏夹</a></li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="read">
			<div class="read-box">
			<div class="crumb">
					当前位置：
					<a href="shouye.jsp">首页</a>
					>
					<%
					    String SQL="select * from book where  booknumber = '"+Bbb+"'";
					    rs=st.executeQuery(SQL);
					    if(rs.next()){
					%>
					<a href=""><%=rs.getString("bookstyle") %></a>
					>
					<a href="book.html"><%=rs.getString("bookname") %></a>
					<%} %>
					>续写
			</div>
			
			<div class="title">
				   <div class="words">
						字体大小：
						<button class="small" id="small" name="words">小</button>
						<button class="middle" id="middle" name="words">中</button>
						<button class="big" id="big" name="words">大</button>
					</div>
					<%String queryNumberSQL="select * from xbook where  xbooknumber = '"+Bbb+"'AND xid = (select MAX(xid) from xbook where xbooknumber = '"+Bbb+"')";
				    rs=st.executeQuery(queryNumberSQL);
				    if(rs.next()){ %>
					<h2><%=rs.getString("xname")%></h2>
					
			</div>
				<div class="bookinfo">
					作者：
					<a href=""><%=rs.getString("xbookauther") %></a>
					<%} %>
				</div>
				<div class="read-line"></div>
				<div class="content">
				  <pre id="content">
				  <% 
				      String SQL1="select * from xbook where  xbooknumber = '"+Bbb+"'AND xid = (select MAX(xid) from xbook where xbooknumber = '"+Bbb+"')";
                      rs=st.executeQuery(SQL1);
                      if(rs.next()){
    	          %>
				  <%=rs.getString("xbooktext") %>
			       <%} %>
				  </pre>
			    </div>
			    <div class="like">
			    	<a class="like-btn" href="">加入收藏</a>
			    </div>
			    <div class="clearfix"></div>
			    <div class="chap-btn">
			    	<a href="javascript:" onclick="self.location=document.referrer;">目录</a>
			    	<a href="chapter.jsp?Booknumber=<%=Bbb %>&zzz=<%//=b %>">上一章</a>
			    	<%
			    	    //a=a+1;
			    	%>
			    	<a class="nextchap" href="chapter.jsp?Booknumber=<%//=Bbb %>&zzz=<%//=a %>">下一章</a>
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