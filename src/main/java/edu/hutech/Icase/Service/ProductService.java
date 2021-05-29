package edu.hutech.Icase.Service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import edu.hutech.Icase.Mapper.ColorMapper;
import edu.hutech.Icase.Mapper.ImageMapper;
import edu.hutech.Icase.Mapper.NewsMapper;
import edu.hutech.Icase.Mapper.PhoneBrandMapper;
import edu.hutech.Icase.Mapper.PhoneMapper;
import edu.hutech.Icase.Mapper.ProductMapper;
import edu.hutech.Icase.Model.ImageModel;
import edu.hutech.Icase.Model.NewsModel;
import edu.hutech.Icase.Model.PhoneBrandModel;
import edu.hutech.Icase.Model.PhoneModel;
import edu.hutech.Icase.Model.ProductModel;
import edu.hutech.Icase.Model.ColorModel;

@Service
public class ProductService {
	@Autowired 
	public JdbcTemplate jdbcTemplate;
	 
	//             ProductModel
	public List<ProductModel> getAllProduct(){
		String sql = "SELECT * FROM dbo.product";
		List<ProductModel> productsList = jdbcTemplate.query(sql, new ProductMapper());
		return productsList;
	}
	
	public List<ProductModel> get32ProductsWithLocalPack(int localPack,List<ProductModel> listProducts){
		List<ProductModel> list32Products = new ArrayList<ProductModel>();
		
		int localStart = (localPack)*32;
		
		for(int index = localStart; index <localStart+32; index ++) {
			if(listProducts.size()==0||index == listProducts.size()-1 ) {
				break;
			}
			list32Products.add(listProducts.get(index));
		}
		
		return list32Products;
	}
	
	public List<ProductModel> get5EndOfProducts(List<ProductModel> listProducts){
		List<ProductModel> list5Products = new ArrayList<ProductModel>();
		
		for(int index =1; index <=5; index ++) {
			list5Products.add(listProducts.get(listProducts.size()-index));
		}
		return list5Products;
	}
	
