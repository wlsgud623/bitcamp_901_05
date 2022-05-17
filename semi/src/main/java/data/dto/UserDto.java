package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("user")
public class UserDto {
<<<<<<< HEAD
	private String UserID;
	private String name;
	private String password;
	private String tier;
	private String hp;
	private String email;
	private String photo;
	private String intro;
	private String ownrecipe;
	private String currentrecipe;
	private String scraprecipe;
	private Timestamp joinday;
=======
	private String UserID; //사용자 ID
	private String name; // 사용자 이름
	private String password; //사용자 비밀번호
	private String tier; // 사용자 티어
	private String hp; // 사용자 전화번호
	private String email; // 사용자 이메일
	private String photo; // 사용자 사진
	private String intro; // 사용자 자기소개
	private String ownrecipe; // 사용자가 등록한 레시피
	private String currentrecipe; // 사용자가 최근 열람한 레시피
	private String scraprecipe; // 사용자가 스크랩한 레시피
	private Timestamp joinday; // 회원 가입 일자
>>>>>>> branch 'main' of https://github.com/wlsgud623/bitcamp_901_05.git
}
