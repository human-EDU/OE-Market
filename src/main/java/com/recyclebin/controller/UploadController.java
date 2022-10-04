package com.recyclebin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.recyclebin.domain.ImgFileVO;
import com.recyclebin.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

@RequestMapping("board/*")
@Controller
@Log4j
public class UploadController {
	private static final String UPLOAD_FOLDER = "c:/uploads";
	private BoardMapper mapper;
	
	/**
	 * 파일 조회
	 * @author 김경보
	 * @param vo
	 * @return result
	 */
	@GetMapping("display") @ResponseBody
	public ResponseEntity<byte[]> getFile(ImgFileVO vo){
		log.info(vo);
		File file = new File(UPLOAD_FOLDER,vo.getPath() +  "/" + vo.getUuid());
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
			
		} catch (IOException e) {
			e.printStackTrace();
			result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	/**
	 * 파일 업로드
	 * @author 김경보
	 * @param files
	 * @return list
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@PostMapping("upload") @ResponseBody
	public List<ImgFileVO> upload(MultipartFile[] files) throws IllegalStateException, IOException{
		List<ImgFileVO> list = new ArrayList<>();
		File uploadPath = new File(UPLOAD_FOLDER, getFolder());
		if(!uploadPath.exists()){
			uploadPath.mkdir();
		}
		for(MultipartFile multipartFile : files){
			String origin = multipartFile.getOriginalFilename();
			String ext = "";
			if(origin.lastIndexOf(".") != 1){
				ext = origin.substring(origin.lastIndexOf("."));
			}
			String uuid = UUID.randomUUID().toString() + ext;
			File file = new File(uploadPath, uuid);
			multipartFile.transferTo(file);
			
			ImgFileVO imgFileVO = new ImgFileVO(uuid, origin, getFolder(), isIamge(file));
			if(imgFileVO.isImage()){
				Thumbnails
				.of(file)
				.sourceRegion(Positions.CENTER,200,200)
				.size(200, 200)
				.toFile(new File(uploadPath,"s_" + uuid));
			}
			list.add(imgFileVO);
		}
		return list;
	}
	
	/**
	 * ck에디터를 통한 파일 첨부
	 * @author 김경보
	 * @param upload
	 * @return map
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@PostMapping(value="ckupload", produces=MediaType.APPLICATION_JSON_UTF8_VALUE) @ResponseBody
	public Map<String, String> ckupload(MultipartFile upload) throws IllegalStateException, IOException {
		File uploadPath = new File(UPLOAD_FOLDER,getFolder());
		if(!uploadPath.exists()){
			uploadPath.mkdir();
		}
		String origin = upload.getOriginalFilename();
		String ext = "";
		if(origin.lastIndexOf(".") != 1){
			ext = origin.substring(origin.lastIndexOf("."));
		}
		String uuid = UUID.randomUUID().toString() + ext;
		
		File file = new File(uploadPath,uuid);
		upload.transferTo(file);
		
		ImgFileVO imgFileVO = new ImgFileVO(origin, uuid, getFolder(), isIamge(file));
		if(imgFileVO.isImage()){
			Thumbnails
			.of(file)
			.sourceRegion(Positions.CENTER,200,200)
			.size(200, 200)
			.toFile(new File(uploadPath,"s_" + uuid));
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("uploaded", "1");
		map.put("fileName", origin);
		map.put("url", "/board/display?path="+getFolder()+"&uuid="+uuid);
		log.warn(map);
		return map;
		
	}
	
	/**
	 * 파일삭제
	 * @author 김경보
	 * @param imgFileVO
	 * @return "success"
	 */
	@PostMapping("deleteFile") @ResponseBody
	public String deleteFile(ImgFileVO imgFileVO){
		File file = new File(UPLOAD_FOLDER,imgFileVO.getPath() + "/" + imgFileVO.getUuid());
		file.delete();
		if(imgFileVO.isImage()){
			file = new File(UPLOAD_FOLDER, imgFileVO.getPath() + "/s_" + imgFileVO.getUuid());
			file.delete();
		}
		return "success";
		
	}
	
	/**
	 * 파일 다운로드
	 * @author 김경보
	 * @param imgFileVO
	 * @return result
	 */
	@GetMapping("download") @ResponseBody
	public ResponseEntity<byte[]> download(ImgFileVO imgFileVO){
		File file = new File(UPLOAD_FOLDER,imgFileVO.getPath() + "/" + imgFileVO.getUuid());
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", MediaType.APPLICATION_OCTET_STREAM_VALUE);
			headers.add("Content-Disposition", "attachment; filename=" + new String(imgFileVO.getOrigin().getBytes("utf-8"), "iso-8859-1"));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
			result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
		
	}
	
	/**
	 * 오늘자 패스생성 
	 * @author 김경보
	 * @return new SimpleDateFormat("yyyy/MM/dd").format(new Date())
	 */
	private String getFolder(){
		return new SimpleDateFormat("yyyy/MM/dd").format(new Date());
	}
	
	/**
	 * 이미지 여부 확인
	 * @@author 김경보
	 * @param file
	 * @return mime.startsWith("image");
	 * @throws IOException
	 */
	private boolean isIamge(File file) throws IOException{
		String mime = Files.probeContentType(file.toPath());
		if(mime == null || mime.equals("image/x-icon")) return false;
		return mime.startsWith("image");
	}
}
