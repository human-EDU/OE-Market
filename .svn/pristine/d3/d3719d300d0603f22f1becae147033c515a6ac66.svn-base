package com.recyclebin.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("trade")
public class TradeVO {
	private Long trno; // 거래 번호
	private String buyerId; // 구매자 아이디
	private String sellerId; // 판매자 아이디
	private Long price; // 상품의 가격
	private Long amount; // 입금한 금액
	private boolean buyerStatus; // 구매자 거래 상태
	private boolean sellerStatus; // 판매자 거래 상태
	private Long buyerPoint; // 구매자 보유 포인트
	private boolean complete; // 거래 완료 상태 (구매자, 판매자 모두 참일 시 참)
	private Long cno; // 채팅방 번호

}
