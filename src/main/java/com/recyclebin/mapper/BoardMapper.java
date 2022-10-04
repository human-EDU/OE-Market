package com.recyclebin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.MemberVO;

public interface BoardMapper {
	// select
	public List<BoardVO> getList(String id);
	public BoardVO read(@Param("id")String id,@Param("bno") Long bno);
	public List<BoardVO> getListWithPaging(@Param("cri") Criteria cri);
	
	//insert
	public int insert(BoardVO boardVO);
	public int insertSelectKey(BoardVO boardVO);
	public int update(BoardVO boardVO);
	public int delete(Long bno);
	public List<BoardVO> findby(String category);
	
	public Long getPrice(Long bno);
	
	
}