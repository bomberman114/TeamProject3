package com.green.manager.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ManagerImageVo {

	private int     customer_service_image_idx;
	private int     customer_service_idx;
	private String  customer_service_image_name;
	private String  customer_service_image_ext;
	private String  customer_service_sfile_name;

}
