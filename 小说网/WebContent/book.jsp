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
    <link rel="stylesheet" href="css/dixian.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>小说</title>
    <script language="JavaScript">
        function add(){
	        var x=document.getElementById("num").innerHTML;
            x=parseInt(x)+1;
            document.getElementById("num").innerHTML=x;
        }
        function check(){
	        alert("申请成功！请稍后。。。");
	    return true;
        }
        function prom(){
	        var flag=true;
	        var a=document.getElementById("re-drop");
	        if(flag){
		    a.style.display="block";
		    flag=false;
	        }
        }
        function sumb(){
	        var text=document.getElementById("com-text").value;
	        if(text==""||text==null){
		        alert("请输入评论内容！");
		    return false;
	        }
	        else{
	            alert("提交成功！");
	            return true;
	        }
        }
	</script>
</head>

<body>
<%
    Statement st=null;
    ResultSet rs=null;

        
    Connection conn=null;
    Jdbc jdbc=new Jdbc();
    conn=jdbc.getConnection();
    st=conn.createStatement();

    
        
%>
    <div class="row">
		<div class="col-md-4">
			<h2>&nbsp&nbsp飞阅续书小说网</h2>
		</div>
		<div class="col-md-5">
			<div class="sousuolan">
				<form action="do_susuo.jsp" method="post" name="biaodan" autocomplete="on">
					<input type="radio" name="zhonglei" checked="checked">书名
					<input type="radio" name="zhonglei">作者&nbsp
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
						<a href="shoucang.jsp">收藏夹</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="navcol">
			<ul>
				<li>
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
		<div class="book">
			<div class="book-main">
			    <%  
			        String Booknumber=request.getParameter("bbk");
			        String SQL="select * from book where booknumber = '"+Booknumber+"'";
			        //String SQL="select * from book where booknumber = 6";
			        rs=st.executeQuery(SQL);
			        if(rs.next()){
			    %>
				<div class="crumb">
			                     当前位置:
			        <a href="shouye.jsp">首页</a>
			        >
			        <a href=""><%=rs.getString("bookstyle") %></a>
			        >
			        <a href="chapters.jsp"><%=rs.getString("bookname") %></a>
		        </div>
				<div class="book-detail">
					<div class="book-img">
					<% 			
					    String imgName=rs.getString("picture");
					%>
						<img width="200" height="264" alt="" src="<%=imgName%>">

					</div>
					<div class="book-info">
						<div class="book-name">
							<h2><%=rs.getString("bookname") %></h2>
							<em class="sign"></em>
							<em class="vip"></em>
						</div>
						<div class="book-label">
							<a class="state" href=""><%=rs.getString("bookstate") %></a>
							<a class="classify" href=""><%=rs.getString("bookstyle") %></a>
							<span>
							<a href="">热血</a>
							<a href="">搞笑</a>
							<a href="">重生</a>
						</span>
						</div>
						<div class="nums">
							<span>
					    		字数
					    		<i><%=rs.getString("bookword") %></i>
					    	</span>
							<span>
					    		总推荐
					    		<i>40万</i>
					    	</span>
							<span>
					    		总点击
					    		<i>400万</i>
					    	</span>
						</div>
						<div class="book-dec">
							<p><%=rs.getString("bookintroduce") %>
							......
							</p>
						</div>
						<div class="book-btn">
						    
							<a class="read-btn" href="chapter.jsp?Booknumber=<%=Booknumber%>&zzz=1">开始阅读</a>
							<a class="like-btn" href="">加入收藏</a>
							<a href="http://127.0.0.1:8000/Booknumber=<%=Booknumber%>"><button class="write-btn" onclick="check()">申请续写</button></a>
							<div class="group-btn">
								<a class="all-catalog" href="catalog.jsp">全部目录</a>
								<span>|</span>
								<a class="vote" href="">投荐票</a>
							</div>
						</div>
					</div>
				</div>
				<%} %>
				<div class="book-new">
					<div class="tit">
					<h4>最新章节</h4>
					<%  
					   
					    String SQL2="select * from resource where booknumber = '"+Booknumber+"' AND zhangjie = (select MAX(zhangjie) from resource where booknumber = '"+Booknumber+"')";
			            rs=st.executeQuery(SQL2);
			            if(rs.next()){
					%>
					<a href="">
					<%=rs.getString("zj") %>
					<%=rs.getString("zjname") %>
					</a>
					</div>
					<div class="con">
				     <%=rs.getString("zjintroduce") %>......
					<%} %>
					</div>
				</div>
			</div>
			<div class="book-side">
				<div class="book-author">
					<img  />
					<%
					    String SQL3="select * from authors where author = (select author from book where booknumber = '"+Booknumber+"')";
					    rs=st.executeQuery(SQL3);
					    if(rs.next()){
					%>
					<em>
					<%=rs.getString("authorstate") %>
					</em>
				</div>
				<div class="au-name">
				    <a href="">
				    <%=rs.getString("author") %>
				    </a>
			    </div>
			    <div class="au-words">
			    	<span>作品数
			    	<%
			    	    String Author=rs.getString("author");
			    	    %>
			    	    <%} %>
			    	    <% 
			    	    String SQL4="select COUNT(booknumber) as num from book where  author = (select author from book where booknumber = '"+Booknumber+"')";
			    	    rs=st.executeQuery(SQL4);
			    	    if(rs.next()){	    	   			    	    
			    	%>
			    		<i><%=rs.getInt("num") %></i>
			    		<%} %>
			    	</span>
			    	<span>最新
			    		<i>1234</i>
			    	</span>
			    </div>
			    <div class="au-new">
			        <%
			            String SQL5="select jianjie  from authors where  author = (select author from book where booknumber = '"+Booknumber+"')";
			            rs=st.executeQuery(SQL5);
			            if(rs.next()){
			        %>
			    	<p><%=rs.getString("jianjie") %></p>
			    	<%} %>
			    </div>
			    <div class="au-says">
			    	<h4>作者有话说：</h4>
			    	<p>作者大大正奋力码字哦~~~</p>
			    </div>
			    <div class="au-book">
			    	<h4>最近更新：</h4>
			    	<%
			    	    String SQL6="select * from book where  author = (select author from book where booknumber = '"+Booknumber+"')";
		                rs=st.executeQuery(SQL6);
		               if(rs.next()){
			    	%>
			    	<a href="">
			    	<%=rs.getString("bookname") %>
			    	</a><br>
			    	<%} %>
			    </div>
			</div>
		 </div>
		 <div class="book-cha">
		      <div class="selectline"></div>
				    <div class="tit1">
					<h4>续写章节</h4>
					<%  
					    String SQL7="select * from xbook where xbooknumber = '"+Booknumber+"' AND xid = (select MAX(xid) from xbook where xbooknumber = '"+Booknumber+"')";
			            rs=st.executeQuery(SQL7);
			            if(rs.next()){
					%>
					<a href="xchapter.jsp?Booknumber=<%=Booknumber%>">
					   <%=rs.getString("xbookauther") %>-续写
					   <%=rs.getString("xname") %>
					   
					</a>
					</div>
					<div class="con1">
				         <%=rs.getString("xintroduce") %>......
					</div>
					<%}else{ %>
					<a>无</a>
				</div>
				<%} %>
		</div>
		<div class="clearfix"></div>
		<div class="book-comment">
			<div class="com-book">
			<div class="com-top">
			<span>小说评论</span>
			<button type="button" onclick="prom()">发布评论</button>
			</div>
			<div class="book-line"></div>
			<div class="reader">
				<div class="head"></div>
				<div class="re-name">
					<h4>书友12138</h4>
					<p>好看！大爱！</p>
					<span>发布时间:
						<i>2019-04-15</i>
					</span>
					<div class="com-btn">
						<button type="button" onclick="add()">点赞(<span id="num">0</span>)</button>
						<span>|</span>
						<button type="button">回复(0)</button>
				    </div>
				</div>
			</div>
			<div class="re-drop" id="re-drop">
				<form action="book.jsp" method="post" autocomplete="on" name="sumbit comment">
                <textarea class="com-text" id="com-text"></textarea><br></br>
				<button type="submit" class="com-sumb" onclick="sumb()">确认提交</button>
				</form>
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