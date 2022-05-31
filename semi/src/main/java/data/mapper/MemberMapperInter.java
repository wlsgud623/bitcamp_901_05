package data.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import data.dto.UserDto;

@Mapper
public interface MemberMapperInter {
	public void insertMember(UserDto dto); 
	public int getSearchId(String userid); 
	public String getSearchName(String name); 
	public int login(Map<String, String> map); 
	public void updateScrapRecipe(@Param("RECIPE_IDX") int RECIPE_IDX, @Param("USERID") String USERID);
}
