package com.recyclebin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.recyclebin.domain.ImgFileVO;
import com.recyclebin.mapper.ImgFileMapper;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class ImgFileServiceImpl implements ImgFileService{
	private ImgFileMapper mapper;
	@Override
	public int register(ImgFileVO vo) {
		return mapper.insert(vo);
	}

	public int remove(String uuid) {
		return mapper.delete(uuid);
	}

	@Override
	public int removeAll(Long bno) {
		return mapper.deleteAll(bno);
	}

	@Override
	public List<ImgFileVO> getList(Long bno) {
		return mapper.findBy(bno);
	}
	
}
