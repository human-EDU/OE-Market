package com.recyclebin.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.Criteria;
import com.recyclebin.mapper.ImgFileMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class BoardServiceTests {
	
	@Setter @Autowired
	private BoardService boardService;
	
	@Setter @Autowired
	private PasswordEncoder encoder;
	
	@Test
	public void testExist(){
		assertNotNull(boardService);
	}
	
	@Test
	public void testGet(){
		BoardVO boardVO = boardService.get("kyoungbow",143L);
		log.info(boardVO);
	}
	
	@Test
	public void testRegister(){
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("service test2");
		boardVO.setContent("test2");
		boardVO.setId("test5");
		boardVO.setWriter("Ssam");
		boardVO.setCategory(1);
		boardVO.setPno(1L);
		boardVO.setPrice(10000L);
		log.info(boardVO);
		
		boardService.register(boardVO);
		boardService.getList(new Criteria());
	}
	
	@Test
	public void testModify(){
		BoardVO boardVO = boardService.get("kyoungbow",143L);
		boardVO.setTitle("testService2");
		boardVO.setContent("testService2");
		boardVO.setCategory(2);
		boardVO.setPno(2L);
		boardVO.setPrice(500L);
		boardService.modify(boardVO);
		log.info(boardVO);
	}
	
	@Test
	public void testRemove(){
		boardService.remove(545L);
		boardService.getList(new Criteria());
	}
	
	@Test
	public void testGetList(){
		Criteria criteria = new Criteria();
		List<BoardVO> list = boardService.getList(criteria);
		
		list.forEach(log::info);
	}
	
	
}
