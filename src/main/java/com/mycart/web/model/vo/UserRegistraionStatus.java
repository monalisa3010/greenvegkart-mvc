package com.mycart.web.model.vo;

import java.io.Serializable;

public class UserRegistraionStatus implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String message;
	
	private boolean success;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public UserRegistraionStatus(String message, boolean success) {
		super();
		this.message = message;
		this.success = success;
	}

	public UserRegistraionStatus() {
		super();
	}
	
	

}
