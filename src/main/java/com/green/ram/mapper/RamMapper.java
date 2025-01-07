package com.green.ram.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RamMapper {

	List<HashMap<String, Object>> getdeskTopEstimateRamFilterList();

	List<HashMap<String, Object>> getRamResultList();

}
