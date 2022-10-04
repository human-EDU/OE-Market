package com.recyclebin.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.ChatRoomVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class ChatRoomServiceTests {
	@Setter @Autowired
	private ChatRoomService service;
	@Setter @Autowired
	private PasswordEncoder encoder;
	
	@Test
	public void testSelectChatRoom() {
		log.info(service.selectChatRoom(61L));
	}
	
	@Test
	public void testCreateChatRoom() {
		ChatRoomVO vo = new ChatRoomVO();
		vo.setBno(101L);
		vo.setUserId("test02");
		vo.setMasterId("test15");
		service.createChatRoom(vo);
	}
	
	@Test
	public void testSearchChatRooms() {
		String userId = "test02";
		String masterId = "test15";
		log.info(service.searchChatRoom(userId, masterId));
	}
	
	@Test
	public void testGetChatRooms() {
		service.getChatRooms("test15").forEach(log::info);
	}
}
