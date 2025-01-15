package com.green.oauth.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HomeMapper {

	List<HashMap<String, Object>> findProductType();

	List<HashMap<String, Object>> findByCategoryIdxOffset(HashMap<String, Object> product);

	List<HashMap<String, Object>> findProduct();

	List<HashMap<String, Object>> findSearchProduct(String keyword);

}
