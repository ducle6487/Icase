package edu.hutech.Icase.Model;

public class Phone {
	private int idphone;
	private String namephone;
	private int brand;
	
	public Phone() {
		
	}
	
	public Phone(int a,String b,int c) {
		this.idphone = a;
		this.namephone = b;
		this.brand = c;
	}
	
	public int getIdphone() {
		return idphone;
	}
	@Override
	public String toString() {
		return "Phone [idphone=" + idphone + ", namephone=" + namephone + ", brand=" + brand + "]";
	}
	public void setIdphone(int idphone) {
		this.idphone = idphone;
	}
	public String getNamephone() {
		return namephone;
	}
	public void setNamephone(String namephone) {
		this.namephone = namephone;
	}
	public int getBrand() {
		return brand;
	}
	public void setBrand(int brand) {
		this.brand = brand;
	}
}
