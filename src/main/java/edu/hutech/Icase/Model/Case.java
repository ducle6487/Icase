package edu.hutech.Icase.Model;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Case {
	@Override
	public String toString() {
		return "Case [idproduct=" + idproduct + ", name=" + name + ", idphonebrand=" + idphonebrand + ", price=" + price
				+ ", description=" + description + ", amount=" + amount + ", casebrand=" + casebrand + ", sold=" + sold
				+ ",Images=" + image + ",sl=" + sl + "]";
	}

	public Case() {

	}

	public Case(int a, String b, int c, int d, String e, int f, String g, int h) {
		this.idproduct = a;
		this.name = b;
		this.idphonebrand = c;
		this.price = d;
		this.description = e;
		this.amount = f;
		this.casebrand = g;
		this.sold = h;

	}

	private int idproduct;
	private String name;
	private int idphonebrand;
	private int price;
	private int sl;

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	private String description;
	private int amount;
	private String casebrand;
	private int sold;
	public List<Image> image;

	public List<Image> getImage() {
		return image;
	}

	public void setImage(List<Image> image) {
		this.image = image;
	}

	public int getIdproduct() {
		return idproduct;
	}

	public void setIdproduct(int idproduct) {
		this.idproduct = idproduct;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIdphonebrand() {
		return idphonebrand;
	}

	public void setIdphonebrand(int idphonebrand) {
		this.idphonebrand = idphonebrand;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCasebrand() {
		return casebrand;
	}

	public void setCasebrand(String casebrand) {
		this.casebrand = casebrand;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}
}
