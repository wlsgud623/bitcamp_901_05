package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import data.dto.RecipeDto;

@Mapper
public interface SearchMapperInter {

	public int getTotalCount(String searchWord);
	public List<RecipeDto> searchRecipe(Map<String, Object> map);
	public List<String> searchAuto(String searchWord);
	
}
