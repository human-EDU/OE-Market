package com.recyclebin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.recyclebin.domain.ImgFileVO;

public interface ImgFileMapper {
	public int insert(ImgFileVO vo);
	
	public int delete(String uuid);
	
	public int deleteAll(Long bno);
	
	public List<ImgFileVO> findBy(Long bno);
}
