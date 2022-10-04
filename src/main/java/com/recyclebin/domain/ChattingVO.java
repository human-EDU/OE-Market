package com.recyclebin.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("chatting")
public class ChattingVO {
	private Long clno; // 채팅 번호
	private Long cno; // 채팅방 번호
	private String userId; // 유저 아이디
	private String message; // 메세지 내용
	private boolean unReadCount; // 읽지않은 메세지 
	private Date regDate; // 보낸 시간
}
