package com.green.desktop.estimate.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.filter.OncePerRequestFilter;

import com.green.computer.part.compatibility.CompauterPartCompatibilityCheck;
import com.green.cooler.mapper.CoolerMapper;
import com.green.cpu.mapper.CpuMapper;
import com.green.desktop.estimate.service.DeskTopEstimateService;
import com.green.desktopcase.mapper.DesktopCaseMapper;
import com.green.files.FileImage;
import com.green.gpu.mapper.GpuMapper;
import com.green.hdd.mapper.HddMapper;
import com.green.motherboard.mapper.MotherboardMapper;
import com.green.power.mapper.PowerMapper;
import com.green.product.mapper.ProductMapper;
import com.green.ram.mapper.RamMapper;
import com.green.ssd.mapper.SsdMapper;

@Service("DeskTopEstimateService")
public class DeskTopEstimateServiceImpl implements DeskTopEstimateService {

   @Autowired
   private CpuMapper cpuMapper;

   @Autowired
   private GpuMapper gpuMapper;

   @Autowired
   private RamMapper ramMapper;

   @Autowired
   private SsdMapper ssdMapper;

   @Autowired
   private CoolerMapper coolerMapper;

   @Autowired
   private DesktopCaseMapper desktopCaseMapper;

   @Autowired
   private PowerMapper powerMapper;

   @Autowired
   private HddMapper hddMapper;

   @Autowired
   private MotherboardMapper motherboardMapper;

   @Autowired
   private ProductMapper productMapper;

   @Override
   public List<HashMap<String, Object>> getProductResultList(HashMap<String, Object> map) {
      List<HashMap<String, Object>> productList = productMapper.getProductResultList(map);
      for (int i = 0; i < productList.size(); i++) {
         String productSfileName = String.valueOf(productList.get(i).get("PRODUCT_SFILE_NAME"));
         FileImage fileImage = new FileImage();
         productSfileName = fileImage.fileNemeReplace(productSfileName);
         productList.get(i).put("PRODUCT_SFILE_NAME", productSfileName);
      }
      return productList;
   }

   @Override
   public List<HashMap<String, Object>> getdeskTopEstimateProductFilterList(HashMap<String, Object> map) {
      List<HashMap<String, Object>> deskTopEstimateProductFilterList = productMapper
            .getdeskTopEstimateProductFilterList(map);
      // 결과를 저장할 List 생성
      List<HashMap<String, Object>> groupedResults = new ArrayList<>();
      // 그룹화 로직
      for (HashMap<String, Object> item : deskTopEstimateProductFilterList) {
         int idx = Integer.parseInt(String.valueOf(item.get("CATEGORY_ATTRIBUTE_IDX")));
         String category = String.valueOf(item.get("CATEGORY_ATTRIBUTE_NAME"));
         int valueIdx = Integer.parseInt(String.valueOf(item.get("CATEGORY_ATTRIBUTE_VALUE_IDX")));
         String value = String.valueOf(item.get("CATEGORY_ATTRIBUTE_VALUE_NAME"));

         // 해당 카테고리가 이미 존재하는지 확인
         HashMap<String, Object> existingCategory = findCategory(groupedResults, category);
         if (existingCategory == null) {
            // 없다면 새로 추가
            existingCategory = new HashMap<>();
            existingCategory.put("CATEGORY_ATTRIBUTE_IDX", idx);
            existingCategory.put("CATEGORY_ATTRIBUTE_NAME", category);
            existingCategory.put("items", new ArrayList<Map<String, Object>>());
            groupedResults.add(existingCategory);
         }

         // 아이템 추가
         List<Map<String, Object>> items = (List<Map<String, Object>>) existingCategory.get("items");
         items.add(createValueMap(value, valueIdx));
      }

      // 결과 출력
      return groupedResults;
   }

   private static Map<String, Object> createValueMap(String value, int idx) {
      Map<String, Object> valueMap = new HashMap<>();
      valueMap.put("CATEGORY_ATTRIBUTE_VALUE_NAME", value);
      valueMap.put("CATEGORY_ATTRIBUTE_VALUE_IDX", idx);
      return valueMap;
   }

   // 카테고리를 찾는 메서드
   private static HashMap<String, Object> findCategory(List<HashMap<String, Object>> groupedResults, String category) {
      for (HashMap<String, Object> cat : groupedResults) {
         if (cat.get("CATEGORY_ATTRIBUTE_NAME").equals(category)) {
            return cat;
         }
      }
      return null;
   }

   @Override
   public HashMap<String, Object> compauterPartCompatibilityCheck(HashMap<String, Object> map) {
      List<HashMap<String, Object>> productList = productMapper.getProductList(map);
      System.out.println("productList전:" + productList);
      productList = deduplication(productList);
      System.out.println("productList후:" + productList);
      HashMap<String, Object> resultMap = new HashMap<>();
      CompauterPartCompatibilityCheck compauterPartCompatibilityCheck = new CompauterPartCompatibilityCheck();
      resultMap = compauterPartCompatibilityCheck.compauterPartCompatibilityCheck(productList);
      System.out.println("호환성 결과 :" + resultMap);
      return resultMap;
   }

