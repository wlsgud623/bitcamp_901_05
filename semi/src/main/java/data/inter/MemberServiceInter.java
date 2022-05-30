package data.inter;

import data.dto.UserDto;

public interface MemberServiceInter {
	public void insertMember(UserDto dto); //회원 정보 기입
	public int getSearchId(String userid); //중복 아이디 찾기 (count)
	public String getSearchName(String name); //로그인 한 사람의 이름
	public int login(String userid, String password); //로그인 id, password
	public void updateScrapRecipe(int RECIPE_IDX, String UserID); //내가 스크랩한 레시피 목록 업데이트
}

