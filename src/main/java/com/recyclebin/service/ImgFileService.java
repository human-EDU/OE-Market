package com.recyclebin.service;

import java.util.List;

import com.recyclebin.domain.ImgFileVO;

public interface ImgFileService {
	int register(ImgFileVO vo);
	int remove(String uuid);
	int removeAll(Long bno);
	List<ImgFileVO> getList (Long bno);
}
