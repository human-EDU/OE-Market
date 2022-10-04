package com.recyclebin.controller;

import java.security.Principal;
import java.util.List;
import java.util.Objects;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recyclebin.domain.AuthVO;
import com.recyclebin.domain.MemberVO;
import com.recyclebin.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("member")
@Log4j
@AllArgsConstructor
public class MemberController {
	private MemberService memberservice;
	
	/**
	 * 로그인
	 * @param error
	 * @param logout
	 * @param model
	 * @param id
	 */
	@GetMapping("login")
	public void login(@ModelAttribute String error, @ModelAttribute String logout, Model model, String id) {
		log.info("error :" + error);
		log.info("logout: " + logout);
		log.warn(id);
		
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "logout!!");
		}
		
	}
	
	/**
	 * 회원가입
	 */
	@GetMapping("join")
	public void join() {
		
	}

	/**
	 * 회원가입
	 * @param vo
	 * @return
	 */
	@PostMapping("join")
	public String join(MemberVO vo) {
		log.info(vo);
		memberservice.join(vo);
		return "redirect:/member/login";
	}

	/**
	 * 마이페이지 (조회)
	 * @param principal
	 * @param model
	 */
	@GetMapping("mypage")
	@PreAuthorize("isAuthenticated()")
	public void mypage(Principal principal, Model model) {
		MemberVO vo = memberservice.get(principal.getName());
		model.addAttribute("member", vo);
	}
	
	/**
	 * 마이페이지 (내용 수정)
	 * @param memberVO
	 * @param rttr
	 * @return
	 */
	@PreAuthorize("isAuthenticated() and principal.username == #memberVO.id")
	@PostMapping("mypage")
	public String mypage(MemberVO memberVO, RedirectAttributes rttr) {
		if(memberservice.modifyMember(memberVO)) {			
			rttr.addFlashAttribute("result", "수정");
		}
		return "redirect:/member/mypage";		
	}
	
	/**
	 * 프로필 (조회)
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("profile/{id}")
	public String profile(@PathVariable String id, Model model) {
		int score = Objects.isNull(memberservice.averageScore(id)) ? 0 : memberservice.averageScore(id);
		model.addAttribute("member", memberservice.get(id));
		model.addAttribute("post", memberservice.totalPost(id));		
		model.addAttribute("score", score);
		return "member/profile";
	}
	
	/**
	 * 관리자 페이지
	 * @param model
	 */
	@GetMapping("admin")
	@PreAuthorize("isAuthenticated()")
	public void admin(Model model) {
		List<MemberVO> member = memberservice.memberList();
		List<AuthVO> auth = memberservice.AuthList();
		model.addAttribute("member", member);
		model.addAttribute("auth", auth);
		
	}
	
	/**
	 * 회원 등급 수정
	 * @param vo
	 * @param rttr
	 * @return
	 */
	@PostMapping("modify")
	@PreAuthorize("isAuthenticated()")
	public String modify(AuthVO vo, RedirectAttributes rttr) {
		if(memberservice.modifyAuth(vo)) {
			rttr.addFlashAttribute("result", "등급수정");
		}
		return "redirect:/member/admin";

	}
	
	/**
	 * 회원 비활성화(활동정지)
	 * @param id
	 * @param rttr
	 * @return
	 */
	@PostMapping("remove")
	@PreAuthorize("isAuthenticated()")
	public String remove(String id, RedirectAttributes rttr) {
		if(memberservice.remove(id)) {
			rttr.addFlashAttribute("result", "회원정지");
		} 
		return "redirect:/member/admin";		
	}
	
}
