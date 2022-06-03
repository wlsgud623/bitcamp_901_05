package data.service;


import java.util.ArrayList;

import java.util.List;
import java.util.Vector;

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
	public UserDto getUser(String userid) {
		// TODO Auto-generated method stub
		return mypageMapperInter.getUser(userid);
	}

	@Override
	public void updateUser(UserDto dto) {
		// TODO Auto-generated method stub
		mypageMapperInter.updateUser(dto);
	}

	

	

	@Override
	public List<RecipeDto> getUserRecipeList(String UserID) { //레시피dto에서 가져오기
		// TODO Auto-generated method stub
		System.out.println("UserID="+UserID);
		String ownrecipe = mypageMapperInter.getUserRecipeList(UserID); //own에 넣기
		System.out.println("ownrecipe" + ownrecipe);
		List<RecipeDto> list = new Vector<>(); //list 정의
		
		if (ownrecipe != null) {
			String [] recipes = ownrecipe.split(","); //string인걸 가져왓으니 배열로
			System.out.println("recipes" + recipes);
			for(String idx:recipes) {
				System.out.println("Integer.parseInt(idx)="+Integer.parseInt(idx));
				RecipeDto dto = recipeMapperInter.getRecipe(Integer.parseInt(idx));
			
				//가져온걸 int 타입으로 변환
				list.add(dto);
			}
		}
		
		return list;
	}

	@Override
	public List<RecipeDto> getScrapRecipeList(String UserID) {
		// TODO Auto-generated method stub
		String scraprecipe = mypageMapperInter.getScrapRecipeList(UserID);
		List<RecipeDto> list = new Vector<>();
		
		if (!scraprecipe.equals("none")) {
			String [] recipes = scraprecipe.split(",");
			
			for(String idx :recipes) {
				RecipeDto dto = recipeMapperInter.getRecipe(Integer.parseInt(idx));
				list.add(dto);	
			}
		}
		
		return list;
	}

	


	

	
}
