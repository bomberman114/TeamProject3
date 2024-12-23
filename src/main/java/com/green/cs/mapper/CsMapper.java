package com.green.cs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.cs.vo.CsVo;


@Mapper
public interface CsMapper {

	List<CsVo> getcsList();


}
