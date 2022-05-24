package data.service;


import java.util.ArrayList;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.RecipeDto;
import data.dto.UserDto;

import data.inter.MypageServiceInter;

import data.mapper.MypageMapperInter;
import data.mapper.RecipeMapperInter;

@Service
public class MypageService implements MypageServiceInter{

	@Autowired
	private MypageMapperInter mypageMapperInter;
	@Autowired
	private RecipeMapperInter recipeMapperInter;
	
	@Override
	public UserDto getUser(String UserID) {
		// TODO Auto-generated method stub
		return mypageMapperInter.getUser(UserID);
	}

	@Override
	public void updateUser(UserDto dto) {
		// TODO Auto-generated method stub
		mypageMapperInter.updateUser(dto);
	}

	@Override
	public void deleteUser(String UserID) {
		// TODO Auto-generated method stub
		mypageMapperInter.deleteUser(UserID);
	}

	

	@Override
	public List<RecipeDto> getUserRecipeList(String UserID) { //레시피dto에서 가져오기
		// TODO Auto-generated method stub
		String ownrecipe = mypageMapperInter.getUserRecipeList(UserID); //own에 넣기
		String [] recipes = ownrecipe.split(","); //string인걸 가져왓으니 배열로
		
		List<RecipeDto> list = new ArrayList<>(); //list 정의
		for(String idx:recipes) {
			RecipeDto dto = recipeMapperInter.getRecipe(Integer.parseInt(idx));
			//가져온걸 int 타입으로 변환
			list.add(dto);
		}
		
		return list;
	}

	@Override
	public List<RecipeDto> getscraprecipe(String UserID) {
		// TODO Auto-generated method stub
		String scraprecipe = mypageMapperInter.getscraprecipeList(UserID);
		String [] scraprecipes = scraprecipe.split(",");
		
		List<RecipeDto> list = new ArrayList<>();
		
		for(String idx :scraprecipes) {
			RecipeDto dto = recipeMapperInter.getRecipe(Integer.parseInt(idx));
			list.add(dto);
			
		}
		return list;
	}

	@Override
	public int getTotalCount() {
		return mypageMapperInter.getTotalCount();
	}

	

	
}
