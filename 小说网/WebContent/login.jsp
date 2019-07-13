<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <link rel="stylesheet" href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>登录</title>
    <style type="text/css">
        @import url("css/bootstrap.css");
    </style>
    <script>
        function check() {
            var a = document.getElementById("uphone").value;
            var b = document.getElementById("upassword").value;
            if(a==""||a==null) {
                alert("请输入用户名");
                return false;
            }
            else if(b == "" || b == null) {
                alert("请输入密码");
                return false;
            }
            else{
                return true;
            }
        }
    </script>
</head>
<%
    String message = (String)request.getAttribute("message");
    if(message == null){
        message = "";
    }
    if (!message.trim().equals("")){
        out.println("<script language='javascript'>");
        out.println("alert('"+message+"');");
        out.println("</script>");
    }
    request.removeAttribute("message");
%>
<body>

<body background="img/45.jpg" style="background-size:cover ;"></body>
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
            <li>
                <a href=".html">收藏夹</a>
            </li>
        </ul>
    </div>
</div>
<div class="container-login">
    <div class="myform">
        <h3>登录</h3>
        <form id="form2" action="userLogin" method="post" name="denglubiaodan" autocomplete="on">
            <ul>
                <p style="text-align: left;">用户名</p>
                <li><input id="uname" type="text" name="uname">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
                <p style="text-align: left;">密码</p>
                <li><input id="upassword" type="password" name="upassword">
                    <a href="findpassword.jsp">找回密码</a></li>
            </ul>
            <div class="submit">
                <button type="submit" onclick="check()">登录</button>
                <a href="zhuce.jsp"><button type="button">注册</button></a>
            </div>
        </form>
    </div>
</div>
</body>

</html>
