package com.lgy.pt_chat.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyDto {
	//게시글 번호
	private int c_code;//외래키
	//댓글 번호
	private int r_code;
	//댓글 내용
	private String r_content;
	//댓글 작성자 아이디
	private String r_id;
	//댓글 날짜
	private String r_date;
	//댓글 작성자 이름
	private String r_name;
}
          