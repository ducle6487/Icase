package edu.hutech.Icase.Controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import static java.time.DayOfWeek.MONDAY;
import static java.time.DayOfWeek.SUNDAY;
import static java.time.temporal.TemporalAdjusters.nextOrSame;
import static java.time.temporal.TemporalAdjusters.previousOrSame;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.hutech.Icase.Mapper.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hutech.Icase.Model.AdminModel;
import edu.hutech.Icase.Model.AdminProductModel;
import edu.hutech.Icase.Model.ColorModel;
import edu.hutech.Icase.Model.InfoOrderModel;
import edu.hutech.Icase.Model.OrderHistoryModel;
import edu.hutech.Icase.Model.PhoneBrandModel;
import edu.hutech.Icase.Model.PhoneModel;
import edu.hutech.Icase.Model.ProductValueModel;

@Controller
public class AdminControler {

	@Autowired
	JdbcTemplate jdbcTemplate;

	// Utility function

	private int countOrder(int[] input) {

		int result = 0;

		for (int i = 0; i < input.length; i++) {
			result = result + input[i];
		}

		return result;
	}

	private final long MILLIS_IN_A_DAY = 1000 * 60 * 60 * 24;

	private Date findNextDay(Date date) {
		return new Date(date.getTime() + MILLIS_IN_A_DAY);
	}

	private Date findPreviousDay(Date date) {
		return new Date(date.getTime() - MILLIS_IN_A_DAY);
	}

