package com.recyclebin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recyclebin.domain.ChattingVO;
import com.recyclebin.mapper.ChattingMapper;

import lombok.AllArgsConstructor;

@Service @AllArgsConstructor
public class ChattingServiceImpl implements ChattingService{
	private ChattingMapper mapper;
	
	@Override
	public List<ChattingVO> getMessages(Long cno) {
		// TODO Auto-generated method stub
		return mapper.getMessages(cno);
	}

	@Override
	public int insertMessage(ChattingVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertMessage(vo);
	}

	@Override
	public int getUnReadCount(ChattingVO vo) {
		// TODO Auto-generated method stub
		return mapper.getUnReadCount(vo);
	}

	@Override
	public int updateCount(ChattingVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateCount(vo);
	}

	@Override
	public ChattingVO getMessage(Long clno) {
		// TODO Auto-generated method stub
		return mapper.getMessage(clno);
	}

}
