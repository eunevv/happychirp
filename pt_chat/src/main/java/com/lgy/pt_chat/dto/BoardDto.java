package com.lgy.pt_chat.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {
	private int c_code;
	private String c_title;
//	private Timestamp date;
	private String c_date;
	private String c_content;
	private String c_id;//외래키
	private String c_name;
	
}

