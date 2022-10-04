package com.recyclebin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.ImgFileVO;
import com.recyclebin.mapper.BoardMapper;
import com.recyclebin.mapper.ImgFileMapper;
import com.recyclebin.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service @AllArgsConstructor

public class BoardServiceImpl implements BoardService{
	private BoardMapper boardMapper;
	private ImgFileMapper fileMapper;
	private ReplyMapper replyMapper;
	
	@Override
	public int register(BoardVO boardVO) {
		// TODO Auto-generated method stub
		int result = boardMapper.insertSelectKey(boardVO);
		boardVO.getAttachs().forEach(attach ->{
			attach.setBno(boardVO.getBno());
			fileMapper.insert(attach);
		});
		return result;
	}

	@Override
	public BoardVO get(String id,Long bno) {
		// TODO Auto-generated method stub
		fileMapper.findBy(bno);
		return boardMapper.read(id, bno);
	}

	@Override
	public boolean modify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		// 첨부파일 일괄 삭제
		fileMapper.deleteAll(boardVO.getBno());
		
		boardVO.getAttachs().forEach(attach ->{
			attach.setBno(boardVO.getBno());
			fileMapper.insert(attach);
		});
		
		return boardMapper.update(boardVO) > 0;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		replyMapper.deleteAll(bno);
		fileMapper.deleteAll(bno);
		return boardMapper.delete(bno) > 0;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(board -> {
			board.setAttachs(fileMapper.findBy(board.getBno()));
		});
		return list;
	}

	@Override
	public List<ImgFileVO> getAttachs(Long bno) {
		// TODO Auto-generated method stub
		return fileMapper.findBy(bno);
	}

	@Override
	public List<BoardVO> getList(String id) {
		// TODO Auto-generated method stub
		return boardMapper.getList(id);
	}

	@Override
	public List<BoardVO> findby(String category) {
		return boardMapper.findby(category);
	}

	@Override
	public Long getPrice(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.getPrice(bno);
	}
	
	
}
