package data.inter;

import java.util.List;
import java.util.Map;


import data.dto.UserDto;

public interface MypageServiceInter {
	
	public UserDto getUserID(String UserID);
	 //유저 정보를 id로 가져옴
	public void updateUser(UserDto dto);//유저수정
	public int deleteUser(int UserID); //유저삭제
	
	public void username(String name); //이름가져오기
	public int userage(int age); //나이
	public void userpassword(String password);//비번
	public void userhp(String hp);//폰
	public void useremail(String email);//이메일
	public void useraddress(String address); //주소
	public void userphoto(String photo);// 사진
	public void userintro(String intro); //소개
	
	public void updateChu(int USERID); //총레시피 업로드 갯수
	public List<UserDto> getUserRecipeList(int startnum, int perpage);
	public List<UserDto> getscraprecipeList(int startnum, int perpage);
	 //유저가 등록한 레시피처음부터끝까지불러옴
		//스크랩한 레시피
	

	
}
