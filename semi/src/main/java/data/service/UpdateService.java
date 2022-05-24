package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.IngredientDto;
import data.dto.RecipeDto;
import data.dto.StepsDto;
import data.inter.UpdateServiceInter;
import data.mapper.UpdateMapperInter;

@Service
public class UpdateService implements UpdateServiceInter {

	@Autowired
	UpdateMapperInter mapper;
	
	@Override
	public RecipeDto getRecipe(int RECIPE_IDX) {
		// TODO Auto-generated method stub
		return mapper.getRecipe(RECIPE_IDX);
	}

	@Override
	public List<IngredientDto> getIngredient(int RECIPE_IDX) {
		// TODO Auto-generated method stub
		return mapper.getIngredient(RECIPE_IDX);
	}
	
	@Override
	public List<Integer> getBundleCount(int RECIPE_IDX) {
		// TODO Auto-generated method stub
		return mapper.getBundleCount(RECIPE_IDX);
	}

	@Override
	public List<StepsDto> getSteps(int RECIPE_IDX) {
		// TODO Auto-generated method stub
		return mapper.getSteps(RECIPE_IDX);
	}
	
	@Override
	public String getPhotoByNum(int num) {
		// TODO Auto-generated method stub
		return mapper.getPhotoByNum(num);
	}

	@Override
	public void updateRecipe(RecipeDto dto) {
		// TODO Auto-generated method stub
		mapper.updateRecipe(dto);
	}

	@Override
	public void updateIngredient(IngredientDto dto) {
		// TODO Auto-generated method stub
		mapper.updateIngredient(dto);
	}

	@Override
	public void updateSteps(StepsDto dto) {
		// TODO Auto-generated method stub
		mapper.updateSteps(dto);
	}

	@Override
	public void deleteIngredient(int num) {
		// TODO Auto-generated method stub
		mapper.deleteIngredient(num);
	}

	@Override
	public void deleteSteps(int num) {
		// TODO Auto-generated method stub
		mapper.deleteSteps(num);
	}

}
