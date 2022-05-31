package data.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.IngredientDto;
import data.dto.RecipeDto;
import data.dto.StepsDto;
import data.inter.InputServiceInter;
import data.mapper.InputMapperInter;

@Service
public class InputService implements InputServiceInter {

	@Autowired
	InputMapperInter mapper;
	
	@Override
	public void insertRecipe(RecipeDto dto) {
		// TODO Auto-generated method stub
		mapper.insertRecipe(dto);
	}

	@Override
	public int getLastRecipeIdx() {
		// TODO Auto-generated method stub
		return mapper.getLastRecipeIdx();
	}

	@Override
	public void insertIngredient(IngredientDto dto) {
		// TODO Auto-generated method stub
		mapper.insertIngredient(dto);
	}

	@Override
	public void insertSteps(StepsDto dto) {
		// TODO Auto-generated method stub
		mapper.insertSteps(dto);
	}

	@Override
	public void updateOwnRecipe(int RECIPE_IDX, String userID) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("RECIPE_IDX", ""+RECIPE_IDX);
		map.put("userID", userID);
		mapper.updateOwnRecipe(map);
	}
	
}
