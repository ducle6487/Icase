package edu.hutech.Icase.Model;

import org.springframework.stereotype.Component;

@Component
public class Device {
	private int idproduct;
	private String phone;
	
	public Device() {
		
	}
	public Device(int a,String b) {
		this.idproduct = a;
		this.phone = b;
	}
	@Override
	public String toString() {
		return "Device [idproduct=" + idproduct + ", phone=" + phone + "]";
	}
	public int getIdproduct() {
		return idproduct;
	}
	public void setIdproduct(int idproduct) {
		this.idproduct = idproduct;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
