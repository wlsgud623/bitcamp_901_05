package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ingredient")
public class IngredientDto {
	private int num; // 재료 번호
	private int RECIPE_IDX; // 재료가 포함될 레시피의 번호
	private int writeorder; // 사용자가 입력한 재료의 순서
	private String bundle; //재료 묶음
	private String name; // 재료 이름
	private String quantity; // 재료 정량
}
