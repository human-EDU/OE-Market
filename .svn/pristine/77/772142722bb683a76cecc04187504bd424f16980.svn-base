package com.recyclebin.controller;
import java.io.IOException;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.recyclebin.domain.ChatRoomVO;
import com.recyclebin.domain.ChattingVO;
import com.recyclebin.domain.CustomUser;
import com.recyclebin.domain.MemberVO;
import com.recyclebin.domain.TradeVO;
import com.recyclebin.service.BoardService;
import com.recyclebin.service.ChatRoomService;
import com.recyclebin.service.ChattingService;
import com.recyclebin.service.MemberService;
import com.recyclebin.service.TradeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("chat")
@AllArgsConstructor
@Log4j
public class ChatController{
	private ChatRoomService chatRoomService;
	private ChattingService chattingService;
	private TradeService tradeService;
	private MemberService memberService;
	private BoardService boardService;
	/**
	 * 채팅목록 불러오기
	 * @param cno
	 * @param vo
	 * @param model
	 * @Parma principal
	 * @return
	 */
	@GetMapping("rooms/{cno}") @ResponseBody
	public List<ChattingVO> getMessages(@PathVariable Long cno, ChattingVO vo, Model model, Principal principal) {
		vo.setCno(cno);
		vo.setUserId(principal.getName());
		chattingService.updateCount(vo);
		model.addAttribute("message", chattingService.getMessages(cno));
		log.info(chattingService.getMessage(cno));
		return chattingService.getMessages(cno);
	}
	
	/**
	 * 채팅 보내기
	 * @author 김태윤
	 * @param vo
	 * @return
	 */
	@PostMapping("send") @ResponseBody
	public Long sendMessage(@RequestBody ChattingVO vo) {
		return chattingService.insertMessage(vo) > 0 ? vo.getClno() : null;
	}
	
	/**
	 * 보낸 채팅 확인
	 * @param clno
	 * @return
	 */
	@GetMapping("/chat/rooms/{cno}/{clno}")
	public ChattingVO getMessage(Long clno) {
		return chattingService.getMessage(clno);
	}

	/**
	 * 채팅방 목록
	 * @param principal
	 * @return
	 */
	@GetMapping("rooms") @ResponseBody
    public List<ChatRoomVO> getChatRooms(Principal principal) {
		log.info(principal);
		return chatRoomService.getChatRooms(principal.getName());
    }
	/**
	 * 채팅방 유무 확인 후 거래 생성
	 * @param vo
	 * @return
	 */
	@PostMapping("check") @ResponseBody
	public String checkChatRoom(@RequestBody ChatRoomVO vo) {
		String userId = vo.getUserId();
		String masterId = vo.getMasterId();
		Long bno = vo.getBno();
		if(Objects.isNull(chatRoomService.searchChatRoom(userId, masterId))) {
			vo.setUserId(userId);
			vo.setMasterId(masterId);
			vo.setBno(bno);
			chatRoomService.createChatRoom(vo);
			vo = chatRoomService.searchChatRoom(userId, masterId);
			Long buyerPoint = memberService.get(userId).getPoint();
			Long price = boardService.getPrice(bno);
			tradeService.createTrade(userId, masterId, vo.getCno(), buyerPoint, price);
		};
		log.warn(chatRoomService.searchChatRoom(userId, masterId).getCno());
		return "success";
	}
	
}
