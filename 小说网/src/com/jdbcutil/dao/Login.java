package com.jdbcutil.dao;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

public class Login {
	
    private Statement st;
	private ResultSet rs;
	
	public ResultSet login(String Uphone,String Upassword,Connection Conn){
		try {
		st = Conn.createStatement();
		String queryNumberSQL="select * from user where uphone='"+Uphone+"' and upassword='"+Upassword+"'";
		rs=st.executeQuery(queryNumberSQL);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
