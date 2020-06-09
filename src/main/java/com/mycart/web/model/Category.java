package com.mycart.web.model;

import java.io.Serializable;

public class Category implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + "]";
	}

	private int id;
	private String name;

	public Category() {
		super();
	}

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

	public Category(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	@Override
	public int hashCode() {
		return this.id + 100;
	}

	@Override
	public boolean equals(Object obj) {
		return this.id == ((Category) obj).getId();
	}

}
