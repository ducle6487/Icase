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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.hutech.Icase.Model.ProductModel;
import edu.hutech.Icase.Model.Case;
import edu.hutech.Icase.Model.GioHang;
import edu.hutech.Icase.Model.Image;
import edu.hutech.Icase.Model.ImageModel;
import edu.hutech.Icase.Model.NewsModel;
import edu.hutech.Icase.Model.Phone;
import edu.hutech.Icase.Model.PhoneBrandModel;
import edu.hutech.Icase.Model.PhoneModel;
import edu.hutech.Icase.Model.ProductInforBuying;
import edu.hutech.Icase.Service.*;

@Controller
public class ProductController {

	@Autowired
	public JdbcTemplate jdbcTemplate;
	@Autowired
	ProductService prodService;

	@GetMapping("/product")
	public String product(Model model) {
		List<ProductModel> productsList = prodService.get32ProductsWithLocalPack(0, prodService.getAllProduct());
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = prodService.NumberPage(prodService.getAllProduct());
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		List<NewsModel> list3NewNews = prodService.getList3NewNews();

		model.addAttribute("products", productsList);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("numberPage", listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("list3News", list3NewNews);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "product";
	}

	@GetMapping("/product/{id}")
	public String productPageNumber(@PathVariable String id, Model model) {
		System.out.println("Ok");
		List<ProductModel> productsList = prodService.get32ProductsWithLocalPack(Integer.parseInt(id) - 1,
				prodService.getAllProduct());
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = prodService.NumberPage(productsList);
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		List<NewsModel> list3NewNews = prodService.getList3NewNews();

		model.addAttribute("products", productsList);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("numberPage", listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("list3News", list3NewNews);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "product";
	}

	@RequestMapping(value = "/product/search", method = RequestMethod.POST)
	public String searchProductWithName(@RequestParam("searchText") String searchText, Model model) {
		List<ProductModel> productsList = null;
		productsList = prodService.getListProductsAfterSearch(searchText);
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = new ArrayList<Integer>();
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		boolean numberOfProductIsNull = false;
		if (productsList.size() == 0) {
			numberOfProductIsNull = true;
		}
		List<NewsModel> list3NewNews = prodService.getList3NewNews();
		boolean filter = true;

		model.addAttribute("products", productsList);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("numberPage", listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("numberOfProductIsNull", numberOfProductIsNull);
		model.addAttribute("list3News", list3NewNews);
		model.addAttribute("filter", filter);
		model.addAttribute("filterStr", searchText);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "product";
	}

	@RequestMapping(value = "/product/phone", method = RequestMethod.POST)
	public String filterProductWithPhoneName(@RequestParam("phone") String phoneName, Model model) {
		List<ProductModel> productsList = null;
		if (phoneName.equals("---*---")) {
			return "redirect:/product";
		}
		productsList = prodService.getListProductsAfterFilterWithPhoneId(prodService.getIdPhoneWithName(phoneName));
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = new ArrayList<Integer>();
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		boolean numberOfProductIsNull = false;
		if (productsList.size() == 0) {
			numberOfProductIsNull = true;
		}
		List<NewsModel> list3NewNews = prodService.getList3NewNews();
		boolean filter = true;

		model.addAttribute("products", productsList);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("numberPage", listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("numberOfProductIsNull", numberOfProductIsNull);
		model.addAttribute("list3News", list3NewNews);
		model.addAttribute("filter", filter);
		model.addAttribute("filterStr", phoneName);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "product";
	}

	@GetMapping("/product/phone={id}")
	public String findProductByPhoneId(@PathVariable String id, Model model) {
		List<ProductModel> productsList = prodService.getListProductsAfterFilterWithPhoneId(Integer.parseInt(id));
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		List<NewsModel> list3NewNews = prodService.getList3NewNews();
		boolean filter = true;
		String namePhone = prodService.getNamePhoneWithPhoneId(Integer.parseInt(id));

		model.addAttribute("products", productsList);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("list3News", list3NewNews);
		model.addAttribute("filter", filter);
		model.addAttribute("filterStr", namePhone);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);
		return "product";
	}

	@RequestMapping(value = "/product/phonebrand", method = RequestMethod.POST)
	public String filterProductWithPhoneBrandName(@RequestParam("phoneBrand") String phoneBrandName, Model model) {
		if (phoneBrandName.equals("---*---")) {
			return "redirect:/product";
		}
		List<ProductModel> productsList = null;
		productsList = prodService
				.getListProductsAfterFilterWithPhoneBrandId(prodService.getIdPhoneBrandWithName(phoneBrandName));
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = new ArrayList<Integer>();
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		boolean numberOfProductIsNull = false;
		if (productsList.size() == 0) {
			numberOfProductIsNull = true;
		}
		int amount = 0;
		List<NewsModel> list3NewNews = prodService.getList3NewNews();
		boolean filter = true;

		model.addAttribute("products", productsList);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("numberPage", listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("numberOfProductIsNull", numberOfProductIsNull);
		model.addAttribute("amountWantBuy", amount);
		model.addAttribute("list3News", list3NewNews);
		model.addAttribute("filter", filter);
		model.addAttribute("filterStr", phoneBrandName);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "product";
	}

	//
	// Detail product
	//
	@GetMapping("/detailproduct/{id}")
	public String detailProduct(@PathVariable String id, Model model) {
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		ProductModel product = prodService.getProductById(id);
		List<ImageModel> imagesList = prodService.getImagesByProductId(id);
		String imgCover = imagesList.get(0).getName();
		String namePhoneBrand = prodService.getNamePhoneBrandById("" + product.getIdPhoneBrand());
		List<PhoneModel> listPhone = prodService.getListPhonesByProductId(id);
		List<String> listColor = prodService.getListColorByIdProduct(id);
		List<PhoneModel> listPhonesById = prodService.getListPhonesByProductId(id);
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		List<NewsModel> list3NewNews = prodService.getList3NewNews();

		model.addAttribute("product", product);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("listImages", imagesList);
		model.addAttribute("imgCover", imgCover);
		model.addAttribute("phoneBrand", namePhoneBrand);
		model.addAttribute("listPhone", listPhone);
		model.addAttribute("listColor", listColor);
		model.addAttribute("listPhone", listPhonesById);
		model.addAttribute("prodinfor", new ProductInforBuying());
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("list3News", list3NewNews);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);
		model.addAttribute("defaultvalue", "1");

		return "DetailProduct";
	}

	//
	// About
	//
	@GetMapping("/about")
	public String About(Model model) {
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();

		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "About";
	}

	//
	// News
	//
	@GetMapping("/news")
	public String news(Model model) {
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		List<NewsModel> listNews = prodService.getListNews();
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());

		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("listNews", listNews);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "news";
	}

	@GetMapping("/news/{id}")
	public String newsDetail(@PathVariable String id, Model model) {
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		NewsModel news = prodService.getNewsById(id);

		model.addAttribute("new5Products", new5Products);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("news", news);
		model.addAttribute("new5Products", new5Products);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "newsdetail";
	}

	//
	// Giới thiệu
	//
	@GetMapping("/introduct")
	public String introduct(Model model) {
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();

		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "redirect:/introduce";
	}

	@GetMapping("/introduce")
	public String intro(Model model) {
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();

		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("cartcount", GioHang.cart.size());
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cart", GioHang.cart);

		return "contact";
	}

	// add to card form detail product

	@RequestMapping(value = "/giohang/damua", method = RequestMethod.POST)
	public String Buyed(@RequestParam(name = "idProduct") String idProduct, @RequestParam(name = "color") String color,
			@RequestParam(name = "amount") String sl, @RequestParam(name = "phone") String phone, Model model) {

		int soluong = 1;
		if (!sl.isEmpty()) {
			soluong = Integer.parseInt(sl);

		}
		int count = GioHang.cart.size();
		boolean flagadd = false;
		boolean flagnotadd = false;
		List<Case> product = jdbcTemplate.query("select * from product where idproduct = ?",
				BeanPropertyRowMapper.newInstance(Case.class), idProduct);
		List<Phone> devices = jdbcTemplate.query("select * from Phone where namePhone = ?",
				BeanPropertyRowMapper.newInstance(Phone.class), phone);
		List<Image> images = jdbcTemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
				BeanPropertyRowMapper.newInstance(Image.class), product.get(0).getIdproduct());
		product.get(0).setImage1(images.get(0).getName().toString());
		product.get(0).setImage2(images.get(1).getName().toString());
		product.get(0).setColor(color);
		product.get(0).setPhone(devices.get(0).getIdphone());

		if (GioHang.cart.size() > 0) {
			for (int j = 0; j < count; j++) {
				for (int i = 0; i < product.size(); i++) {
					if (GioHang.cart.get(j).getIdproduct() == product.get(i).getIdproduct()
							&& GioHang.cart.get(j).getColor().equals(product.get(i).getColor())
							&& GioHang.cart.get(j).getPhone() == product.get(i).getPhone()) {

						GioHang.cart.forEach(System.out::println);
						GioHang.cart.get(j).setSl(GioHang.cart.get(j).getSl() + soluong);

						flagnotadd = true;
					} else {
						flagadd = true;
					}
				}
			}
		} else {
			GioHang.cart.addAll(product);
			GioHang.cart.get(0).setSl(soluong);
		}
		if (flagadd == true && flagnotadd == false) {
			GioHang.cart.add(product.get(0));
			GioHang.cart.get(GioHang.cart.size() - 1)
					.setSl(GioHang.cart.get(GioHang.cart.size() - 1).getSl() + soluong);
		}
		return "redirect:/product";
	}

}
