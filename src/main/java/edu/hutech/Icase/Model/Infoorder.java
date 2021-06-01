package edu.hutech.Icase.Model;

public class Infoorder {
	private int IdOrder;
	private int IdProduct;
	private int Amount;
	private int ToTal;
	private String color;
	private int Phone;
	public int getIdOrder() {
		return IdOrder;
	}
	public void setIdOrder(int idOrder) {
		IdOrder = idOrder;
	}
	public int getIdProduct() {
		return IdProduct;
	}
	public void setIdProduct(int idProduct) {
		IdProduct = idProduct;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public int getToTal() {
		return ToTal;
	}
	public void setToTal(int toTal) {
		ToTal = toTal;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getPhone() {
		return Phone;
	}
	public void setPhone(int phone) {
		Phone = phone;
	}

}
