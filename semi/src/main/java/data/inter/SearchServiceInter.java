package data.inter;

import java.util.List;

import data.dto.RecipeDto;

public interface SearchServiceInter {

	public List<RecipeDto> searchRecipe (String searchWord);
	
}
