<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String a2=request.getParameter("uname");
    String b2=request.getParameter("upassword");
%>

    <%
    PreparedStatement pst=null;
    PreparedStatement tmt=null;
    ResultSet rs=null;
    int rst=0;
    String url = "jdbc:mysql://localhost:3306/rw";
    String userName="root";
    String password="123456";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection(url,userName,password);
    pst = conn.prepareStatement("select * from user where uname='"+a2+"'");
    rs=pst.executeQuery();
    if (rs.next()){
    	tmt = conn.prepareStatement("update user set upassword='" + b2 + "'where uname='"+a2+"'");
    	rst = tmt.executeUpdate();
    	if (rst != 0){
            out.println("<script language='javascript'>alert('密码修改成功！');window.location.href='login.jsp';</script>");
        }
    	else{
            out.println("<script language='javascript'>alert('密码修改失败！');window.location.href='findpassword2.jsp';</script>");
        }
    }
    else{
    	out.println("<script language='javascript'>alert('用户名不存在，请重新输入！');window.location.href='findpassword2.jsp';</script>");
    }
    rs.close();
    conn.close();
%>
</body>
</html>