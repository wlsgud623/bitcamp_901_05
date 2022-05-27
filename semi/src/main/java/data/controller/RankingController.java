package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.RecipeDto;
import data.service.RecipeService;

@Controller
@RequestMapping("/ranking")
public class RankingController {


	@Autowired
	private RecipeService recipeService;
	
	@GetMapping(value = {"/ranking", "/recom_ranking"})
	public ModelAndView recommendRanking() {
		ModelAndView mView = new ModelAndView();
		
		List<RecipeDto> list = recipeService.getRankingList(0, 10);
		int curStartPage = 1;
		int curEndPage = 5;
		
		mView.addObject("list", list);
		mView.addObject("curStartPage", curStartPage);
		mView.addObject("cureEndPage", curEndPage);	
		mView.setViewName("/ranking/ranking");
		return mView;
	}
	
	@GetMapping("/view_ranking")
	public ModelAndView viewRanking() {
		ModelAndView mView = new ModelAndView();
		
		List<RecipeDto> list = recipeService.getRankingList(0, 10);
		mView.addObject("list", list);
		mView.setViewName("/ranking/ranking");
		return mView;
	}
	
	@GetMapping("/new_ranking")
	public ModelAndView newRanking() {
		ModelAndView mView = new ModelAndView();
		
		List<RecipeDto> list = recipeService.getRankingList(0, 10);
		mView.addObject("list", list);
		mView.setViewName("/ranking/ranking");
		return mView;
	}
	
	  
}
