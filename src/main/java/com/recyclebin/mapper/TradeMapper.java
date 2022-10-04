package com.recyclebin.mapper;

import org.apache.ibatis.annotations.Param;

import com.recyclebin.domain.TradeVO;

public interface TradeMapper {
	TradeVO findByCno(Long cno);
	
	TradeVO findByTrno(Long trno);
	
	int createTrade(TradeVO vo);
	
	int updateBuyerStatus(@Param("trno") Long trno);
	
	int updateSellerStatus(@Param("trno") Long trno);
	
	int updateComplete(@Param("trno") Long trno);
	
	int updateBoardTranscom(Long bno);
	
	int updateAmount(@Param("trno") Long trno, @Param("amount") Long amount);
	
	int updateBuyerPoint(@Param("trno") Long trno);
	
	int updateMemberPoint(@Param("point") Long point, @Param("id") String sellerId);
	
	int updateCompleteDeal(@Param("id") String id);
	
	int cancelTrade(@Param("trno") Long trno);
}
