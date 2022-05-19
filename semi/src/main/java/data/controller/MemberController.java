package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class MemberController {

		@GetMapping("/signup")
		public String signup()
		{
			return "/sign/login/signup";
		}
}
