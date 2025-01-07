package com.green.gpu.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GpuMapper {

	List<HashMap<String, Object>> getdeskTopEstimateGpuFilterList();

	List<HashMap<String, Object>> getGpuResultList();

}
