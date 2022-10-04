package com.recyclebin.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.ImgFileVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ImgFileServiceTests {
	@Setter @Autowired
	private ImgFileService fileService;
	
	@Test
	public void testExist(){
		assertNotNull(fileService);
	}
	
	@Test
	public void testRegister(){
		ImgFileVO vo = new ImgFileVO();
		vo.setBno(579L);
		vo.setUuid("testUuid.jpg");
		vo.setOrigin("testOrigin.jpg");
		vo.setPath("2022/05/19");
		vo.setImage(true);
		fileService.register(vo);
		
		fileService.getList(579L).forEach(log::info);
	}
	
	@Test
	public void testList(){
		fileService.getList(200L).forEach(log::info);
	}
	
	@Test
	public void testRemove(){
		fileService.remove("testUuid.jpg");
		fileService.getList(579L).forEach(log::info);
	}
	
	@Test
	public void testRemoveAll(){
		fileService.removeAll(579L);
		fileService.getList(579L).forEach(log::info);
	}
	
}
