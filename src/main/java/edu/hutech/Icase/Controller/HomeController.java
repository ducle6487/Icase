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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.hutech.Icase.Model.Case;
import edu.hutech.Icase.Model.Color;
import edu.hutech.Icase.Model.Device;
import edu.hutech.Icase.Model.GioHang;
import edu.hutech.Icase.Model.Image;
import edu.hutech.Icase.Model.MethodPayment;
import edu.hutech.Icase.Model.PhoneBrand;
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
		model.addAttribute("phonebrands", phonebrands);
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
			model.addAttribute("cartcount", GioHang.cart.size());
			model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
			model.addAttribute("cart", GioHang.cart);
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

	@GetMapping("/ContactUs")
	public String Contactus() {
		return "contactus";
	}

	@RequestMapping(value = "/giohang+thanhtoan", method = RequestMethod.GET)
	public String giohangthanhtoan(@RequestParam(value = "sl", required = false) String[] sl, Model model) {
		List<String> a = new ArrayList<String>();
		List<String> test = Arrays.asList(sl);
		System.out.print(test.get(0));
		System.out.print(test.size());
		// for(int i=1;i<test.size()-1;i++) {
		// String c=(test.get(i));
		// a.add(c);
		// System.out.println(test.get(i));
		// }
		int cartship = 30000;
		if (GioHang.cart.size() <= 0) {
			model.addAttribute("message", "Giỏ Hàng Của Bạn Đang Trống Nên Không Thể Thanh Toán ");
			return "giohangvathanhtoan2";
		}
		List<MethodPayment> methodpayments = jdbctemplate.query("select * from methodpayment",
				BeanPropertyRowMapper.newInstance(MethodPayment.class));
		String[] stringarray = new String[] { "Bình Chánh", "Bình Tân", "Bình Thạnh", "Cần Giờ", "Củ Chi", "Gò Vấp",
				"Hóc Môn", "Nhà Bè", "Phú Nhuận", "Quận 1", "Quận 10", "Quận 11", "Quận 12", "Quận 3", "Quận 4",
				"Quận 9", "Quận 2", "Quận 5", "Quận 6", "Quận 7", "Quận 8", "Thủ Đức", "Tân Bình", "Tân Phú" };
		String[] stringarray2 = new String[] { "Ba Đình", "Ba Vì", "Bắc Từ Liêm", "Cầu Giấy", "Chương Mỹ", "Đan Phượng",
				"Đông Anh", "Đống Đa", "Gia Lâm", "Hà Đông", "Hai Bà Trưng", "Hoài Đức", "Hoàn Kiếm", "Hoàng Mai",
				"Long Biên", "Mê Linh", "Mỹ Đức", "Nam Từ Liêm", "Phú Xuyên", "Phúc Thọ", "Quốc Oai", "Sóc Sơn",
				"Sơn Tây", "Tây Hồ", "Thạch Thất", "Thanh Oai", "Thanh Trì", "Thanh Xuân", "Thường Tín", "Ứng Hòa" };
		String[] stringarray3 = new String[] { "Bàu Bàng", "Bến Cát", "Dầu Tiếng", "Tân Uyên", "Dĩ An", "Phú Giáo",
				"Thủ Dầu Một", "Thuận An" };

		String[] stringarray4 = new String[] { "Cẩm Lệ", "Hải Châu", "Hòa Vang", "Hoàng Sa", "Liên Chiểu",
				"Ngũ Hành Sơn", "Sơn Trà", "Thanh Khê" };

		String[] stringarray6 = new String[] { "Bến Lức", "Cần Đước", "Cần Giuộc", "Châu Thành", "Đức Hòa", "Đức Huệ",
				"Kiến Tường", "Mộc Hóa", "Tân An", "Tân Hưng", "Tân Thạnh", "Tân Trụ", "Thạnh Hóa", "Thủ Thừa",
				"Vĩnh Hưng" };

		String[] stringarray5 = new String[] { "An Dương", "An Lão", "Bạch Long Vĩ", "Cát Hải", "Đồ Sơn", "Dương Kinh",
				"Hải An", "Hồng Bàng", "Kiến An", "Kiến Thụy", "Lê Chân", "Ngô Quyền", "Thủy Nguyên", "Tiên Lãng",
				"Vĩnh Bảo" };

		String[] stringarray7 = new String[] { "Bà Rịa", "Châu Đức", "Côn Đảo", "Đất Đỏ", "Long Điền", "Tân Thành",
				"Vũng Tàu", "Xuyên Mộc" };

		String[] stringarray8 = new String[] { "An Phú", "Châu Đốc", "Châu Phú", "Châu Thành", "Chợ Mới", "Long Xuyên",
				"Phú Tân", "Tân Châu", "Thoại Sơn", "Tịnh Biên", "Tri Tôn" };

		String[] stringarray9 = new String[] { "Bắc Giang", "Hiệp Hòa", "Lạng Giang", "Lục Nam", "Lục Ngạn", "Sơn Động",
				"Tân Yên", "Việt Yên", "Yên Dũng", "Yên Thế" };

		String[] stringarray10 = new String[] { "Ba Bể", "Bắc Kạn", "Bạch Thông", "Chợ Đồn", "Chợ Mới", "Na Rì",
				"Ngân Sơn", "Pác Nặm" };

		String[] stringarray11 = new String[] { "Bạc Liêu", "Đông Hải", "Giá Rai", "Hòa Bình", "Hồng Dân", "Phước Long",
				"Vĩnh Lợi" };

		String[] stringarray12 = new String[] { "Bắc Ninh", "Gia Bình", "Quế Võ", "Thuận Thành", "Lương Tài", "Tiên Du",
				"Từ Sơn", "Yên Phong" };

		String[] stringarray13 = new String[] { "Ba Tri", "Bến Tre", "Bình Đại", "Châu Thành", "Chợ Lách", "Giồng Trôm",
				"Mỏ Cày Bắc", "Mỏ Cày Nam", "Thạnh Phú" };

		String[] stringarray14 = new String[] { "An Lão", "An Nhơn", "Hoài Ân", "Phù Mỹ", "Phù Cát", "Hoài Nhơn",
				"Quy Nhơn", "Tây Sơn", "Tuy Phước", "Vân Canh", "Vĩnh Thạnh" };

		String[] stringarray15 = new String[] { "Bình Long", "Bù Đăng", "Bù Đốp", "Bù Gia Mập", "Chơn Thành",
				"Đồng Phú", "Đồng Xoài", "Hớn Quản", "Lộc Ninh", "Phú Riềng", "Phước Long" };

		String[] stringarray16 = new String[] { "Bắc Bình", "Đảo Phú Quý", "Đức Linh", "Hàm Thuận Bắc", "Hàm Thuận Nam",
				"Hàm Tân", "La Gi", "Phan Thiết", "Tánh Linh", "Tuy Phong" };

		String[] stringarray17 = new String[] { "Cà Mau", "Cái Nước", "Đầm Dơi", "Năm Căn", "Ngọc Hiển", "Phú Tân",
				"Thới Bình", "Trần Văn Thời", "U Minh" };

		String[] stringarray18 = new String[] { " Thới Lai", "Bình Thủy", "Cái Răng", "Ô Môn", "Cờ Đỏ", "Phong Điền",
				"Ninh Kiều", "Thốt Nốt", "Vĩnh Thạnh" };

		String[] stringarray19 = new String[] { "Bảo Lạc", "Bảo Lâm", "Cao Bằng", "Hạ Lang", "Hà Quảng", "Hòa An",
				"Nguyên Bình", "Phục Hòa", "Quảng Uyên", "Thạch An", "Thông Nông", "Trà Lĩnh", "Trùng Khánh" };

		String[] stringarray20 = new String[] { "Buôn Đôn", "Buôn Hồ", "Buôn Ma Thuột", "Cư Kuin", "Ea Kar", "Ea Súp",
				"Krông Ana", "Krông Bông", "Krông Buk", "Krông Năng", "Krông Pắc", "Lăk" };

		String[] stringarray21 = new String[] { "Điện Biên", "Điện Biên Đông", "Mường Ảng", "Mường Chà", "Mường Lay",
				"Điện Biên Phủ", "Mường Nhé", "Nậm Pồ", "Tủa Chùa", "Tuần Giáo" };

		String[] stringarray22 = new String[] { "Biên Hòa", "Cẩm Mỹ", "Định Quán", "Long Thành", "Nhơn Trạch",
				"Long Khánh", "Tân Phú", "Thống Nhất", "Trảng Bom", "Vĩnh Cửu", "Xuân Lộc" };

		String[] stringarray23 = new String[] { "Châu Thành", "Huyện Cao Lãnh", "Huyện Hồng Ngự", "Lai Vung", "Lấp Vò",
				"Sa Đéc", "Tam Nông", "Tân Hồng", "Thanh Bình", "Tháp Mười", "Thị xã Hồng Ngự", "Tp. Cao Lãnh" };

		String[] stringarray24 = new String[] { "An Khê", "AYun Pa", "Chư Păh", "Chư Pưh", "Chư Sê", "ChưPRông",
				"Đăk Đoa", "Đăk Pơ" };

		String[] stringarray25 = new String[] { "Bắc Mê", "Bắc Quang", "Đồng Văn", "Hà Giang", "Hoàng Su Phì",
				"Mèo Vạc", "Quản Bạ", "Quang Bình", "Vị Xuyên", "Xín Mần", "Yên Minh" };

		String[] stringarray26 = new String[] { "Bình Lục", "Duy Tiên", "Kim Bảng", "Lý Nhân", "Phủ Lý", "Thanh Liêm" };

		String[] stringarray27 = new String[] { "Cẩm Xuyên", "Can Lộc", "Đức Thọ", "Hà Tĩnh", "Hồng Lĩnh", "Hương Khê",
				"Hương Sơn", "Kỳ Anh", "Lộc Hà", "Nghi Xuân", "Thạch Hà", "Vũ Quang" };

		String[] stringarray28 = new String[] { "Bình Giang", "Cẩm Giàng", "Chí Linh", "Gia Lộc", "Kim Thành",
				"Kinh Môn", "Hải Dương", "Nam Sách", "Ninh Giang", "Thanh Hà", "Thanh Miện", "Tứ Kỳ" };

		String[] stringarray29 = new String[] { "Châu Thành", "Châu Thành A", "Long Mỹ", "Ngã Bảy", "Phụng Hiệp",
				"Vị Thanh", "Vị Thủy" };

		String[] stringarray30 = new String[] { "Cao Phong", "Đà Bắc", "Hòa Bình", "Kim Bôi", "Kỳ Sơn", "Lạc Sơn",
				"Lạc Thủy", "Lương Sơn", "Mai Châu", "Tân Lạc", "Yên Thủy" };

		String[] stringarray31 = new String[] { "Ân Thi", "Hưng Yên", "Khoái Châu", "Mỹ Hào", "Kim Động", "Phù Cừ",
				"Tiên Lữ", "Văn Giang", "Văn Lâm", "Yên Mỹ" };

		String[] stringarray32 = new String[] { "Cam Lâm", "Cam Ranh", "Diên Khánh", "Khánh Sơn", "Khánh Vĩnh",
				"Nha Trang", "Ninh Hòa", "Trường Sa", "Vạn Ninh" };

		String[] stringarray33 = new String[] { "An Biên", "An Minh", "Châu Thành", "Giang Thành", "Giồng Riềng",
				"Gò Quao", "Hà Tiên", "Kiên Hải", "Hòn Đất", "Kiên Lương", "Phú Quốc", "Rạch Giá", "Tân Hiệp",
				"U minh Thượng", "Vĩnh Thuận" };

		String[] stringarray34 = new String[] { "Đăk Glei", "Đăk Hà", "Kon Rẫy", "Đăk Tô", "Kon Plông", "KonTum",
				"Ngọc Hồi", "Sa Thầy", "Tu Mơ Rông" };

		String[] stringarray35 = new String[] { "Lai Châu", "Mường Tè", "Nậm Nhùn", "Phong Thổ", "Sìn Hồ", "Tam Đường",
				"Tân Uyên", "Than Uyên" };

		String[] stringarray36 = new String[] { "Bảo Lâm", "Bảo Lộc", "Cát Tiên", "Đam Rông", "Đạ Tẻh", "Đà Lạt",
				"Di Linh", "Đạ Huoai", "Đơn Dương", "Đức Trọng", "Lạc Dương", "Lâm Hà" };

		String[] stringarray37 = new String[] { "Bắc Sơn", "Bình Gia", "Cao Lộc", "Chi Lăng", "Đình Lập", "Lạng Sơn",
				"Hữu Lũng", "Lộc Bình", "Tràng Định", "Văn Lãng", "Văn Quan" };

		String[] stringarray38 = new String[] { "Bắc Hà", "Bảo Thắng", "Lào Cai", "Bát Xát", "Bảo Yên", "Mường Khương",
				"Sa Pa", "Văn Bàn", "Xi Ma Cai" };

		String[] stringarray39 = new String[] { "Giao Thủy", "Hải Hậu", "Mỹ Lộc", "Trực Ninh", "Nghĩa Hưng", "Nam Trực",
				"Nam Định", "Vụ Bản", "Xuân Trường", "Ý Yên" };

		String[] stringarray40 = new String[] { "Anh Sơn", "Con Cuông", "Cửa Lò", "Diễn Châu", "Đô Lương", "Hoàng Mai",
				"Hưng Nguyên", "Kỳ Sơn", "Nam Đàn", "Nghi Lộc", "Nghĩa Đàn", "Quế Phong", "Quỳ Châu", "Quỳ Hợp",
				"Quỳnh Lưu", "Tân Kỳ", "Thái Hòa", "Thanh Chương", "Tương Dương", "Vinh", "Yên Thành" };

		String[] stringarray41 = new String[] { "Gia Viễn", "Hoa Lư", "Kim Sơn", "Nho Quan", "Ninh Bình", "Tam Điệp",
				"Yên Khánh", "Yên Mô" };

		String[] stringarray42 = new String[] { "Bác Ái", "Ninh Hải", "Ninh Phước", "Ninh Sơn", "Phan Rang - Tháp Chàm",
				"Thuận Bắc", "Thuận Nam" };

		String[] stringarray43 = new String[] { "Cẩm Khê", "Đoan Hùng", "Hạ Hòa", "Lâm Thao", "Phù Ninh", "Phú Thọ",
				"Tam Nông", "Tân Sơn", "Thanh Ba", "Thanh Sơn", "Thanh Thủy", "Việt Trì", "Yên Lập" };

		String[] stringarray44 = new String[] { "Đông Hòa", "Đồng Xuân", "Sơn Hòa", "Sông Cầu", "Sông Hinh", "Phú Hòa",
				"Tây Hòa", "Tuy An", "Tuy Hòa" };

		String[] stringarray45 = new String[] { "Ba Đồn", "Bố Trạch", "Đồng Hới", "Lệ Thủy", "Minh Hóa", "Quảng Ninh",
				"Quảng Trạch", "Tuyên Hóa" };

		String[] stringarray46 = new String[] { "Bắc Trà My", "Đại Lộc", "Điện Bàn", "Đông Giang", "Hiệp Đức",
				"Duy Xuyên", "Hội An", "Nam Giang", "Nam Trà My", "Nông Sơn", "Núi Thành", "Phú Ninh", "Phước Sơn",
				"Quế Sơn", "Tam Kỳ", "Tây Giang", "Thăng Bình", "Tiên Phước" };

		String[] stringarray47 = new String[] { "Ba Tơ", "Bình Sơn", "Đức Phổ", "Lý Sơn", "Minh Long", "Mộ Đức",
				"Nghĩa Hành", "Quảng Ngãi", "Sơn Hà", "Sơn Tây", "Sơn Tịnh", "Tây Trà", "Trà Bồng", "Tư Nghĩa" };

		String[] stringarray48 = new String[] { "Ba Chẽ", "Cẩm Phả", "Bình Liêu", "Cô Tô", "Đầm Hà", "Đông Triều",
				"Hạ Long", "Hải Hà", "Hoành Bồ", "Móng Cái", "Quảng Yên", "Tiên Yên", "Uông Bí", "Vân Đồn" };

		String[] stringarray49 = new String[] { "Cam Lộ", "Đảo Cồn cỏ", "Đăk Rông", "Đông Hà", "Gio Linh", "Hải Lăng",
				"Hướng Hóa", "Quảng Trị", "Triệu Phong", "Vĩnh Linh" };

		String[] stringarray50 = new String[] { "Châu Thành", "Cù Lao Dung", "Mỹ Xuyên", "Mỹ Tú", "Long Phú", "Kế Sách",
				"Ngã Năm", "Sóc Trăng", "Thạnh Trị", "Trần Đề", "Vĩnh Châu" };

		String[] stringarray51 = new String[] { "Mai Sơn", "Bắc Yên", "Mộc Châu", "Mường La", "Quỳnh Nhai", "Phù Yên",
				"Sơn La", "Sông Mã", "Sốp Cộp", "Thuận Châu", "Vân Hồ", "Yên Châu" };

		String[] stringarray52 = new String[] { "Bến Cầu", "Châu Thành", "Gò Dầu", "Dương Minh Châu", "Tân Biên",
				"Hòa Thành", "Tân Châu", "Tây Ninh", "Trảng Bàng" };

		String[] stringarray53 = new String[] { "Đông Hưng", "Thái Bình", "Hưng Hà", "Kiến Xương", "Quỳnh Phụ",
				"Thái Thuỵ", "Tiền Hải", "Vũ Thư" };

		String[] stringarray54 = new String[] { "Định Hóa", "Đại Từ", "Đồng Hỷ", "Phổ Yên", "Phú Lương", "Phú Bình",
				"Sông Công", "Thái Nguyên", "Võ Nhai" };

		String[] stringarray55 = new String[] { "Bá Thước", "Bỉm Sơn", "Cẩm Thủy", "Đông Sơn", "Hà Trung", "Hậu Lộc",
				"Hoằng Hóa", "Lang Chánh", "Mường Lát", "Nga Sơn", "Ngọc Lặc", "Như Thanh", "Như Xuân", "Nông Cống",
				"Quan Hóa", "Quan Sơn", "Quảng Xương", "Sầm Sơn", "Thạch Thành", "Thanh Hóa", "Thiệu Hóa", "Thọ Xuân",
				"Thường Xuân", "Tĩnh Gia", "Triệu Sơn", "Vĩnh Lộc", "Yên Định" };

		String[] stringarray56 = new String[] { "A Lưới", "Hương Thủy", "Phong Điền", "Hương Trà", "Huế", "Nam Đông",
				"Phú Lộc", "Phú Vang", "Quảng Điền" };

		String[] stringarray57 = new String[] { "Cái Bè", "Gò Công Đông", "Chợ Gạo", "Gò Công", "Châu Thành",
				"Gò Công Tây", "Huyện Cai Lậy", "Mỹ Tho", "Tân Phú Đông", "Tân Phước", "Thị Xã Cai Lậy" };

		String[] stringarray58 = new String[] { "Càng Long", "Cầu Ngang", "Cầu Kè", "Duyên Hải", "Tiểu Cần",
				"Châu Thành", "Trà Cú", "Trà Vinh" };

		String[] stringarray59 = new String[] { "Chiêm Hóa", "Sơn Dương", "Na Hang", "Tuyên Quang", "Hàm Yên",
				"Lâm Bình", "Yên Sơn" };

		String[] stringarray60 = new String[] { "Buôn Đôn", "Buôn Hồ", "Buôn Ma Thuột", "Cư Kuin", "Ea Kar", "Ea Súp",
				"Krông Ana", "Krông Bông", "Krông Buk", "Krông Năng", "Krông Pắc", "Lăk" };

		String[] stringarray61 = new String[] { "Điện Biên", "Điện Biên Đông", "Mường Ảng", "Mường Chà", "Mường Lay",
				"Điện Biên Phủ", "Mường Nhé", "Nậm Pồ", "Tủa Chùa", "Tuần Giáo" };

		String[] stringarray62 = new String[] { "Biên Hòa", "Cẩm Mỹ", "Định Quán", "Long Thành", "Nhơn Trạch",
				"Long Khánh", "Tân Phú", "Thống Nhất", "Trảng Bom", "Vĩnh Cửu", "Xuân Lộc" };

		String[] stringarray63 = new String[] { "Châu Thành", "Huyện Cao Lãnh", "Huyện Hồng Ngự", "Lai Vung", "Lấp Vò",
				"Sa Đéc", "Tam Nông", "Tân Hồng", "Thanh Bình", "Tháp Mười", "Thị xã Hồng Ngự", "Tp. Cao Lãnh" };
		List<String> list = Arrays.asList(stringarray);
		List<String> list1 = Arrays.asList(stringarray2);
		List<String> list2 = Arrays.asList(stringarray3);
		List<String> list3 = Arrays.asList(stringarray4);
		List<String> list4 = Arrays.asList(stringarray5);
		List<String> list5 = Arrays.asList(stringarray6);
		List<String> list6 = Arrays.asList(stringarray7);
		List<String> list7 = Arrays.asList(stringarray8);
		List<String> list8 = Arrays.asList(stringarray9);
		List<String> list9 = Arrays.asList(stringarray10);
		List<String> list10 = Arrays.asList(stringarray11);
		List<String> list11 = Arrays.asList(stringarray12);
		List<String> list12 = Arrays.asList(stringarray13);
		List<String> list13 = Arrays.asList(stringarray14);
		List<String> list14 = Arrays.asList(stringarray15);
		List<String> list15 = Arrays.asList(stringarray16);
		List<String> list16 = Arrays.asList(stringarray17);
		List<String> list17 = Arrays.asList(stringarray18);
		List<String> list18 = Arrays.asList(stringarray19);
		List<String> list19 = Arrays.asList(stringarray20);
		List<String> list20 = Arrays.asList(stringarray21);
		List<String> list21 = Arrays.asList(stringarray22);
		List<String> list22 = Arrays.asList(stringarray23);
		List<String> list23 = Arrays.asList(stringarray24);
		List<String> list24 = Arrays.asList(stringarray25);
		List<String> list25 = Arrays.asList(stringarray26);
		List<String> list26 = Arrays.asList(stringarray27);
		List<String> list27 = Arrays.asList(stringarray28);
		List<String> list28 = Arrays.asList(stringarray29);
		List<String> list29 = Arrays.asList(stringarray30);
		List<String> list30 = Arrays.asList(stringarray31);
		List<String> list31 = Arrays.asList(stringarray32);
		List<String> list32 = Arrays.asList(stringarray33);
		List<String> list33 = Arrays.asList(stringarray34);
		List<String> list34 = Arrays.asList(stringarray35);
		List<String> list35 = Arrays.asList(stringarray36);
		List<String> list36 = Arrays.asList(stringarray37);
		List<String> list37 = Arrays.asList(stringarray38);
		List<String> list38 = Arrays.asList(stringarray39);
		List<String> list39 = Arrays.asList(stringarray40);
		List<String> list40 = Arrays.asList(stringarray41);
		List<String> list41 = Arrays.asList(stringarray42);
		List<String> list42 = Arrays.asList(stringarray43);
		List<String> list43 = Arrays.asList(stringarray44);
		List<String> list44 = Arrays.asList(stringarray45);
		List<String> list45 = Arrays.asList(stringarray46);
		List<String> list46 = Arrays.asList(stringarray47);
		List<String> list47 = Arrays.asList(stringarray48);
		List<PhoneBrand> phonebrands = jdbctemplate.query("Select * from phonebrand",
				BeanPropertyRowMapper.newInstance(PhoneBrand.class));
		methodpayments.get(0).setNamemethod(methodpayments.get(0).getNamemethod() + " (Thanh toán khi giao hàng)");
		methodpayments.get(1).setNamemethod(methodpayments.get(1).getNamemethod() + " (Thanh toán bằng MOMO)");
		model.addAttribute("phonebrands", phonebrands);
		model.addAttribute("HoChiMinh", list);
		model.addAttribute("HaNoi", list1);
		model.addAttribute("BinhDuong", list2);
		model.addAttribute("DaNang", list3);
		model.addAttribute("HaiPhong", list4);
		model.addAttribute("LongAn", list5);
		model.addAttribute("BaRia", list6);
		model.addAttribute("AnGiang", list7);
		model.addAttribute("BacGiang", list8);
		model.addAttribute("BacKan", list9);
		model.addAttribute("BacLieu", list10);
		model.addAttribute("BacNinh", list11);
		model.addAttribute("BenTre", list12);
		model.addAttribute("BinhDinh", list13);
		model.addAttribute("BinhPhuoc", list14);
		model.addAttribute("BinhThuan", list15);
		model.addAttribute("CaMau", list16);
		model.addAttribute("CanTho", list17);
		model.addAttribute("CaoBang", list18);
		model.addAttribute("DakLak", list19);
		model.addAttribute("DienBien", list20);
		model.addAttribute("DongNai", list21);
		model.addAttribute("DongThap", list22);
		model.addAttribute("LongAn", list23);
		model.addAttribute("HoChiMinh", list24);
		model.addAttribute("HaNoi", list25);
		model.addAttribute("BinhDuong", list26);
		model.addAttribute("DaNang", list27);
		model.addAttribute("HaiPhong", list28);
		model.addAttribute("LongAn", list29);
		model.addAttribute("methodpayments", methodpayments);
		model.addAttribute("CartTotal", GioHang.cart.stream().mapToDouble(Case::getPrice).sum());
		model.addAttribute("cartship", cartship);
		return "giohangvathanhtoan";
	}

	@PostMapping(path = "thanhtoan")
	public String thanhtoan(User user, Model model) {
		boolean result = false;
		boolean result1 = false;
		String a = user.getAddress() + ",phường" + user.getPhuongxa() + "," + user.getQuanhuyen() + ",TP"
				+ user.getTinhthanh();
		user.setAddress(a);
		double total = GioHang.cart.stream().mapToDouble(Case::getPrice).sum() + 30000;
		char[] value1 = user.getName().toCharArray();
		String value = Integer.toString(user.getNumber());
		char[] value2 = value.toCharArray();
		for (char ch1 : value1) {
			result = Character.isLetter(ch1);
		}
		if (result == false) {
			model.addAttribute("message", "Họ và tên không chứa ký tự đặc biệt hoặc số");
			return "giohangvathanhtoan";
		}
		for (char ch2 : value2) {
			result1 = Character.isDigit(ch2);
		}
		if (result1 == false) {
			model.addAttribute("message", "Số điện thoại không chứa ký tự hoặc ký tự đặc biệt");
			return "giohangvathanhtoan";
		}
		int row = jdbctemplate.update("insert into orders(DateOrder,Total,Name,Phone,Address,Message) values(GETDATE(),"
				+ total + ",N'" + user.getName() + "'," + user.getNumber() + ",N'" + user.getAddress() + "',N'"
				+ user.getMessage() + "')");
		List<User> idorder = jdbctemplate.query("select top 1 IdOrder from orders order by DateOrder DESC",
				BeanPropertyRowMapper.newInstance(User.class));
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
						+ idorder + "," + GioHang.cart.get(i).getIdproduct() + "," + GioHang.cart.get(i).getSl() + ","
						+ totalPrice + ",N'" + GioHang.cart.get(i).getColor() + "'," + device.get(0).getIdphone()
						+ ")");
				GioHang.cart.clear();
			}
			model.addAttribute("message",
					"Hóa Đơn Của Bạn Đã Được Tiếp Nhận Chúng Tôi Sẽ Thông Báo Cho Bạn Qua Email");
			return "giohangvathanhtoan2";
		} else {
			model.addAttribute("message",
					"Hiện tại máy chủ đang có sự cố nên việc mua bán hiện không hoạt động");
			return "giohangvathanhtoan";
		}
	}

	@GetMapping("/newdescription")
	public String newdes() {
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
		List<Color> colors = jdbctemplate.query("select * from color where idproduct=" + getIdproduct + "",
				BeanPropertyRowMapper.newInstance(Color.class));
		List<Image> images = jdbctemplate.query("select top 2 * from image where idproduct= ? order by idimage asc",
				BeanPropertyRowMapper.newInstance(Image.class), product.get(0).getIdproduct());
		product.get(0).setImage1(images.get(0).getName().toString());
		product.get(0).setImage2(images.get(1).getName().toString());
		product.get(0).setColor(colors.get(0).getColor());
		if (GioHang.cart.size() > 0) {
			for (int j = 0; j < count; j++) {
				for (int i = 0; i < product.size(); i++) {
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
