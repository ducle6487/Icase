package edu.hutech.Icase.Model;

import java.sql.Date;

public class User {
	private String name;
	private int number;
	private String address;
	private String message;
	private Date DateOrder;
	private String tinhthanh;
	private String quanhuyen;
	private String phuongxa;
	public String getTinhthanh() {
		return tinhthanh;
	}
	public void setTinhthanh(String tinhthanh) {
		this.tinhthanh = tinhthanh;
	}
	public String getQuanhuyen() {
		return quanhuyen;
	}
	public void setQuanhuyen(String quanhuyen) {
		this.quanhuyen = quanhuyen;
	}
	public String getPhuongxa() {
		return phuongxa;
	}
	public void setPhuongxa(String phuongxa) {
		this.phuongxa = phuongxa;
	}
	public Date getDateOrder() {
		return DateOrder;
	}
	public void setDateOrder(Date dateOrder) {
		DateOrder = dateOrder;
	}
	public String getName() {
		return name;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", number=" + number + ", address=" + address + ", message=" + message + ",tinhthanh="+ tinhthanh+ ",quanhuyen="+quanhuyen+",phuongxa="+phuongxa+"]";
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
