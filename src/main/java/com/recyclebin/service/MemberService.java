package com.recyclebin.service;

import java.util.List;

import com.recyclebin.domain.AuthVO;
import com.recyclebin.domain.BookmarkVO;
import com.recyclebin.domain.MemberVO;

public interface MemberService {

	void join(MemberVO vo); // 회원가입
	
	MemberVO get(String id); // 회원조회 (단일회원조회)
	
	boolean modifyMember(MemberVO vo); // 회원정보수정

	boolean modifyAddress(MemberVO vo); // 회원주소수정

	boolean modifyAuth(AuthVO vo); // 회원권한수정
	
	boolean remove(String id); // 회원정지
	
	List<AuthVO> AuthList(); // 전체 회원 권한조회

	List<MemberVO> memberList(); // 전체 회원조회
	
	int registerBookmark(BookmarkVO vo); // 즐겨찾기 주소 추가
	
	boolean modifyBookmark(BookmarkVO vo); // 즐겨찾기 주소 수정
	
	boolean removeBookmark(String id); // 즐겨찾기 주소 삭제
	
	BookmarkVO getBookmark(String id); // 즐겨찾기 주소 조회
	
	MemberVO findId(String email); // id 찾기
	
//	MemberVO findPassword(String email); // password 찾기
	
	int totalPost(String id); // 글 갯수 조회
	
	Integer averageScore(String id); // 평점 조회 (받은 별점 평균 조회)
}
