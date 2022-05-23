package data.inter;

import java.util.List;

import data.dto.StepsDto;

public interface StepsServiceInter {
	public int getStepCount(int idx);	// RECIPE_IDX가 idx인 레시피의 Step의 개수
	public List<StepsDto> getStepList(int idx); // RECIPE_IDX idx인 레시피의 Step을 리스트로 반환
}
