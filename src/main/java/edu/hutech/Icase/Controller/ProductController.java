package edu.hutech.Icase.Controller;

import edu.hutech.Icase.Mapper.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.JdbcTemplateAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;

import edu.hutech.Icase.Model.ProductModel;
import edu.hutech.Icase.Model.ImageModel;
import edu.hutech.Icase.Model.NewsModel;
import edu.hutech.Icase.Model.PhoneBrandModel;
import edu.hutech.Icase.Model.PhoneModel;
import edu.hutech.Icase.Model.ProductInforBuying;
import edu.hutech.Icase.Service.*;

@Controller
public class ProductController {

//	 @Autowired 
//	 public JdbcTemplate jdbcTemplate;
	@Autowired
	ProductService prodService;
	
	@GetMapping("/product")
	public String product(Model model) {	
		List<ProductModel> productsList = prodService.get32ProductsWithLocalPack(0,prodService.getAllProduct());
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = prodService.NumberPage(prodService.getAllProduct());
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		
		model.addAttribute("products",productsList);
		model.addAttribute("new5Products",new5Products);
		model.addAttribute("numberPage",listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		
		return "product";
	}
	
	@GetMapping("/product/{id}")
	public String productPageNumber(@PathVariable String id,Model model) {	
		List<ProductModel> productsList = prodService.get32ProductsWithLocalPack(Integer.parseInt(id)-1,prodService.getAllProduct());
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = prodService.NumberPage(productsList);
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		
		model.addAttribute("products",productsList);
		model.addAttribute("new5Products",new5Products);
		model.addAttribute("numberPage",listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		
		return "product";
	}
	@RequestMapping(value = "/product/search", method = RequestMethod.POST)
	public String searchProductWithName(@RequestParam("searchText") String searchText,Model model) {	
		List<ProductModel> productsList = null;
		productsList = prodService.getListProductsAfterSearch(searchText);
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = new ArrayList<Integer>();
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		boolean numberOfProductIsNull = false;
		if(productsList.size() == 0) {
			numberOfProductIsNull = true;
		}
		
		model.addAttribute("products",productsList);
		model.addAttribute("new5Products",new5Products);
		model.addAttribute("numberPage",listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("numberOfProductIsNull", numberOfProductIsNull);

		return "product";
	}
	@RequestMapping(value = "/product/phone", method = RequestMethod.POST)
	public String filterProductWithPhoneName(@RequestParam("phone") String phoneName,Model model) {	
		List<ProductModel> productsList = null;
		productsList = prodService.getListProductsAfterFilterWithPhoneId(prodService.getIdPhoneWithName(phoneName));
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = new ArrayList<Integer>();
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		boolean numberOfProductIsNull = false;
		if(productsList.size() == 0) {
			numberOfProductIsNull = true;
		}
		
		model.addAttribute("products",productsList);
		model.addAttribute("new5Products",new5Products);
		model.addAttribute("numberPage",listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("numberOfProductIsNull", numberOfProductIsNull);

		return "product";
	}
	@RequestMapping(value = "/product/phonebrand", method = RequestMethod.POST)
	public String filterProductWithPhoneBrandName(@RequestParam("phoneBrand") String phoneBrandName,Model model) {	
		List<ProductModel> productsList = null;
		productsList = prodService.getListProductsAfterFilterWithPhoneBrandId(prodService.getIdPhoneBrandWithName(phoneBrandName));
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		List<Integer> listNumPages = new ArrayList<Integer>();
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		boolean numberOfProductIsNull = false;
		if(productsList.size() == 0) {
			numberOfProductIsNull = true;
		}
		int amount = 0;
		
		model.addAttribute("products",productsList);
		model.addAttribute("new5Products",new5Products);
		model.addAttribute("numberPage",listNumPages);
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("numberOfProductIsNull", numberOfProductIsNull);
		model.addAttribute("amountWantBuy", amount);

		return "product";
	}
	//
	//     Detail product
	//System.out.println("ok");
	@GetMapping("/detailproduct/{id}")
	public String detailProduct(@PathVariable String id,Model model) {	
		List<ProductModel> new5Products = prodService.get5EndOfProducts(prodService.getAllProduct());
		ProductModel product =  prodService.getProductById(id);
		List<ImageModel> imagesList = prodService.getImagesByProductId(id);
		String imgCover = imagesList.get(0).getName();
		String namePhoneBrand = prodService.getNamePhoneBrandById(""+product.getIdPhoneBrand());
		List<PhoneModel> listPhone = prodService.getListPhonesByProductId(id);
		List<String> listColor = prodService.getListColorByIdProduct(id);
		List<PhoneModel> listPhonesById = prodService.getListPhonesByProductId(id);
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		
		model.addAttribute("product", product);
		model.addAttribute("new5Products",new5Products);
		model.addAttribute("listImages", imagesList);
		model.addAttribute("imgCover", imgCover);
		model.addAttribute("phoneBrand", namePhoneBrand);
		model.addAttribute("listPhones", listPhone);
		model.addAttribute("listColor", listColor);
		model.addAttribute("listPhone",listPhonesById);
		model.addAttribute("prodinfor", new ProductInforBuying());
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		
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
		
		return "About";
	}
	//
	//    News
	//
	@GetMapping("/news")
	public String news(Model model) {
		List<PhoneModel> listPhones = prodService.getAllPhone();
		List<PhoneBrandModel> listPhoneBrands = prodService.getAllPhoneBrand();
		List<NewsModel> listNews = prodService.getListNews();
		
		model.addAttribute("listPhones", listPhones);
		model.addAttribute("listPhoneBrands", listPhoneBrands);
		model.addAttribute("listNews", listNews);
		
		return "news";
	}
	
	
	// test

	@RequestMapping(value = "/giohang/damua", method = RequestMethod.POST)
	public String Buyed(@ModelAttribute("prodinfor") ProductInforBuying prodinfor) {
		
		return"About";
	}
	 
}
