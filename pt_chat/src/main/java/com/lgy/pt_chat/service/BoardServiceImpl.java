package com.lgy.pt_chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.pt_chat.dao.BoardDao;
import com.lgy.pt_chat.dto.BoardDto;
import com.lgy.pt_chat.dto.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void write(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl.write() start");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.write(param);
		
	}

	@Override
	public ArrayList<BoardDto> list() {
		log.info("@# BoardServiceImpl.list() start");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<BoardDto> list = dao.list();
		
		return list;
	}

	@Override
	public ArrayList<BoardDto> contentView(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl.contentView() start");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<BoardDto> dto = dao.contentView(param);
		log.info("@# BoardServiceImpl.contentView() end");
		
		return dto;
	}

	@Override
	public void update(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl.update() start");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.update(param);
	}

	@Override
	public void delete(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl.delete() start");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.delete(param);
		
	}

	@Override
	public ArrayList<BoardDto> searchById(Criteria cri) {
	    log.info("@# BoardServiceImpl.searchById() start");
	    BoardDao dao = sqlSession.getMapper(BoardDao.class);
	    ArrayList<BoardDto> list = dao.searchById(cri);
	    return list;
	}

}
