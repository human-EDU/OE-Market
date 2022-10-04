package com.recyclebin.domain;

import java.util.List;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data @Alias("member")
public class MemberVO {
	// 주소
	private String zipcode; // 우편번호
	private String roadAddress; // 도로명주소
	private String address;	// 지번주소
	private String detailAddress; // 상세주소
	private String latitude; // 위도
	private String longitude; // 경도
	
	private String account; // 계좌

	private String name; // 이름
	private String resident; // 주민등록번호
	private String phone; // 핸드폰번호
	
	private String nickname; // 닉네임
	private String id; // 아이디
	private String email; // 이메일
	private String password; // 비밀번호
	
	private Long point; // 포인트

	// 인증
	private Long accountCheck; // 계좌인증여부
	private Long phoneCheck; // 핸드폰인증여부
	private Long emailCheck; // 이메일인증여부
		
	private boolean enabled; // 활동가능여부	
	private List<AuthVO> auths; // 권한
	
	private int completeDeal; // 거래완료횟수
	
}
