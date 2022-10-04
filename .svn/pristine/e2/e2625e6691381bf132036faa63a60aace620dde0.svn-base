package com.recyclebin.controller;

import static org.junit.Assert.assertNotNull;

import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.recyclebin.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@WebAppConfiguration
@Log4j
public class BoardControllerTests {
	
	@Setter @Autowired
	private WebApplicationContext ctx;
	private MockMvc mvc;
	
	@Before
	public void setup(){
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	@Test
	public void testExists() {
		assertNotNull(ctx);
		assertNotNull(mvc);
	}
	

	
	@Test
	public void testList() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/board/pages/200"))
				.andReturn().getModelAndView();
		
		Map<String, Object> map = mav.getModel();
		
		@SuppressWarnings("unchecked")
		List<BoardVO> list = (List<BoardVO>) map.get("boards");
		list.forEach(log::info);
		
		
	}
	@Test
	public void testRegister() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/board/register")
					.param("title", "controller title test")
					.param("content", "controller content test")
					.param("id", "test5")
					.param("writer", "Ssam")
					.param("category", "1")
					.param("pno", "1")
					.param("price", "1000"))
				.andReturn()
				.getModelAndView();
		
		log.info(mav.getViewName());
		
	}
	
	@Test
	public void testGet() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/board/get").principal(()->"test5")
			.param("bno", "643"))
		.andReturn()
		.getModelAndView();
		
		Map<String, Object> map = mav.getModel();
		Object board = map.get("board");
		log.info(board);
		
	}
	
	@Test
	public void testModify() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/board/modify")
					.param("title", "modify controller title test")
					.param("content", "modify controller content test")
					.param("id", "test5")
					.param("writer", "Ssam")
					.param("category", "1")
					.param("pno", "1")
					.param("price", "1000")
					.param("bno", "642"))
				.andReturn()
				.getModelAndView();
		
		log.info(mav.getViewName());
		
	}
	@Test
	public void testRemove() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("id", "test5")
				.param("bno", "642"))
				.andReturn()
				.getModelAndView();
		
		log.info(mav.getViewName());
	}
}
