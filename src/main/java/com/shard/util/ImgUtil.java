package com.shard.util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ImgUtil {
	
	/* 이미지 저장을 2곳 이상에서 하기 때문에 불필요한 객체를 줄이기 위해 싱글톤패턴을 활용해
	 *  객체를 1개만 생성하고 이미지 저장을 사용하는 곳에서 클래스변수를 활용해서 이미지를 폴더에
	 *  저장하고 객체에 데이터를 담아주는 역할을 한다. */ 
	
	private static ImgUtil instence = new ImgUtil();
	
	private ImgUtil() {
	}
	
	public static ImgUtil getInstence() {
		return instence;
	}
	
	private String PATH = "c:/upload";
	
	private int counter = 1; // �뙆�씪 �씠由꾩쓣 怨좎쑀�븯寃� 留뚮뱾湲� �쐞�븳 移댁슫�꽣	
	
	public String storeFile(MultipartFile file) {
		int result = 0;
		String originalFileName = StringUtils.cleanPath(file.getOriginalFilename());
		String uniqueFileName = generateUniqueFileName(originalFileName);

		try {
			Path filePath = Paths.get(PATH, uniqueFileName);
			Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
			return uniqueFileName;
		} catch (IOException e) {
			result = -3; // �뙆�씪 �뾽濡쒕뱶 以� �삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎.
			throw new RuntimeException("�뙆�씪 ���옣 �떎�뙣", e);
		}
	}

	private  String generateUniqueFileName(String originalFileName) {
		String extension = extractFileExtension(originalFileName);
		String timeStamp = new SimpleDateFormat("yyyyMMdd-HHmmss-SSS").format(new Date());

		// 移댁슫�꽣瑜� �궗�슜�븯�뿬 �뙆�씪 �씠由꾩쓣 怨좎쑀�븯寃� 留뚮벊�땲�떎.
		String uniqueFileName = timeStamp + "-" + counter + "." + extension;

		// �떎�쓬 �뙆�씪�쓣 �쐞�빐 移댁슫�꽣瑜� 利앷��떆�궢�땲�떎.
		counter++;

		return uniqueFileName;
	}

	private static  String extractFileExtension(String fileName) {
		int lastDotIndex = fileName.lastIndexOf(".");
		return lastDotIndex == -1 ? "" : fileName.substring(lastDotIndex + 1);
	}
}
