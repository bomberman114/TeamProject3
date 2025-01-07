package com.green.files;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileImage {

    // 파일 저장 메서드
    public static void save(HashMap<String, Object> map, MultipartFile[] files) {
        // 저장 경로 가져오기
        String uploadPath = String.valueOf(map.get("uploadPath"));

        // 파일별로 처리
        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                continue; // 파일이 없으면 다음 파일로 넘어감
            }

            // 원본 파일명 가져오기
            String orgName = file.getOriginalFilename();
            String fileName = (orgName.lastIndexOf("\\") < 0) ? orgName : orgName.substring(orgName.lastIndexOf("\\") + 1);
            String fileExt = (orgName.lastIndexOf('.') < 0) ? "" : orgName.substring(orgName.lastIndexOf('.'));

            // 날짜 폴더 생성
            String folderPath = makeFolder(uploadPath);

            // UUID를 활용하여 고유한 파일명 생성
            String uuid = UUID.randomUUID().toString();
            String saveName = uploadPath + File.separator + folderPath + File.separator + uuid + "_" + fileName;
            String saveName2 = folderPath + File.separator + uuid + "_" + fileName;

            // 파일 저장 경로 생성
            Path savePath = Paths.get(saveName);

            // 파일 저장 처리
            try {
                file.transferTo(savePath);
                System.out.println(savePath + " 저장 완료");
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    // 날짜 폴더 생성 메서드
    private static String makeFolder(String uploadPath) {
        String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        String folderPath = dateStr.replace("/", File.separator);

        File uploadPathFolder = new File(uploadPath, folderPath);
        if (!uploadPathFolder.exists()) {
            uploadPathFolder.mkdirs();
        }

        return folderPath;
    }
}
