package com.jdbcutil.dao;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

public class Search {
	private Statement st;
	private ResultSet rs;
	
    public ResultSet search(String sousuo,Connection Conn) {
    	try {
    		st=Conn.createStatement();
    		String SQL="select * from book where bookname='"+sousuo+"'";
    		String SQL2="select * from book where author='"+sousuo+"'";
    		rs=st.executeQuery(SQL);
    		if(rs.next()) {
    			rs=st.executeQuery(SQL);
    		}
    		else {
        		rs=st.executeQuery(SQL2);
    		}
    	}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return rs;
    }
}
