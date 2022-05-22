package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ingredient")
public class IngredientDto {
	private int num; // 재료 번호
	private int RECIPE_IDX; // 재료가 포함될 레시피의 번호
	private String ing_class; //재료 묶음
	private String ing_name; // 재료 이름
	private String ing_quantity; // 재료 정량
}
