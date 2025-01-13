package com.green.oauth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.oauth.mapper.HomeMapper;
import com.green.util.CrwllingCPUFilter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class HomeController {

	@Autowired
	private HomeMapper homeMapper;

    @GetMapping("/")
    public ModelAndView main(HttpServletRequest request, HttpSession session) {
    	
    	ModelAndView mv = new ModelAndView();
    	
    	List<HashMap<String, Object>> recentProductList = new ArrayList<HashMap<String, Object>>();
    	
    	List<HashMap<String, Object>> productTypeCount = homeMapper.findProductType(); 

    	for(HashMap<String, Object> product  : productTypeCount ) {
    		List<HashMap<String, Object>> productList = homeMapper.findByCategoryIdxOffset(product);
    		HashMap<String, Object> map = new HashMap<>();
    		map.put("categoryIdx", product.get("CATEGORY_IDX"));
    		map.put("categoryName", product.get("CATEGORY_NAME"));
    		map.put("productList", productList);
    		
    		recentProductList.add(map);
    	}
    	
    	mv.addObject("recentProductList",recentProductList);
    	
    	// 403 에러시에 리다이렉트 되고 세션에 담긴 에러메시지 처리
    	String errorMessage = (String) session.getAttribute("errorMessage");
        if(errorMessage != null) {
            mv.addObject(errorMessage, errorMessage);
            session.removeAttribute("errorMessage");
        }
        //List<HashMap<String, Object>> productList = homeMapper.findProduct();
        //CrwllingProductFilter.cpuAttribute(productList);
        mv.setViewName("home");
        return mv;
    }
    
    @PostMapping("/dSearch/postSearchList")
    public ResponseEntity<HashMap<String, Object>> postSearchList(@RequestBody HashMap<String, Object> requestbody) {
    	HashMap<String, Object> res = new HashMap<>(); 
    	String keyword = String.valueOf(requestbody.get("keyword"));
        List<HashMap<String, Object>> appliProduct = homeMapper.findSearchProduct(keyword);
        System.out.println(appliProduct);
        res.put("appliProduct", appliProduct);
        
        return ResponseEntity.ok(res);
    }
    
}

