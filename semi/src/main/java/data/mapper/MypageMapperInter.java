package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import data.dto.UserDto;

@Mapper
public interface MypageMapperInter {
	public UserDto getUserID(String UserID);
	public void insertmypage(UserDto dto);
	
	


	//유저 1명의 정보
	public void updateUser(UserDto dto); //유저수정
	public int deleteUser(int UserID); //유저삭제
	public void username(String name); //이름가져오기
	public int userage(int age); //나이
	public void userpassword(String password);//비번
	public void userhp(String hp);//폰
	public void useremail(String email);//이메일
	public void useraddress(String address); //주소
	public void userphoto(String photo);// 사진
	public void userintro(String intro); //소개
	
	
	public List<UserDto> getUserRecipeList(Map<String, Integer> map); //유저레시피 정보
	public List<UserDto> getscraprecipeList(Map<String, Integer> map); //스크랩한 레시피 
	
	public void updateChu(int USERID);
	//총레시피 업로드 갯수
	
	
}
