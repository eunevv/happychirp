package com.lgy.pt_chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.pt_chat.dto.BoardDto;
import com.lgy.pt_chat.dto.Criteria;
import com.lgy.pt_chat.dto.ReplyDto;
import com.lgy.pt_chat.dto.adminDto;
import com.lgy.pt_chat.dto.userDto;
import com.lgy.pt_chat.service.BoardService;
import com.lgy.pt_chat.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@RequestMapping("testUpload")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService rservice;
	
	/* 글 작성 페이지 */
	@RequestMapping(value = "/write_view")
	public String write_view() {
		log.info("☆★ write_view 페이지 ☆★");
		
		return "Board/write_view";
	}	

	/* 글 작성 */
	@RequestMapping(value = "/write")
	public String write(@RequestParam HashMap<String, String> param, HttpSession session) {
		log.info("☆★ write 메서드 ☆★");
								
		 // 세션에 저장된 adminDto에서 id를 가져와서 param에 추가 (외래키)
	    adminDto dto = (adminDto) session.getAttribute("adminDto");
	    log.info("☆★ write 세션에 저장된 adminDto에서 id를 가져와서 param에 추가 (외래키) ☆★" + dto);
	    if (dto != null) {
	        String c_id = dto.getId();
	        String c_name = dto.getName();
	        param.put("c_id", c_id);
	        param.put("c_name", c_name);
	    } else {
	    	log.info("☆★ 세션이 없대요 ");
	        return "user/loginPage"; // 예시로 write_view 페이지로 이동하도록 설정했습니다.
	    }
	    
	    service.write(param);
	    
		
		return "redirect:list";
	}
	
	/* 글 목록 */
