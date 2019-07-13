<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>试一试显示图片</title>
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
</head>
<body>
<%
    Statement st=null;
    ResultSet rs=null;
    Connection conn=null;
    Jdbc jdbc=new Jdbc();
    conn=jdbc.getConnection();
    st = conn.createStatement();
    String queryNumberSQL="select * from book where booknumber=1";
    rs=st.executeQuery(queryNumberSQL);
    if(rs.next()){
    Blob b = rs.getBlob("picture");
    long size = b.length();
    byte[] bs = b.getBytes(1, (int)size);
    //response.setContentType("image/jpeg"); 
    OutputStream outs = response.getOutputStream(); 
%>
<% outs.write(bs);%>
<% outs.flush();%>
<% }%> 
</body>
</html>