package com.mycart.web.model.vo;

import java.io.Serializable;

public class Payment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String type;
	private PaymentCard paymentCard;
	public Payment() {
		super();
	}
	public Payment(String type, PaymentCard paymentCard) {
		super();
		this.type = type;
		this.paymentCard = paymentCard;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public PaymentCard getPaymentCard() {
		return paymentCard;
	}
	public void setPaymentCard(PaymentCard paymentCard) {
		this.paymentCard = paymentCard;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
