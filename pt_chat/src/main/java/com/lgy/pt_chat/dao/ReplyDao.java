package com.lgy.pt_chat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.pt_chat.dto.ReplyDto;

public interface ReplyDao {
	//댓글 조회
	public ArrayList<ReplyDto> readReply(int c_code);
	// 댓글 상세보기
    public ReplyDto getReply(int r_code);
	//댓글 삭제
	public void deleteReply(int r_code);
	//댓글 작성
	public void insertReply(HashMap<String, String> param);
	public void updateReplyCountOnDelete(int c_code);
}
