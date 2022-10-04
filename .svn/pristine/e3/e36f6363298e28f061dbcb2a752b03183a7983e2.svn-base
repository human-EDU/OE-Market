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
import com.recyclebin.domain.TradeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@WebAppConfiguration
@Log4j
public class TradeControllerTests {
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
	
	
	// 채팅방 번호로 거래 확인
	@Test
	public void testFindByCno() throws Exception {
		mvc.perform(MockMvcRequestBuilders.get("/trade/202"))
				.andExpect(status().is2xxSuccessful());
	}
	
	// 구매자 입금 기능
	@Test
	@WithUserDetails("test1")
	public void testSetAmount() throws Exception {
		TradeVO vo = new TradeVO();
		vo.setTrno(61L);
		vo.setAmount(3000L);
		String jsonStr = new Gson().toJson(vo);
		mvc.perform(post("/trade/61")
				.contentType(MediaType.APPLICATION_JSON_VALUE)
				.content(jsonStr))
		.andExpect(status().is2xxSuccessful());
	}
	
	// 구매자 상태 업데이트
	@Test
	@WithUserDetails("test1")
	public void testUpdateBuyerStatus() throws Exception {
		mvc.perform(MockMvcRequestBuilders.get("/trade/61/updateBuyerStatus"))
		.andExpect(status().is2xxSuccessful());
	}
	
	// 판매자 상태 업데이트
	@Test
	@WithUserDetails("test1")
	public void testUpdateSellerStatus() throws Exception {
		mvc.perform(MockMvcRequestBuilders.get("/trade/61/updateSellerStatus"))
		.andExpect(status().is2xxSuccessful());
	}
	
	/**
	 * 거래완료
	 * 해당 게시판 거래완료 표시
	 * 채팅 거래 완료 표시
	 * 판매자에게 구매자가 설정한 금액이 입금됨
	 */
	@Test
	@WithUserDetails("test1")
	public void testUpdateComplete() throws Exception {
		mvc.perform(MockMvcRequestBuilders.get("/trade/61/updateComplete"))
		.andExpect(status().is2xxSuccessful());
	}
	/**
	 * 거래취소
	 * 구매자는 입금 전 상태로 돌아감
	 */
	@Test
	@WithUserDetails("test1")
	public void testCancelTrade() throws Exception {
		mvc.perform(MockMvcRequestBuilders.get("/trade/61/cancelTrade"))
		.andExpect(status().is2xxSuccessful());
	}
	

}
