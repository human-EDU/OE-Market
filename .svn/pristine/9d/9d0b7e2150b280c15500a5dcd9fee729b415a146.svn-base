package com.recyclebin.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.ChattingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class ChattingServiceTests {
	@Setter @Autowired
	private ChattingService service;
	@Setter @Autowired
	private PasswordEncoder encoder;
	
	@Test
	public void testGetMessages() {
		service.getMessages(61L).forEach(log::info);
	}
	
	@Test
	public void testInsertMessage() {
		ChattingVO vo = new ChattingVO();
		vo.setCno(61L);
		vo.setUserId("test15");
		vo.setMessage("service테스트");
//		vo.setSessionCount(1);
		service.insertMessage(vo);
	}
	
	@Test
	public void testGetUnReadCount() {
		ChattingVO vo = new ChattingVO();
		vo.setCno(61L);
		vo.setUserId("test12");
		log.info(service.getUnReadCount(vo));
	}
	
	@Test
	public void testUpdateCount() {
		ChattingVO vo = new ChattingVO();
		vo.setCno(61L);
		vo.setUserId("test12");
		service.updateCount(vo);
	}
}
