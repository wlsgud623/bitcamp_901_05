package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import data.dto.UserDto;

@Mapper
public interface MypageMapperInter {
	public UserDto getUser(String UserID); // UserDto반환
	public void insertmypage(UserDto dto); //
	
	//유저 1명의 정보
	public void updateUser(UserDto dto); //유저수정
	public void deleteUser(int UserID); //유저삭제
	
	public String getUserRecipeList(String UserID); //유저 레시피 정보
	public String getscraprecipeList(String UserID); //스크랩한 레시피 
	
	
}
