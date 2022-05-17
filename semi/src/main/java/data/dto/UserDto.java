package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("user")
public class UserDto {
	private String UserID;
	private String name;
	private String password;
	private String tier;
	private String hp;
	private String email;
	private String photo;
	private String intro;
	private String ownrecipe;
	private String currentrecipe;
	private String scraprecipe;
	private Timestamp joinday;
}
