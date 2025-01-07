package com.green.user.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.green.oauth.mapper.UserMapper;
import com.green.oauth.vo.UserVo;
import com.green.user.service.UserLoginService;


@Service
public class UserLoginServiceImpl implements UserLoginService{

	private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean isUserExist(HashMap<String, Object> map) {

		String inputPassword = String.valueOf(map.get("user_password"));
	    
	    // 사용자 정보를 데이터베이스에서 조회 (이메일 또는 아이디로)
	    UserVo user = userMapper.findUserVoAtEmail(String.valueOf(map.get("user_email")));
	    
	    if (user != null) {
	        // 저장된 암호화된 비밀번호와 입력된 평문 비밀번호를 비교
	        boolean isPasswordMatch = passwordEncoder.matches(inputPassword, user.getUser_password());
	        return isPasswordMatch;
	    }
		return false;
		
	}

	@Override
	public boolean isUserEmailDupCheck(HashMap<String, Object> map) {
		String userEmail     = String.valueOf(map.get("user_email"));
		String registedEmail = userMapper.isUserEmailDupCheck(userEmail);
		System.out.println(userEmail);
		System.out.println(registedEmail);
		if(registedEmail != null) {
			return true;			
		}else {
			return false;						
		}
	}


}
