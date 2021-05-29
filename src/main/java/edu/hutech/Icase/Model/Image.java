package edu.hutech.Icase.Model;

public class Image {
	public Image() {
		
	}
	public Image(int a,String b,int c) {
		
	}
	private int idimage;
	private String name;
	private int idproduct;
	public int getIdimage() {
		return idimage;
	}
	public void setIdimage(int idimage) {
		this.idimage = idimage;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIdProduct() {
		return idproduct;
	}
	public void setIdProduct(int product) {
		this.idproduct = product;
	}
	@Override
	public String toString() {
		return "Image [idimage=" + idimage + ", name=" + name + ", idproduct=" + idproduct + "]";
	}
}
