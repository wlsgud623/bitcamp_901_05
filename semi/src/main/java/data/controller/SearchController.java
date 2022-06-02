package data.controller;

import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.dto.RecipeDto;
import data.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	
	@GetMapping("/search")
	public String search(@RequestParam String research,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model) {
		
		int totalCount=service.getTotalCount(research);
		int perPage=9;
		int startNum=(currentPage-1)*perPage;
		
		List<RecipeDto> list = new Vector<>();
		list = service.searchRecipe(research, startNum, perPage);
		
		int perBlock=5;
		int totalPage=(int)Math.ceil((double)totalCount/perPage);
		int startPage=((currentPage-1)/perBlock)*perBlock+1;
		int endPage=(startPage+perBlock-1)<totalPage?(startPage+perBlock-1):totalPage;
		
		model.addAttribute("list", list);
		model.addAttribute("tot", totalCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startNum", startNum);
		model.addAttribute("research", research);
		
		return ("/collection/search");
	}
	
	@GetMapping("/searchauto")
	@ResponseBody
	public List<String> searchAuto(@RequestParam String searchWord) {
		List<String> list=new Vector<>();
		list=service.searchAuto(searchWord);
		return list;
	}
	
}
