package edu.hutech.Icase.Model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class SoLuongList {
	List<SoLuong> soluong;

	public List<SoLuong> getSoluong() {
		return soluong;
	}

	public void setSoluong(List<SoLuong> soluong) {
		this.soluong = soluong;
	}
}
