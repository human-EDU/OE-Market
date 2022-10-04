package com.recyclebin.service;

import org.apache.ibatis.annotations.Param;

import com.recyclebin.domain.ChatRoomVO;
import com.recyclebin.domain.TradeVO;

public interface TradeService {
	TradeVO findByCno(Long cno);
	
	TradeVO findByTrno(Long trno);
	
	int createTrade(String buyerId, String sellerId, Long cno, Long buyerPoint, Long price);
	
	TradeVO updateBuyerStatus(Long trno);
	
	TradeVO updateSellerStatus(Long trno);
	
	TradeVO updateComplete(Long trno);
	
	int updateBoardTranscom(Long bno);
	
	int updateAmount(Long trno, Long amount);
	
	int updateBuyerPoint(Long trno);
	
	int updateMemberPoint(Long point, String sellerId);
	
	int updateCompleteDeal(String id);
	
	int cancelTrade(Long trno);

}
