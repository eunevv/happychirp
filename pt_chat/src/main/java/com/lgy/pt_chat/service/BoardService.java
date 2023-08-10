package com.lgy.pt_chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.pt_chat.dto.BoardDto;
import com.lgy.pt_chat.dto.Criteria;

public interface BoardService {
	//글작성
	public void write(HashMap<String, String> param);
	//글목록
	public ArrayList<BoardDto> list();
	//글상세
//	public BoardDto contentView(HashMap<String, String> param);
	public ArrayList<BoardDto> contentView(HashMap<String, String> param);
	//글수정
	public void update(HashMap<String, String> param);
	//글삭제
	public void delete(HashMap<String, String> param);
	//검색
	public ArrayList<BoardDto> searchById(Criteria cri);
}