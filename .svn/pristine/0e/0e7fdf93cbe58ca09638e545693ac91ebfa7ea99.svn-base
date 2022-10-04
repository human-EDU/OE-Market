package com.recyclebin.service;

import java.util.List;

import com.recyclebin.domain.ChatRoomVO;
import com.recyclebin.domain.ChattingVO;

public interface ChattingService {
	
	/**
	 * 채팅 목록 불러오기
	 * @author 김태윤
	 * @param cno
	 * @return
	 */
	List<ChattingVO> getMessages(Long cno);
	
	/**
	 * 메세지 보내기
	 * @author 김태윤
	 * @param vo
	 * @return
	 */
	int insertMessage(ChattingVO vo);
	
	/**
	 * 읽지 않은 메세지 갯수
	 * @author 김태윤
	 * @param vo
	 * @return
	 */
	int getUnReadCount(ChattingVO vo);
	
	/**
	 * 채팅 읽음 처리
	 * @author 김태윤
	 * @param vo
	 * @return
	 */
	int updateCount(ChattingVO vo);
	
	/**
	 * 보낸 메세지 확인
	 * @author 김태윤
	 * @param clno
	 * @return
	 */
	ChattingVO getMessage(Long clno);
}
