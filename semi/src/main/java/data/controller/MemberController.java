package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.dto.UserDto;
import data.mapper.MemberMapperInter;
import data.service.MemberService;

@Controller
@RequestMapping("/login")
public class MemberController {
	
		@Autowired
		private MemberService service;
	
		@Autowired
		private MemberMapperInter memberMapperInter;

		@GetMapping("/signup")
		public String signup()
		{
			return "/sign/login/signup";
		}
		
		
		@PostMapping("/insert")
		public String insert(@ModelAttribute UserDto dto,
				@RequestParam String email1, @RequestParam String email2) 
		{
				dto.setEmail(email1 + "@" + email2);
				service.insertMember(dto);
				
				return "redirect:aftersignup_login"; // 회원가입을 완료하면 로그인 페이지로 이동
		}
		
}