	public List<Integer> NumberPage(List<ProductModel> listProducts){
		List<Integer> numPage = new ArrayList<Integer>();
		int numberOfPage = Math.round((float)listProducts.size()/32) ;
		for(int index=1;index <= numberOfPage;index ++) {
			numPage.add(index);
		}
		return numPage;
	}
	public List<ProductModel> getListProductsAfterSearch(String searchText){
		List<ProductModel> ListProductsAfterSearch = new ArrayList<ProductModel>();
		for(ProductModel product : getAllProduct()) {
			if(product.getName().toLowerCase().contains(searchText.toLowerCase())) {
				ListProductsAfterSearch.add(product);
			}
		}
		return ListProductsAfterSearch;
	}
	public List<ProductModel> getListProductsAfterFilterWithPhoneId(int phoneId){
		String sql = "SELECT prod.* FROM dbo.product prod,dbo.device de WHERE de.idphone = "+ phoneId+" and de.idproduct = prod.idproduct";
		List<ProductModel> productsList = jdbcTemplate.query(sql, new ProductMapper());
		 System.out.println(phoneId);
		 
		return productsList;
	}
	public List<ProductModel> getListProductsAfterFilterWithPhoneBrandId(int phoneId){
		String sql = "SELECT prod.* FROM dbo.product prod WHERE  prod.idphonebrand= "+phoneId ;
		List<ProductModel> productsList = jdbcTemplate.query(sql, new ProductMapper());
		 
		return productsList;
	}
	public ProductModel getProductById(String id) {
		String sql = "SELECT * FROM dbo.product WHERE idproduct = "+id;
		List<ProductModel> productsList = jdbcTemplate.query(sql, new ProductMapper());
		ProductModel product = productsList.get(0);
		return product;
	}
	//
	//  PhoneModel
	//
	 public List<PhoneModel> getAllPhone(){
		 String sql = "SELECT * FROM dbo.\"Phone\"";
		List<PhoneModel> phonesList = jdbcTemplate.query(sql, new PhoneMapper());
		return phonesList;
	 }
	 public int getIdPhoneWithName(String phoneName) {
		 int id=0;
		 for(PhoneModel phone : getAllPhone()) {
			 if(phone.getNamephone().equals(phoneName)) {
				 id = phone.idphone;
				 break;
			 }
		 }
		 return id;
	 }
	 public List<PhoneModel> getListPhonesByProductId(String id){
		 String sql = "SELECT ph.* FROM dbo.device de,dbo.\"Phone\" ph WHERE ph.idphone = de.idphone and de.idproduct = "+id;
		 List<PhoneModel> phonesList = jdbcTemplate.query(sql, new PhoneMapper());

		 return phonesList ;
	 }
	 //
	 //    PhoneBrandModel
	 //
	 public List<PhoneBrandModel> getAllPhoneBrand(){
		 String sql = "SELECT * FROM dbo.phonebrand";
		List<PhoneBrandModel> phoneBrandsList = jdbcTemplate.query(sql, new PhoneBrandMapper());
		return  phoneBrandsList ;
	 }
	 public int getIdPhoneBrandWithName(String phoneBrandName) {
		 int id=0;
		 for(PhoneBrandModel phoneBrand : getAllPhoneBrand()) {
			 if(phoneBrand .getName().equals(phoneBrandName)) {
				 id = phoneBrand .idPhoneBrand;
				 break;
			 }
		 }
		 return id;
	 }
	 public String getNamePhoneBrandById(String id) {
		 String sql = "SELECT * FROM dbo.phonebrand WHERE idphonebrand =" +id;
		 List<PhoneBrandModel> phoneBrandsList = jdbcTemplate.query(sql, new PhoneBrandMapper());
		 String name = "Không có hãng";
		 if(phoneBrandsList.size() != 0) {
	 		 name = phoneBrandsList.get(0).getName();
		 } 
		 return name;
	 }
	 public List<PhoneBrandModel> getListPhoneBrandsById(String id) {
		 String sql = "SELECT * FROM dbo.phonebrand WHERE idphonebrand =" +id;
		 List<PhoneBrandModel> phoneBrandsList = jdbcTemplate.query(sql, new PhoneBrandMapper());
 
		 return phoneBrandsList;
	 }
	 //
	 // imageModel
	 //
	 public List<ImageModel> getImagesByProductId(String id){
		 String sql ="SELECT * FROM dbo.image WHERE idproduct = "+id;
		 List<ImageModel> imagesList = jdbcTemplate.query(sql, new ImageMapper());
		 
		 return imagesList;
	 }
	 //
	 //   ColorModel
	 //
	 public List<String> getListColorByIdProduct(String id){
		 List<String> listColor = new ArrayList<String>();
		 String sql="SELECT * FROM dbo.color  WHERE idproduct = "+id;
		 List<ColorModel> listColorHaveIdProd = jdbcTemplate.query(sql, new ColorMapper());
		 
		 for(ColorModel color : listColorHaveIdProd) {
			 listColor.add(color.getColor());
		 }
		 return listColor;
	 }
	 //
	 //     NewsModel
	 //
	 public List<NewsModel> getListNews(){
		 String sql ="SELECT * FROM dbo.news";
		 List<NewsModel> listNews = jdbcTemplate.query(sql, new NewsMapper());
		 
		 return listNews;
	 }
	 public List<NewsModel> getList3NewNews(){
		 List<NewsModel> list3News = new ArrayList<NewsModel>();
		 for(int index =1; index <=3;index ++) {
			 list3News.add(getListNews().get(getListNews().size()-index));
		 }
		 
		 return list3News;
	 }
	 public NewsModel getNewsById(String id) {
		String sql = "SELECT * FROM dbo.news WHERE \"IdNews\" = "+id;
		List<NewsModel> newsList = jdbcTemplate.query(sql, new NewsMapper());
		NewsModel news = newsList.get(0);
		return news;
	 }
}
