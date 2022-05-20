package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("pick")
public class AdminPickDto {
	private int num; // 운영자 추천레시피 번호
	private int RECIPE_IDX; // 운영자 추천에 포함될 레시피의 레시피인덱스
}
