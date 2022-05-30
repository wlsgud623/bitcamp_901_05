package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import data.dto.UserDto;

@Mapper
public interface MypageMapperInter {
	public int getTotalCount();
	public UserDto getUser(String userid); // UserDto반환
	
	
	//유저 1명의 정보
	public void updateUser(UserDto dto); //유저수정
	
	
	public String getUserRecipeList(String UserID); //유저 레시피 정보
	public String getScrapRecipeList(String UserID); //스크랩한 레시피 
	
	
}
