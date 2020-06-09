package com.mycart.web.model.vo;

import java.io.Serializable;

public class LoginRequest implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String toString() {
		return "LoginRequest [username=" + username + ", password=" + password + "]";
	}

	private String username;
	private String password;

	public LoginRequest() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public LoginRequest(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

}
