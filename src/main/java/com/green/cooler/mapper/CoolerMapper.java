package com.green.cooler.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CoolerMapper {

	List<HashMap<String, Object>> getdeskTopEstimateCoolerFilterList();

	List<HashMap<String, Object>> getCoolerResultList();

}
