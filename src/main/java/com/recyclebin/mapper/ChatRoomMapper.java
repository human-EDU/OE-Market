package com.recyclebin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.recyclebin.domain.ChatRoomVO;

public interface ChatRoomMapper {
	
	/**
	 * 채팅방 생성
	 * @author 김태윤
	 * @param vo
	 * @return
	 */
	int createChatRoom(ChatRoomVO vo);
	
	/**
	 * 채팅방 목록 불러오기
	 * @author 김태윤
	 * @param id
	 * @return
	 */
	List<ChatRoomVO> getChatRooms(String id);
	
	/**
	 * 채팅방 선택
	 * @author 김태윤
	 * @param cno
	 * @return
	 */
	ChatRoomVO selectChatRoom(Long cno);
	
	/**
	 * 채팅방 유무 확인
	 * @author 김태윤
	 * @param userId
	 * @param masterId
	 * @return
	 */
	ChatRoomVO searchChatRoom(@Param("userId") String userId,  @Param("masterId") String masterId);
	
	/**
	 * 읽지 않은 메세지 갯수
	 * @author 김태윤
	 * @return
	 */
	int updateUnreadCount();
}
