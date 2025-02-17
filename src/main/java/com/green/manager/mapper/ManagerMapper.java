package com.green.manager.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.manager.vo.ManagerVo;


@Mapper
public interface ManagerMapper {
	
	List<ManagerVo> getnoticeList(
			@Param("start") int start, 
			@Param("size") int size,
			@Param("type") String type
			);

	List<ManagerVo> getaskList(
			@Param("start") int start, 
			@Param("size") int size,
			@Param("type") String type
			);


	List<ManagerVo> getmacsList(
			@Param("start") int start, 
			@Param("size") int size,
			@Param("type") String type
			);
	
	int getcountaskList(
			@Param("type") String type
			);

	int getcountmacsList(
			@Param("type") String type
			);

	int getcountnoticeList(
			@Param("type") String type
			);

	void insertask(ManagerVo ManagerVo);

	void updateask(ManagerVo ManagerVo);

	ManagerVo selectask(int idx);

	void deleteAsk(int idx);

	ManagerVo selectnotice(int idx);

	void updatenotice(ManagerVo ManagerVo);

	void deletenotice(int idx);

	void insertnotice(ManagerVo ManagerVo);

	ManagerVo selectcs(int idx);

	void updatecs(ManagerVo ManagerVo);

	void deleteCs(int idx);

	List<String> getType();

	List<String> getnoticeType();
	
	int getTotalAlbumCount(
			@Param("searchBy") String searchBy, 
			@Param("searchtext") String searchtext);

	List<ManagerVo> getalbumList(
			@Param("start") int start, 
			@Param("size") int size,
			@Param("type") String type
			);

	int getcountalbumList();

	void deletecommunity(int idx);

	List<HashMap<String, Object>> getCategoryList();


	void saveProductImage(HashMap<String, Object> map);

	void saveProduct(HashMap<String, Object> map);
	
	int getProductIdx(HashMap<String, Object> map);
		

}