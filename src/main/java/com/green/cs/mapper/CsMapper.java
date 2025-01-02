package com.green.cs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.cs.vo.CsVo;


@Mapper
public interface CsMapper {

	List<CsVo> getcsList();

	List<CsVo> getntList();

	CsVo getnotice(int notice_idx);

	CsVo getprevious(int notice_idx);

	CsVo getnext(int notice_idx);

	void insertcs(CsVo csVo);

	List<CsVo> getmycsList(int user_idx);

	CsVo getmycs(int customer_service_idx);

	CsVo getanswer(int customer_service_idx);

	List<CsVo> getsearchList(String searchtext);

	CsVo getfaqList(int customer_service_idx);

	CsVo getminfo(int user_idx);


}
