package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.IngredientDto;
import data.inter.IngredientServiceInter;
import data.mapper.IngredientMapperInter;

@Service
public class IngredientService implements IngredientServiceInter {

	@Autowired
	private IngredientMapperInter mapper;
	
	@Override
	public List<IngredientDto> getAllIngredient(int idx) {
		// TODO Auto-generated method stub
		return mapper.getAllIngredient(idx);
	}

}
