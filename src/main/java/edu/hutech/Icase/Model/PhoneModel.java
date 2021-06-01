package edu.hutech.Icase.Model;

public class PhoneModel {
    public int idphone;
    public String namephone;
    public int idPhoneBrand;

    public int getIdPhoneBrand() {
		return idPhoneBrand;
	}

	public void setIdPhoneBrand(int idPhoneBrand) {
		this.idPhoneBrand = idPhoneBrand;
	}

	public int getIdphone() {
        return this.idphone;
    }

    public void setIdphone(int idphone) {
        this.idphone = idphone;
    }

    public String getNamephone() {
        return this.namephone;
    }

    public void setNamephone(String namephone) {
        this.namephone = namephone;
    }
}
