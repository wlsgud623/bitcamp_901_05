package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("test")
@Data
public class TestDto {
	
	private int num;

}
