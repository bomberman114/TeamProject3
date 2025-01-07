package com.green.desktopcase.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DesktopCaseMapper {

	List<HashMap<String, Object>> getdeskTopEstimateDesktopCaseFilterList();

	List<HashMap<String, Object>> getDesktopCaseResultList();

}
