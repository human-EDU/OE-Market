package com.recyclebin.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data  @Alias("score")
public class ScoreVO {
	private String id; // 아이디
	private Long score; // 받은 점수
	
}
