package edu.hutech.Icase.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import edu.hutech.Icase.Model.AdminModel;

@Controller
public class AdminControler {

	@GetMapping("/admin/login")
	public String adminLogin() {
		return "login";
	}

	@PostMapping(path = "checkLogin")
	public String checkLogin(AdminModel admin) {

		if (admin.getUserName().equals("admin") && admin.getPassword().equals("anhducle")) {
			return "redirect:/home";
		} else {
			return "redirect:/admin/login";
		}

	}

	@GetMapping("/test")
	public void test() {

	}
}
