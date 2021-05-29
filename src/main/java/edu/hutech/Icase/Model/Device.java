package edu.hutech.Icase.Model;

import org.springframework.stereotype.Component;

@Component
public class Device {
	private int idproduct;
	private int idphone;
	
	public Device() {
		
	}
	public Device(int a,int b) {
		this.idproduct = a;
		this.idphone = b;
	}
	public int getIdphone() {
		return idphone;
	}
	public void setIdphone(int idphone) {
		this.idphone = idphone;
	}
	@Override
	public String toString() {
		return "Device [idproduct=" + idproduct + ", phone=" + idphone + "]";
	}
	public int getIdproduct() {
		return idproduct;
	}
	public void setIdproduct(int idproduct) {
		this.idproduct = idproduct;
	}
	
}
