package com.lgy.pt_chat.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.pt_chat.dao.adminDao;
import com.lgy.pt_chat.dto.adminDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("adminService")
public class adminServiceImpl implements adminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public adminDto aloginYN(HashMap<String, String> param) {
		log.info("@# adminServiceImpl.aloginYN() @#");
		
		adminDao dao = sqlSession.getMapper(adminDao.class);
		adminDto dtos = dao.aloginYN(param);
		
		return dtos;
	}

	@Override
	public void aregister(HashMap<String, String> param) {
		log.info("@# adminServiceImpl.aregister() @#");
		adminDao dao = sqlSession.getMapper(adminDao.class);
		dao.aregister(param);
				
	}

	@Override
	public adminDto adminInfo(HashMap<String, String> param){
		log.info("@# adminServiceImpl.adminInfo() @#");
		
		adminDao dao = sqlSession.getMapper(adminDao.class);
		adminDto dtos = dao.adminInfo(param);
		
		return dtos;
	}
	

	@Override
	public void adminUpdate(HashMap<String, String> param){
		log.info("@# adminServiceImpl.adminUpdate() @#");
		
		adminDao dao = sqlSession.getMapper(adminDao.class);
		dao.adminUpdate(param);
		
	}

}
