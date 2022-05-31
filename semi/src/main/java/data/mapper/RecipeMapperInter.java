package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import data.dto.RecipeDto;

@Mapper
public interface RecipeMapperInter {
	public int getTotalCount();
	public List<RecipeDto> getAllRecipe(); 
	public List<RecipeDto> getRecipeList(Map<String, Integer> map);
	public RecipeDto getRecipe(int idx);
	
	public int getRecipeRec(int idx);
	public int getRecipeRate(int idx);
	public int getRecipeVolunteer(int idx);
	
	public void addRecommend(int idx); 
	public void addRate(Map<String, Integer> map); 
	public void addView(int idx); 
	
	public void updateRecipe(RecipeDto dto);
	public void deleteRecipe(int idx);
	
	public List<RecipeDto> findCategory(String category);
	public List<RecipeDto> findCooking(String cooking);
	
	public List<Integer> searchRecipe (String searchWord);

	public List<RecipeDto> getRankingList(Map<String, Integer> map);
	public List<RecipeDto> getViewRankingList(Map<String, Integer> map);
	public List<RecipeDto> getNewRankingList(Map<String, Integer> map);
	
	public List<RecipeDto> getCategoryList(@Param("category") String category, @Param("item") String item, @Param("startnum") int startnum, @Param("limit") int limit);
	public int getCategoryCount(@Param("category") String category, @Param("item") String item);
}
