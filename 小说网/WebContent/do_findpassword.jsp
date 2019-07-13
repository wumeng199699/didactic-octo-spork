<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.jdbcutil.dao.*" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF8">
<title>实现找回密码</title>
</head>

<body>
<%
    Statement st=null;
    ResultSet rs=null;
    Connection conn=null;
    
    String Uname=request.getParameter("uname");
    String Uphone=request.getParameter("uphone");
    
    Jdbc jdbc=new Jdbc();
    conn=jdbc.getConnection();
    
    st = conn.createStatement();
    rs=st.executeQuery("select * from user where uname='"+Uname+"' and uphone= '"+Uphone+"'");
    
    if(rs.next()){
    	out.println("<script language='javascript'>window.location.href='findpassword2.jsp';</script>");
    }
    else{
    	out.println("<script language='javascript'>alert('用户名或手机号不存在！');window.location.href='zhuce.jsp';</script>");
    }
    rs.close();
    st.close();
    conn.close();
 %>
</body>
</html>