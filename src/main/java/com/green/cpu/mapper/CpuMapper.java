package com.green.cpu.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CpuMapper {


	List<HashMap<String, Object>> getdeskTopEstimateCpuFilterList();

	List<HashMap<String, Object>> getCpuResultList();

	

}
