package com.green.crawling.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CrawlingImgVo {
	private int    product_image_idx;
	private int    product_idx;
	private String product_image_name;
	private String product_image_ext;
	private String product_sfile_name;
}
