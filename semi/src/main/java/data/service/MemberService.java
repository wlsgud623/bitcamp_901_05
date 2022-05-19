package data.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.UserDto;
import data.inter.MemberServiceInter;
import data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter{
	
	@Autowired	
	private MemberMapperInter memberMapperInter;

	@Override
	public void insertMember(UserDto dto) {
		// TODO Auto-generated method stub	
		memberMapperInter.insertMember(dto);
	}

	@Override
	public int getSearchId(String UserID) {
		// TODO Auto-generated method stub
		return memberMapperInter.getSearchId(UserID);
	}

	@Override
	public String getSearchName(String name) {
		// TODO Auto-generated method stub
		return memberMapperInter.getSearchName(name);
	}

	@Override
	public int login(String UserID, String password) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		map.put("UserID", UserID);
		map.put("password", password);
		
		return memberMapperInter.login(map);
	}
	
	
}
