package com.green.cs.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.UUID;
import org.springframework.web.multipart.MultipartFile;

import com.green.cs.vo.CsVo;

public class FileImage {

    // 파일 저장 메서드
    public static String save(HashMap<String, Object> map, MultipartFile[] files, CsVo csVo) {
        StringBuilder savedPaths = new StringBuilder();
        StringBuilder savedFileNames = new StringBuilder();
        
        String uploadPath = String.valueOf(map.get("uploadPath"));

        // 파일별로 처리
        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                continue; // 파일이 없으면 다음 파일로 넘어감
            }

            // 원본 파일명 가져오기
            String orgName = file.getOriginalFilename();
            String folderPath = makeFolder(uploadPath); // 날짜 폴더 생성
            String uuid = UUID.randomUUID().toString();
            String saveName = folderPath + File.separator + uuid + "_" + orgName;

            // 파일 경로 설정
            Path savePath = Paths.get(uploadPath, saveName);
            try {
                // 파일 저장
                file.transferTo(savePath);
                if (savedPaths.length() > 0) savedPaths.append(",");
                savedPaths.append(saveName);
                
                // 원본 파일명도 저장
                if (savedFileNames.length() > 0) savedFileNames.append(",");
                savedFileNames.append(orgName);
                
                
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        // CsVo 객체에 원본 파일명 저장
        csVo.setCustomer_service_sfile_name(savedFileNames.toString());
        return savedPaths.toString(); // 저장된 파일 경로 반환
    }

    // 날짜 기반 폴더 생성 메서드
    private static String makeFolder(String uploadPath) {
        String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        String folderPath = dateStr.replace("/", File.separator);

        File uploadPathFolder = new File(uploadPath, folderPath);
        if (!uploadPathFolder.exists()) {
            uploadPathFolder.mkdirs(); // 폴더 생성
        }

        return folderPath; // 생성된 폴더 경로 반환
    }

}
