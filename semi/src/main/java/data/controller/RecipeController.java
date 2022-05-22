package data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.dto.CommentDto;
import data.dto.RecipeDto;
import data.dto.StepsDto;
import data.inter.CommentServiceInter;
import data.service.CommentService;
import data.service.RecipeService;
import data.service.StepsService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
	

	@Autowired
	private RecipeService recipeService;

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private StepsService stepsService;

	@GetMapping("/detail") // 디테일 페이지
	public ModelAndView showRecipe(@RequestParam int idx) {
		ModelAndView mView = new ModelAndView();
		
		recipeService.addView(idx); // 조회수 증가
		
		RecipeDto dto = recipeService.getRecipe(idx);
		List<StepsDto> steps = stepsService.getStepList(idx);
		List<CommentDto> comments = commentService.getAllComment(idx);
		
		mView.addObject("dto", dto);
		mView.addObject("steps", steps);
		mView.addObject("comments", comments);
		mView.setViewName("/recipe/detail");
		return mView;
	}
	
	/*
	//스크랩, 추천, 평점
	@PostMapping("/scrap") // 레시피 스크랩
	public void scrapRecipe(@RequestParam int idx
			//, @RequestParam String id
			) {
		//스크랩 기능 구현
	}
	
	*/
	@PostMapping("/addrecom") //레시피 추천
	@ResponseBody
	public Map<String, Integer> addRecommend(@RequestParam int idx) {
		recipeService.addRecommend(idx);
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int recom = recipeService.getRecipeRec(idx);
		map.put("recom", recom);
		return map;
	}
	
	@PostMapping("/addrate") //레시피 평점 추가
	@ResponseBody
	public Map<String, Integer> addRate(@RequestParam int idx, @RequestParam int rate) {
		recipeService.addRate(idx, rate);
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int currate = recipeService.getRecipeRate(idx);
		int volunteer = recipeService.getRecipeVolunteer(idx);
		
		map.put("rate", currate);
		map.put("volunteer", volunteer);
		
		return map;
	}
	
	//수정, 삭제
	@GetMapping("/updateform") // 레시피 수정 화면으로 이동
	public ModelAndView updateform(@RequestParam int idx) {
		ModelAndView mView = new ModelAndView();
		RecipeDto dto = recipeService.getRecipe(idx);
		mView.addObject("dto", dto);
		mView.setViewName("/recipe/updateform");
		return mView;
	}
	
	@PostMapping("/update") //레시피 수정
	public String updateRecipe(@ModelAttribute RecipeDto dto) {
		recipeService.updateRecipe(dto);
		return "/detail?idx=" + dto.getRECIPE_IDX();
	}
	
	@GetMapping("/delete") //레시피 삭제
	public String deleteRecipe(@RequestParam int idx) {
		recipeService.deleteRecipe(idx);
		return "../collection/collection";
	}
	
	//comment
	@PostMapping("/addcom") //후기 추가
	public void addComment(@ModelAttribute CommentDto dto) {
		commentService.insertComment(dto);
	}
	
	@PostMapping("/delcom") // 후기 삭제
	public void deleteComment(@RequestParam int num) {
		commentService.deleteComment(num);
	}
}
