package com.recyclebin.security;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.AuthVO;
import com.recyclebin.domain.MemberVO;
import com.recyclebin.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
						"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"
	})
@Log4j
public class SecurityTests {
	@Setter @Autowired
	private PasswordEncoder encoder;

	@Setter @Autowired
	private MemberMapper mapper;

	@Test
	public void testEncode() {
		String raw = "1234";
		log.info(raw);
		String encoded = encoder.encode(raw);
		log.info(encoded);
	}
	
	@Test
	public void testInsertMember() {
		MemberVO vo = new MemberVO();

		vo.setId("admin");
		vo.setPassword(encoder.encode("1234"));
		vo.setNickname("관리자");
		vo.setName("admin");
		vo.setResident("888");
		
		vo.setAccount("77");
		vo.setPhone("7");
		vo.setEmail("7887@.ac.ker");
		
		log.info(vo);
		
		mapper.insertMember(vo);
	}
	
}	
