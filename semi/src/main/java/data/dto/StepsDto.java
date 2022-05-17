package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("steps")
public class StepsDto {
	public int num; // 요리 step의 고유 키
	public int RECIPE_IDX; // 요리 step이 속한 레시피의 번호
	public int step; // detail.jsp에 표시될 요리 step 번호
	public String text; // 세부 내용
	public String photo; // 사진
}