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
	






	@GetMapping("/giohang+thanhtoan")
	public String giohang2() {
		return "giohangvathanhtoan";

	}

	@GetMapping("/newdescription")
	public String newdes() {
		return "newdescription";
	}

	@GetMapping("/search")
	public String search() {
		return "search";
	}
	//dhshdashdjkas

}
