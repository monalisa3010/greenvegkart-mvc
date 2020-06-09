package com.mycart.web.model.vo;

public class CheckoutItem {

	private int id;
	private String name;
	private String summary;
	private double price;
	private int quantity;
	private String image;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public CheckoutItem(int id, String name, String summary, double price, int quantity, String image) {
		super();
		this.id = id;
		this.name = name;
		this.summary = summary;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
	}

	public CheckoutItem() {
		super();
	}

	@Override
	public String toString() {
		return "CheckoutItems [id=" + id + ", name=" + name + ", summary=" + summary + ", price=" + price
				+ ", quantity=" + quantity + ", image=" + image + "]";
	}

}
