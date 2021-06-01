package edu.hutech.Icase.Model;

public class Phone {
	private int idphone;
	private String namephone;
	private int idphonebrand;
	
	public Phone() {
		
	}
	
	public Phone(int a,String b,int c) {
		this.idphone = a;
		this.namephone = b;
		this.idphonebrand = c;
	}
	
	public int getIdphone() {
		return idphone;
	}
	@Override
	public String toString() {
		return "Phone [idphone=" + idphone + ", namephone=" + namephone + ", brand=" + idphonebrand + "]";
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

	public int getIdphonebrand() {
		return idphonebrand;
	}

	public void setIdphonebrand(int idphonebrand) {
		this.idphonebrand = idphonebrand;
	}

}
