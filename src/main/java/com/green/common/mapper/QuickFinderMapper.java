package com.green.common.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.crawling.vo.CrawlingImgVo;

@Mapper
public interface QuickFinderMapper {

	List<HashMap<String, Object>> findPurposeList(String purposeIdx);

	int getProductCount(@Param("requestBody") HashMap<String, Object> requestBody);
	
    List<HashMap<String, Object>> getProductPagingList(@Param("offset") int offset, 
            @Param("recordSize") int recordSize, 
            @Param("requestBody") HashMap<String, Object> requestBody);

	List<HashMap<String, Object>> findManufacturerList();

	List<HashMap<String, Object>> findBrandListByManufactureIdx(String manufactureIdx);

	void postTestPurposeImg(String manufactureIdx);

	void saveTestPurposeImg(CrawlingImgVo crollingImgVo);


}