//	@RequestMapping(value = "/list")
//	public String list(Model model) {
//		log.info("☆★ list 페이지 ☆★");
//
//		
//		ArrayList<BoardDto> list = service.list();
//		model.addAttribute("list", list);
//		
//		return "Board/list";
//	}
	
	/* 글 목록 */
	@RequestMapping(value = "/list")
	public String list(Model model, Criteria cri) {
	    log.info("☆★ list 페이지 ☆★");

	    ArrayList<BoardDto> list;
	    if (cri != null && cri.getKeyword() != null && !cri.getKeyword().isEmpty()) {
	        list = service.searchById(cri); // 검색어가 있을 경우, 해당 c_id를 검색합니다.
	    } else {
	        list = service.list(); // 검색어가 없을 경우, 전체 목록을 가져옵니다.
	    }
	    model.addAttribute("list", list);

	    return "Board/list";
	}
	
	/* 글 상세 페이지 */	
	@RequestMapping("/content_view")
	public String content_view(@RequestParam HashMap<String, String> param,@RequestParam("c_code") int c_code, Model model) throws Exception {
		log.info("☆★ content_view 메서드 ☆★");

//		BoardDto dto = service.contentView(param);
//		model.addAttribute("content_view", dto);
//		log.info("☆★ content_view 메서드 ☆★"+dto);
		
		
		ArrayList<BoardDto> dtoList = service.contentView(param);
        if (dtoList.isEmpty()) {
            return "error"; // 해당 글이 존재하지 않는 경우 에러 페이지로 이동
        }
        BoardDto dto = dtoList.get(0);
        model.addAttribute("content_view", dto);
        
        
        ArrayList<ReplyDto> reDto = rservice.readReply(dto.getC_code());
        log.info("☆★reDto" + reDto);
        model.addAttribute("replylist", reDto);
        
		
		return "Board/content_view";
	}
	
	/* 글 수정 페이지 */
	@RequestMapping(value = "/modify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("☆★ modify_view 페이지 ☆★");
		
		ArrayList<BoardDto> dtoList = service.contentView(param);
        if (dtoList.isEmpty()) {
            return "error"; // 해당 글이 존재하지 않는 경우 에러 페이지로 이동
        }
        BoardDto dto = dtoList.get(0);
        model.addAttribute("content_view", dto);
		
		return "Board/modify_view";
	}	
	
	/* 글 수정 */
	@RequestMapping("/update")
	public String update(@RequestParam HashMap<String, String> param, HttpSession session) {
		log.info("☆★ update(modify) 메서드 ☆★");
		
		adminDto loginAdmin = (adminDto) session.getAttribute("adminDto");
		log.info("☆★ loginAdmin ☆★" + loginAdmin);
		 // 수정할 게시글의 작성자 아이디를 가져옴
	    String c_id = param.get("c_id");
	    log.info("☆★ 수정할 게시글의 작성자 아이디를 가져옴 ☆★"+ c_id);

	    // 로그인된 사용자 아이디와 게시글 작성자 아이디를 비교하여 일치하는 경우에만 수정 가능
	    if (loginAdmin != null && loginAdmin.getId().equals(c_id)) {
	        service.update(param);
	        log.info("☆★ update 수정된 값 확인 ☆★" + param);

	        String c_code = param.get("c_code"); // 수정된 게시글의 아이디를 가져옴
	        return "redirect:content_view?c_code=" + c_code; // content_view 페이지로 아이디를 전달하여 리다이렉트
	    } else {
	        // 일치하지 않는 경우에 대한 처리 (예: 권한이 없음 메시지를 보여주거나, 다른 페이지로 리다이렉트 등)
	        return "error"; // 권한이 없는 경우 에러 페이지로 이동하도록 설정했습니다.
	    }

	}
	
	/* 글 삭제 */
	@RequestMapping("/delete")
	public String delete(@RequestParam HashMap<String, String> param) {
		log.info("☆★ delete 메서드 ☆★");
	
		service.delete(param);
		
		return "redirect:list";
	}
	
	/* 댓글 작성 */
    @Transactional
	@RequestMapping(value = "/insertReply")
	public String insertReply(@RequestParam HashMap<String, String> param, @RequestParam("c_code") int c_code, HttpSession session) throws Exception {
		
		// 댓글 작성자 정보를 세션에서 가져옴
	    userDto user = (userDto) session.getAttribute("userDto");
	    adminDto admin = (adminDto) session.getAttribute("adminDto");
	    if ((user == null) && (admin == null)) {
	        // 로그인이 되어있지 않은 경우 로그인 페이지로 이동하거나 에러 처리
	        return "redirect:login"; // 로그인 페이지로 이동하도록 설정했습니다.
	    }

	    // 댓글 작성자 아이디와 이름을 param에 추가
	    if (user != null) {
	        param.put("r_id", user.getId());
	        param.put("r_name", user.getName());
	    } else if (admin != null) {
	        param.put("r_id", admin.getId());
	        param.put("r_name", admin.getName());
	    }

	    // 댓글 insert 기능 수행
	    rservice.insertReply(param);

	    // 댓글 작성 후, 해당 게시글의 상세 페이지로 리다이렉트
	    return "redirect:content_view?c_code=" + param.get("c_code");
	}
	
	
	/* 댓글 상세 페이지 */	
	@RequestMapping(value = "/reply_view")
	public String reply_view(@RequestParam("r_code") int r_code, Model model) {
	    log.info("☆★ reply_view 페이지 ☆★");
	    
	    // 댓글 조회 로직을 추가하여 해당 댓글 정보를 가져옵니다.
	    ReplyDto replyDto = rservice.getReply(r_code);
	    model.addAttribute("replyDto", replyDto);

	    return "Board/reply_view";
	}
	
	/* 댓글 삭제 */
    @Transactional
    @RequestMapping("/deleteReply")
    public String deleteReply(@RequestParam("r_code") int r_code,@RequestParam("c_code") int c_code, HttpSession session) {
//    	public String deleteReply(@RequestParam("r_code") int r_code,@RequestParam("c_code") int c_code,  Model model) {
        log.info("☆★ deleteReply 메서드 ☆★");

        userDto user = (userDto) session.getAttribute("userDto");
        adminDto admin = (adminDto) session.getAttribute("adminDto");

        // 로그인 여부 확인
        if (user == null && admin == null) {
            return "redirect:loginPage"; // 로그인 페이지로 이동하도록 설정
        }

        // 삭제할 댓글 정보 가져오기
        ReplyDto reply = rservice.getReply(r_code);
        log.info("☆★ 삭제할 댓글 정보 가져오기 ☆★" +reply);
        
        if (reply == null) {
            // 해당 댓글이 존재하지 않는 경우 처리 (예: 에러 메시지를 보여주거나, 다른 페이지로 리다이렉트 등)
            return "error"; // 에러 페이지로 이동하도록 설정
        }

        // 댓글 작성자 아이디 가져오기
        String r_id = reply.getR_id();
        log.info("☆★ 댓글 작성자 아이디 가져오기 ☆★" +r_id);

        // 로그인된 사용자 아이디와 댓글 작성자 아이디 비교하여 일치하는 경우에만 삭제 가능
        if ((user != null && user.getId().equals(r_id)) || (admin != null && admin.getId().equals(r_id))) {
            rservice.deleteReply(r_code);
            return "redirect:/content_view?c_code=" + c_code;
        } else {
            // 일치하지 않는 경우에 대한 처리 (예: 권한이 없음 메시지를 보여주거나, 다른 페이지로 리다이렉트 등)
            return "error"; // 권한이 없는 경우 에러 페이지로 이동하도록 설정
        }
    }
    
}
