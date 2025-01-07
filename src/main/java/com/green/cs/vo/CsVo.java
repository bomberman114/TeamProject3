package com.green.cs.vo;

import java.beans.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CsVo {
	private int     user_idx;
	private int     admin_user_idx;
	private int     customer_service_idx;
	private String  customer_service_title;
	private String  customer_service_type;
	private String  customer_service_regdate;
	private String  customer_service_content;
	private String  customer_service_answer_status;
	
	private int     customer_service_answer_idx;
	private String  customer_service_answer_regdate;
	private String  customer_service_answer_content;
	
	private int     customer_service_image_idx;
	private String  customer_service_image_ext;
	
	private int     notice_idx;
	private String  notice_title;
	private String  notice_type;
	private String  notice_regdate;
	private String  notice_content;

	private int     notice_image_idx;
	private String  notice_image_name;  // MultipartFile ?
	private String  notice_image_ext;
	private String  notice_sfile_name;  // MultipartFile ?

	private MultipartFile[]  customer_service_image_name;  // MultipartFile ?
	private MultipartFile[]  customer_service_sfile_name;  // MultipartFile ?
}
