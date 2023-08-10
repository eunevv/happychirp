package com.lgy.pt_chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.pt_chat.dao.ReplyDao;
import com.lgy.pt_chat.dto.ReplyDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<ReplyDto> readReply(int c_code) {
		log.info("@# ReplyServiceImpl.readReply() 조회 start");
		ReplyDao dao = sqlSession.getMapper(ReplyDao.class);
		ArrayList<ReplyDto> dto = dao.readReply(c_code);
		return dto;
	}
	
	//삭제
	@Override
	public void deleteReply(int r_code) {
		log.info("@# ReplyServiceImpl.deleteReply() start");
		ReplyDao dao = sqlSession.getMapper(ReplyDao.class);
		dao.deleteReply(r_code);
		
	}
	
	//상세보기
	@Override
	public ReplyDto getReply(int r_code) {
		log.info("@# ReplyServiceImpl.getReply() 상세보기 start");
		ReplyDao dao = sqlSession.getMapper(ReplyDao.class);
		ReplyDto dto = dao.getReply(r_code);
		log.info("@# ReplyServiceImpl.getReply() end");
		return dto;
	}

	@Override
	public void insertReply(HashMap<String, String> param) {
		log.info("@# ReplyServiceImpl.insertReply() start");
		ReplyDao dao = sqlSession.getMapper(ReplyDao.class);
		log.info("@# ReplyServiceImpl.insertReply() 작성한 값" + param);
		dao.insertReply(param);
	}
	
}
