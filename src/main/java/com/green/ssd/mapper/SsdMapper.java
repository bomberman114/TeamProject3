package com.green.ssd.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SsdMapper {

	List<HashMap<String, Object>> getdeskTopEstimateSsdFilterList();

	List<HashMap<String, Object>> getSsdResultList();

}
