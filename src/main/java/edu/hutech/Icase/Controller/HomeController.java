package edu.hutech.Icase.Controller;

import java.io.Console;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.websocket.Session;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.hutech.Icase.Model.Case;
import edu.hutech.Icase.Model.Device;
import edu.hutech.Icase.Model.GioHang;
import edu.hutech.Icase.Model.Image;
import edu.hutech.Icase.Model.Phone;
import edu.hutech.Icase.Model.PhoneBrand;

@Controller
public class HomeController {
	
	@Autowired
	JdbcTemplate jdbctemplate;
	
	@GetMapping("/home")
	public String home(Model model) {
		List<Case> cases = jdbctemplate.query("select top 10  * from product order by dateadded desc", BeanPropertyRowMapper.newInstance(Case.class));
		for (Case case1 : cases) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc", BeanPropertyRowMapper.newInstance(Image.class),case1.getIdproduct());			
			case1.setImage(images);
		}
		List<Case> products = jdbctemplate.query("select top 8  * from product where name like N'Ốp lưng %'", BeanPropertyRowMapper.newInstance(Case.class));
		List<Case> productes = jdbctemplate.query("select top 8  * from product where name like N'Case%'", BeanPropertyRowMapper.newInstance(Case.class));
		List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand", BeanPropertyRowMapper.newInstance(PhoneBrand.class));
		List<Phone> phones = jdbctemplate.query("select * from Phone", BeanPropertyRowMapper.newInstance(Phone.class));
		for (Case products1 : products) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc", BeanPropertyRowMapper.newInstance(Image.class),products1.getIdproduct());			
			products1.setImage(images);
		}
		for (Case productes1 : productes) {
			List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc", BeanPropertyRowMapper.newInstance(Image.class),productes1.getIdproduct());			
			productes1.setImage(images);
		}
		model.addAttribute("phonebrands", phonebrands);
		model.addAttribute("phones", phones);
		model.addAttribute("product", cases);
		model.addAttribute("man", products);
		model.addAttribute("women", productes);
		return "index";
	}
	

	@GetMapping("/")
	public String home2() {
		return "index";
	}

	@GetMapping("/about")
	public String about() {
		return "About";
	}

	@GetMapping("/detail")
	public String description() {
		return "DetailProduct";
	}

	@GetMapping("/giohang")
	public String giohang(Model model) {
		if(GioHang.cart.size() == 0) {
			return "giohang";			
		}
		else {
			model.addAttribute("cartcount", GioHang.cart.size());
			model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
			model.addAttribute("cart", GioHang.cart);
			return "giohang2";
		}
	}

	@GetMapping("/giohang+thanhtoan")
	public String giohang2(Model model) {		
//		List<String> list = new ArrayList("Bình Chánh","Bình Tân","Bình Thạnh","Cần Giờ","Củ Chi","Gò Vấp","Hóc Môn","Nhà Bè","Phú Nhuận","Quận 1","Quận 10","Quận 11",
//				"Quận 12","Quận 3","Quận 4","Quận 9","Quận 2","Quận 5","Quận 6","Quận 7","Quận 8","Thủ Đức","Tân Bình","Tân Phú")<String> ();
		String[] stringarray = new String[] {"Bình Chánh","Bình Tân","Bình Thạnh","Cần Giờ","Củ Chi","Gò Vấp","Hóc Môn","Nhà Bè","Phú Nhuận","Quận 1","Quận 10","Quận 11",
			"Quận 12","Quận 3","Quận 4","Quận 9","Quận 2","Quận 5","Quận 6","Quận 7","Quận 8","Thủ Đức","Tân Bình","Tân Phú"};
		List<String> list = Arrays.asList(stringarray);		
		model.addAttribute("mykey", "meyvalue");
		model.addAttribute("HoChiMinh",list);
		return "giohangvathanhtoan";

	}

	@GetMapping("/newdescription")
	public String newdes() {
		return "newdescription";
	}
	
	@GetMapping("/product")
	public String product(Model model) {
		return "product";
	}

	@GetMapping(path="search")
	public String Search(@RequestParam("search") String name,Model model) {
		List<Case> cases = jdbctemplate.query("Select * from product where name=N'%?%'", BeanPropertyRowMapper.newInstance(Case.class),name);
		return "search";
	}
	
	@GetMapping("/Addtocart/{getIdproduct}")
	public String AddtoCart(@PathVariable int getIdproduct) {
		List<Case> products = new ArrayList<Case>();
		List<Case> product =  jdbctemplate.query("select * from product where idproduct = ?", BeanPropertyRowMapper.newInstance(Case.class),getIdproduct);
		for (Case case1 : product) {
			if(GioHang.cart.size() > 0) {
				for (Case case2 : GioHang.cart) {				
					if(case1.getIdproduct() == case2.getIdproduct()) {
						products.forEach(System.out::println);
						case1.setSl(case1.getSl()+1);
						case2.setSl(case1.getSl());		
					}
					else {
						case1.setSl(1);
						products.add(case1);
					}
				}				
			}
			else {
				case1.setSl(1);
				GioHang.cart.add(case1);
			}
		}
		GioHang.cart.addAll(products);
		return "redirect:/home";		
	}


}
