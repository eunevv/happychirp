package com.lgy.pt_chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.pt_chat.dto.ReplyDto;

public interface ReplyService {
	//댓글 조회
	public ArrayList<ReplyDto> readReply(int c_code);
	// 댓글 상세보기
    public ReplyDto getReply(int r_code);
	//댓글 삭제
	public void deleteReply(int r_code);
	//댓글 작성
	public void insertReply(HashMap<String, String> param);
}