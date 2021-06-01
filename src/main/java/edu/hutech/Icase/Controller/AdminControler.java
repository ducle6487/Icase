package edu.hutech.Icase.Controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import static java.time.DayOfWeek.MONDAY;
import static java.time.DayOfWeek.SUNDAY;
import static java.time.temporal.TemporalAdjusters.nextOrSame;
import static java.time.temporal.TemporalAdjusters.previousOrSame;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.DecimalFormat;

import com.fasterxml.jackson.core.JsonProcessingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.hutech.Icase.Model.AdminModel;
import edu.hutech.Icase.Model.AdminProductModel;
import edu.hutech.Icase.Model.ColorModel;
import edu.hutech.Icase.Model.InfoOrderModel;
import edu.hutech.Icase.Model.OrderHistoryModel;
import edu.hutech.Icase.Model.PhoneModel;
import edu.hutech.Icase.Model.ProductValueModel;
import edu.hutech.Icase.Service.AdminService;

@Controller
public class AdminControler {

	@Autowired
	AdminService adminService;

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Mapping Area

	@GetMapping("/admin/login")
	public String adminLogin(Model model, HttpSession session) {

		if (adminService.islogedIn(session)) {
			return "redirect:/admin/dashboard";
		}

		System.out.println(model.getAttribute("message"));
		return "login";
	}

	@PostMapping(path = "admin/check-login")
	public String checkLogin(AdminModel admin, Model model, HttpSession session) {

		String message = "";
		if (adminService.checkLogin(admin.userName, admin.password) > 0) {
			session.setAttribute("username", admin.userName);
			return "redirect:/admin/dashboard";
		} else {
			message = "login fail";

		}

		model.addAttribute("message", message);
		// adminLogin(model);
		return "login";
	}

	@GetMapping("/admin/dashboard")
	public String adminMainPage(Model model, HttpSession session) {
		// ArrayList<Integer> list = new ArrayList<Integer>();
		// list.add(300);
		// list.add(200);
		// list.add(100);
		// list.add(600);
		// list.add(500);

		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}

		LocalDate today = LocalDate.now();

		LocalDate monday = today.with(previousOrSame(MONDAY));
		LocalDate sunday = today.with(nextOrSame(SUNDAY));

		String thisMonth = today.format(DateTimeFormatter.ofPattern("MM"));
		System.out.println(thisMonth);
		DecimalFormat fm = new DecimalFormat("###,###,###");

		model.addAttribute("username", (String) session.getAttribute("username"));
		model.addAttribute("monday", monday.format(DateTimeFormatter.ofPattern("MMM, dd yyyy")));
		model.addAttribute("sunday", sunday.format(DateTimeFormatter.ofPattern("MMM, dd yyyy")));
		model.addAttribute("pricethisweek", fm.format(adminService.getSumPriceThisWeek()));
		model.addAttribute("amountthisweek",
				fm.format(adminService.countOrder(adminService.getListOrderCountInThisWeek())));
		model.addAttribute("amountthismonth",
				fm.format(adminService.getListOrderCountInThisYear()[Integer.parseInt(thisMonth) - 1]));
		model.addAttribute("pricethismonth", fm.format(adminService.getSumPriceThisMonth()));
		model.addAttribute("amountthisyear",
				fm.format(adminService.countOrder(adminService.getListOrderCountInThisYear())));
		model.addAttribute("pricethisyear", fm.format(adminService.getSumPriceThisYear()));
		model.addAttribute("orderhistories", adminService.getRecent24hOrderHistory());
		model.addAttribute("weekly", adminService.getListOrderCountInThisWeek());
		model.addAttribute("yearly", adminService.getListOrderCountInThisYear());
		model.addAttribute("thismonth", thisMonth);