	private List<String> convertArrayToList(String[] arr) {
		ArrayList<String> list = new ArrayList<String>();
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].isEmpty()) {
				list.add(arr[i]);
			}

		}
		return list;
	}

	private String getJsonPhoneByBrand() throws JsonProcessingException {
		Map<String, String[]> dic = new Hashtable<String, String[]>();
		String[] ls = new String[] { "Oppo A52", "Oppo A92", "OPPO A5", "OPPO A3S", "Reno ACE", "Oppo K5", "Oppo A9",
				"Oppo A11X" };

		dic.put("Xiaomi", new String[] { "Mi 10T Pro", "Redmi K30s", "Mi 10T Lite", "Redmi Note 9 Pro 5G", "Mi 11",
				"Black Shark 3", "Redmi Note 9S", "Note 9 Pro", "Poco M3", "Redmi 9T", "Poco X3 NFC",
				"Redmi Note 8 Pro", "Mi 10T", "Mi 10T Pro 5G", "K30S", "Redmi Note 9 5G", "Note 9 Pro 5G",
				"Redmi K30 5G", "Redmi Note 8", "Poco F2 Pro", "Redmi K30 Pro", "K30 Ultra", "Mi 9T", "Redmi K20",
				"Redmi Note 7", "Redmi 9A", "Mi Note 10 Lite", "PocoPhone X2", "Redmi 9", "Redmi 9C", "Redmi Note 9",
				"Redmi 10X 4G", "Mi 10 Lite", "Mi 9", "Mi 8", "Poco X2", "Note 8 Pro" });
		dic.put("Realme", new String[] { "Realme 7", "Realme 7i", "Realme 7 Pro", "Realme 6", "Realme 6 Pro",
				"Realme C17", "Realme 5 Pro", "Realme 5", "Realme X2 Pro", "Realme XT", "Realme X2" });
		dic.put("Oppo", ls);
		dic.put("Apple",
				new String[] { "iPhone 6 Plus", "iPhone 7", "iPhone 7 Plus / 8 Plus", "iPhone X / Xs",
						"iPhone 6 Plus / 6s Plus", "iPhone Xs Max", "iPhone X", "iPhone Xs", "iPhone XR",
						"iPhone 7 Plus", "iPhone X-XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max", "iPhone 8",
						"iPhone 6/7/8", "iPhone 6/6S", "Airpods 1 / 2", "Airpods Pro" });
		dic.put("Vsmart",
				new String[] { "Vsmart Aris Pro", "Vsmart Aris", "Vsmart Joy 4", "Vsmart Live 4", "Vsmart Star 4",
						"Vsmart Star 3", "Vsmart Active 3", "Vsmart Joy 3", "Vsmart Bee 3", "Vsmart Star",
						"Vsmart Joy 1", "Vsmart Joy 1+ Plus" });
		dic.put("Samsung",
				new String[] { "Galaxy Note 20 Ultra", "Galaxy S8", "Galaxy A7 2017", "Galaxy A5 2017",
						"Galaxy A3 2017", "Galaxy J7 Prime", "Galaxy A52", "Galaxy S21 Ultra", "Galaxy S21+ Plus",
						"Galaxy S21", "Galaxy A02s", "Galaxy Note 9", "Galaxy Note 8", "Galaxy S20 FE", "Galaxy M51",
						"Galaxy A11", "Galaxy A21s", "Galaxy M11", "Galaxy M31", "Galaxy S10 5G" });
		dic.put("Huawei",
				new String[] { "Huawei P40 Pro", "Huawei P40", "Huawei Nova 5T", "Mate 30 Pro", "Huawei Y9s",
						"Huawei Nova 7i", "Huawei Nova 6 SE", "Huawei P30 Lite", "Huawei Y9 2019", "Huawei P30",
						"Huawei P30 Pro", "Redmi K30" });
		return new ObjectMapper().writeValueAsString(dic);

	}

	// RSelect and Insert, update data Area

	private List<AdminProductModel> getAllProduct() {

		String sql = "select * from product";

		List<AdminProductModel> list = jdbcTemplate.query(sql, new ProductRowMapper());

		return list;
	}

	private AdminProductModel findProduct(int id) {

		String sql = "select * from product where idproduct=?";

		List<AdminProductModel> list = jdbcTemplate.query(sql, new ProductRowMapper(), new Object[] { id });

		return list.get(0);
	}

	private List<ColorModel> getAllColor() {
		String sql = "select distinct color from color";

		return jdbcTemplate.query(sql, new ColorRowMapper());

	}

	private List<ColorModel> findColorByIdProduct(int id) {
		String sql = "select * from color where idproduct = ?";
		return jdbcTemplate.query(sql, new ColorRowMapper(), Integer.toString(id));
	}

	private List<PhoneBrandModel> getAllPhoneBrand() {
		String sql = "select * from phonebrand";
		return jdbcTemplate.query(sql, new PhoneBrandRowMapper());
	}

	private PhoneBrandModel findPhoneBrandById(int id) {
		String sql = "select * from phonebrand where idphonebrand = ?";
		List<PhoneBrandModel> list = jdbcTemplate.query(sql, new PhoneBrandRowMapper(), Integer.toString(id));
		return list.get(0);
	}

	private PhoneBrandModel findIdPhoneBrandByName(String name) {
		String sql = "select * from phonebrand where name = ?";
		List<PhoneBrandModel> list = jdbcTemplate.query(sql, new PhoneBrandRowMapper(), name);
		return list.get(0);
	}

	private List<PhoneModel> findPhoneByIdProduct(int id) {
		String sql = "select a.idphone, namephone from device a, Phone b where a.idphone = b.IdPhone and idproduct = ?";
		return jdbcTemplate.query(sql, new PhoneRowMapper(), Integer.toString(id));
	}

	private List<OrderHistoryModel> getAllOrderHistory() {
		String sql = "select a.IdOrder as idorder, b.Name as namecustomer, Phone as phone, Address as address, DateOrder as dateorder, Message as message, c.NameMethod as methodpayment, e.name as paymentstatus, d.name as deliverystatus from history a, orders b, methodpayment c, DeliveryStatus d, PaymentStatus e where a.IdOrder = b.idOrder and a.IdMethod = c.IdMethod and d.idStatus = a.IdStatusDelivery and e.idStatus = a.idStatusPayment";
		return jdbcTemplate.query(sql, new OrderHistoryRowMapper());
	}

	private List<OrderHistoryModel> getRecent24hOrderHistory() {

		String sql = "select distinct a.IdOrder as idorder, b.Name as namecustomer, Phone as phone, Address as address, DateOrder as dateorder, Message as message, c.NameMethod as methodpayment, e.name as paymentstatus, d.name as deliverystatus from history a, orders b, methodpayment c, DeliveryStatus d, PaymentStatus e where a.IdOrder = b.idOrder and a.IdMethod = c.IdMethod and d.idStatus = a.IdStatusDelivery and e.idStatus = a.idStatusPayment and DateOrder >= DATEADD(day, -1, GETDATE()) order by dateorder";
		return jdbcTemplate.query(sql, new OrderHistoryRowMapper());

	}

	private List<OrderHistoryModel> getAllOrderHistoryByIdOrder(int idorder) {
		String sql = "select a.IdOrder as idorder, b.Name as namecustomer, Phone as phone, Address as address, DateOrder as dateorder, Message as message, c.NameMethod as methodpayment, e.name as paymentstatus, d.name as deliverystatus from history a, orders b, methodpayment c, DeliveryStatus d, PaymentStatus e where a.IdOrder = b.idOrder and a.IdMethod = c.IdMethod and d.idStatus = a.IdStatusDelivery and e.idStatus = a.idStatusPayment and a.IdOrder = ?";

		return jdbcTemplate.query(sql, new OrderHistoryRowMapper(), idorder);
	}

	private List<InfoOrderModel> getInfoOrderByIdOrder(int idorder) {
		String sql = "select IdProduct as idproduct, Amount as amount, a.Color as color, b.namephone as phone, a.Total as total from infoorder a, phone b where a.Phone = b.idphone and a.IdOrder = ?";
		return jdbcTemplate.query(sql, new InfoOrderRowMapper(), idorder);
	}

	private int[] getListOrderCountInThisWeek() {

		Date today = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
		Date monday = Date
				.from(LocalDate.now().with(previousOrSame(MONDAY)).atStartOfDay(ZoneId.systemDefault()).toInstant());

		int index = -1;

		Date nextDate = findPreviousDay(monday);

		long difference = today.getTime() - monday.getTime();
		float daysBetween = (difference / (1000 * 60 * 60 * 24));
		int[] list = new int[(int) daysBetween + 1];
		do {

			nextDate = findNextDay(nextDate);
			index++;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String dateToString = df.format(nextDate);

			String sql = "select count(*) as counter from orders where convert(date,DateOrder,102)=?";

			List<Integer> ls = jdbcTemplate.query(sql, new RowMapper<Integer>() {

				@Override
				public Integer mapRow(ResultSet rs, int numRow) throws SQLException {
					return Integer.valueOf(rs.getInt("counter"));

				}

			}, dateToString);

			if (!ls.isEmpty()) {
				list[index] = ls.get(0).intValue();
			}

		} while (!nextDate.equals(today));

		return list;
	}

	private int[] getListOrderCountInThisYear() {

		LocalDate today = LocalDate.now();

		String thisMonth = today.format(DateTimeFormatter.ofPattern("MM"));
		String thisYear = today.format(DateTimeFormatter.ofPattern("yyyy"));

		int[] list = new int[Integer.parseInt(thisMonth)];

		for (int i = 1; i <= Integer.parseInt(thisMonth); i++) {

			String sql = "select count(*) as counter from orders where MONTH(DateOrder)=? and YEAR(DateOrder)=?";

			List<Integer> ls = jdbcTemplate.query(sql, new RowMapper<Integer>() {

				@Override
				public Integer mapRow(ResultSet rs, int numRow) throws SQLException {
					return Integer.valueOf(rs.getInt("counter"));

				}

			}, i, thisYear);

			if (!ls.isEmpty()) {
				list[i - 1] = ls.get(0).intValue();
			}

		}

		return list;
	}

	private Long getSumPriceThisWeek() {

		LocalDate today = LocalDate.now();
		LocalDate monday = LocalDate.now().with(previousOrSame(MONDAY));

		String mondayStr = monday.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String todayStr = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

		String sql = "select sum(Total) as sumtotal from orders where DateOrder >= ? and DateOrder <= ?";

		List<Long> ls = jdbcTemplate.query(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int numRow) throws SQLException {
				return rs.getLong("sumtotal");
			}

		}, mondayStr, todayStr);

		if (!ls.isEmpty()) {
			return ls.get(0);
		}

		return 0l;
	}

	private Long getSumPriceThisMonth() {

		LocalDate today = LocalDate.now();
		String todayStr = today.format(DateTimeFormatter.ofPattern("MM"));

		String sql = "select sum(Total) as sumtotal from orders where MONTH(DateOrder)=?";

		List<Long> ls = jdbcTemplate.query(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int numRow) throws SQLException {
				return rs.getLong("sumtotal");
			}

		}, todayStr);

		if (!ls.isEmpty()) {
			return ls.get(0);
		}

		return 0l;
	}

	private Long getSumPriceThisYear() {

		LocalDate today = LocalDate.now();
		String todayStr = today.format(DateTimeFormatter.ofPattern("yyyy"));

		String sql = "select sum(Total) as sumtotal from orders where YEAR(DateOrder)=?";

		List<Long> ls = jdbcTemplate.query(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int numRow) throws SQLException {
				return rs.getLong("sumtotal");
			}

		}, todayStr);

		if (!ls.isEmpty()) {
			return ls.get(0);
		}

		return 0l;
	}

	private int updateDeliveryStatus(int status, int idorder, boolean isCOD) {

		String sql = "update history set IdStatusDelivery = ? where IdOrder = ?";
		if (isCOD) {
			sql = "update history set IdStatusPayment = 2, IdStatusDelivery = 3 where IdOrder = ?";
			return jdbcTemplate.update(sql, idorder);
		}

		return jdbcTemplate.update(sql, status, idorder);

	}

	private int updatePaymentStatus(int idorder) {
		String sql = "update history set IdStatusPayment = 2 where IdOrder = ?";
		return jdbcTemplate.update(sql, idorder);
	}

	// Mapping Area

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
	public String adminMainPage(Model model) {
		// ArrayList<Integer> list = new ArrayList<Integer>();
		// list.add(300);
		// list.add(200);
		// list.add(100);
		// list.add(600);
		// list.add(500);

		LocalDate today = LocalDate.now();

		LocalDate monday = today.with(previousOrSame(MONDAY));
		LocalDate sunday = today.with(nextOrSame(SUNDAY));

		String thisMonth = today.format(DateTimeFormatter.ofPattern("MM"));

		model.addAttribute("monday", monday.format(DateTimeFormatter.ofPattern("MMM, dd yyyy")));
		model.addAttribute("sunday", sunday.format(DateTimeFormatter.ofPattern("MMM, dd yyyy")));
		model.addAttribute("pricethisweek", getSumPriceThisWeek());
		model.addAttribute("amountthisweek", countOrder(getListOrderCountInThisWeek()));
		model.addAttribute("amountthismonth", getListOrderCountInThisYear()[Integer.parseInt(thisMonth) - 1]);
		model.addAttribute("pricethismonth", getSumPriceThisMonth());
		model.addAttribute("amountthisyear", countOrder(getListOrderCountInThisYear()));
		model.addAttribute("pricethisyear", getSumPriceThisYear());
		model.addAttribute("orderhistories", getRecent24hOrderHistory());
		model.addAttribute("weekly", getListOrderCountInThisWeek());
		model.addAttribute("yearly", getListOrderCountInThisYear());

		return "index-admin";
	}

	@GetMapping("/admin/all-product")
	public String allProduct(Model model) {

		List<AdminProductModel> list = getAllProduct();
		System.out.println(list.get(0).getPrice());
		model.addAttribute("products", list);

		return "allproduct";
	}

	@GetMapping("/admin/product-edit&id={id}")
	public String editProduct(@PathVariable String id, Model model) throws JsonProcessingException {
		AdminProductModel product = findProduct(Integer.parseInt(id));

		List<PhoneModel> list = findPhoneByIdProduct(product.idProduct);
		ArrayList<String> listDevice = new ArrayList<String>();
		list.forEach(phone -> {
			listDevice.add(phone.getNamephone());
		});

		List<ColorModel> listAllColors = getAllColor();
		ArrayList<String> listAllColorString = new ArrayList<String>();
		listAllColors.forEach(item -> {
			listAllColorString.add(item.getNamecolor());
		});

		List<ColorModel> listSelectedColors = findColorByIdProduct(product.idProduct);
		ArrayList<String> listSelectedColorsString = new ArrayList<String>();
		listSelectedColors.forEach(color -> {
			listSelectedColorsString.add(color.getNamecolor());
		});

		model.addAttribute("PhoneByBrand", getJsonPhoneByBrand());
		model.addAttribute("product", product);
		model.addAttribute("brand", findPhoneBrandById(product.idBrandPhone).namebrand);
		model.addAttribute("device", listDevice);
		model.addAttribute("allcolor", listAllColorString);
		model.addAttribute("selectedcolor", listSelectedColorsString);
		return "edit-product";
	}

	@GetMapping("/admin/all-order")
	public String allOrder(Model model) {
		model.addAttribute("orderhistories", getAllOrderHistory());
		return "allorder";
	}

	@GetMapping("/admin/product-edit")
	public String addProduct(Model model) throws JsonProcessingException {

		AdminProductModel p = new AdminProductModel();
		model.addAttribute("PhoneByBrand", getJsonPhoneByBrand());
		model.addAttribute("product", p);

		return "edit-product";
	}

	@RequestMapping(value = "/update-product")
	public String updateProduct(@ModelAttribute ProductValueModel product) {
		String[] phones = product.device.split("\\|", -1);
		String[] colors = product.color.split("\\|", -1);
		List<String> listSelectedPhone = convertArrayToList(phones);
		List<String> listSelectedColor = convertArrayToList(colors);
		System.out.println(listSelectedColor + "" + listSelectedPhone + "" + product.idproduct + product.brand
				+ product.amount + product.description + product.name + product.phonebrand);
		return "redirect:/admin/dashboard";
	}

	@GetMapping("/admin/detail-order&id={id}")
	public String detailorder(@PathVariable String id, Model model) {

		OrderHistoryModel ord = new OrderHistoryModel();
		List<OrderHistoryModel> list = getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "detail-order";
	}

	@GetMapping("/change-to-shipping&id={id}")
	public String changeToShipping(@PathVariable String id, Model model) {

		updateDeliveryStatus(2, Integer.parseInt(id), false);

		OrderHistoryModel ord = new OrderHistoryModel();
		List<OrderHistoryModel> list = getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "redirect:/admin/detail-order&id=" + id;
	}

	boolean updated = false;

	@GetMapping("/change-to-accept&id={id}")
	public String changeToAccept(@PathVariable String id, Model model) {

		List<OrderHistoryModel> list = getAllOrderHistoryByIdOrder(Integer.parseInt(id));

		list.forEach(item -> {
			if (item.idorder == Integer.parseInt(id) && item.methodpayment.equals("COD")) {
				updateDeliveryStatus(0, Integer.parseInt(id), true);
				updated = true;
			}
		});
		if (!updated) {
			updateDeliveryStatus(3, Integer.parseInt(id), false);
		}

		OrderHistoryModel ord = new OrderHistoryModel();
		list = getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "redirect:/admin/detail-order&id=" + id;
	}

	@GetMapping("/change-to-decline&id={id}")
	public String changeToDecline(@PathVariable String id, Model model) {

		updateDeliveryStatus(4, Integer.parseInt(id), false);

		OrderHistoryModel ord = new OrderHistoryModel();
		List<OrderHistoryModel> list = getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "redirect:/admin/detail-order&id=" + id;
	}

	@GetMapping("/change-to-payed&id={id}")
	public String changeToPayed(@PathVariable String id, Model model) {

		updatePaymentStatus(Integer.parseInt(id));

		OrderHistoryModel ord = new OrderHistoryModel();
		List<OrderHistoryModel> list = getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "redirect:/admin/detail-order&id=" + id;
	}

}
