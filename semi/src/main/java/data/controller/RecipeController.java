package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {
	
	@GetMapping("/detail")
	public String recipe() {
		return "/recipe/detail";
	}
}
