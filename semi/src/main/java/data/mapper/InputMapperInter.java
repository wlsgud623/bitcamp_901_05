package data.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import data.dto.IngredientDto;
import data.dto.RecipeDto;
import data.dto.StepsDto;

@Mapper
public interface InputMapperInter {

	public void insertRecipe(RecipeDto dto);	
	public int getLastRecipeIdx();
	
	public void insertIngredient(IngredientDto dto);
	public void insertSteps(StepsDto dto);
	
	public void updateOwnRecipe(Map<String, String> map);
	
}
