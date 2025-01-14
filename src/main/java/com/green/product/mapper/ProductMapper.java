package com.green.product.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProductMapper {


   List<HashMap<String, Object>> getdeskTopEstimateProductFilterList(HashMap<String, Object> map);

   List<HashMap<String, Object>> getProductResultList(HashMap<String, Object> map);

   void setProductCpu(HashMap<String, Object> hashMap);

   List<HashMap<String, Object>> getcategoryAttributeList(HashMap<String, Object> map);

   int getProductResultListCount(HashMap<String, Object> map);

   HashMap<String, Object> getCategoryMap(HashMap<String, Object> map);

   List<HashMap<String, Object>> getProductList(HashMap<String, Object> map);

   List<HashMap<String, Object>> getCategoryAttributeValueList(HashMap<String, Object> map);

   List<HashMap<String, Object>> getDeskTopPartProductList(HashMap<String, Object> map);


	int getProductResultListCount(HashMap<String, Object> map);

	HashMap<String, Object> getCategoryMap(HashMap<String, Object> map);

	List<HashMap<String, Object>> getProductList(HashMap<String, Object> map);

	List<HashMap<String, Object>> getCategoryAttributeValueList(HashMap<String, Object> map);

	List<HashMap<String, Object>> getDeskTopPartProductList(HashMap<String, Object> map);

	List<HashMap<String, Object>> getProductResultMapList(HashMap<String, Object> map);


}
