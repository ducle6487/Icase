package edu.hutech.Icase.Model;

public class PhoneBrand {
	private int idphonebrand;
	private String name;
	
	public PhoneBrand() {
		
	}
	public PhoneBrand(int a,String b) {
		this.idphonebrand = a;
		this.name = b;
	}

	@Override
	public String toString() {
		return "PhoneBrand [idphonebrand=" + idphonebrand + ", name=" + name + "]";
	}
	public int getIdphonebrand() {
		return idphonebrand;
	}
	public void setIdphonebrand(int idphonebrand) {
		this.idphonebrand = idphonebrand;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
