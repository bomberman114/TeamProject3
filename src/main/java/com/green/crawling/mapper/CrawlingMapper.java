package com.green.crawling.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.crawling.vo.CrawlingImgVo;

@Mapper
public interface CrawlingMapper {

	void saveProduct(HashMap<String, Object> product);

	void saveProductImg(@Param(value = "img") CrawlingImgVo img);

	HashMap<String, Object> findByProductName(HashMap<String, Object> product);

	HashMap<String, Object> findByIdx(@Param(value = "proudctIDx") int proudctIDx);

	void reinforceProductImg(@Param(value = "img") CrawlingImgVo img,@Param(value = "proudctIDx") int proudctIDx);

	void saveAttr(int productIdx, int i, int attrVal);

}
