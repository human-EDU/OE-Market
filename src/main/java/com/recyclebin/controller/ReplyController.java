package com.recyclebin.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.MemberVO;
import com.recyclebin.domain.ReplyVO;
import com.recyclebin.service.MemberService;
import com.recyclebin.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("replies")
@AllArgsConstructor
@Log4j
public class ReplyController {
	private ReplyService replyService;
	private MemberService member;
	
	/**
	 * 댓글 조회(무한스크롤)
	 * @author 김경보
	 * @param bno
	 * @param lastRno
	 * @param amount
	 * @return replyService.getList(bno, cri)
	 */
	@GetMapping({"pages/{bno}", "pages/{bno}/{lastRno}", "pages/{bno}/{lastRno}/{amount}"})
	public List<ReplyVO> getList(
			@PathVariable Long bno, 
			@PathVariable(required = false) Optional<Long> lastRno, 
			@PathVariable(required = false) Optional<Integer> amount){
		Criteria cri = new Criteria();
		cri.setLastRno(lastRno.orElse(cri.getLastRno()));
		cri.setAmount(amount.orElse(cri.getAmount()));
		return replyService.getList(bno, cri);
	}
	
	/**
	 * 댓글단일 조회
	 * @author 김경보
	 * @param rno
	 * @return replyService.get(rno)
	 */
	@GetMapping("{rno}")
	public ReplyVO get(@PathVariable Long rno){
		return replyService.get(rno);
		
	}
	/**
	 * 댓들 등록
	 * @author 김경보
	 * @param vo
	 * @return replyService.register(vo) > 0 ? vo.getRno() : null
	 */
	@PostMapping("new")
	@PreAuthorize("isAuthenticated()")
	public Long create(@RequestBody ReplyVO vo){
		
		return replyService.register(vo) > 0 ? vo.getRno() : null;
	}
	
	
	/**
	 * 댓글 삭제
	 * @author 김경보
	 * @param rno
	 * @return replyService.remove(rno) > 0 ? "success" : null;
	 */
	
	@DeleteMapping("{rno}")
	@PreAuthorize("principal.username == #vo.writer")
	public String remove(@PathVariable Long rno){
		return replyService.remove(rno) > 0 ? "success" : null;
		
	}
	
	/**
	 * 댓글 수정
	 * @author 김경보
	 * @param rno
	 * @param vo
	 * @return return replyService.modify(vo) > 0 ? "success" : null
	 */
	@RequestMapping(value="{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	@PreAuthorize("isAuthenticated() and principal.username == #vo.writer")
	public String modify(@PathVariable Long rno, @RequestBody ReplyVO vo){
		return replyService.modify(vo) > 0 ? "success" : null;
	}
	
}