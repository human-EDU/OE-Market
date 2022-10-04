package com.recyclebin.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
@Alias("img")
public class ImgFileVO {
	private String uuid;
	private String origin;
	private String path;
	private Long bno;
	private boolean image;
	
	public ImgFileVO(String uuid, String origin, String path, boolean image) {
		this.uuid = uuid;
		this.origin = origin;
		this.path = path;
		this.image = image;
	}
	
	
}
