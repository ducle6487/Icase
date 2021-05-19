package edu.hutech.Icase.Model;


public class AdminProductModel {
    

    public int idProduct;
    public String nameProduct;
    public int idBrandPhone;
    public Long price;
    public String description;
    public int amount;
    public String caseBrand;
    public int sold;
    public String dateAdded;


    public int getIdProduct() {
        return this.idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return this.nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getIdBrandPhone() {
        return this.idBrandPhone;
    }

    public void setIdBrandPhone(int idBrandPhone) {
        this.idBrandPhone = idBrandPhone;
    }

    public Long getPrice() {
        return this.price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAmount() {
        return this.amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getCaseBrand() {
        return this.caseBrand;
    }

    public void setCaseBrand(String caseBrand) {
        this.caseBrand = caseBrand;
    }

    public int getSold() {
        return this.sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getDateAdded() {
        return this.dateAdded;
    }

    public void setDateAdded(String dateAdded) {
        this.dateAdded = dateAdded;
    }



}
