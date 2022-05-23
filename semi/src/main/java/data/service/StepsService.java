package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.StepsDto;
import data.inter.StepsServiceInter;
import data.mapper.StepsMapperInter;

@Service
public class StepsService implements StepsServiceInter {

	@Autowired
	private StepsMapperInter mapper;
	
	@Override
	public int getStepCount(int idx) {
		// TODO Auto-generated method stub
		return mapper.getStepCount(idx);
	}

	@Override
	public List<StepsDto> getStepList(int idx) {
		// TODO Auto-generated method stub
		return mapper.getStepList(idx);
	}

}
