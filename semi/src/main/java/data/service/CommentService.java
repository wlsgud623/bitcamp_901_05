 package data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.CommentDto;
import data.inter.CommentServiceInter;
import data.mapper.CommentMapperInter;

@Service
public class CommentService implements CommentServiceInter {

	@Autowired
	private CommentMapperInter mapper;
	
	@Override
	public int getTotalCount(int idx) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(idx);
	}
	@Override
	public int getTotalGroupCount(int idx) {
		// TODO Auto-generated method stub
		return mapper.getTotalGroupCount(idx);
	}
	
	@Override
	public List<CommentDto> getAllComment(int idx) {
		// TODO Auto-generated method stub
		List<CommentDto> list = mapper.getAllComment(idx);
		return list;
	}

	@Override
	public CommentDto getComment(int idx, int num) {
		Map< String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("num", num);
		return mapper.getComment(map);
	}

	@Override
	public void insertComment(CommentDto dto) {
		// TODO Auto-generated method stub
		dto.setCgroup(mapper.getMaxCgroup() + 1);
		mapper.insertComment(dto);
	}
	
	@Override
	public void insertRecomment(CommentDto dto) {
		// TODO Auto-generated method stub
		mapper.updateSeq(dto);
		mapper.insertComment(dto);
	}
	
	
	@Override
	public void deleteComment(int num) {
		// TODO Auto-generated method stub
		mapper.deleteComment(num);
	}
	
	@Override
	public void updateComment(CommentDto dto) {
		// TODO Auto-generated method stub
		mapper.updateComment(dto);
	}
	
}
