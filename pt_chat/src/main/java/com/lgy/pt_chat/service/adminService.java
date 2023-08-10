package com.lgy.pt_chat.service;

import java.util.HashMap;

import com.lgy.pt_chat.dto.adminDto;

public interface adminService {
	//로그인
	public adminDto aloginYN(HashMap<String,String> param);
	//회원가입
	public void aregister(HashMap<String,String> param);
	//회원정보(조회)
	public adminDto adminInfo(HashMap<String,String> param);
	//회원정보수정
	void adminUpdate(HashMap<String,String> param);
}