package data.inter;

import data.dto.IngredientDto;
import data.dto.RecipeDto;
import data.dto.StepsDto;

public interface InputServiceInter {

	public void insertRecipe(RecipeDto dto); //레시피 업로드
	public int getLastRecipeIdx(); //업로드한 레시피의 RECIPE_IDX 얻기 - ingredient, steps 업로드에 사용
	
	public void insertIngredient(IngredientDto dto); //재료 업로드
	public void insertSteps(StepsDto dto); //요리단계 업로드
	
	public void updateOwnRecipe(int RECIPE_IDX, String userID); //내가 등록한 레시피 목록 업데이트
	
}
