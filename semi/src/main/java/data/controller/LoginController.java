package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@GetMapping("/login")
	public String login()
	{
		return "/sign/login/login";
	}
	
	@GetMapping("/aftersignup_login")
	public String aftersignup_login()
	{
		return "/sign/login/aftersignup_login";
	}
}
