package data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int getTotalCount(String searchWord) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(searchWord);
	}
	
	@Override
	public List<RecipeDto> searchRecipe(String searchWord, int startNum, int perPage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchWord", searchWord);
		map.put("startNum", startNum);
		map.put("perPage", perPage);
		return mapper.searchRecipe(map);
	}
	
	@Override
	public List<String> searchAuto(String searchWord) {
		// TODO Auto-generated method stub
		return mapper.searchAuto(searchWord);
	}

}
