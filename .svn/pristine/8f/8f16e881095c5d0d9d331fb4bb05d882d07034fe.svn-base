package com.recyclebin.service;

import java.util.List;

import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.ImgFileVO;

public interface BoardService {
	public List<BoardVO> getList(String id);
	
	int register(BoardVO boardVO);
	
	BoardVO get(String id,Long bno);
	
	Long getPrice(Long bno);
	
	boolean modify(BoardVO boardVO);
	
	boolean remove(Long bno);
	
	List<BoardVO> getList(Criteria cri);

	List<ImgFileVO> getAttachs(Long bno);
	
	List<BoardVO> findby(String category);
}
