 package data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.tomcat.jni.Mmap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.CommentDto;
import data.inter.CommentServiceInter;
import data.inter.RecommendationServiceInter;
import data.mapper.CommentMapperInter;
import data.mapper.RecommendationMapperInter;

@Service
public class RecommendationService implements RecommendationServiceInter {

	@Autowired
	private RecommendationMapperInter mapper;
	
	@Override
	public void addRecommend(int idx, String userid) {
		// TODO Auto-generated method stub
		mapper.addRecommend(idx, userid);
		return;
	}

	@Override
	public void addRate(int idx, String userid) {
		// TODO Auto-generated method stub
		mapper.addRate(idx, userid);
		return;
	}

	@Override
	public void addScrap(int idx, String userid) {
		// TODO Auto-generated method stub
		mapper.addScrap(idx, userid);
		return;
	}

	@Override
	public int searchRecommend(int idx, String userid) {
		// TODO Auto-generated method stub
		return mapper.searchRecommend(idx, userid);
	}

	@Override
	public int searchRate(int idx, String userid) {
		// TODO Auto-generated method stub
		return mapper.searchRate(idx, userid);
	}

	@Override
	public int searchScrap(int idx, String userid) {
		// TODO Auto-generated method stub
		return mapper.searchScrap(idx, userid);
	}

	
	
}
