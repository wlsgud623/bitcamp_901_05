package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.RecipeDto;
import data.inter.SearchServiceInter;
import data.mapper.SearchMapperInter;

@Service
public class SearchService implements SearchServiceInter {
	
	@Autowired
	SearchMapperInter mapper;

	@Override
	public List<RecipeDto> searchRecipe(String searchWord) {
		// TODO Auto-generated method stub
		return mapper.searchRecipe(searchWord);
	}

}
