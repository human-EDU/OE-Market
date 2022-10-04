package com.recyclebin.mapper;

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
public class ChattingMapperTests {
	@Setter @Autowired
	private ChattingMapper mapper;
	@Setter @Autowired
	private PasswordEncoder encoder;
	
	@Test
	public void testInsertMessage() {
		ChattingVO vo = new ChattingVO();
		vo.setCno(125L);
		vo.setUserId("test1");
		vo.setMessage("test1의 메세지");
//		vo.setSessionCount(1);
		mapper.insertMessage(vo);
	}
	
	@Test
	public void testGetMessages() {
		mapper.getMessages(125L).forEach(log::info);
	}
	
	@Test
	public void testGetUnReadCount() {
		ChattingVO vo = new ChattingVO();
		vo.setCno(125L);
		vo.setUserId("test2");
		log.info(mapper.getUnReadCount(vo));
	}
	
	@Test
	public void testUpdateCount() {
		ChattingVO vo = new ChattingVO();
		vo.setCno(125L);
		vo.setUserId("test2");
		mapper.updateCount(vo);
	}
	
}
