package edu.hutech.Icase.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/home")
	public String home() {
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
	public String giohang() {
		return "giohang";
	}

	@GetMapping("/giohang+thanhtoan")
	public String giohang2() {
		return "giohangvathanhtoan";

	}

	@GetMapping("/newdescription")
	public String newdes() {
		return "newdescription";
	}
//	gelloasdaga
	@GetMapping("/product")
	public String product() {
		return "product";
	}

	@GetMapping("/search")
	public String search() {
		return "search";
	}

}
