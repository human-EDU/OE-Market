package com.recyclebin.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})

@Log4j
public class BoardMapperTests {
	
	@Setter @Autowired
	private BoardMapper boardMapper;
	
	@Setter @Autowired
	private ImgFileMapper fileMapper;
	
	@Setter @Autowired
	private ReplyMapper replyMapper;
	
	@Setter @Autowired
	private PasswordEncoder encoder;
	
	@Setter @Autowired
	private MemberMapper memberMapper;
	
	
	@Test
	public void testExist(){
		assertNotNull(boardMapper);
	}
	
	@Test
	public void testGetList(){
		List<BoardVO> list = boardMapper.getList("kyoungbow");
		assertNotNull(list);
		list.forEach(log::info);
		
	}
	
	@Test
	public void testGetListWithPaging(){
		Criteria cri = new Criteria();
		cri.setAmount(9);
		cri.setLastBno(200L);
		log.info(cri);
		List<BoardVO> result = boardMapper.getListWithPaging(cri);
		assertNotNull(result);
		result.forEach(log::info);
		
	}
	
	@Test
	public void testRead(){
		BoardVO read = boardMapper.read("kyoungbow", 143L);
		log.info(read);
	}
	
	@Test
	public void testInsert(){
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("Mapper Test");
		boardVO.setContent("Mapper TestInsert");
		boardVO.setId("test5");
		boardVO.setWriter("Ssam");
		boardVO.setCategory(1);
		boardVO.setPno(1L);
		boardVO.setPrice(1000L);
		log.info(boardVO);
		
		boardMapper.insert(boardVO);
		boardMapper.getList("kyoungbow");
		
	}
	
	@Test
	public void testUpdate(){
		BoardVO boardVO = boardMapper.read("kyoungbow", 143L);
		boardVO.setTitle("Mapper Update Title");
		boardVO.setContent("Mapper Update Content");
		boardVO.setCategory(1);
		boardVO.setPno(1L);
		boardVO.setPrice(10000L);
		
		boardMapper.update(boardVO);
		boardMapper.getList("kyoungbow");
	}
	
	@Test
	public void testDelete(){
		replyMapper.deleteAll(572L);
		fileMapper.deleteAll(575L);
		boardMapper.delete(572L);
		boardMapper.getList("kyoungbow");
		
	}
	
	@Test
	public void testInsertSelectKey(){
		BoardVO boardVO = new BoardVO();
		
		boardVO.setTitle("Mapper Test title with InsertSelectkey");
		boardVO.setContent("Mapper Test content with InsertSelectkey");
		boardVO.setId("test5");
		boardVO.setWriter("Ssam");
		boardVO.setCategory(1);
		boardVO.setPno(1L);
		boardVO.setPrice(1000L);
		
		log.info(boardVO);
		boardMapper.insertSelectKey(boardVO);
		boardMapper.getListWithPaging(new Criteria());
	}
	
}
