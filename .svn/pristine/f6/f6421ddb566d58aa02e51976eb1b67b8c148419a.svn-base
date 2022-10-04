package com.recyclebin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.ReplyVO;
import com.recyclebin.mapper.BoardMapper;
import com.recyclebin.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service @AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	private ReplyMapper mapper;
	private BoardMapper boardMapper;
	
	@Override
	@Transactional
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertSelectKey(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Long bno, Criteria cri) {
		return mapper.getListWithPaging(bno, cri);
	}
	
}
