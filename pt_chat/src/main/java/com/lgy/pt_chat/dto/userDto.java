package com.lgy.pt_chat.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class userDto {
	private String id;
	private String pwd;
	private String email;
	private String name;
}
