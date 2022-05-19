package data.inter;

import java.util.Map;

import data.dto.UserDto;

public interface MemberServiceInter {
	public void insertMember(UserDto dto); //회원 정보 기입
	public int getSearchId(String UserID); //중복 아이디 찾기 (count)
	public String getSearchName(String name); //로그인 한 사람의 이름
	public int login(String UserID, String password); //로그인 id, password
}