		return "index-admin";
	}

	@GetMapping("/admin/all-product")
	public String allProduct(Model model, HttpSession session) {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}
		List<AdminProductModel> list = adminService.getAllProduct();
		// System.out.println(list.get(0).getPrice());

		model.addAttribute("username", (String) session.getAttribute("username"));
		model.addAttribute("products", list);

		return "allproduct";
	}

	@GetMapping("/admin/product-edit&id={id}")
	public String editProduct(@PathVariable String id, Model model, HttpSession session)
			throws JsonProcessingException {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}
		AdminProductModel product = adminService.findProduct(Integer.parseInt(id));

		List<PhoneModel> list = adminService.findPhoneByIdProduct(product.idProduct);
		ArrayList<String> listDevice = new ArrayList<String>();
		list.forEach(phone -> {
			listDevice.add(phone.getNamephone());
		});

		List<ColorModel> listAllColors = adminService.getAllColor();
		ArrayList<String> listAllColorString = new ArrayList<String>();
		listAllColors.forEach(item -> {
			listAllColorString.add(item.getColor());
		});

		List<ColorModel> listSelectedColors = adminService.findColorByIdProduct(product.idProduct);
		ArrayList<String> listSelectedColorsString = new ArrayList<String>();
		listSelectedColors.forEach(color -> {
			listSelectedColorsString.add(color.getColor());
		});

		model.addAttribute("username", (String) session.getAttribute("username"));
		model.addAttribute("PhoneByBrand", adminService.getJsonPhoneByBrand());
		model.addAttribute("product", product);
		model.addAttribute("brand", adminService.findPhoneBrandById(product.idBrandPhone).name);
		model.addAttribute("device", listDevice);
		model.addAttribute("allcolor", listAllColorString);
		model.addAttribute("selectedcolor", listSelectedColorsString);
		return "edit-product";
	}

	@GetMapping("/admin/all-order")
	public String allOrder(Model model, HttpSession session) {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}
		model.addAttribute("username", (String) session.getAttribute("username"));
		model.addAttribute("orderhistories", adminService.getAllOrderHistory());
		return "allorder";
	}

	@GetMapping("/admin/product-edit")
	public String addProduct(Model model, HttpSession session) throws JsonProcessingException {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}

		ArrayList<String> listAllColorString = new ArrayList<String>();
		List<ColorModel> listAllColors = adminService.getAllColor();
		listAllColors.forEach(item -> {
			listAllColorString.add(item.getColor());
		});

		ArrayList<String> l2 = new ArrayList<String>();
		l2.add("");
		AdminProductModel p = new AdminProductModel();

		model.addAttribute("username", (String) session.getAttribute("username"));
		model.addAttribute("PhoneByBrand", adminService.getJsonPhoneByBrand());
		model.addAttribute("product", p);
		model.addAttribute("allcolor", listAllColorString);
		model.addAttribute("selectedcolor", l2);

		return "edit-product";
	}

	@RequestMapping(value = "/update-product")
	public String updateProduct(@RequestParam("files") MultipartFile[] files, @ModelAttribute ProductValueModel product,
			HttpSession session, Model model) throws IllegalStateException, IOException {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}

		model.addAttribute("username", (String) session.getAttribute("username"));
		String[] phones = product.device.split("\\|", -1);
		String[] colors = product.color.split("\\|", -1);
		List<String> listSelectedPhone = adminService.convertArrayToList(phones);
		List<String> listSelectedColor = adminService.convertArrayToList(colors);

		String path = Paths.get("").toFile().getAbsolutePath();

		// path + "/src/main/resources/static/temp/a.png"
		if (adminService.getIdBrandByNameBrand(product.phonebrand) == -1) {
			// add new phone brand and phone

			if (adminService.addNewPhoneBrand(product.phonebrand) == 0) {
				return "redirect:/admin/dashboard";
			}

			for (String s : listSelectedPhone) {
				adminService.addNewPhone(s);
			}

		}

		int idproduct = product.idproduct;
		if (product.idproduct == 0) {
			// add new product
			idproduct = adminService.addNewProduct(product);
			if (idproduct == 0) {
				return "redirect:/admin/dashboard";
			}

		} else {
			// just editting
			if (adminService.updateProduct(product) == 0) {
				return "redirect:/admin/dashboard";
			}

		}

		if (idproduct != 0) {
			if (adminService.deleteOldColor(idproduct) >= 0) {
				for (String s : listSelectedColor) {
					adminService.addNewColor(idproduct, s);
				}
			}
			if (adminService.deleteOldDevice(idproduct) >= 0) {
				for (String s : listSelectedPhone) {
					adminService.addNewDevice(idproduct, adminService.getIdPhoneByName(s));
				}
			}
			if (files.length > 0) {
				for (int i = 0; i < files.length; i++) {
					files[i].transferTo(
							new File(path + "/src/main/resources/static/imageCase/" + files[i].getOriginalFilename()));
					adminService.addNewImage(files[i].getOriginalFilename(), idproduct);
				}
			}
		}

		return "redirect:/admin/dashboard";
	}

	@GetMapping("/admin/detail-order&id={id}")
	public String detailorder(@PathVariable String id, Model model, HttpSession session) {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}

		OrderHistoryModel ord = new OrderHistoryModel();
		List<OrderHistoryModel> list = adminService.getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = adminService.getInfoOrderByIdOrder(Integer.parseInt(id));
		model.addAttribute("username", (String) session.getAttribute("username"));
		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "detail-order";
	}

	@GetMapping("/change-to-shipping&id={id}")
	public String changeToShipping(@PathVariable String id, Model model, HttpSession session) {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}

		adminService.updateDeliveryStatus(2, Integer.parseInt(id), false);

		OrderHistoryModel ord = new OrderHistoryModel();
		List<OrderHistoryModel> list = adminService.getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = adminService.getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "redirect:/admin/detail-order&id=" + id;
	}

	boolean updated = false;

	@GetMapping("/change-to-accept&id={id}")
	public String changeToAccept(@PathVariable String id, Model model, HttpSession session) {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}

		List<OrderHistoryModel> list = adminService.getAllOrderHistoryByIdOrder(Integer.parseInt(id));

		list.forEach(item -> {
			if (item.idorder == Integer.parseInt(id) && item.methodpayment.equals("COD")) {
				adminService.updateDeliveryStatus(0, Integer.parseInt(id), true);
				updated = true;
			}
		});
		if (!updated) {
			adminService.updateDeliveryStatus(3, Integer.parseInt(id), false);
		}

		OrderHistoryModel ord = new OrderHistoryModel();
		list = adminService.getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = adminService.getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "redirect:/admin/detail-order&id=" + id;
	}

	@GetMapping("/change-to-decline&id={id}")
	public String changeToDecline(@PathVariable String id, Model model, HttpSession session) {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}

		adminService.updateDeliveryStatus(4, Integer.parseInt(id), false);

		OrderHistoryModel ord = new OrderHistoryModel();
		List<OrderHistoryModel> list = adminService.getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = adminService.getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "redirect:/admin/detail-order&id=" + id;
	}

	@GetMapping("/change-to-payed&id={id}")
	public String changeToPayed(@PathVariable String id, Model model, HttpSession session) {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}

		adminService.updatePaymentStatus(Integer.parseInt(id));

		OrderHistoryModel ord = new OrderHistoryModel();
		List<OrderHistoryModel> list = adminService.getAllOrderHistoryByIdOrder(Integer.parseInt(id));
		if (list.size() > 0) {
			ord = list.get(0);
		}

		List<InfoOrderModel> listInfo = adminService.getInfoOrderByIdOrder(Integer.parseInt(id));

		model.addAttribute("infoorder", listInfo);
		model.addAttribute("order", ord);
		return "redirect:/admin/detail-order&id=" + id;
	}

	@GetMapping("/delete-product&id={id}")
	public String deleteProduct(@PathVariable String id, HttpSession session) {
		if (!adminService.islogedIn(session)) {
			return "redirect:/admin/login";
		}
		adminService.deleteProduct(Integer.parseInt(id));
		return "redirect:/admin/all-product";
	}

	@GetMapping("/sign-out")
	public String signOut(HttpSession session) {
		session.setAttribute("username", null);
		return "redirect:/admin/login";
	}

}
