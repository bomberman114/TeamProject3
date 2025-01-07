package com.green.crolling.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.crolling.vo.CrollingImgVo;

@Mapper
public interface CrollingMapper {

	void saveProduct(HashMap<String, Object> product);

	void saveProductImg(CrollingImgVo img);

	HashMap<String, Object> findByProductName(HashMap<String, Object> product);

}
