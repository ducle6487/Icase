package edu.hutech.Icase.Controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import edu.hutech.Icase.Model.AdminModel;
import edu.hutech.Icase.Model.AdminProductModel;

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

	@GetMapping("/admin/all-order")
	public String allOrder() {
		return "allorder";
	}

	@GetMapping("/admin/add-product")
	public String addProduct() {
		return "index-admin";
	}

}
