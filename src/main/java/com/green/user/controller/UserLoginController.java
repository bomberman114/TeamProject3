package com.green.user.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.green.oauth.mapper.UserMapper;
import com.green.oauth.vo.UserVo;
import com.green.user.service.UserLoginService;

@Controller
public class UserLoginController {

	 private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	
	@Autowired
	private UserLoginService userLoginService;
	
	@Autowired
	private UserMapper userMapper;

	@GetMapping("/loginForm")
	public String getLogin() {
		return "loginForm";
	}
	
	@GetMapping("/registerForm")
	public String getRegisterUser() {
		return "registerForm";
	}
	
	@PostMapping("/register")
	public String postRegisterUser(UserVo vo) {
		String encodedPassword = passwordEncoder.encode(vo.getUser_password());
		vo.setUser_password(encodedPassword);
		userMapper.saveUserLocal(vo);
		return "redirect:/loginForm";
	}
	
	@PostMapping("/IsUserExist")
	public ResponseEntity<Boolean> isUserExist(@RequestBody HashMap<String, Object> map) {
	    boolean isUserExist = userLoginService.isUserExist(map);
	    return new ResponseEntity<>(isUserExist, HttpStatus.OK);
	}

	@PostMapping("/IsEmailDupCheck")
	public ResponseEntity<Boolean>  isEmailDupCheck(@RequestBody HashMap<String, Object> map) {;
		boolean isUserEmailDupCheck = userLoginService.isUserEmailDupCheck(map);
		return new ResponseEntity<Boolean>(isUserEmailDupCheck, HttpStatus.OK);
		
	}
}
