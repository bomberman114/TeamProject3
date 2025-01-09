package com.green.common.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DetailSearchMapper {

	List<HashMap<String, Object>> getAttributeListByCategoryIdx(String categoryIdx);


}
