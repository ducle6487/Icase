package edu.hutech.Icase.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import edu.hutech.Icase.Model.Case;
import edu.hutech.Icase.Model.Device;
import edu.hutech.Icase.Model.GioHang;
import edu.hutech.Icase.Model.Image;
import edu.hutech.Icase.Model.Phone;
import edu.hutech.Icase.Model.PhoneBrand;
import edu.hutech.Icase.Model.User;

@Controller
public class HomeController {

	public List<Case> products = new ArrayList<Case>();

	@Autowired
	JdbcTemplate jdbctemplate;

	@GetMapping("/home")
	public String home(Model model) {
		List<Case> cases = jdbctemplate.query("select top 10  * from product order by dateadded desc",
				BeanPropertyRowMapper.newInstance(Case.class));
		for (int i = 0; i < cases.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), cases.get(i).getIdproduct());
			cases.get(i).setImage(images);
		}
		List<Case> products = jdbctemplate.query("select top 8  * from product where name like N'Ốp lưng %'",
				BeanPropertyRowMapper.newInstance(Case.class));
		List<Case> productes = jdbctemplate.query("select top 8  * from product where name like N'Case%'",
				BeanPropertyRowMapper.newInstance(Case.class));
		List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand",
				BeanPropertyRowMapper.newInstance(PhoneBrand.class));
		List<Phone> phones = jdbctemplate.query("select * from Phone", BeanPropertyRowMapper.newInstance(Phone.class));
		for (int i = 0; i < products.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), products.get(i).getIdproduct());
			products.get(i).setImage(images);
		}
		for (int i = 0; i < productes.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), productes.get(i).getIdproduct());
			productes.get(i).setImage(images);
		}
		model.addAttribute("phonebrands", phonebrands);
		model.addAttribute("phones", phones);
		model.addAttribute("product", cases);
		model.addAttribute("man", products);
		model.addAttribute("women", productes);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);
		return "index";
	}

	@GetMapping("/")
	public String home2() {
		return "index";
	}

	@GetMapping("/giohang")
	public String giohang(Model model) {
		if (GioHang.cart.size() == 0) {
			return "giohang";
		} else {
			int cartship = 30000;
			model.addAttribute("cartcount", GioHang.cart.size());
			model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
			model.addAttribute("cart", GioHang.cart);
			model.addAttribute("cartship", cartship);
			return "giohang2";
		}
	}

	@GetMapping("/giohang+thanhtoan")
	public String giohangthanhtoan(Model model) {
		if (GioHang.cart.size() <= 0) {
			System.out.println("Không có");
		}
		String[] stringarray = new String[] { "Bình Chánh", "Bình Tân", "Bình Thạnh", "Cần Giờ", "Củ Chi", "Gò Vấp",
				"Hóc Môn", "Nhà Bè", "Phú Nhuận", "Quận 1", "Quận 10", "Quận 11", "Quận 12", "Quận 3", "Quận 4",
				"Quận 9", "Quận 2", "Quận 5", "Quận 6", "Quận 7", "Quận 8", "Thủ Đức", "Tân Bình", "Tân Phú" };
		List<String> list = Arrays.asList(stringarray);
		model.addAttribute("HoChiMinh", list);
		return "giohangvathanhtoan";

	}

	@PostMapping(path = "thanhtoan")
	public String thanhtoan(User user) {
		// String[] stringarray = new String[] { "Bình Chánh", "Bình Tân", "Bình Thạnh",
		// "Cần Giờ", "Củ Chi", "Gò Vấp",
		// "Hóc Môn", "Nhà Bè", "Phú Nhuận", "Quận 1", "Quận 10", "Quận 11", "Quận 12",
		// "Quận 3", "Quận 4",
		// "Quận 9", "Quận 2", "Quận 5", "Quận 6", "Quận 7", "Quận 8", "Thủ Đức", "Tân
		// Bình", "Tân Phú" };
		System.out.println(user.getTinhthanh());
		// double total = GioHang.cart.stream().mapToDouble(Case::getPrice).sum() +
		// 30000;
		// int row = jdbctemplate.update("insert into
		// orders(DateOrder,Total,Name,Phone,Address,Message) values
		// ("+date+","+total+",N'"+user.getName()+"',"+"0"+user.getNumber()+",N'"+
		// user.getAddress()+"',N'"+user.getMessage()+"')");
		// System.out.println(row);
		return "giohangvathanhtoan";
	}

	@GetMapping("/newdescription")
	public String newdes() {
		return "newdescription";
	}

	// @GetMapping("/product")
	// public String product(Model model) {
	// return "product";
	// }

	@GetMapping("/product/{getIdphone}")
	public String product(@PathVariable int getIdphone, Model model) {
		List<Device> devices = jdbctemplate.query("select idproduct from device where idphone = ?",
				BeanPropertyRowMapper.newInstance(Device.class), getIdphone);
		List<Case> products = jdbctemplate.query("Select * from product where idproduct=?",
				BeanPropertyRowMapper.newInstance(Case.class), devices.get(0).getIdproduct());
		model.addAttribute("product", products);
		return "product";
	}

	@GetMapping(path = "search")
	public String search(Case product, Model model) {
		System.out.println(product);
		List<Case> products = jdbctemplate.query("Select * from product where name Like N'%" + product.getName() + "%'",
				BeanPropertyRowMapper.newInstance(Case.class));
		model.addAttribute("products", products);
		products.forEach(System.out::println);
		return "search";
	}

	@GetMapping("/Addtocart/{getIdproduct}")
	public String AddtoCart(@PathVariable int getIdproduct) {
		int count = GioHang.cart.size();
		boolean flagadd = false;
		boolean flagnotadd = false;
		List<Case> product = jdbctemplate.query("select  * from product where idproduct = ?",
				BeanPropertyRowMapper.newInstance(Case.class), getIdproduct);
		if (GioHang.cart.size() > 0) {
			for (int j = 0; j < count; j++) {
				for (int i = 0; i < product.size(); i++) {
					System.out.println(product.get(i).getIdproduct());
					System.out.println(GioHang.cart.get(j).getIdproduct());
					System.out.println(GioHang.cart.get(j).getIdproduct() == product.get(i).getIdproduct());
					if (GioHang.cart.get(j).getIdproduct() == product.get(i).getIdproduct()) {

						GioHang.cart.forEach(System.out::println);
						GioHang.cart.get(j).setSl(GioHang.cart.get(j).getSl() + 1);
						flagnotadd = true;
					} else {
						flagadd = true;
					}
				}
			}
		} else {
			GioHang.cart.addAll(product);
			GioHang.cart.get(0).setSl(1);
		}
		if (flagadd == true && flagnotadd == false) {
			GioHang.cart.add(product.get(0));
			System.out.println(GioHang.cart.size());
			GioHang.cart.get(GioHang.cart.size() - 1).setSl(GioHang.cart.get(GioHang.cart.size() - 1).getSl() + 1);
		}
		return "redirect:/home";
	}

	@GetMapping("/Remove/{getIdproduct}")
	public String Remove(@PathVariable int getIdproduct) {
		List<Case> product = jdbctemplate.query("select  * from product where idproduct = ?",
				BeanPropertyRowMapper.newInstance(Case.class), getIdproduct);
		for (int i = 0; i < GioHang.cart.size(); i++) {
			if (GioHang.cart.get(i).getIdproduct() == product.get(0).getIdproduct()) {
				if (GioHang.cart.get(i).getSl() > 1) {
					GioHang.cart.get(i).setSl(GioHang.cart.get(i).getSl() - 1);
				} else {
					GioHang.cart.remove(i);
				}
			}
		}
		return "redirect:/giohang";
	}

}
