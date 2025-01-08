package com.green.crolling.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.crolling.vo.CrollingImgVo;

@Mapper
public interface CrollingMapper {

	void saveProduct(HashMap<String, Object> product);

	void saveProductImg(@Param(value = "img") CrollingImgVo img);

	HashMap<String, Object> findByProductName(HashMap<String, Object> product);

	HashMap<String, Object> findByIdx(@Param(value = "proudctIDx") int proudctIDx);

	void reinforceProductImg(@Param(value = "img") CrollingImgVo img,@Param(value = "proudctIDx") int proudctIDx);

}
