package data.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.UserDto;
import data.inter.MemberServiceInter;
import data.inter.MypageServiceInter;
import data.mapper.MemberMapperInter;

@Service
public class MypageService implements MypageServiceInter{

	@Override
	public UserDto getUserID(String UserID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(UserDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int deleteUser(int UserID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void userpassword(String password) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userhp(String hp) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void useremail(String email) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void useraddress(String address) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userphoto(String photo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userintro(String intro) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateChu(int USERID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UserDto> getUserRecipeList(int startnum, int perpage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserDto> getscraprecipeList(int startnum, int perpage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void username(String name) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int userage(int age) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
