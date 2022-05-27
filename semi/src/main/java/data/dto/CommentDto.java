package data.dto;

import java.sql.Timestamp;

import javax.sql.rowset.JoinRowSet;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("comment")
public class CommentDto {
	private int NUM; // 댓글의 번호, 기본키
	private int RECIPE_IDX; // 댓글이 작성된 레시피의 IDX
	private String userID;	//댓글 작성자 ID
	private String content; // 댓글의 내용
	private int depth; // 대댓글 여부 0 : 댓글, 1 : 대댓글
	private int cgroup; // 댓글일 경우 0, 대댓글의 경우 원 댓글의 NUM
	private int seq;
	private Timestamp writeday; // 댓글이 작성된 시간
}
