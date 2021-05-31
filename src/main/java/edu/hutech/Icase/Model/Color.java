package edu.hutech.Icase.Model;

public class Color {
	private int idproduct;
	private String color;
	public int getIdproduct() {
		return idproduct;
	}
	public void setIdproduct(int idproduct) {
		this.idproduct = idproduct;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "Color [idproduct=" + idproduct + ", color=" + color + "]";
	}
	
}
