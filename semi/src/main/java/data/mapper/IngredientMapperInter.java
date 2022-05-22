package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.IngredientDto;

@Mapper
public interface IngredientMapperInter {
	public List<IngredientDto> getAllIngredient(int idx);
}
