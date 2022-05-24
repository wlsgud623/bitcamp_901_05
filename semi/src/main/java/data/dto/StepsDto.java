package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("steps")
public class StepsDto {
	private int num; // 요리 step의 고유 키
	private int RECIPE_IDX; // 요리 step이 속한 레시피의 번호
	private int step; // 요리 step 번호
	private String text; // 세부 내용
	private String photo; // 사진
}