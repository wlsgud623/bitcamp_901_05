package data.inter;

import java.util.List;

import data.dto.CommentDto;

public interface CommentServiceInter {
	public int getTotalCount(int idx); // RECIPE_IDX가 idx인 레시피의 모든 댓글의 수 
	public int getTotalGroupCount(int idx); //RECIPE IDX 가 idx이고 답글을 제외한 주 댓글의 수
	
	public List<CommentDto> getAllComment(int idx); // RECIPE_IDX가 idx인 레시피의 모든 댓글
	public CommentDto getComment(int idx, int num); // RECIPE_IDX가 idx인 NUM이 num인 댓글을 출력
	public void insertComment(CommentDto dto); //Comment를 추가
	public void deleteComment(int num); // Comment를 삭제
}
