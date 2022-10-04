package com.recyclebin.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.ImgFileVO;
import com.recyclebin.service.BoardService;
import com.recyclebin.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@RequestMapping("board/*")
@AllArgsConstructor
@Log4j
public class BoardController {
	private BoardService boardService; 
	private MemberService memberService;
	
	/**
	 * 게시물 조회
	 * @author 김경보
	 */
	@GetMapping("list")
	public void list() {
		
	}
	
	/**
	 * 게시물 리스트 조회 페이징처리(무한스크롤)
	 * @author 김경보
	 * @param lastBno
	 * @param amount
	 * @return boardService.getList(cri)
	 */
	@GetMapping({"pages/{lastBno}", "pages/{lastBno}/{amount}"})
	@ResponseBody
	public List<BoardVO> getList(
			@PathVariable(required = false) Optional<Long> lastBno, 
			@PathVariable(required = false) Optional<Integer> amount){
		Criteria cri = new Criteria();
		cri.setLastBno(lastBno.orElse(cri.getLastBno()));
		cri.setAmount(amount.orElse(cri.getAmount()));
		return boardService.getList(cri);
	}
	
	
	/**
	 * 게시물 상세조회
	 * @author 김경보
	 * @param principal
	 * @param bno
	 * @param model
	 */
	@GetMapping("get")
	public void get(Principal principal,Long bno, Model model){
		String id = principal.getName();
		model.addAttribute("board",boardService.get(id, bno));
		model.addAttribute("user", memberService.get(principal.getName()));
	}
	
	
	/**
	 * 게시물 작성페이지
	 * @author 김경보
	 * @param cri
	 * @param principal
	 * @param model
	 * 
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("register")
	public void register(@ModelAttribute("cri") Criteria cri, Principal principal,Model model){
		model.addAttribute("user", memberService.get(principal.getName()));
		
	}
	
	
	/**
	 * 게시물 작성
	 * @author 김경보
	 * @param boardVO
	 * @param rttr
	 * @param cri
	 * @return "redirect:/board/get?bno=" + boardVO.getBno()
	 */
	@PreAuthorize("isAuthenticated() and principal.username == #boardVO.id")
	@PostMapping("register")
	public String register(BoardVO boardVO, RedirectAttributes rttr, Criteria cri){
		boardService.register(boardVO);
		rttr.addFlashAttribute("result", boardVO.getBno());
		
		log.info(boardVO.getWriter());
		log.warn(boardVO.getBno());
		return "redirect:/board/get?bno=" + boardVO.getBno();
	}
	
	
	/**
	 * 게시물 수정 페이지
	 * @author 김경보
	 * @param bno
	 * @param model
	 */
	@GetMapping("modify")
	public void modify(Principal principal,Long bno, Model model){
		String id = principal.getName();
		model.addAttribute("board",boardService.get(id,bno));
		
	}
	
	
	/**
	 * 게시물 수정
	 * @author 김경보
	 * @param boardVO
	 * @param rttr
	 * @return ""redirect:/board/get?bno=" + boardVO.getBno();
	 */
	@PreAuthorize("isAuthenticated() and principal.username == #boardVO.id")
	@PostMapping("modify")
	public String modify(BoardVO boardVO, RedirectAttributes rttr){
		if(boardService.modify(boardVO)){
			rttr.addFlashAttribute("result","수정");
		}
		return "redirect:/board/get?bno=" + boardVO.getBno();
	}
	
	
	/**
	 * * 게시물 삭제
	 * @author 김경보
	 * @param bno
	 * @param rttr
	 * @param uc
	 * @param boardVO
	 * @return "redirect:/board/list?category=" + category
	 */
	 
	@PreAuthorize("isAuthenticated() and principal.username == #boardVO.id")
	@PostMapping("remove")
	public String remove(String id,Long bno, RedirectAttributes rttr, UploadController uc, BoardVO boardVO){
		boardVO = boardService.get(id,bno);
		int category = boardVO.getCategory();
		List<ImgFileVO> attachs = boardService.getAttachs(bno);
		if(boardService.remove(bno)){
			rttr.addFlashAttribute("result", "삭제");
			if(attachs != null) attachs.forEach(uc::deleteFile);
		}
		return "redirect:/board/list?category=" + category;
	}
	
	
	/**
	 * 이미지 파일 리스트 조회
	 * @author 김경보
	 * @param bno
	 * @return boardService.getAttachs(bno)
	 */
	@GetMapping("attachs") @ResponseBody
	public List<ImgFileVO> getAttachs(Long bno){
		return boardService.getAttachs(bno);
	}
}
