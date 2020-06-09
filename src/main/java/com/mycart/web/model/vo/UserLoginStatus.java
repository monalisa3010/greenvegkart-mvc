package com.mycart.web.model.vo;

import java.io.Serializable;

public class UserLoginStatus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private boolean success;
	private String message;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public UserLoginStatus() {
		super();
	}

	@Override
	public String toString() {
		return "UserLoginStatus [success=" + success + ", message=" + message + "]";
	}

	public UserLoginStatus(boolean success, String message) {
		super();
		this.success = success;
		this.message = message;
	}

}
