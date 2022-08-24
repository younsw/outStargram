package com.younsw.OutStargram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public static final String FILE_UPLODE_PATH = "/Users/yeonsang-won/Documents/코딩/uplode/OutStargram/";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	// 파일을 저장하고 접근가능한 경로 리턴하는 기능
	public static String saveFile(int userId, MultipartFile file) {
		
		if(file == null) {
			logger.error("FileManagerService - saveFile : file 객체 null");
			return null;
		}
		
		// 파일을 어디에 저장할지 
//		/Users/yeonsang-won/Documents/코딩/uplode/3_
		// 디렉토리 새로 만든다.
		// 디렉토리 이름 규칙 
		// 사용자 (userId)
		// 시간 정보 - UNIX 타임 : 1970년 1월 1일을 기준으로 몇 millisecond(1/1000) 가 지났는지
		// /3_124371092837
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		// 디렉토리 생성
		String filePath = FILE_UPLODE_PATH + directoryName;
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			// 디렉토리 생성 실패
			logger.error("FileManagerService - saveFile : 디렉토리 생성 실패" + filePath);
			return null;
		}
		
		// 파일저장
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			// 파일 처리 예외 상황
			logger.error("FileManagerService - saveFile : 파일 저장 실패");
			return null;
			
		}
		
		// 외부에서 접근 가능한 경로 리턴
		// 규칙 정하기
		// /images/3_132413413/asdf.jpg
		// <img src="images/3_134134134/asdf.jpg >
		
		return "/images/" + directoryName + file.getOriginalFilename();
		
	}
	
	public static boolean removeFile(String filePath) { // /images/3-134134/test.png
		
		if(filePath == null) {
			return false;
		}
		
		String realFilePath = FILE_UPLODE_PATH + filePath.replace("/images/", "");
		
		Path path = Paths.get(realFilePath);
		
		// 파일이 있는지
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
				
				return false;
			}
		}
		
		path = path.getParent();
		
		// 디렉토리 존재하는지 확인 
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
		}
		
		return true;
	}

}
