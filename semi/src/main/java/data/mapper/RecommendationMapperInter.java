package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import data.dto.CommentDto;

@Mapper
public interface RecommendationMapperInter {
	public void addRecommend(@Param("RECIPE_IDX") int idx, @Param("USERID") String userid);
	public void addRate(@Param("RECIPE_IDX") int idx, @Param("USERID") String userid);
	public void addScrap(@Param("RECIPE_IDX") int idx, @Param("USERID") String userid);
	
	public int searchRecommend(@Param("RECIPE_IDX") int idx, @Param("USERID") String userid);
	public int searchRate(@Param("RECIPE_IDX") int idx, @Param("USERID") String userid);
	public int searchScrap(@Param("RECIPE_IDX") int idx, @Param("USERID") String userid);
}
