<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/18 0018
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<% String url = "jdbc:mysql://rm-bp1vy9a80af682440lo.mysql.rds.aliyuncs.com:3306/feishu"; //����һ��ch10�����ݿ�
    String userName="root";
    String password="lljcgqshjdjc1!";
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        out.println("������������ʱ�����쳣");
    }
    try {
        conn = null;
        conn = DriverManager.getConnection(url, userName, password);
    } catch (SQLException e) {
        out.println("�������ݿ�Ĺ����г���SQL�쳣");
    }
    if (conn == null) {
        out.println("�������ݿ�ʧ��");
    } else {
        out.println("�������ݿ�ɹ�");
        try {
            conn.close();
        } catch (SQLException
                e) {
            out.println("�ر����ݿ�����ʱ����SQL�쳣");
        }
    } %>