package com.recyclebin.mapper;

import java.util.List;

import com.recyclebin.domain.AuthVO;
import com.recyclebin.domain.BookmarkVO;
import com.recyclebin.domain.MemberVO;
import com.recyclebin.domain.ScoreVO;

public interface MemberMapper {
	
	MemberVO read(String id); // 회원정보 및 권한조회
	
	int insertMember(MemberVO vo); // 회원정보추가
	
	List<AuthVO> getAuthList(); // 권한 전체조회
	
	int insertAuth(AuthVO vo); // 권한추가
	
	int updateMember(MemberVO vo); // 회원정보변경

	int updateAddress(MemberVO vo); // 회원주소변경
	
	int updateAuth(AuthVO vo); // 권한변경
	
	int deleteMember(String id); // 회원정보삭제
	
	int deleteAuth(String id); // 권한삭제
	
	int blackList(String id); // 활동정지, 블랙리스트
	
	ScoreVO readScore(String id); // 평점 조회
	
	List<MemberVO> getMemberList(); // 회원 전체조회
	
	int insertBookmark(BookmarkVO vo); // 즐겨찾기 주소 추가
	
	int updateBookmark(BookmarkVO vo); // 즐겨찾기 주소 수정
	
	int deleteBookmark(String id); // 즐겨찾기 주소 삭제
	
	BookmarkVO readBookmark(String id); // 즐겨찾기 주소 조회
	
	MemberVO SearchId(String email); // 아이디 찾기

//	MemberVO SearchPassword(String email); // 비밀번호 찾기 > 복호화? - 보류
	
//	int CountDeal(String id); // 거래완료 횟수 조회 - 보류

	int CountPost(String id); // 글 갯수 조회
	
	Integer CountScore(String id); // 평점 조회(평균)
	
	// 작성한 글 조회, 작성한 댓글 조회 - 보류
}
