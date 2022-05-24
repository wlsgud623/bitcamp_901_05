package data.inter;

import java.util.List;
import java.util.Map;

import data.dto.RecipeDto;
import data.dto.UserDto;

public interface MypageServiceInter {
	public int getTotalCount();
	public UserDto getUser(String UserID);
	 //유저 정보를 id로 가져옴
	public void updateUser(UserDto dto);//유저수정
	public void deleteUser(String UserID);
	
	
	public List<RecipeDto> getUserRecipeList(String UserID);// 등록된 유저 레시피 전체 읽어오긴
	public List<RecipeDto> getscraprecipe(String UserID);
	 //스크랩한 레시피
	
	
	
	

	

	
}
