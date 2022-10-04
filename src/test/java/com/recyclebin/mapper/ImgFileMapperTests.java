package com.recyclebin.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.ImgFileVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ImgFileMapperTests {
	
	@Setter @Autowired
	private ImgFileMapper mapper;
	@Setter @Autowired
	private PasswordEncoder encoder;
	
	@Test
	public void testExist(){
		assertNotNull(mapper);
	}
	@Test
	public void testList(){
//		log.info(boardVO);
		
		mapper.findBy(578L).forEach(log::info);
	}
	@Test
	public void testDelete(){
		mapper.delete("ca52e76a-9a48-4ed6-ae15-e3cf4abe5fec.PNG");
		mapper.findBy(577L).forEach(log::info);
	}
	
	@Test
	public void testDeleteAll(){
		mapper.deleteAll(578L);
		mapper.findBy(578L).forEach(log::info);
	}
	
	@Test
	public void testInsert(){
		ImgFileVO vo = new ImgFileVO();
		vo.setUuid("test uuid");
		vo.setOrigin("test origin");
		vo.setPath("2022/05/19");
		vo.setBno(579L);
		vo.setImage(true);
		mapper.insert(vo);
		mapper.findBy(579L).forEach(log::info);
	}
	
}
