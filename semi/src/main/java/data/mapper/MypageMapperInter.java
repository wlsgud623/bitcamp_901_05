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
	
	public String userName(String UserID); //이름가져오기
	public int userAge(String UserID); //나이
	public String userPassword(String UserID);//비번
	public String userHP(String UserID);//폰
	public String userEmail(String UserID);//이메일
	public String userAddress(String UserID); //주소
	public String userPhoto(String UserID);// 사진
	public String userIntro(String UserID); //소개
	
	public String getUserRecipeList(String UserID); //유저 레시피 정보
	public String getscraprecipeList(String UserID); //스크랩한 레시피 
	
	
}
