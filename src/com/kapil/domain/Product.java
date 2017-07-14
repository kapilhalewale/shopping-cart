package com.kapil.domain;

import java.math.BigDecimal;
import java.util.Date;

public class Product
{
	private int id;
	private String name;
	private BigDecimal price;
	private int quantity;
	private Date expiry;
	private boolean status;
	
	public Product(int id, BigDecimal price, int quantity, Date expiry, boolean status, String name)
	{
		this.id = id;
		this.price = price;
		this.quantity = quantity;
		this.expiry = expiry;
		this.status = status;
		this.name = name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getExpiry() {
		return expiry;
	}
	public void setExpiry(Date expiry) {
		this.expiry = expiry;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", expiry="
				+ expiry + ", status=" + status + "]";
	}
}