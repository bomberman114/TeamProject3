package com.green.motherboard.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MotherboardMapper {

	List<HashMap<String, Object>> getdeskTopEstimateMotherBoadFilterList();

	List<HashMap<String, Object>> getmotherBoardResultList();

}
