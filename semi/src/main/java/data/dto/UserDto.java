package data.dto;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.type.Alias;


import lombok.Data;

@Data
@Alias("user")
public class UserDto {

	private String userid; //사용자 ID
	private String name; // 사용자 이름
	private String password; //사용자 비밀번호
	private String tier; // 사용자 티어
	private String hp; // 사용자 전화번호
	private String email; // 사용자 이메일
	private String address; //사용자 주소 
	private String photo; // 사용자 사진
	private String intro; // 사용자 자기소개
	private String ownrecipe; // 사용자가 등록한 레시피
	private String currentrecipe; // 사용자가 최근 열람한 레시피
	private String scraprecipe; // 사용자가 스크랩한 레시피
	private Timestamp joinday; // 회원 가입 일자
}
