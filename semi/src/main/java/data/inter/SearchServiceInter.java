package data.inter;

import java.util.List;

import data.dto.RecipeDto;

public interface SearchServiceInter {

	public int getTotalCount(String searchWord);
	public List<RecipeDto> searchRecipe(String searchWord, int startNum, int perPage);
	public List<String> searchAuto(String searchWord);
	
}
