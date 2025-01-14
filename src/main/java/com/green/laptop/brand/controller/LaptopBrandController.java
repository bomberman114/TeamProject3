package com.green.laptop.brand.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.laptop.brand.service.LaptopBrandService;

@Controller
@RequestMapping("/LaptopBrand")
public class LaptopBrandController {
    
   @Autowired
   private LaptopBrandService laptopBrandService;
   
    
   @RequestMapping("/Brand")
    public ModelAndView brand() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Brand/laptopBrand");
        return mv;
    }
    
    //함수라서 선언을 하면 그 타입에 맞는 리턴을 해줘야하는 데 
    //타입이 지금 클래스 타입깐 null 타입을 리턴 가능 
    @RequestMapping("/BrandExplain")    
    @ResponseBody
    public List<HashMap<String, Object>> brandExplain(@RequestParam HashMap<String,Object> map ) {
       List<HashMap<String, Object>> brandExplainList = laptopBrandService.brandExplainList(map);
       System.out.println(brandExplainList);
       return brandExplainList;
       
       
    }
 }



