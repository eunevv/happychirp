package com.lgy.pt_chat.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.pt_chat.dao.userDao;
import com.lgy.pt_chat.dto.userDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("userService")
public class userServiceImpl implements userService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public userDto loginYN(HashMap<String, String> param) {
		log.info("@# userServiceImpl.loginYN() @#");
		
		userDao dao = sqlSession.getMapper(userDao.class);
		userDto dtos = dao.loginYN(param);
		
		return dtos;
	}

	@Override
	public void register(HashMap<String, String> param) {
		log.info("@# userServiceImpl.register() @#");
		userDao dao = sqlSession.getMapper(userDao.class);
		dao.register(param);
				
	}

	@Override
	public userDto userInfo(HashMap<String, String> param){
		log.info("@# userServiceImpl.userInfo() @#");
		
		userDao dao = sqlSession.getMapper(userDao.class);
		userDto dtos = dao.userInfo(param);
		
		return dtos;
	}
	

	@Override
	public void userUpdate(HashMap<String, String> param){
		log.info("@# userServiceImpl.userUpdate() @#");
		
		userDao dao = sqlSession.getMapper(userDao.class);
		dao.userUpdate(param);
		
	}

	@Override
	public int idCheck(userDto dto) throws Exception {
		log.info("@# userServiceImpl.idCheck() @#");
		
		userDao dao = sqlSession.getMapper(userDao.class);
		int cnt = dao.idCheck(dto);
		
		return cnt;
	}

}
