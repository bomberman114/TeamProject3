package com.green.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import com.green.crolling.vo.CrollingImgVo;

public class CrollingUtil {

    // 다나와 크롤링 이미지 다운로드,저장
    public static CrollingImgVo downloadAndSaveImage(String imgUrl, String uploadPath) {

            try {
                String modifiedUrl = imgUrl.replace("shrink=130:130", "shrink=500:500");
                URL url = new URL("https:" + modifiedUrl);
                BufferedImage image = ImageIO.read(url);

                String fileName = UUID.randomUUID().toString() + ".jpg";
                String folderPath = makeFolder(uploadPath);
                String savePath = uploadPath + File.separator + folderPath + File.separator + fileName;

                ImageIO.write(image, "jpg", new File(savePath));

                CrollingImgVo imgVo = new CrollingImgVo(0, 0, fileName, ".jpg", folderPath + File.separator + fileName);
                

                System.out.println("Image saved: " + savePath);
                return imgVo;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }


    // Create date-based folder structure
    private static String makeFolder(String uploadPath) {
        String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        String folderPath = dateStr.replace("/", File.separator);
        
        File uploadPathFolder = new File(uploadPath, folderPath);
        
        if (!uploadPathFolder.exists()) {
            uploadPathFolder.mkdirs();
        }
        
        return folderPath;
    }

    // Delete company images
    public static void deleteCompanyImage(String uploadPath, List<CrollingImgVo> fileList) {
        deleteImages(uploadPath, fileList, CrollingImgVo::getProduct_sfile_name);
    }

    // Generic method to delete images
    private static <T> void deleteImages(String uploadPath, List<T> fileList, java.util.function.Function<T, String> getFileName) {
        String path = uploadPath;
        
        fileList.forEach((file) -> {
            String sfile = getFileName.apply(file);
            File dfile = new File(path + sfile);
            if (dfile.exists()) {
                dfile.delete();
            }
        });
    }
}
