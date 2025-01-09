package com.green.laptop.brand.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LaptopBrandMapper {

	List<HashMap<String, Object>> brandExplainList(HashMap<String, Object> map);
	

}
