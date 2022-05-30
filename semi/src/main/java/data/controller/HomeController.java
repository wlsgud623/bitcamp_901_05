package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.RecipeDto;
import data.service.RecipeService;

@Controller
public class HomeController {
	
	@Autowired
	private RecipeService recipeService;
	
	
	@GetMapping("/")
	public ModelAndView list()
	{
		ModelAndView mView = new ModelAndView();
		
		List<RecipeDto> list = recipeService.getAllRecipe();
		mView.addObject("list", list);
		mView.setViewName("/home/main");
		return mView;
	}

}
