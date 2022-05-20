package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("admin")
public class AdminUserDto {
	private int num; // 운영자 번호
	private String userID; // 운영자 ID
	private String name; // 운영자 이름
}
