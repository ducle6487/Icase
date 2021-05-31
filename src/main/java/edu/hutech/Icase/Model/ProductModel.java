package edu.hutech.Icase.Model;

public class ProductModel {
	@Override
	public String toString() {
		return "ProductModel [idProduct=" + idProduct + ", name=" + name + ", idPhoneBrand=" + idPhoneBrand + ", price="
				+ price + ", description=" + description + ", amount=" + amount + ", caseBrand=" + caseBrand + ", sold="
				+ sold + ", dateAdded=" + dateAdded + "]";
	}

	public int idProduct;
	public String name;
	public int idPhoneBrand;
	public long price;
	public String description;
	public int amount;
	public String caseBrand;
	public int sold;
	public String dateAdded;

	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIdPhoneBrand() {
		return idPhoneBrand;
	}

	public void setIdPhoneBrand(int idPhoneBrand) {
		this.idPhoneBrand = idPhoneBrand;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
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

	public String getCaseBrand() {
		return caseBrand;
	}

	public void setCaseBrand(String caseBrand) {
		this.caseBrand = caseBrand;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public String getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(String dateAdded) {
		this.dateAdded = dateAdded;
	}
}
