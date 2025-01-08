package com.green.crolling.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.crolling.mapper.CrollingMapper;
import com.green.crolling.service.CrollingService;
import com.green.crolling.vo.CrollingImgVo;
import com.green.util.CrollingUtil;

@Transactional
@Service
public class CrollingServiceImpl implements CrollingService {
	
	@Value("${part4.upload-path}")
	private String uploadpath;
	
	@Autowired
	private CrollingMapper crollingMapper;

	@Override
	public void DownloadAndSaveImg(HashMap<String, Object> map) {
		List<HashMap<String, Object> >list = (List<HashMap<String, Object>>) map.get("products");
		for (HashMap<String, Object> product : list) {
			try {
				// DB 저장 로직
				HashMap<String, Object> exist = crollingMapper.findByProductName(product);
				
				
				if(exist != null) {
					int proudctIDx = Integer.parseInt(String.valueOf(exist.get("PRODUCT_IDX")));
					HashMap<String, Object> existImg = crollingMapper.findByIdx(proudctIDx);
					if(existImg == null) {
					CrollingImgVo img = CrollingUtil.downloadAndSaveImage(String.valueOf(product.get("product_img")), uploadpath);
					crollingMapper.reinforceProductImg(img,proudctIDx);
					}
				}else {
					crollingMapper.saveProduct(product);
					CrollingImgVo img = CrollingUtil.downloadAndSaveImage(String.valueOf(product.get("product_img")), uploadpath);
					crollingMapper.saveProductImg(img);
				}
				
			} catch (Exception e) {
				// 예외 발생 시 롤백됨
				throw new RuntimeException("Error processing products", e);
			}
		}
		
	}

}

	