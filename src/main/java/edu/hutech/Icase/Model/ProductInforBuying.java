package edu.hutech.Icase.Model;

public class ProductInforBuying {
	public int idProduct;
	public int amount;
	public String color;
	public String  phone;
	public int getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getColor() {
		return color;
	}
	@Override
	public String toString() {
		return "ProductInforBuying [idProduct=" + idProduct + ", amount=" + amount + ", color=" + color + ", phone="
				+ phone + "]";
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

}
