package edu.hutech.Icase.Controller;

import java.util.ArrayList;
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
import edu.hutech.Icase.Model.Color;
import edu.hutech.Icase.Model.Device;
import edu.hutech.Icase.Model.GioHang;
import edu.hutech.Icase.Model.Image;
import edu.hutech.Icase.Model.Infoorder;
import edu.hutech.Icase.Model.MethodPayment;
import edu.hutech.Icase.Model.Phone;
import edu.hutech.Icase.Model.PhoneBrand;
import edu.hutech.Icase.Model.PhoneBrandModel;
import edu.hutech.Icase.Model.PhoneModel;
import edu.hutech.Icase.Model.User;
import edu.hutech.Icase.Service.ProductService;

@Controller
public class HomeController {

	public List<Case> products = new ArrayList<Case>();

	@Autowired
	JdbcTemplate jdbctemplate;
	@Autowired
	ProductService prodService;

	@GetMapping("/home")
	public String home(Model model) {
		List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand",
				BeanPropertyRowMapper.newInstance(PhoneBrand.class));
		List<Case> cases = jdbctemplate.query("select top 10  * from product order by dateadded desc",
				BeanPropertyRowMapper.newInstance(Case.class));
		for (int i = 0; i < cases.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), cases.get(i).getIdproduct());
			cases.get(i).setImage1(images.get(0).getName().toString());
			cases.get(i).setImage2(images.get(1).getName().toString());
		}
		List<Case> products = jdbctemplate.query("select top 8  * from product where name like N'Ốp lưng %'",
				BeanPropertyRowMapper.newInstance(Case.class));
		List<Case> productes = jdbctemplate.query("select top 8  * from product where name like N'Case%'",
				BeanPropertyRowMapper.newInstance(Case.class));
		for (int i = 0; i < products.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), products.get(i).getIdproduct());
			products.get(i).setImage1(images.get(0).getName().toString());
			products.get(i).setImage2(images.get(1).getName().toString());
		}
		for (int i = 0; i < productes.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), productes.get(i).getIdproduct());
			productes.get(i).setImage1(images.get(0).getName().toString());
			productes.get(i).setImage2(images.get(1).getName().toString());
		}

		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();

		model.addAttribute("phonebrands", phonebrands);
		model.addAttribute("product", cases);
		model.addAttribute("man", products);
		model.addAttribute("women", productes);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		return "index";
	}

	@GetMapping("/")
	public String home2(Model model) {
		List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand",
				BeanPropertyRowMapper.newInstance(PhoneBrand.class));
		List<Case> cases = jdbctemplate.query("select top 10  * from product order by dateadded desc",
				BeanPropertyRowMapper.newInstance(Case.class));
		for (int i = 0; i < cases.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), cases.get(i).getIdproduct());
			cases.get(i).setImage1(images.get(0).getName().toString());
			cases.get(i).setImage2(images.get(1).getName().toString());
		}
		List<Case> products = jdbctemplate.query("select top 8  * from product where name like N'Ốp lưng %'",
				BeanPropertyRowMapper.newInstance(Case.class));
		List<Case> productes = jdbctemplate.query("select top 8  * from product where name like N'Case%'",
				BeanPropertyRowMapper.newInstance(Case.class));
		for (int i = 0; i < products.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), products.get(i).getIdproduct());
			products.get(i).setImage1(images.get(0).getName().toString());
			products.get(i).setImage2(images.get(1).getName().toString());
		}
		for (int i = 0; i < productes.size(); i++) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
					BeanPropertyRowMapper.newInstance(Image.class), productes.get(i).getIdproduct());
			productes.get(i).setImage1(images.get(0).getName().toString());
			productes.get(i).setImage2(images.get(1).getName().toString());
		}

		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();

		model.addAttribute("phonebrands", phonebrands);
		model.addAttribute("product", cases);
		model.addAttribute("man", products);
		model.addAttribute("women", productes);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		return "index";
	}

	@GetMapping("/giohang")
	public String giohang(Model model) {
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		if (GioHang.cart.size() == 0) {
			double totalPrice = 0;
			for (int i = 0; i < GioHang.cart.size(); i++) {
				totalPrice += GioHang.cart.get(i).getPrice() * GioHang.cart.get(i).getSl();
			}
			List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand",
					BeanPropertyRowMapper.newInstance(PhoneBrand.class));
			List<Phone> phone = jdbctemplate.query("select * from Phone",
					BeanPropertyRowMapper.newInstance(Phone.class));
			model.addAttribute("listPhoneBrands", phonebrands);
			model.addAttribute("listPhones", phone);
			model.addAttribute("cartcount", GioHang.cart.size());
			model.addAttribute("CartTotal", totalPrice);
			model.addAttribute("cart", GioHang.cart);
			return "giohang";
		} else {
			int cartship = 30000;
			double totalPrice = 0;
			for (int i = 0; i < GioHang.cart.size(); i++) {
				totalPrice += GioHang.cart.get(i).getPrice() * GioHang.cart.get(i).getSl();
			}
			List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand",
					BeanPropertyRowMapper.newInstance(PhoneBrand.class));
			List<Phone> phone = jdbctemplate.query("select * from Phone",
					BeanPropertyRowMapper.newInstance(Phone.class));
			model.addAttribute("listPhoneBrands", phonebrands);
			model.addAttribute("listPhones", phone);
			model.addAttribute("cartcount", GioHang.cart.size());
			model.addAttribute("CartTotal", totalPrice);
			model.addAttribute("cart", GioHang.cart);
			model.addAttribute("cartship", cartship);
			return "giohang2";
		}
	}

	@GetMapping("/ContactUs")
	public String Contactus(Model model) {
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);
		return "contactus";
	}

	@GetMapping(value = "/giohang+thanhtoan")
	public String giohangthanhtoan(Model model) {
		int cartship = 30000;
		if (GioHang.cart.size() <= 0) {
			List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand",
					BeanPropertyRowMapper.newInstance(PhoneBrand.class));
			List<Phone> phone = jdbctemplate.query("select * from Phone",
					BeanPropertyRowMapper.newInstance(Phone.class));
			model.addAttribute("listPhoneBrands", phonebrands);
			model.addAttribute("listPhones", phone);
			model.addAttribute("cartcount", GioHang.cart.size());
			model.addAttribute("message", "Giỏ Hàng Của Bạn Đang Trống Nên Không Thể Thanh Toán ");
			return "giohangvathanhtoan2";
		}
		List<MethodPayment> methodpayments = jdbctemplate.query("select * from methodpayment",
				BeanPropertyRowMapper.newInstance(MethodPayment.class));
		List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand",
				BeanPropertyRowMapper.newInstance(PhoneBrand.class));
		methodpayments.get(0).setNamemethod(methodpayments.get(0).getNamemethod() + " (Thanh toán khi giao hàng)");
		methodpayments.get(1).setNamemethod(methodpayments.get(1).getNamemethod() + " (Thanh toán bằng MOMO)");
		List<Phone> phone = jdbctemplate.query("select * from Phone", BeanPropertyRowMapper.newInstance(Phone.class));
		model.addAttribute("listPhoneBrands", phonebrands);
		model.addAttribute("listPhones", phone);
		model.addAttribute("methodpayments", methodpayments);
		double totalPrice = 0;
		for (int i = 0; i < GioHang.cart.size(); i++) {
			totalPrice += GioHang.cart.get(i).getPrice() * GioHang.cart.get(i).getSl();
		}
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", totalPrice);
		model.addAttribute("cartship", cartship);
		model.addAttribute("cart", GioHang.cart);
		return "giohangvathanhtoan";
	}

	@PostMapping(path = "thanhtoan")
	public String thanhtoan(User user, Model model) {
		System.out.println(user);
		boolean result = false;
		String a = user.getAddress() + "," + user.getPhuongxa() + "," + user.getQuanhuyen() + "," + user.getTinhthanh();
		user.setAddress(a);
		double total = GioHang.cart.stream().mapToDouble(Case::getPrice).sum() + 30000;
		char[] value1 = user.getName().toCharArray();
		// String value = Integer.toString(user.getNumber());
		for (char ch1 : value1) {
			result = Character.isLetter(ch1);
		}
		if (result == false) {
			model.addAttribute("message", "Họ và tên không chứa ký tự đặc biệt hoặc số");
			model.addAttribute("cartcount", GioHang.cart.size());
			List<MethodPayment> methodpayments = jdbctemplate.query("select * from methodpayment",
					BeanPropertyRowMapper.newInstance(MethodPayment.class));
			model.addAttribute("methodpayments", methodpayments);
			return "giohangvathanhtoan";
		}
		int row = jdbctemplate.update("insert into orders(DateOrder,Total,Name,Phone,Address,Message) values(GETDATE(),"
				+ total + ",N'" + user.getName() + "'," + user.getNumber() + ",N'" + user.getAddress() + "',N'"
				+ user.getMessage() + "')");
		List<Infoorder> idorder = jdbctemplate.query("select top 1 * from orders order by DateOrder DESC",
				BeanPropertyRowMapper.newInstance(Infoorder.class));
		if (row == 1) {
			for (int i = 0; i < GioHang.cart.size(); i++) {
				int amount = GioHang.cart.get(i).getAmount() - GioHang.cart.get(i).getSl();
				double totalPrice = GioHang.cart.get(i).getPrice() * GioHang.cart.get(i).getSl();
				List<Device> device = jdbctemplate.query(
						"Select idphone from device where idproduct=" + GioHang.cart.get(i).getIdproduct() + "",
						BeanPropertyRowMapper.newInstance(Device.class));
				jdbctemplate.update("UPDATE product SET amount=" + amount + ",sold=" + GioHang.cart.get(i).getSl()
						+ "where idproduct=" + GioHang.cart.get(i).getIdproduct() + "");
				jdbctemplate.update("insert into infoorder(IdOrder,IdProduct,Amount,ToTal,Color,Phone) values("
						+ idorder.get(0).getIdOrder() + "," + GioHang.cart.get(i).getIdproduct() + ","
						+ GioHang.cart.get(i).getSl() + "," + totalPrice + ",N'" + GioHang.cart.get(i).getColor() + "',"
						+ device.get(0).getIdphone() + ")");

			}
			model.addAttribute("message","Hóa Đơn Của Bạn Đã Được Tiếp Nhận Chúng Tôi Sẽ Thông Báo Cho Bạn Qua Email");
			model.addAttribute("cartcount", GioHang.cart.size());
			return "giohangvathanhtoan2";
		} else {
			model.addAttribute("message","Hiện tại máy chủ đang có sự cố nên việc mua bán hiện không hoạt động");
			model.addAttribute("cartcount", GioHang.cart.size());
			return "giohangvathanhtoan";
		}
	}

	@GetMapping("/newdescription")
	public String newdes(Model model) {
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);
		return "newdescription";
	}

	// @GetMapping("/product")
	// public String product(Model model) {
	// return "product";
	// }

	// @GetMapping("/product/{getIdphonebrand}")
	// public String product(@PathVariable int getIdphonebrand, Model model) {
	// List<PhoneBrand> phonebrand = jdbctemplate.query(
	// "select * from phonebrand where idphonebrand=" + getIdphonebrand + "",
	// BeanPropertyRowMapper.newInstance(PhoneBrand.class));
	// List<Case> products = jdbctemplate.query("Select * from product where
	// idphonebrand=" + getIdphonebrand + "",
	// BeanPropertyRowMapper.newInstance(Case.class));
	// for (int i = 0; i < products.size(); i++) {
	// List<Image> images = jdbctemplate.query("select top 2 * from image where
	// idproduct= ? order by idimage asc",
	// BeanPropertyRowMapper.newInstance(Image.class),
	// products.get(i).getIdproduct());
	// products.get(i).setImage1(images.get(0).getName().toString());
	// products.get(i).setImage2(images.get(1).getName().toString());
	// }
	// // List<ProductModel> new5Products =
	// // prodService.get5EndOfProducts(prodService.getAllProduct());
	// //// List<Integer> listNumPages = prodService.NumberPage(products);
	// // List<PhoneModel> listPhones = prodService.getAllPhone();
	// // List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
	// // List<NewsModel> list3NewNews = prodService.getList3NewNews();
	// // model.addAttribute("new5Products", new5Products);
	// // model.addAttribute("numberPage", listNumPages);
	// // model.addAttribute("listPhones", listPhones);
	// // model.addAttribute("listPhoneBrands", listPhoneBrands);
	// // model.addAttribute("list3News", list3NewNews);
	// model.addAttribute("Detail", phonebrand.get(0).getName());
	// model.addAttribute("product", products);
	// return "product";
	// }
	//
	// @GetMapping("/product/{getIdphone}")
	// public String product(@PathVariable int getIdphone, Model model) {
	// List<Device> devices = jdbctemplate.query("select idproduct from device where
	// idphone = ?",
	// BeanPropertyRowMapper.newInstance(Device.class), getIdphone);
	// List<Case> products = jdbctemplate.query("Select * from product where
	// idproduct=?",
	// BeanPropertyRowMapper.newInstance(Case.class),
	// devices.get(0).getIdproduct());
	// model.addAttribute("product", products);
	// return "product";
	// }

	@GetMapping(path = "search")
	public String search(Case product, Model model) {
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
		List<Color> colors = jdbctemplate.query("select * from color where idproduct=" + getIdproduct + "",
				BeanPropertyRowMapper.newInstance(Color.class));
		List<Device> devices = jdbctemplate.query("select * from device where idproduct = " + getIdproduct,
				BeanPropertyRowMapper.newInstance(Device.class));
		List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
				BeanPropertyRowMapper.newInstance(Image.class), product.get(0).getIdproduct());
		product.get(0).setImage1(images.get(0).getName().toString());
		product.get(0).setImage2(images.get(1).getName().toString());
		product.get(0).setColor(colors.get(0).getColor());
		product.get(0).setPhone(devices.get(0).getIdphone());
		if (GioHang.cart.size() > 0) {
			for (int j = 0; j < count; j++) {
				for (int i = 0; i < product.size(); i++) {
					if (GioHang.cart.get(j).getIdproduct() == product.get(i).getIdproduct()
							&& GioHang.cart.get(j).getColor().equals(product.get(i).getColor())
							&& GioHang.cart.get(j).getPhone() == product.get(i).getPhone()) {

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
			GioHang.cart.get(GioHang.cart.size() - 1).setSl(GioHang.cart.get(GioHang.cart.size() - 1).getSl() + 1);
		}
		return "redirect:/home";
	}

	@GetMapping("/addtocart/{getIdproduct}")
	public String addtoCart(@PathVariable int getIdproduct) {
		int count = GioHang.cart.size();
		System.out.println(getIdproduct);
		boolean flagadd = false;
		boolean flagnotadd = false;
		List<Case> product = jdbctemplate.query("select  * from product where idproduct = ?",
				BeanPropertyRowMapper.newInstance(Case.class), getIdproduct);
		System.out.println(product.get(0));
		if (GioHang.cart.size() > 0) {
			for (int j = 0; j < count; j++) {
				for (int i = 0; i < product.size(); i++) {
					if ((GioHang.cart.get(j).getIdproduct() == product.get(i).getIdproduct())
							&& (GioHang.cart.get(i).getSl() <= GioHang.cart.get(i).getAmount())) {
						GioHang.cart.get(j).setSl(GioHang.cart.get(j).getSl() + 1);
						GioHang.cart.forEach(System.out::println);
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
			GioHang.cart.get(GioHang.cart.size() - 1).setSl(GioHang.cart.get(GioHang.cart.size() - 1).getSl() + 1);
		}
		return "redirect:/giohang";
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

	@GetMapping("/minus/{getIdproduct}")
	public String minus(@PathVariable int getIdproduct) {
		List<Case> product = jdbctemplate.query("select  * from product where idproduct = ?",
				BeanPropertyRowMapper.newInstance(Case.class), getIdproduct);
		for (int i = 0; i < GioHang.cart.size(); i++) {
			if (GioHang.cart.get(i).getIdproduct() == product.get(0).getIdproduct()) {
				if (GioHang.cart.get(i).getSl() > 1) {
					GioHang.cart.get(i).setSl(GioHang.cart.get(i).getSl() - 1);
				}
			}
		}
		return "redirect:/giohang";
	}

	@GetMapping("/remove/{getIdproduct}")
	public String remove(@PathVariable int getIdproduct) {
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
		return "redirect:/home";
	}

}
