package com.lgy.pt_chat.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lgy.pt_chat.dto.adminDto;
import com.lgy.pt_chat.service.adminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes
public class adminController {
	
	@Autowired
	private adminService service;
	
	/* 메인 페이지 */
	@RequestMapping(value = "/amain")
	public String amain(){
		log.info("☆★ amain page ☆★");
		
		return "amain";
	}
//
//	/* 로그인 페이지 */
//	@RequestMapping(value = "/login")
//	public String login() {
//		log.info("☆★ login page ☆★");
//
//		return "user/login";
//	}

//	/* 로그인 실행 */
//	@RequestMapping(value = "/aloginYN")
//	public String aloginYN(@RequestParam HashMap<String, String> param, HttpSession session) {
//		log.info("☆★ aloginYN 메서드 ☆★");
//
//		adminDto dtos = service.aloginYN(param);
//		log.info("@# aloginYN 전달된 데이터들 " + dtos);
//
//		if (dtos == null) {// 로그인실패
////            int result = 0;
////            attr.addFlashAttribute("result", result);
//			return "redirect:/login";
//		} else {
//			if (param.get("pwd").equals(dtos.getPwd())) {// 비밀번호 일치
//				session.setAttribute("adminDto", dtos); // 로그인성공
//				return "redirect:amain";
//			} else {// 비밀번호 불일치
//				return "redirect:login";
//			}
//		}
//	}
	
//    /* 로그아웃 */
//    @RequestMapping(value = "/logout")
//    public String logout(HttpSession session){
//        log.info("☆★ logout 메서드 ☆★");
//                
//        session.removeAttribute("adminDto");
//        
//        return "redirect:main";        
//    }
	
//	/* 회원가입 */
//	@RequestMapping(value = "/register")
//	public String register() {
//		log.info("☆★ register page ☆★");
//		
//		return "register";
//	}
	
//	/* 회원가입 실행 */
//	@RequestMapping(value =  "/aregisterOk")
//	public String aregisterOk(@RequestParam HashMap<String, String> param) {
//		log.info("☆★ aregisterOk 메서드 ☆★");
//		
//		service.aregister(param);
//		
//		log.info("@aregisterOk@ id=>" + param.get("id"));
//		log.info("@aregisterOk@ pwd=>" + param.get("pwd"));
//		log.info("@aregisterOk@ name=>" + param.get("name"));
//		log.info("@aregisterOk@ hp=>" + param.get("hp"));
//		log.info("@aregisterOk@ email=>" + param.get("email"));
//
//		
//		return "redirect:/login";
//	}
		
	/* 회원정보 페이지 */
	@RequestMapping(value = "/adminInfo")
	public String adminInfo(@RequestParam HashMap<String, String> param, Model model){
		log.info("☆★ adminInfo page ☆★");

//		if (!id.equals(null)) {
//			log.info("$$$들어옴");
//			param.put("id", id);
//		}
		
		adminDto dtos = service.adminInfo(param);
		log.info("@# userInfo 전달된 데이터들 " + dtos);
		model.addAttribute("adminInfo", dtos);
		
		return "admin/adminInfo";
	}
	
	
	/* 회원정보 수정 */
	@RequestMapping(value = "/adminUpdate")
	public String adminUpdate(@RequestParam HashMap<String, String> param, Model model) throws Exception {
		log.info("☆★ adminUpdate 메서드 ☆★");
		
		service.adminUpdate(param);
		log.info("@# userInfo 컨트롤러 수정수정수정수정수정한거 " + param);
		
		log.info("☆★ userInfo page ☆★");
		adminDto dtos = service.adminInfo(param);
		log.info("@# userInfo 수정된 데이터들 " + dtos);
		model.addAttribute("adminInfo", dtos);
		
		
		return "admin/adminInfo";
	}
	
}