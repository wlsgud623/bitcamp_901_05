package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ingredient")
public class IngredientDto {
	public int num; // 재료 번호
	public int RECIPE_IDX; // 재료가 포함될 레시피의 번호
	public String name; // 재료 이름
	public String quantity; // 재료 정량
}
