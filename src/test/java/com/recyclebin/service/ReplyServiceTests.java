package com.recyclebin.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.Criteria;
import com.recyclebin.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReplyServiceTests {
	
	@Setter @Autowired
	private ReplyService replyService;
	
	@Test
	public void testExist(){
		assertNotNull(replyService);
	}
	
	@Test
	public void testRegister(){
		ReplyVO vo = new ReplyVO();
		vo.setBno(235L);
		vo.setWriter("Ssam");
		vo.setReply("안녕하세용");
		replyService.register(vo);
	}
	
	@Test
	public void testGet(){
		ReplyVO vo = replyService.get(153L);
		log.info(vo);
	}
	
	@Test
	public void testModify(){
		ReplyVO vo = replyService.get(153L);
		vo.setReply("test replyService");
		replyService.modify(vo);
		replyService.get(153L);
	}
	
	@Test
	public void testRemove(){
		replyService.remove(153L);
		replyService.get(153L);
		
	}
	
	@Test
	public void testList(){
		Criteria cri = new Criteria();
		cri.setLastRno(141L);
		replyService.getList(235L, cri);
	}

}
