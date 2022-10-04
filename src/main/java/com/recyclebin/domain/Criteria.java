package com.recyclebin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Criteria {
	private int amount = 9;
	private Long lastBno = 0L;
	private Long lastRno = 0L;
}