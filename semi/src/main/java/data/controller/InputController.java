package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.RecipeDto;

@Controller
public class InputController {

	@GetMapping("/input")
	public String input() {
		return "/recipe/input";
	}
	
	@PostMapping("/insert")
	public ModelAndView insert(@ModelAttribute RecipeDto dto) {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("/"); //mypage로 포워드 할 예정
		return mav;
	}
}
