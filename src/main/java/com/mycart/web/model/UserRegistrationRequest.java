package com.mycart.web.model;

import java.io.Serializable;

public class UserRegistrationRequest implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDetails userDetails;
	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	public UserRegistrationRequest() {
		super();
	}

	public UserRegistrationRequest(UserDetails userDetails, String password) {
		super();
		this.userDetails = userDetails;
		this.password = password;
	}

	@Override
	public String toString() {
		return "UserRegistrationRequest [userDetails=" + userDetails + ", password=" + password + "]";
	}

}
