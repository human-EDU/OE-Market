package com.recyclebin.service;

import org.springframework.stereotype.Service;

import com.recyclebin.domain.ChatRoomVO;
import com.recyclebin.domain.MemberVO;
import com.recyclebin.domain.TradeVO;
import com.recyclebin.mapper.ChatRoomMapper;
import com.recyclebin.mapper.MemberMapper;
import com.recyclebin.mapper.TradeMapper;

import lombok.AllArgsConstructor;

@Service @AllArgsConstructor
public class TradeServiceImpl implements TradeService{
	private TradeMapper tradeMapper;
	private MemberMapper memberMapper;
	private ChatRoomMapper chatRoomMapper;
	
	@Override
	public TradeVO findByCno(Long cno) {
		// TODO Auto-generated method stub
		return tradeMapper.findByCno(cno);
	}
	
	@Override
	public TradeVO findByTrno(Long trno) {
		// TODO Auto-generated method stub
		return tradeMapper.findByTrno(trno);
	}
	
	@Override
	public int createTrade(String buyerId, String sellerId, Long cno, Long buyerPoint,  Long price) {
		// TODO Auto-generated method stub
		TradeVO vo = new TradeVO();
		vo.setBuyerId(buyerId);
		vo.setSellerId(sellerId);
		vo.setCno(cno);
		vo.setBuyerPoint(buyerPoint);
		vo.setPrice(price);
		return tradeMapper.createTrade(vo);
	}
	
	@Override
	public TradeVO updateBuyerStatus(Long trno) {
		// TODO Auto-generated method stub
		tradeMapper.updateBuyerStatus(trno);
		return tradeMapper.findByTrno(trno);
	}

	@Override
	public TradeVO updateSellerStatus(Long trno) {
		// TODO Auto-generated method stub
		tradeMapper.updateSellerStatus(trno);
		return tradeMapper.findByTrno(trno);
	}

	@Override
	public TradeVO updateComplete(Long trno) {
		// TODO Auto-generated method stub
		tradeMapper.updateComplete(trno);
		TradeVO tradeVO = tradeMapper.findByTrno(trno);
		String sellerId = tradeVO.getSellerId();
		String buyerId = tradeVO.getBuyerId();
		
		MemberVO sellerMember = memberMapper.read(sellerId);
		MemberVO buyerMember = memberMapper.read(buyerId);
		
		ChatRoomVO chatRoomVO = chatRoomMapper.selectChatRoom(tradeVO.getCno());
		tradeMapper.updateBoardTranscom(chatRoomVO.getBno());
		
		Long sellerPoint = sellerMember.getPoint() + tradeVO.getAmount();
		Long buyerPoint = buyerMember.getPoint() - tradeVO.getAmount();
		tradeMapper.updateMemberPoint(sellerPoint, sellerId);
		tradeMapper.updateMemberPoint(buyerPoint, buyerId);
		tradeMapper.updateCompleteDeal(sellerId);
		tradeMapper.updateCompleteDeal(buyerId);
		return tradeMapper.findByTrno(trno);
	}

	@Override
	public int updateBoardTranscom(Long bno) {
		// TODO Auto-generated method stub
		return tradeMapper.updateBoardTranscom(bno);
	}
	
	@Override
	public int updateAmount(Long trno, Long amount) {
		// TODO Auto-generated method stub
		return tradeMapper.updateAmount(trno, amount);
	}

	@Override
	public int updateBuyerPoint(Long trno) {
		// TODO Auto-generated method stub
		return tradeMapper.updateBuyerPoint(trno);
	}

	@Override
	public int updateMemberPoint(Long point, String sellerId) {
		// TODO Auto-generated method stub
		return tradeMapper.updateMemberPoint(point, sellerId);
	}

	@Override
	public int updateCompleteDeal(String id) {
		// TODO Auto-generated method stub
		return tradeMapper.updateCompleteDeal(id);
	}

	@Override
	public int cancelTrade(Long trno) {
		// TODO Auto-generated method stub
		return tradeMapper.cancelTrade(trno);
	}
}
