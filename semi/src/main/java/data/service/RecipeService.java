package data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;import org.eclipse.jdt.internal.compiler.ast.LongLiteralMinValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.RecipeDto;
import data.inter.RecipeServiceInter;
import data.mapper.RecipeMapperInter;

@Service
public class RecipeService implements RecipeServiceInter {

	@Autowired
	private RecipeMapperInter recipeMapperInter;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return recipeMapperInter.getTotalCount();
	}

	@Override
	public List<RecipeDto> getAllRecipe() {
		// TODO Auto-generated method stub
		return recipeMapperInter.getAllRecipe();
	}

	@Override
	public List<RecipeDto> getRecipeList(int startnum, int limit) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startnum", startnum);
		map.put("limit", limit);
		return recipeMapperInter.getRecipeList(map);
	}

	@Override
	public RecipeDto getRecipe(int idx) {
		// TODO Auto-generated method stub
		return recipeMapperInter.getRecipe(idx);
	}

	@Override
	public void addRecommend(int idx) {
		// TODO Auto-generated method stub
		recipeMapperInter.addRecommend(idx);
	}
	
	@Override
	public void addRate(int idx, int rate) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("rate", rate);
		recipeMapperInter.addRate(map);
	}

	@Override
	public void addView(int idx) {
		// TODO Auto-generated method stub
		recipeMapperInter.addView(idx);
	}

	@Override
	public List<RecipeDto> findCategory(String category) {
		// TODO Auto-generated method stub
		return recipeMapperInter.findCategory(category);
	}

	@Override
	public List<RecipeDto> findCooking(String cooking) {
		// TODO Auto-generated method stub
		return recipeMapperInter.findCooking(cooking);
	}

	@Override
	public List<RecipeDto> getRankingList(int startnum, int limit) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startnum", startnum);
		map.put("limit", limit);
		return recipeMapperInter.getRankingList(map);
	}

	@Override
	public void updateRecipe(RecipeDto dto) {
		// TODO Auto-generated method stub
		recipeMapperInter.updateRecipe(dto);
	}

	@Override
	public void deleteRecipe(int idx) {
		// TODO Auto-generated method stub
		recipeMapperInter.deleteRecipe(idx);
	}


}