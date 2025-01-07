package com.green.product.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {


	List<HashMap<String, Object>> getdeskTopEstimateProductFilterList(HashMap<String, Object> map);

	List<HashMap<String, Object>> getProductResultList(HashMap<String, Object> map);

	void setProductCpu(HashMap<String, Object> hashMap);

	List<HashMap<String, Object>> getcategoryAttributeList(HashMap<String, Object> map);

}
