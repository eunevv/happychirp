package com.lgy.pt_chat.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lgy.pt_chat.dto.adminDto;
import com.lgy.pt_chat.dto.userDto;
import com.lgy.pt_chat.service.adminService;
import com.lgy.pt_chat.service.userService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes
public class userController {
	@Autowired
	private userService service;

	@Autowired
	private adminService aservice;

	/* 메인 페이지 */
	@RequestMapping(value = "/main")
	public String main() {
		log.info("☆★ main page ☆★");

		return "main";
	}

	/* 로그인 페이지 */
	@RequestMapping(value = "/login")
	public String login() {
		log.info("☆★ login page ☆★");

		return "user/loginPage";
	}

	/* 로그인 실행 */
	@RequestMapping(value = "/loginYN")
	public String loginYN(@RequestParam HashMap<String, String> param, HttpSession session) {
		log.info("☆★ loginYN 메서드 ☆★");
		
		
		userDto user = service.loginYN(param);
		adminDto admin = aservice.aloginYN(param);
		
		if (user != null) {
			log.info("@# user 로그인 전달된 데이터들 " + user);			
		} else {
			log.info("@# admin 로그인 전달된 데이터들 " + admin);
		}
		
		
		if (user != null) { // 일반 회원으로 로그인 성공
	        if (param.get("pwd").equals(user.getPwd())) { // 비밀번호 일치
	            session.setAttribute("userDto", user); // 로그인 성공
	            return "redirect:main"; // 일반 회원 메인 페이지로 이동
	        }else {
	        	return "redirect:login";
	        }
	    } else if (admin != null) { // 관리자로 로그인 성공
	        if (param.get("pwd").equals(admin.getPwd())) { // 비밀번호 일치
	            session.setAttribute("adminDto", admin); // 로그인 성공
	            return "redirect:amain"; // 관리자 메인 페이지로 이동
	        }else {
	        	return "redirect:login";
	        }
	    }

	    return "redirect:login"; // 로그인 실패 시 로그인 페이지로 이동
	}

	/* 로그아웃 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		log.info("☆★ logout 메서드 ☆★");

		session.invalidate();

		return "redirect:main";
	}

	/* 회원가입 */
	@RequestMapping(value = "/register")
	public String register() {
		log.info("☆★ register page ☆★");

		return "register";
	}

	/* 회원가입 실행 */
	@RequestMapping(value = "/registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
		log.info("☆★ registerOk 메서드 ☆★");

		service.register(param);

		log.info("@registerOk@ id=>" + param.get("id"));
		log.info("@registerOk@ pwd=>" + param.get("pwd"));
		log.info("@registerOk@ name=>" + param.get("name"));
		log.info("@registerOk@ email=>" + param.get("email"));

		return "redirect:/login";
	}
	/* 회원정보 페이지 */
	@RequestMapping(value = "/userInfo")
	public String userInfo(@RequestParam HashMap<String, String> param, Model model) {
		log.info("☆★ userInfo page ☆★");

//		if (!id.equals(null)) {
//			log.info("$$$들어옴");
//			param.put("id", id);
//		}

		userDto dtos = service.userInfo(param);
		log.info("@# userInfo 전달된 데이터들 " + dtos);
		model.addAttribute("userInfo", dtos);

		return "user/userInfo";
	}

	/* 회원정보 수정 */
	@RequestMapping(value = "/userUpdate")
	public String userUpdate(@RequestParam HashMap<String, String> param, Model model) throws Exception {
		log.info("☆★ userUpdate 메서드 ☆★");

		service.userUpdate(param);
		log.info("@# userInfo 컨트롤러 수정수정수정수정수정한거 " + param);

		log.info("☆★ userInfo page ☆★");
		userDto dtos = service.userInfo(param);
		log.info("@# userInfo 수정된 데이터들 " + dtos);
		model.addAttribute("userInfo", dtos);

		return "user/userInfo";
	}

}