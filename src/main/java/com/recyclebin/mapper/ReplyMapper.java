package com.recyclebin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.ReplyVO;

public interface ReplyMapper {
	int insert(ReplyVO vo);

	int insertSelectKey(ReplyVO vo);
	
	ReplyVO read(Long rno);
	
	int delete(Long rno);
	
	int deleteAll(Long bno);
	
	int update(ReplyVO vo);
	
	List<ReplyVO> getListWithPaging(@Param("bno") Long bno, @Param("cri") Criteria cri);
	
}
