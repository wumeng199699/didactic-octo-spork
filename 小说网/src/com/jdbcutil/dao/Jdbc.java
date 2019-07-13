package com.jdbcutil.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Jdbc {

	private Connection conn;
	
	private Statement st;
	
	private ResultSet rs;
	
	/**
	 * �������ݿ�
	 */
	public  Connection getConnection(){
		String url = "jdbc:mysql://rm-bp1vy9a80af682440lo.mysql.rds.aliyuncs.com:3306/feishu?useUnicode=true&amp;characterEncoding=utf8";
		String username = "root";
		String password = "feiyuexushu1!";
		try {
			//1.ע�����ݿ�����
			//com.mysql.cj.jdbc.Driver
			Class.forName("com.mysql.jdbc.Driver");
			conn=null;
			//2.ͨ��DriverManager��ȡ���ݿ�����
			conn = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("����ע������");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getConnection()����");
		}
		return conn;
	}
	
	/**
	 * ���ݿ�ر�����
	 */
	public void closeConnection(){
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(st!=null){
				st.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(conn!=null){
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}