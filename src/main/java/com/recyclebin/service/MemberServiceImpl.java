package com.recyclebin.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recyclebin.domain.AuthVO;
import com.recyclebin.domain.BookmarkVO;
import com.recyclebin.domain.MemberVO;
import com.recyclebin.mapper.BoardMapper;
import com.recyclebin.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service @AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	private MemberMapper mapper;
	private PasswordEncoder encoder;

	/**
	 * 회원가입
	 */
	@Override
	public void join(MemberVO vo) {
		vo.setPassword(encoder.encode(vo.getPassword()));
		mapper.insertMember(vo);
		AuthVO authVO = new AuthVO();
		authVO.setAuth("ROLE_MEMBER");
		authVO.setId(vo.getId());
		mapper.insertAuth(authVO);
	}

	/**
	 * 단일 회원조회
	 */
	@Override
	public MemberVO get(String id) {
		return mapper.read(id);
	}

	/**
	 * 회원 정보 수정
	 */
	@Override
	public boolean modifyMember(MemberVO vo) {
		if(vo.getPassword() != null && !vo.getPassword().equals("")){			
			vo.setPassword(encoder.encode(vo.getPassword()));
		}
		return mapper.updateMember(vo) > 0;
	}
	
	/**
	 * 회원 주소 수정(미사용)
	 */
	@Override
	public boolean modifyAddress(MemberVO vo) {
		return mapper.updateAddress(vo) > 0;
	}

	/**
	 * 회원 권한 수정
	 */
	@Override
	public boolean modifyAuth(AuthVO vo) {
		return mapper.updateAuth(vo) > 0;
	}

//	@Transactional
//	@Override
//	public boolean remove(String id) {
//		mapper.deleteAuth(id);
//		return mapper.deleteMember(id) > 0;
//	}
	
	/**
	 * 회원 정지(활동 정지)
	 */
	public boolean remove(String id) {
		return mapper.blackList(id) > 0;
	}
	
	/**
	 * 전체 회원 권한 조회
	 */
	@Override
	public List<AuthVO> AuthList() {
		return mapper.getAuthList();
	}

	/**
	 * 전체 회원 조회
	 */
	@Override
	public List<MemberVO> memberList() {
		return mapper.getMemberList();
	}

	/**
	 * 즐겨찾기 주소 추가
	 */
	@Override
	public int registerBookmark(BookmarkVO vo) {
		return mapper.insertBookmark(vo);
	}

	/**
	 * 즐겨찾기 주소 수정
	 */
	@Override
	public boolean modifyBookmark(BookmarkVO vo) {
		return mapper.updateBookmark(vo) > 0;
	}

	/**
	 * 즐겨찾기 주소 삭제
	 */
	@Override
	public boolean removeBookmark(String id) {
		return mapper.deleteBookmark(id) > 0;
	}

	/**
	 * 즐겨찾기 주소 조회
	 */
	@Override
	public BookmarkVO getBookmark(String id) {
		return mapper.readBookmark(id);
	}
	
	/**
	 * 아이디 찾기
	 */
	@Override
	public MemberVO findId(String email) {
		return mapper.SearchId(email);
	}

//	@Override
//	public MemberVO findPassword(String email) {
//		// TODO Auto-generated method stub
//		return mapper.SearchPassword(email);
//	}

	/**
	 * 글 갯수 조회
	 */
	@Override
	public int totalPost(String id) {
		return mapper.CountPost(id);
	}

	/**
	 * 평점 조회
	 */
	@Override
	public Integer averageScore(String id) {
		return mapper.CountScore(id);
	}
		
}
