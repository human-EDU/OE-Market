package com.recyclebin.controller;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.test.context.support.WithUserDetails;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.recyclebin.domain.ChatRoomVO;
import com.recyclebin.domain.ChattingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@WebAppConfiguration
@Log4j
public class ChatControllerTests {
	@Setter @Autowired
	private WebApplicationContext ctx;
	private MockMvc mvc;
	
    
    
	@Before
	public void setup() {
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}
	
	@Test
	public void testExists() {
		assertNotNull(ctx);
		assertNotNull(mvc);
		log.info(ctx);
		log.info(mvc);
	}
	
	// 채팅방 목록 확인
	@Test
	@WithUserDetails("test1")
	public void testGetChatRooms() throws Exception {
		mvc.perform(MockMvcRequestBuilders.get("/chat/rooms").principal(()->"test1"))
				.andExpect(status().is2xxSuccessful());
	}
	
	// 채팅 내역 확인
	@Test
	@WithUserDetails("test1")
	public void testGetChatting() throws Exception {
		mvc.perform(MockMvcRequestBuilders.get("/chat/rooms/202").principal(()->"test1"))
				.andExpect(status().is2xxSuccessful());
	}
	
	// 채팅 보내기
	@Test
	@WithUserDetails("test1")
	public void testSendMessage() throws Exception {
		ChattingVO vo = new ChattingVO();
		vo.setCno(202L);
		vo.setMessage("tete");
		vo.setUserId("test1");
		String jsonStr = new Gson().toJson(vo);
		mvc.perform(post("/chat/send").principal(()->"test1")
				.contentType(MediaType.APPLICATION_JSON_VALUE)
				.content(jsonStr))
		.andExpect(status().is2xxSuccessful());
	}
	
	// 채팅방 유무 확인 후 거래 생성
	@Test
	@WithUserDetails("test1")
	public void testCheckChatRoom() throws Exception {
		ChatRoomVO vo = new ChatRoomVO();
		vo.setBno(221L);
		vo.setUserId("test1");
		vo.setMasterId("test2");
		String jsonStr = new Gson().toJson(vo);
		mvc.perform(post("/chat/check")
				.contentType(MediaType.APPLICATION_JSON_VALUE)
				.content(jsonStr))
		.andExpect(status().is2xxSuccessful());
	}
}
