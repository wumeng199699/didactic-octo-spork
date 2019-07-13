package com.jdbcutil.bean;

public class User {
	private String uphone;
	private String upassword;
	private String uname;

	public User(String uphone, String upassword, String uname) {
		this.uphone = uphone;
		this.upassword = upassword;
		this.uname = uname;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUpassword() {
		return upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}
}
