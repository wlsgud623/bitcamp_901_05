package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.StepsDto;

@Mapper
public interface StepsMapperInter {
	public int getStepCount(int idx);
	public List<StepsDto> getStepList(int idx);
}
