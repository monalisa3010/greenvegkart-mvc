package com.mycart.web.model.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CreateOrderRequest implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int customerId;
	private int deliveryAddressId;
	private String paymentType;
	private BigDecimal totalAmount;
	List<OrderItem> orderItems = new ArrayList<OrderItem>();

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getDeliveryAddressId() {
		return deliveryAddressId;
	}

	public void setDeliveryAddressId(int deliveryAddressId) {
		this.deliveryAddressId = deliveryAddressId;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public CreateOrderRequest(int customerId, int deliveryAddressId, String paymentType, BigDecimal totalAmount,
			List<OrderItem> orderItems) {
		super();
		this.customerId = customerId;
		this.deliveryAddressId = deliveryAddressId;
		this.paymentType = paymentType;
		this.totalAmount = totalAmount;
		this.orderItems = orderItems;
	}

	public CreateOrderRequest() {
		super();
	}

	@Override
	public String toString() {
		return "CreateOrderRequest [customerId=" + customerId + ", deliveryAddressId=" + deliveryAddressId
				+ ", paymentType=" + paymentType + ", totalAmount=" + totalAmount + ", orderItems=" + orderItems + "]";
	}

}