   private static List<HashMap<String, Object>> deduplication(List<HashMap<String, Object>> productList) {

      // 중복 제거 후 통합된 결과를 저장할 새로운 리스트
      List<HashMap<String, Object>> unifiedProductList = new ArrayList<>();

      for (HashMap<String, Object> prod : productList) {
         HashMap<String, Object> unifiedProduct = new HashMap<>();

         // CATEGORY_ATTRIBUTE_IDXS (문자열 처리)
         String categoryAttributeIdxsStr = (String) prod.get("CATEGORY_ATTRIBUTE_IDXS");
         Set<Integer> uniqueIdxs = new LinkedHashSet<>();
         if (categoryAttributeIdxsStr != null && !categoryAttributeIdxsStr.isEmpty()) {
            String[] idxsArray = categoryAttributeIdxsStr.split(",");
            for (String idx : idxsArray) {
               uniqueIdxs.add(Integer.parseInt(idx.trim()));
            }
         }
         unifiedProduct.put("CATEGORY_ATTRIBUTE_IDXS", uniqueIdxs);

         // PRODUCT_DESCRIPTION
         unifiedProduct.put("PRODUCT_DESCRIPTION", prod.get("PRODUCT_DESCRIPTION"));

         // PRODUCT_IDX
         unifiedProduct.put("PRODUCT_IDX", prod.get("PRODUCT_IDX"));

         // CATEGORY_ATTRIBUTE_VALUE_NAMES (문자열 처리)
         String categoryAttributeValueNamesStr = (String) prod.get("CATEGORY_ATTRIBUTE_VALUE_NAMES");
         Set<String> uniqueValueNames = new LinkedHashSet<>();
         if (categoryAttributeValueNamesStr != null && !categoryAttributeValueNamesStr.isEmpty()) {
            String[] valueNamesArray = categoryAttributeValueNamesStr.split(",");
            for (String valueName : valueNamesArray) {
               uniqueValueNames.add(valueName.trim());
            }
         }
         unifiedProduct.put("CATEGORY_ATTRIBUTE_VALUE_NAMES", String.join(", ", uniqueValueNames));

         // PRICE
         unifiedProduct.put("PRICE", prod.get("PRICE"));

         // CATEGORY_IDX
         unifiedProduct.put("CATEGORY_IDX", prod.get("CATEGORY_IDX"));

         // CATEGORY_ATTRIBUTE_NAMES (문자열 처리)
         String categoryAttributeNamesStr = (String) prod.get("CATEGORY_ATTRIBUTE_NAMES");
         Set<String> uniqueAttributeNames = new LinkedHashSet<>();
         if (categoryAttributeNamesStr != null && !categoryAttributeNamesStr.isEmpty()) {
            String[] attributeNamesArray = categoryAttributeNamesStr.split(",");
            for (String attributeName : attributeNamesArray) {
               uniqueAttributeNames.add(attributeName.trim());
            }
         }
         unifiedProduct.put("CATEGORY_ATTRIBUTE_NAMES", String.join(", ", uniqueAttributeNames));

         // CATEGORY_ATTRIBUTE_VALUE_IDXS (문자열 처리)
         String categoryAttributeValueIdxsStr = (String) prod.get("CATEGORY_ATTRIBUTE_VALUE_IDXS");
         Set<Integer> uniqueValueIdxs = new LinkedHashSet<>();
         if (categoryAttributeValueIdxsStr != null && !categoryAttributeValueIdxsStr.isEmpty()) {
            String[] valueIdxsArray = categoryAttributeValueIdxsStr.split(",");
            for (String valueIdx : valueIdxsArray) {
               uniqueValueIdxs.add(Integer.parseInt(valueIdx.trim()));
            }
         }
         unifiedProduct.put("CATEGORY_ATTRIBUTE_VALUE_IDXS", uniqueValueIdxs);

         // PRODUCT_NAME
         unifiedProduct.put("PRODUCT_NAME", prod.get("PRODUCT_NAME"));

         // PRODUCT_ATTRIBUTE_IDXS (문자열 처리)
         String productAttributeIdxsStr = (String) prod.get("PRODUCT_ATTRIBUTE_IDXS");
         Set<Integer> uniqueProductAttributeIdxs = new LinkedHashSet<>();
         if (productAttributeIdxsStr != null && !productAttributeIdxsStr.isEmpty()) {
            String[] productIdxsArray = productAttributeIdxsStr.split(",");
            for (String productIdx : productIdxsArray) {
               uniqueProductAttributeIdxs.add(Integer.parseInt(productIdx.trim()));
            }
         }
         unifiedProduct.put("PRODUCT_ATTRIBUTE_IDXS", uniqueProductAttributeIdxs);

         // 통합된 제품 정보를 새로운 리스트에 추가
         unifiedProductList.add(unifiedProduct);
      }
      return unifiedProductList;
   }

   @Override
   public List<HashMap<String, Object>> getDeskTopPartProductList(HashMap<String, Object> map) {
      List<HashMap<String, Object>> getDeskTopPartProductList = productMapper.getDeskTopPartProductList(map);
      for (int i = 0; i < getDeskTopPartProductList.size(); i++) {
         String productSfileName = String.valueOf(getDeskTopPartProductList.get(i).get("PRODUCT_SFILE_NAME"));
         FileImage fileImage = new FileImage();
         productSfileName = fileImage.fileNemeReplace(productSfileName);
         getDeskTopPartProductList.get(i).put("PRODUCT_SFILE_NAME", productSfileName);
      }
      return getDeskTopPartProductList;
   }

}