package com.green.cs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.cs.vo.CsVo;


@Mapper
public interface CsMapper {

	List<CsVo> getcsList();

	List<CsVo> getntList();

	CsVo getnotice(int notice_idx);

	CsVo getprevious(int notice_idx);

	CsVo getnext(int notice_idx);

	void insertcs(CsVo csVo);

	List<CsVo> getmycsList();

	CsVo getmycs(int customer_service_idx);

	CsVo getanswer(int customer_service_idx);

	List<CsVo> getsearchList(String searchtext);

	CsVo getfaqList(int customer_service_idx);

	List<CsVo> getnoticeList(
			@Param("start") int start, 
			@Param("size") int size
			);

	List<CsVo> getaskList(
			@Param("start") int start, 
			@Param("size") int size
			);


	List<CsVo> getmacsList(
			@Param("start") int start, 
			@Param("size") int size
			);

	int getcountaskList();

	int getcountmacsList();

	int getcountnoticeList();

	void insertask(CsVo csVo);

	void updateask(CsVo csVo);

	CsVo selectask(int idx);

	void deleteAsk(int idx);

	CsVo selectnotice(int idx);

	void updatenotice(CsVo csVo);

	void deletenotice(int idx);

	void insertnotice(CsVo csVo);



}
