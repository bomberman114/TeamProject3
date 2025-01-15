package com.green.common.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.common.mapper.DetailSearchMapper;
import com.green.common.service.DetailSearchService;
import com.green.paging.vo.Pagination;
import com.green.paging.vo.PagingResponse;
import com.green.paging.vo.SearchVo;
import com.green.util.ClobUtils;

@Service
public class DetailSearchServiceImpl implements DetailSearchService{

	@Autowired
	private DetailSearchMapper detailSearchMapper;

	@Override
	public List<HashMap<String, Object>> getAttributeListByCategoryIdx(String categoryIdx) {
	    if(categoryIdx.equals("2") || categoryIdx.equals("3")) {categoryIdx = null;}
	        List<HashMap<String, Object>> categoryAttributeList = detailSearchMapper.getAttributeListByCategoryIdx(categoryIdx);
	        Map<Integer, HashMap<HashMap<String, Object>, List<HashMap<String, Object>>>> groupedData = new HashMap<>();
	        
	        for (HashMap<String, Object> row : categoryAttributeList) {
	        	int group = ((Number) row.get("CATEGORY_ATTRIBUTE_IDX")).intValue();
	        	HashMap<String, Object> attribute =  new HashMap<>();
	        	attribute.put("attribute_idx",Integer.parseInt(String.valueOf(row.get("CATEGORY_ATTRIBUTE_IDX"))));
	        	attribute.put("attribute_name",String.valueOf(row.get("CATEGORY_ATTRIBUTE_NAME")));
	        
	        	HashMap<String, Object> value = new HashMap<>();
	        	value.put("attribute_value_idx",Integer.parseInt(String.valueOf(row.get("CATEGORY_ATTRIBUTE_VALUE_IDX"))));
	        	value.put("attribute_value_name",String.valueOf(row.get("CATEGORY_ATTRIBUTE_VALUE_NAME")));
	        	
	        	groupedData.putIfAbsent(group, new HashMap<>());
	        	groupedData.get(group).putIfAbsent(attribute, new ArrayList<>());
	        	groupedData.get(group).get(attribute).add(value);
	        }
	        
	        List<HashMap<String, Object>> result = new ArrayList<>();
	        for (Entry<Integer, HashMap<HashMap<String, Object>, List<HashMap<String, Object>>>> entry : groupedData.entrySet()) {
	            HashMap<String, Object> groupMap = new HashMap<>();
	            groupMap.put("Group", entry.getKey());
	            
	            // entry.getValue()의 각 항목을 개별적으로 처리
	            for (Entry<HashMap<String, Object>, List<HashMap<String, Object>>> innerEntry : entry.getValue().entrySet()) {
	                HashMap<String, Object> attribute = innerEntry.getKey();
	                List<HashMap<String, Object>> values = innerEntry.getValue();
	                
	                // attribute를 키로 사용하고 values를 값으로 사용
	                groupMap.put(attribute.get("attribute_name").toString(), values);
	            }
	            
	            result.add(groupMap);
	        }

		    return result;
	}

	@Override
	public HashMap<String, Object> getProductPagingFilterList(@RequestParam HashMap<String, Object> requestBody) {
		HashMap<String, Object> res = new HashMap<>();
	    List<HashMap<String, Object>> list = detailSearchMapper.getProductPagingFilterList(0,0,requestBody);
		if(((List<HashMap<String, Object>>) requestBody.get("selectedFilters")).size() > 0) {
    	String selectedFilters = String.valueOf(requestBody.get("selectedFilters"));
    	
    	selectedFilters = selectedFilters.replace("[", "").replace("]", "").trim();
    	List<Integer> filtersList = Arrays.stream(selectedFilters.split(","))
                .map(String::trim)
                .map(Integer::parseInt)
                .collect(Collectors.toList());
    	
    	List<HashMap<String, Object>> attributeFilterProductList = new ArrayList<>();
    	
    	for (HashMap<String, Object> product : list) {
    	    String attributeString = String.valueOf(product.get("ATTRIBUTE_VALUES"));
    	    if (attributeString != null && !attributeString.equals("null")) {
    	        attributeString = attributeString.replace("[", "").replace("]", "").trim();
    	        Set<Integer> productAttributeSet = Arrays.stream(attributeString.split(","))
    	                .map(String::trim)
    	                .map(Integer::parseInt)
    	                .collect(Collectors.toSet());
    	        
    	        Set<Integer> userSelectSet = new HashSet<>(filtersList);
    	        
    	        // 사용자 선택 값이 모두 제품 속성에 포함되는지 확인
    	        boolean allUserSelectionsIncluded = productAttributeSet.containsAll(userSelectSet);
    	        
    	        if (allUserSelectionsIncluded) {
    	            attributeFilterProductList.add(product);
    	        }
    	    }
    	}
    	System.out.println("!" + list);

    	System.out.println("attributeFilterProductList : " + attributeFilterProductList );
    	list = attributeFilterProductList;
		}
		int  productCount  = list.size();
		
	    int nowpage = 1; // 기본값 설정
	    if (requestBody.get("nowpage") != null) {
	        try {
	            nowpage = Integer.parseInt(String.valueOf(requestBody.get("nowpage")));
	        } catch (NumberFormatException e) {
	            // 로그 기록 또는 에러 처리
	            // 기본값 1을 유지
	        }
	    }
		
	    // 페이징을 위한 초기 설정
	    SearchVo searchVo = new SearchVo();
	    searchVo.setPage(nowpage);      // 현재 페이지 정보
	    searchVo.setRecordSize(5);      // 페이지당 20개
	    searchVo.setPageSize(5);        // paging.jsp에 출력할 페이지번호수
	    
	    
	    Pagination pagination = new Pagination(productCount, searchVo);
		
	    PagingResponse<HashMap<String, Object>> response = null;
	    if( productCount < 1 ) { // 현재 조회한 자료가 없다면
	    	response = new PagingResponse<>(
	    		Collections.emptyList(), null);}  
	    
	    
	    // Pagination 설정
	    int offset	   = searchVo.getOffset();
	    int recordSize = searchVo.getRecordSize();
	
	    // 필터링된 리스트에서 현재 페이지에 해당하는 부분만 추출
	    List<HashMap<String, Object>> pagedList;
	    if (offset < list.size()) {
		        pagedList = list.subList(offset, Math.min(offset + recordSize, list.size()));
		    } else {
		        pagedList = Collections.emptyList();
		    }
	
		    pagedList = ClobUtils.processClobData(pagedList);
	
		    response = new PagingResponse<>(pagedList, pagination);
		
			res.put("response", response);
			res.put("searchedCount", productCount);
			res.put("nowpage", nowpage);
			res.put("searchVo", searchVo);
			return res;
		}

