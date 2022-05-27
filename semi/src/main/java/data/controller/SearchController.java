package data.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;

import data.service.RecipeService;

@Controller

public class SearchController {

	@Autowired
	private RecipeService recipeService;
	
	@GetMapping("/search")
	public String search(@RequestParam String research , Model model) {
	List<Integer> list = new Vector<>();
	list = recipeService.searchRecipe(research); //sql결과값을 넣음
	int tot=list.size(); //총갯수 int 형태
	model.addAttribute("list",list);
	model.addAttribute("tot", tot);
	model.addAttribute("research",research);
	
	
	
		
		return ("/collection/collection");
	}	
}
