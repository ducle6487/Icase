package edu.hutech.Icase.Model;

public class ProductValueModel {
    public int idproduct;
    public String name;
    public String phonebrand;
    public String device;
    public String color;
    public int amount;
    public Long price;

    public int getIdproduct() {
        return this.idproduct;
    }

    public void setIdproduct(int idproduct) {
        this.idproduct = idproduct;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhonebrand() {
        return this.phonebrand;
    }

    public void setPhonebrand(String phonebrand) {
        this.phonebrand = phonebrand;
    }

    public String getDevice() {
        return this.device;
    }

    public void setDevice(String device) {
        this.device = device;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getAmount() {
        return this.amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Long getPrice() {
        return this.price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getBrand() {
        return this.brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String brand;
    public String description;
}
