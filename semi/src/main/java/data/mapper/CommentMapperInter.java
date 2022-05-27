package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CommentDto;

@Mapper
public interface CommentMapperInter {
	public int getTotalCount(int idx);
	public int getTotalGroupCount(int idx);
	public List<CommentDto> getAllComment(int idx);
	public CommentDto getComment(Map<String, Integer> map);
	
	public int getMaxCgroup();
	public void updateSeq(CommentDto dto);
	
	public void insertComment(CommentDto dto);
	public void updateComment(CommentDto dto);
	public void deleteComment(int num); 
}
