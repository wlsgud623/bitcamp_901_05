package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import data.mapper.TestMapperInter;

@Controller
public class TestController {
	
	@Autowired
	TestMapperInter mapper;

	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("num", mapper.num());
		return "/home/main";
	}
	
}
