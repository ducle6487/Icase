package edu.hutech.Icase.Model;

public class OrderHistoryModel {

    public int idorder;
    public String namecustomer;
    public String phone;
    public String address;
    public String dateorder;
    public String message;
    public String methodpayment;
    public String paymentstatus;
    public String deliverystatus;

    public int getIdorder() {
        return this.idorder;
    }

    public void setIdorder(int idorder) {
        this.idorder = idorder;
    }

    public String getNamecustomer() {
        return this.namecustomer;
    }

    public void setNamecustomer(String namecustomer) {
        this.namecustomer = namecustomer;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDateorder() {
        return this.dateorder;
    }

    public void setDateorder(String dateorder) {
        this.dateorder = dateorder;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMethodpayment() {
        return this.methodpayment;
    }

    public void setMethodpayment(String methodpayment) {
        this.methodpayment = methodpayment;
    }

    public String getPaymentstatus() {
        return this.paymentstatus;
    }

    public void setPaymentstatus(String paymentstatus) {
        this.paymentstatus = paymentstatus;
    }

    public String getDeliverystatus() {
        return this.deliverystatus;
    }

    public void setDeliverystatus(String deliverystatus) {
        this.deliverystatus = deliverystatus;
    }

}
