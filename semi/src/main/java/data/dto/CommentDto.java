package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("comment")
public class CommentDto {
	private int NUM; // 댓글의 번호, 기본키
	private int RECIPE_IDX; // 댓글이 작성된 레시피의 IDX
	private String userID;	//댓글 작성자 ID
	private String content; // 댓글의 내용
	private int depth; // 댓글의 level
	private int seq; // 그룹 내 댓글 출력 순서
	private int cgroup; // 댓글 그룹
	private Timestamp writeday; // 댓글이 작성된 시간
}
