package com.recyclebin.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.recyclebin.domain.AuthVO;
import com.recyclebin.domain.BoardVO;
import com.recyclebin.domain.BookmarkVO;
import com.recyclebin.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberServiceTests {
	@Setter @Autowired
	private PasswordEncoder encoder;
	
	@Setter @Autowired
	private MemberService memberService;
	
	@Test
	public void testExist(){
		assertNotNull(memberService);
	}
	
	@Test
	public void testGet(){
		log.info(memberService.get("test12"));
	}
	
	@Test
	public void testJoin(){
		MemberVO vo = new MemberVO();

		vo.setId("map5");
		vo.setPassword("1234");
		vo.setNickname("orange");
		vo.setName("orange");
		vo.setResident("999");		
		vo.setAccount("99");
		vo.setPhone("9");
		vo.setEmail("7777@gmail.com");
		
		vo.setZipcode("12345");
		vo.setRoadAddress("범석로 8길");
		vo.setAddress("부평구 십정동");
		vo.setDetailAddress("빌라 5동");
		vo.setLatitude("99.9999");
		vo.setLongitude("188.777777777");
		
		memberService.join(vo);				
	}
	
	@Test
	public void testModifyMember() {
		MemberVO vo = new MemberVO();
		// 변경가능 - 닉네임, 비밀번호
		vo.setNickname("blue orange");
		vo.setPassword("1234");
		
		vo.setZipcode("20520");
		vo.setRoadAddress("범석로");
		vo.setAddress("십정1동");
		vo.setDetailAddress("아파트");
		vo.setLatitude("11.222222222");
		vo.setLongitude("110.777777777");
		
		vo.setId("map5");
		log.info(vo);
		
		memberService.modifyMember(vo);
		
	}

	@Test
	public void testModifyAddress() {
		
		MemberVO vo = new MemberVO();
		// 변경가능 - 주소
		
		vo.setZipcode("123456");
		vo.setRoadAddress("석정로");
		vo.setAddress("간석3동");
		vo.setDetailAddress("아파트");
		vo.setLatitude("22.222222222");
		vo.setLongitude("130.777777777");
		
		vo.setId("map2");
		
		log.info(vo);
		
		memberService.modifyAddress(vo);
		
	}

	@Test
	public void testModifyAuth() {
		AuthVO vo = new AuthVO();
		vo.setId("map5");
//		vo.setAuth("ROLE_MEMBER");
		vo.setAuth("ROLE_MANAGER");
//		vo.setAuth("ROLE_ADMIN");
		
		log.info(vo);
		
		memberService.modifyAuth(vo);
	}
	
	@Test
	public void testRemove() {
		memberService.remove("map5");
	}
	
	@Test
	public void testAuthList() {
		memberService.AuthList();
	}	

	@Test
	public void testMemberList() {
		memberService.memberList();
	}
	
	@Test
	public void testRegisterBookmark() {
		BookmarkVO vo = new BookmarkVO();
		vo.setId("test1");
		vo.setBookmark1("강남구 대치동");
		vo.setBookmark2("서울시 동작구");
		vo.setBookmark3("서울시 서대문구");
		
		memberService.registerBookmark(vo);
	}
	
	@Test
	public void testModifyBookmark() {
		BookmarkVO vo = new BookmarkVO();
		vo.setId("test1");
		vo.setBookmark1("강남구 대치동");
		vo.setBookmark2("인천시 남동구");
		vo.setBookmark3("서울시 서대문구");
		
		memberService.modifyBookmark(vo);
	}
	
	@Test
	public void testRemoveBookmark() {
		memberService.removeBookmark("test1");
	}
	
	@Test
	public void testGetBookmark() {
		memberService.getBookmark("test1");
	}
	
	
	@Test
	public void testFindId() {
		memberService.findId("test1@naver.com");
	}
	
	@Test
	public void testTotalPost() {
		memberService.totalPost("test1");
	}
	
	@Test
	public void testAverangeScore() {
		memberService.averageScore("test1");		
	}

}
