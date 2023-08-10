package com.lgy.pt_chat.dao;

import java.util.HashMap;

import com.lgy.pt_chat.dto.userDto;

public interface userDao {
	//로그인
	public userDto loginYN(HashMap<String,String> param);
	//회원가입
	public void register(HashMap<String,String> param);
	//회원정보(조회)
	public userDto userInfo(HashMap<String,String> param);
	//회원정보수정
	void userUpdate(HashMap<String,String> param);
	//아이디중복체크
	public int idCheck(userDto dto) throws Exception;
}