	@Override
	public List<HashMap<String, Object>> getParentCategoryList(String categoryIdx) {
		Integer cateIdx = Integer.parseInt(categoryIdx);
		HashMap<String, Object> findedParentIdxAndDepth = detailSearchMapper.findParentIdxAndDepthByCategoryIdx(cateIdx);
		List<HashMap<String, Object>> list = new ArrayList<>();
		String findedParentIdx =  String.valueOf(findedParentIdxAndDepth.get("PARENT_CATEGORY_IDX"));
		Integer findedDepth     =  Integer.parseInt(String.valueOf(findedParentIdxAndDepth.get("DEPTH")));
		if(findedDepth != null) {
			for (int i = findedDepth; i >= 0 ; i--) {
				HashMap<String, Object> map = new HashMap<>();
				List<HashMap<String, Object>> findedCategoryList = detailSearchMapper.findCategoryListByParentIdxAndDepth(findedParentIdx,i);   //같은 딥스에서 값 찾고
				map.put("depth",i);
				map.put("categoryList",findedCategoryList);
				list.add(0,map);
				findedParentIdxAndDepth = detailSearchMapper.findParentIdxAndDepthByCategoryIdx(Integer.parseInt(findedParentIdx));				//부모를 찾고	
				if(findedParentIdxAndDepth.get("PARENT_CATEGORY_IDX") != null){
					findedParentIdx =  String.valueOf(findedParentIdxAndDepth.get("PARENT_CATEGORY_IDX"));					                     
				}else { 
					break;
				}
			}
		}
		return list;
	}

	@Override
	public boolean findChildCategoryByCategoryIdx(String categoryIdx) {
		List<HashMap<String, Object>> list = detailSearchMapper.findChildCategoryByCategoryIdx(categoryIdx);
		return list.size() > 0;
	}

	@Override
	public HashMap<String, Object> findFirstChildCategoryByCategoryIdx(String categoryIdx) {
		List<HashMap<String, Object>> list = detailSearchMapper.findChildCategoryByCategoryIdx(categoryIdx);
		return list.get(0);
	}


	@Override
	public HashMap<String, Object> getSearchedProductList(HashMap<String, Object> requestBody) {
		HashMap<String, Object> res = new HashMap<>();
		System.out.println(requestBody);
		List<HashMap<String, Object>> list = detailSearchMapper.getSearchedProductList(requestBody);
		HashSet<HashMap<String, Object>> categoryList = new HashSet<>();
		for(HashMap<String, Object> product : list) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("cateIdx",Integer.parseInt(String.valueOf(product.get("CATEGORY_IDX"))));
			map.put("cateName",String.valueOf(product.get("CATEGORY_NAME")));
			categoryList.add(map);
		}
		List<HashMap<String, Object>> eachCategory = new ArrayList<>();
		for(HashMap<String, Object> category : categoryList) {
			List<HashMap<String, Object>> appliList = new ArrayList<>();
			for(HashMap<String, Object> product : list) {
				
				if(Integer.parseInt(String.valueOf(category.get("cateIdx"))) == Integer.parseInt(String.valueOf(product.get("CATEGORY_IDX")))) {
					appliList.add(product);		
				}			
			}
			HashMap<String, Object> map = new HashMap<>();
			map.put("category", category);
			map.put("categorySize", appliList.size());
			eachCategory.add(map);
		}
		
		eachCategory.sort((o1, o2) -> {
		    HashMap<String, Object> category1 = (HashMap<String, Object>) o1.get("category");
		    HashMap<String, Object> category2 = (HashMap<String, Object>) o2.get("category");
		    return ((Integer) category1.get("cateIdx")).compareTo((Integer) category2.get("cateIdx"));
		});
		
		res.put("allProductCount",list.size());
		res.put("eachCategory",eachCategory);
		return res;
	}
}

