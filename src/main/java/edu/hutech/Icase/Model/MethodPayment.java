package edu.hutech.Icase.Model;

public class MethodPayment {
	private int idmethod;
	private String namemethod;
	@Override
	public String toString() {
		return "MethodPayment [idmethod=" + idmethod + ", namemethod=" + namemethod + "]";
	}
	public int getIdmethod() {
		return idmethod;
	}
	public void setIdmethod(int idmethod) {
		this.idmethod = idmethod;
	}
	public String getNamemethod() {
		return namemethod;
	}
	public void setNamemethod(String namemethod) {
		this.namemethod = namemethod;
	}
}
