package com.recyclebin.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("board")
public class BoardVO {
	private Long bno; // 글번호
	private String title; // 글제목
	private String content; // 글내용
	private String id; // 작성자 아이디
	private String writer; // 작성자 닉네임
	private int category; // 게시판 카테고리
	private Date regDate; // 게시물 작성일
	private boolean transcom; // 거래 성사 전후 확인
	private Long pno; // 게시물 카테고리 번호
	private Long price; // 가격
	private Long crbno; // 크롤링해서 가져온 옛 글번호
	private String distance; // 거리
	List<ImgFileVO> attachs = new ArrayList<>(); // 파일 리스트
}
