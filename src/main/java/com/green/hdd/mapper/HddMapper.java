package com.green.hdd.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HddMapper {

	List<HashMap<String, Object>> getdeskTopEstimateHddFilterList();

	List<HashMap<String, Object>> getHddResultList();

}
