package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.IngredientDto;
import data.dto.RecipeDto;
import data.dto.StepsDto;

@Mapper
public interface UpdateMapperInter {

	public RecipeDto getRecipe(int RECIPE_IDX);
	public List<IngredientDto> getIngredient(int RECIPE_IDX);
	public List<Integer> getBundleCount(int RECIPE_IDX);
	public List<StepsDto> getSteps(int RECIPE_IDX);
	public String getPhotoByNum(int num);
	
	public void updateRecipe(RecipeDto dto);
	public void updateIngredient(IngredientDto dto);
	public void updateSteps(StepsDto dto);
	
	public void deleteIngredient(int num);
	public void deleteSteps(int num);
	
}
