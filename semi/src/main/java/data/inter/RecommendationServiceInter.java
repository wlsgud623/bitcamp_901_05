package data.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import data.dto.RecipeDto;

public interface RecommendationServiceInter {
	public void addRecommend(int idx, String userid);
	public void addRate(int idx, String userid);
	public void addScrap(int idx, String userid);
	
	public int searchRecommend(int idx,String userid);
	public int searchRate(int idx, String userid);
	public int searchScrap(int idx, String userid);
	
}
