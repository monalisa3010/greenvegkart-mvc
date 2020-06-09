package com.mycart.web.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.mycart.web.model.UserAddress;

public class UpdateAddressRequest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int userId;
	private List<UserAddress> userAddressList = new ArrayList<UserAddress>();

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public List<UserAddress> getUserAddressList() {
		return userAddressList;
	}

	public void setUserAddressList(List<UserAddress> userAddressList) {
		this.userAddressList = userAddressList;
	}

	public UpdateAddressRequest(int userId, List<UserAddress> userAddressList) {
		super();
		this.userId = userId;
		this.userAddressList = userAddressList;
	}

	public UpdateAddressRequest() {
		super();
	}

}
