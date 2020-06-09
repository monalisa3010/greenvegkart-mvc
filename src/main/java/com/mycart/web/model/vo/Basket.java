package com.mycart.web.model.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Basket implements Serializable{

	List<CheckoutItem> checkOutItems = new ArrayList<>();
	private BigDecimal totalPrice;
	private int totalQuantity;

	public Basket() {
		super();
	}

	public Basket(List<CheckoutItem> checkOutItems, BigDecimal totalPrice, int totalQuantity) {
		super();
		this.checkOutItems = checkOutItems;
		this.totalPrice = totalPrice;
		this.totalQuantity = totalQuantity;
	}

	public List<CheckoutItem> getCheckOutItems() {
		return checkOutItems;
	}

	public void setCheckOutItems(List<CheckoutItem> checkOutItems) {
		this.checkOutItems = checkOutItems;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

}
