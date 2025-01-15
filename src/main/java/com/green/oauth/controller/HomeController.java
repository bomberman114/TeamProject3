	package com.green.oauth.controller;
	
	import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

import org.asynchttpclient.AsyncHttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.CacheManager;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.crawling.vo.CrawlingImgVo;
import com.green.files.FileImage;
import com.green.oauth.mapper.HomeMapper;
import com.green.util.CrwllingCPUFilter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
	
	
	@Controller
	public class HomeController {
		
		@Autowired
		private HomeMapper homeMapper;
		
	    @Autowired
	    private AsyncHttpClient asyncHttpClient;
	
	    @Autowired
	    private CacheManager cacheManager;
	
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
	    	
	    	List<HashMap<String, Object>> brandList = homeMapper.findBrandList();
	    	
	    	mv.addObject("recentProductList",recentProductList);
	    	mv.addObject("brandList",brandList);
	    	
	    	// 403 에러시에 리다이렉트 되고 세션에 담긴 에러메시지 처리
	    	String errorMessage = (String) session.getAttribute("errorMessage");
	        if(errorMessage != null) {
	            mv.addObject(errorMessage, errorMessage);
	            session.removeAttribute("errorMessage");
	        }
	        //List<HashMap<String, Object>> productList = homeMapper.findProduct();
	        //CrwllingCPUFilter.cpuAttribute(productList);
	        mv.setViewName("home");
	        return mv;
	    }
	    
	    @PostMapping("/dSearch/postSearchList")
	    public ResponseEntity<HashMap<String, Object>> postSearchList(@RequestBody HashMap<String, Object> requestbody) {
	    	HashMap<String, Object> res = new HashMap<>(); 
	    	String keyword = String.valueOf(requestbody.get("keyword"));
	        List<HashMap<String, Object>> appliProduct = homeMapper.findSearchProduct(keyword);
	        res.put("appliProduct", appliProduct);
	        
	        return ResponseEntity.ok(res);
	    }
	    
	
	    @PostMapping("/productRedirect")
	    public CompletableFuture<ResponseEntity<HashMap<String, Object>>> productRedirect(@RequestBody HashMap<String, Object> requestBody) {
	        String url = String.valueOf(requestBody.get("href"));
	
	        return CompletableFuture.supplyAsync(() -> {
	            HashMap<String, Object> res = cacheManager.getCache("products").get(url, HashMap.class);
	            if (res != null) {
	                return ResponseEntity.ok(res);
	            }
	
	            try {
	                String htmlContent = asyncHttpClient.prepareGet(url).execute().get().getResponseBody();
	                Document doc = Jsoup.parse(htmlContent);
	                Elements productNames = doc.select(".prod_name a");
	
	                List<HashMap<String, Object>> products = productNames.parallelStream()
	                    .map(element -> {
	                        HashMap<String, Object> product = new HashMap<>();
	                        product.put("name", element.attr("href"));
	                        return product;
	                    })
	                    .collect(Collectors.toList());
	
	                res = new HashMap<>();
	                res.put("products", products);
	                cacheManager.getCache("products").put(url, res);
	
	                return ResponseEntity.ok(res);
	            } catch (Exception e) {
	                e.printStackTrace();
	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	            }
	        });
	    }  
	    
	    /*
	    @Value("${part4.upload-path}")
		private String uploadPath; 
	    @PostMapping("/brandImgSave")
	    public void brandImgSave(HashMap<String, Object> requestBody, @RequestParam(value="profileImge")  MultipartFile[]   profileImge) {
			requestBody.put("uploadPath", uploadPath);
			FileImage.oneSave(requestBody, profileImge);
			System.out.println((CrawlingImgVo)requestBody.get("imgVo"));
			homeMapper.saveTestBrandImg((CrawlingImgVo)requestBody.get("imgVo"));
	
	    }
	    */
	}
	
