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

import com.green.crawling.vo.CrawlingImgVo;




public class FileImage {

		// uploadfiles 에 넘어온 파일들을 저장
		public static void save(
				HashMap<String, Object> map, 
				MultipartFile[] profileImge) {
			// 저장될 경로를 가져온다
			String  uploadPath = String.valueOf( map.get("uploadPath") );
			  // 파일 목록 리스트 선언
		    //List<CompanyImageVo> companyImageList = new ArrayList<>();
		    //List<UserImageVo> userImageList = new ArrayList<>();
		   
		    System.out.println("save까지옴");
			System.out.println("profileImge:" + profileImge.toString().length());
			// 파일들을 저장하고 Files table 에 저장할 정보를 map 에 담는다 
			
			// 파일별로 반북
			for (MultipartFile uploadfile : profileImge) {
				if( uploadfile.isEmpty() )
					continue;
				
				String  orgName     = uploadfile.getOriginalFilename();
				// d:\\dev\\data\\data.abc.txt
				String  fileName    = 
					( orgName.lastIndexOf("\\") < 0 )  
					?   orgName
					:	orgName.substring( orgName.lastIndexOf("\\") + 1 );  // data.abc.txt 
				String  fileExt     = 
					(orgName.lastIndexOf('.') < 0) 
					?  " "
					:  orgName.substring( orgName.lastIndexOf('.')  )     ;  // .txt
				
				// 날짜 폴더 생성   d:\\dev\\data\\2024\\11\\05
				String  folderPath = makeFolder( uploadPath );
				
				// 파일 중복방지 : 같은 폴더에 같은 파일명의 파일을 저장하면 마지막 파일만 남는다
				// 중복되지 않는 고유한 문자열 생성 :  UUID
				String  uuid       = UUID.randomUUID().toString();
				
				//  File.separator (/, \\)
				String  saveName   = uploadPath + File.separator
						           + folderPath + File.separator
				                   + uuid       + " " + fileName;
				String  saveName2  = folderPath + File.separator
						           + uuid       + " " + fileName;
				
				Path    savePath   = Paths.get(saveName);
				//  import java.nio.file.Path
				//  Paths.get() : 특정 경로의 파일정보를 가져온다
				
				//  파일저장
				try {
					uploadfile.transferTo(savePath);  // 업로드 폴더에 파일을 저장
					//System.out.println( savePath +  "가 저장됨" );
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} // try catch end 
				
				// 저장된 파일들의 정보를 map 에  List 방식으로 저장 -> pdsServiceImpl 에 전달 

				if(map.get("companyProfile") != null ) {

					//CompanyImageVo  companyImageVo = new CompanyImageVo(0, 0, fileName, fileExt, saveName2);
					//companyImageList.add( companyImageVo );
				};
				

				if(map.get("userProfile") != null ) {

					//UserImageVo userImageVo = new UserImageVo(0, 0, fileName, fileExt, saveName2);
					//userImageList.add(userImageVo);
				};
				
			}  // for end
			
			// 돌려줄 정보 map 저장
			  // 조건에 따라 해당 리스트를 map에 추가
			/*
		    if (!companyImageList.isEmpty()) {
		        map.put("fileList", companyImageList);
		    }  
		    if (!userImageList.isEmpty()) {
		        map.put("fileList", userImageList);
		    }
		*/
		
		}
		
		
		// uploadfiles 에 넘어온 파일들을 저장
	/*	public static void oneSave(HashMap<String, Object> map, MultipartFile[] profileImge) {
		    String uploadPath = String.valueOf(map.get("uploadPath"));
		    System.out.println("save까지옴");
		    
		    if (profileImge == null || profileImge.length == 0) {
		        System.out.println("No files to upload");
		        return;
		    }
		    
		    System.out.println("profileImge:" + profileImge[0].getOriginalFilename());
		    
		    try {
		        MultipartFile file = profileImge[0];
		        String originalFilename = file.getOriginalFilename();
		        String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
		        String fileName = UUID.randomUUID().toString() + fileExtension;
		        String folderPath = makeFolder(uploadPath);
		        String savePath = folderPath + File.separator + fileName;
		        
		        File saveFile = new File(savePath);
		        file.transferTo(saveFile);
		        
		        CrollingImgVo  imgVo = new CrollingImgVo(0, 0, fileName, fileExtension, savePath);
		        System.out.println("File saved successfully at: " + savePath);
		        map.put("imgVo", imgVo);
		    } catch (IOException e) {
		        System.err.println("Error saving file: " + e.getMessage());
		        e.printStackTrace();
		    }
		}

		*/
		

		// 날짜 폴더 생성   d:\\dev\\data\\2024\\11\\05
		private static String makeFolder(String uploadPath) {
			// d:\\dev\\data +  \\2024\\11\\05
			// uploadPath    +  folderPath
			
			String  dateStr     =  LocalDate.now().format(
					DateTimeFormatter.ofPattern("yyyy/MM/dd") );
			String  folderPath  =  dateStr.replace("/", File.separator ); 
			
			File    uploadPathFolder = new File(uploadPath, folderPath);
			
			if(uploadPathFolder.exists() == false ) {
				uploadPathFolder.mkdirs();  // make directory
				// mkdir()   :  상위폴더가  없으면 폴더 생성실패 
				// mkdirs()  :  상위폴더    없어도 폴더전체를 생성한다
			} 
			
			return folderPath;
		}
		
		// 파일경로바꾸기
		public String fileNemeReplace(String fileName) {
			fileName = fileName.replace("\\", "/");
			String path = "/images/product/";
			fileName = path + fileName;
			return fileName;
		}
		
		// 실제 물리파일 삭제 : 여러파일 삭제
		/*
		public static void deleteCompanyImage(
			String uploadPath, 
			List<CompanyImageVo> fileList  ) {
			
			String  path  = uploadPath;
			
			fileList.forEach( ( file ) -> {
				String  sfile  = file.getCompany_sfile_name();  // 실제 파일명 uuid
				
				File    dfile  = new  File( path + sfile );
				if( dfile.exists() )
				   dfile.delete();
				
			} ); 
			
		}
		*/
		
		// 실제 물리파일 삭제 : 여러파일 삭제
		/*
		public static void deleteUserImage(
				String uploadPath, 
				List<UserImageVo> fileList 
				) {
			
			String  path  = uploadPath;
			
			fileList.forEach( ( file ) -> {
				String  sfile  = file.getUser_sfile_name();  // 실제 파일명 uuid
				
				File    dfile  = new  File( path + sfile );
				if( dfile.exists() )
					dfile.delete();
				
			} ); 
			
		}
		*/
		

	}