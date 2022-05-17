package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("admin")
public class AdminUserDto {
	public int num; // 운영자 번호
	public String userID; // 운영자 ID
	public String name; // 운영자 이름
}
