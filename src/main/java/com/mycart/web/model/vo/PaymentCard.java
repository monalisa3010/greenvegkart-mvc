package com.mycart.web.model.vo;

import java.io.Serializable;

public class PaymentCard implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cardNo;
	private String cardexp;
	private String cardcvv;
	private String nameonCard;
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardexp() {
		return cardexp;
	}
	public void setCardexp(String cardexp) {
		this.cardexp = cardexp;
	}
	public String getCardcvv() {
		return cardcvv;
	}
	public void setCardcvv(String cardcvv) {
		this.cardcvv = cardcvv;
	}
	
	public String getNameonCard() {
		return nameonCard;
	}
	public void setNameonCard(String nameonCard) {
		this.nameonCard = nameonCard;
	}
	public PaymentCard() {
		super();
	}
	
	
	
	

}
