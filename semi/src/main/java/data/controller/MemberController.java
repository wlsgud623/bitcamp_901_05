package data.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.dto.UserDto;
import data.mapper.MemberMapperInter;
import data.service.MemberService;


@Controller
@RequestMapping("/member")
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
		
		@GetMapping("/aftersignup_login")
		public String aftersignup_login()
		{
			
			return "/sign/login/aftersignup_login";
		}
	
		@PostMapping("/insert")
		public String insert(@ModelAttribute UserDto dto,
				@RequestParam String email1, @RequestParam String email2,
				@RequestParam String address1, @RequestParam String address2,
				Model model) 
		{
				dto.setEmail(email1 + "@" + email2);
				dto.setAddress(address1 + "," + address2);
				service.insertMember(dto);
				String name=dto.getName();
				model.addAttribute("name", name);
				return "/sign/login/aftersignup_login"; // 회원가입을 완료하면 로그인 페이지로 이동
		}
		
		@GetMapping("/idcheck")
		@ResponseBody
		public Map<String, Integer> getSearchId(@RequestParam String UserID)
		{
			Map<String, Integer> map = new HashMap<>();
			int n = memberMapperInter.getSearchId(UserID);
			map.put("count", n);
			return map;
			
		}  
		
}
