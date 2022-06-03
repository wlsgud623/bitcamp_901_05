package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.RecipeDto;
import data.service.RecipeService;

@Controller
@RequestMapping("/ranking")
public class RankingController {


	@Autowired
	private RecipeService recipeService;
	
	@GetMapping(value = {"/ranking", "/recom_ranking"})
	public ModelAndView recommendRanking(@RequestParam(defaultValue = "1") int currentPage) {
		ModelAndView mView = new ModelAndView();
		
		int perPage = 9;
		int perBlock = 5;
		int totalcount; // 모든 레시피 수
		int totalPage; // 총 페이지수
		int startNum; //현 페이지에서 보여질 시작 글번호
		int startPage; //한 블럭에서 보여질 시작 페이지 번호
		int endPage; // 한 블럭에서 보여질 끝 페이지 번호
		int no;
		
		totalcount = recipeService.getTotalCount();
		totalPage = totalcount/perPage + (totalcount%perPage==0?0:1);
		
		startPage = 1 + ((currentPage-1) / perBlock) * perBlock;
		endPage = (startPage + perBlock-1 > totalPage? totalPage:startPage + perBlock - 1);
		
		startNum = (currentPage-1) * perPage;
		no = totalcount - (currentPage-1) * perPage;
		
	
		if (currentPage ==1) {
			List<RecipeDto> list = recipeService.getRankingList(startNum,perPage + 3);
			mView.addObject("list", list);
		}
		else {
			List<RecipeDto> list = recipeService.getRankingList(startNum + 3, perPage);
			mView.addObject("list", list);
		}
		
		mView.addObject("totalcount", totalcount);
		mView.addObject("currentPage", currentPage);
		mView.addObject("totalPage", totalPage);
		mView.addObject("startPage", startPage);
		mView.addObject("endPage", endPage);
		mView.addObject("no", no);
		mView.setViewName("/ranking/ranking");
		return mView;
	}
	
	@GetMapping("/view_ranking")
	public ModelAndView viewRanking(@RequestParam(defaultValue = "1") int currentPage) {
		ModelAndView mView = new ModelAndView();
		
		int perPage = 9;
		int perBlock = 5;
		int totalcount; // 모든 레시피 수
		int totalPage; // 총 페이지수
		int startNum; //현 페이지에서 보여질 시작 글번호
		int startPage; //한 블럭에서 보여질 시작 페이지 번호
		int endPage; // 한 블럭에서 보여질 끝 페이지 번호
		int no;
		
		totalcount = recipeService.getTotalCount();
		totalPage = totalcount/perPage + (totalcount%perPage==0?0:1);
		
		startPage = 1 + ((currentPage-1) / perBlock) * perBlock;
		endPage = (startPage + perBlock-1 > totalPage? totalPage:startPage + perBlock - 1);
		
		startNum = (currentPage-1) * perPage;
		no = totalcount - (currentPage-1) * perPage;
	
		if (currentPage ==1) {
			List<RecipeDto> list = recipeService.getViewRankingList(startNum,perPage + 3);
			mView.addObject("list", list);
		}
		else {
			List<RecipeDto> list = recipeService.getViewRankingList(startNum + 3, perPage);
			mView.addObject("list", list);
		}
		
		mView.addObject("totalcount", totalcount);
		mView.addObject("currentPage", currentPage);
		mView.addObject("totalPage", totalPage);
		mView.addObject("startPage", startPage);
		mView.addObject("endPage", endPage);
		mView.addObject("no", no);
		mView.setViewName("/ranking/viewranking");
		return mView;
	}
	
	@GetMapping("/new_ranking")
	public ModelAndView newRanking(@RequestParam(defaultValue = "1") int currentPage) {
		ModelAndView mView = new ModelAndView();
		
		int perPage = 9;
		int perBlock = 5;
		int totalcount; // 모든 레시피 수
		int totalPage; // 총 페이지수
		int startNum; //현 페이지에서 보여질 시작 글번호
		int startPage; //한 블럭에서 보여질 시작 페이지 번호
		int endPage; // 한 블럭에서 보여질 끝 페이지 번호
		int no;
		
		totalcount = recipeService.getTotalCount();
		totalPage = totalcount/perPage + (totalcount%perPage==0?0:1);
		
		startPage = 1 + ((currentPage-1) / perBlock) * perBlock;
		endPage = (startPage + perBlock-1 > totalPage? totalPage:startPage + perBlock - 1);
		
		startNum = (currentPage-1) * perPage;
		no = totalcount - (currentPage-1) * perPage;
		
		List<RecipeDto> list = recipeService.getNewRankingList(startNum,perPage);
		mView.addObject("list", list);
		
		mView.addObject("totalcount", totalcount);
		mView.addObject("currentPage", currentPage);
		mView.addObject("totalPage", totalPage);
		mView.addObject("startPage", startPage);
		mView.addObject("endPage", endPage);
		mView.addObject("no", no);
		mView.setViewName("/ranking/newranking");
		return mView;
	}
	
	  
}
