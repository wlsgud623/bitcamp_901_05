package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.RecipeDto;

@Mapper
public interface SearchMapperInter {

	public List<RecipeDto> searchRecipe(String searchWord);
	
}
