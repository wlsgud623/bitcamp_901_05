package data.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import data.dto.UserDto;

@Mapper
public interface MemberMapperInter {
	public void insertMember(UserDto dto); 
	public int getSearchId(String UserID); 
	public String getSearchName(String name); 
	public int login(Map<String, String> map); 
}
