package com.mycart.web.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class OrderRequest implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	List<CheckoutItem> orderItems = new ArrayList<>();
	private Payment payment;
	private int addressid;
	public List<CheckoutItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<CheckoutItem> orderItems) {
		this.orderItems = orderItems;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public int getAddressid() {
		return addressid;
	}
	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public OrderRequest() {
		super();
	}
	public OrderRequest(List<CheckoutItem> orderItems, Payment payment, int addressid) {
		super();
		this.orderItems = orderItems;
		this.payment = payment;
		this.addressid = addressid;
	}

}
