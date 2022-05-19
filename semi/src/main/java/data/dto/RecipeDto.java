package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("recipe")
public class RecipeDto {
	private int RECIPE_IDX; // 레시피 인덱스, 기본키
	private String userID;	 // 등록한 유저명
	private String name;	// 레시피 이름
	private String intro; // 레시피 소개
	private String category; // 레시피 종류
	private String main_ing; // 주 재료
	private String cooking; // 레시피 조리법
	private int portion; // 요리 인분
	private String level; // 요리 난이도
	private String main_photo; // 메인 사진
	private String complete_photo; // 완성 사진
	private int total_recom; // 총 추천 수
	private int total_volunteer; // 총 평가자 수
	private int total_rate; // 총 평가 점수
	private int view_count; // 총 조회 수
	private String tags; // 태그
	private Timestamp writeday; // 작성 일자
	
}
