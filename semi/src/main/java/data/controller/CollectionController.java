package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.dto.RecipeDto;
import data.service.RecipeService;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	@Autowired
	private RecipeService recipeService;
	
	@GetMapping("/category")
	public ModelAndView collection(@RequestParam @Nullable String category, @RequestParam @Nullable String item, @RequestParam(defaultValue = "1") int currentPage) {
		ModelAndView mView = new ModelAndView();
		
		int perPage = 9;
		int perBlock = 5;
		int totalcount; // 모든 레시피 수
		int totalPage; // 총 페이지수
		int startNum; //현 페이지에서 보여질 시작 글번호
		int startPage; //한 블럭에서 보여질 시작 페이지 번호
		int endPage; // 한 블럭에서 보여질 끝 페이지 번호
		int no;
		
		if(category != null) {
			mView.addObject("category", category);
		}
	
		if (item != null) {
			totalcount = recipeService.getCategoryCount(category, item);
			mView.addObject("item", item);
		}
		else {
			totalcount = recipeService.getTotalCount();
		}
		
		totalPage = totalcount/perPage + (totalcount%perPage==0?0:1);
		
		startPage = 1 + ((currentPage-1) / perBlock) * perBlock;
		endPage = (startPage + perBlock-1 > totalPage? totalPage:startPage + perBlock - 1);
		
		startNum = (currentPage-1) * perPage;
		no = totalcount - (currentPage-1) * perPage;
		
		List<RecipeDto> list = null;
		if (item != null) {
			list = recipeService.getCategoryList(category, item, startNum, perPage);
		}
		else {
			list = recipeService.getRecipeList(startNum, perPage);
		}
		
		mView.addObject("list", list);
		mView.addObject("currentPage", currentPage);
		mView.addObject("totalPage", totalPage);
		mView.addObject("startPage", startPage);
		mView.addObject("endPage", endPage);
		mView.addObject("no", no);
		mView.setViewName("/collection/category");
		return mView;
	}
	
	@GetMapping("/list")
	@ResponseBody
	public List<RecipeDto> categoryList(@RequestParam String category, @RequestParam String item, @RequestParam(defaultValue = "1") int currentPage){
		int perPage = 12;
		int startNum = (currentPage-1) * perPage;
		
		List<RecipeDto> list = recipeService.getCategoryList(category, item, startNum, perPage);
		return list;
	}
}
