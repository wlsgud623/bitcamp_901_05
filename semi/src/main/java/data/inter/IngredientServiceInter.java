package data.inter;

import java.util.List;

import data.dto.IngredientDto;

public interface IngredientServiceInter {
	public List<IngredientDto> getAllIngredient(int idx);  // RECIPE_IDX가 idx인 모든 재료 반환
}
