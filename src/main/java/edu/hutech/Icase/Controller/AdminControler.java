package edu.hutech.Icase.Controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hutech.Icase.Model.AdminModel;
import edu.hutech.Icase.Model.AdminProductModel;
import edu.hutech.Icase.Model.ProductValueModel;

@Controller
public class AdminControler {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@GetMapping("/admin/login")
	public String adminLogin() {
		return "login";
	}

	@PostMapping(path = "checkLogin")
	public String checkLogin(AdminModel admin) {

		if (admin.getUserName().equals("admin") && admin.getPassword().equals("anhducle")) {
			return "redirect:/admin/dashboard";
		} else {
			return "redirect:/admin/login";
		}

	}

	@GetMapping("/admin/dashboard")
	public String adminMainPage() {
		return "index-admin";
	}

	@GetMapping("/admin/all-product")
	public String allProduct(Model model) {

		String sql = "select * from product";

		List<AdminProductModel> list = jdbcTemplate.query(sql, new RowMapper<AdminProductModel>() {

			@Override
			public AdminProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {

				AdminProductModel product = new AdminProductModel();
				product.setIdProduct(rs.getInt("idproduct"));
				product.setNameProduct(rs.getString("name"));
				product.setIdBrandPhone(rs.getInt("idphonebrand"));
				product.setPrice(rs.getLong("price"));
				product.setDescription(rs.getString("desciption"));
				product.setAmount(rs.getInt("amount"));
				product.setCaseBrand(rs.getString("casebrand"));
				product.setSold(rs.getInt("sold"));
				product.setDateAdded(rs.getString("dateadded"));

				return product;
			}

		});

		model.addAttribute("products", list);

		return "allproduct";
	}

	@GetMapping("/admin/product-edit&id=2")
	public String editProduct(Model model) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("iPhone 6 Plus");
		list.add("iPhone 7");
		ArrayList<String> listcolor = new ArrayList<String>();
		listcolor.add("Màu đỏ");
		listcolor.add("Màu vàng");
		listcolor.add("Màu đen");
		ArrayList<String> listcolor2 = new ArrayList<String>();
		listcolor2.add("Màu đỏ");
		listcolor2.add("Màu vàng");
		model.addAttribute("brand", "Apple");
		model.addAttribute("device", list);
		model.addAttribute("colors", listcolor);
		model.addAttribute("listcolor", listcolor2);
		return "edit-product";
	}

	@GetMapping("/admin/all-order")
	public String allOrder() {
		return "allorder";
	}

	@GetMapping("/admin/product-edit")
	public String addProduct() {

		return "edit-product";
	}

	@RequestMapping(value = "/update-product")
	public String updateProduct(@ModelAttribute ProductValueModel product) {
		System.out.println(java.util.Arrays.toString(product.device.split("\\|", -1)));
		return "redirect:/admin/dashboard";
	}

}
