package com.green.community.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.community.vo.CommunityVo;

@Mapper
public interface CommunityMapper {

   int getTotalAlbumCount(
      @Param("searchBy") String searchBy, 
      @Param("searchtext") String searchtext);

   List<CommunityVo> getalbumList(
      @Param("startIndex") int startIndex, 
      @Param("itemsPerPage") int itemsPerPage, 
        @Param("orderBy") String orderBy,
        @Param("searchBy") String searchBy,
        @Param("searchtext") String searchtext);

   List<CommunityVo> getalbumbestList();

   List<CommunityVo> getminfo(int user_idx);
   
   void insertcommunity(CommunityVo communityVo);
   
   void insertcommunityImage(HashMap<String, Object> map);

   List<String> getproductList(int cpuNum);
   
   CommunityVo getinfo(
      @Param("community_idx") int community_idx,
      @Param("user_idx") int user_idx);

   CommunityVo getspecinfo(int community_idx);

   List<CommunityVo> getanswerList(
      @Param("community_idx")int community_idx);

   void insertanswer(CommunityVo communityVo);

   CommunityVo getalbum(CommunityVo communityVo);

   CommunityVo getinfo(@Param("community_idx") int community_idx);

   void updatecommunity(CommunityVo communityVo);

   void updatecommunityImage(
      @Param("paramMap") HashMap<String, Object> map,
      @Param("community_idx") int community_idx);

   void deletealbum(CommunityVo communityVo);

   void deleteimage(CommunityVo communityVo);

   void plusviews(CommunityVo communityVo);

   HashMap<String, Object> getCommunityDeskTop(HashMap<String, Object> map);

	HashMap<String, Object> getCommunityDeskTop(HashMap<String, Object> map);

}
