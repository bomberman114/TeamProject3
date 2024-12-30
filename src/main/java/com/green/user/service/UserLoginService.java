package com.green.user.service;

import java.util.HashMap;

import com.green.oauth.vo.UserVo;

public interface UserLoginService {

	boolean isUserExist(HashMap<String, Object> map);

	boolean isUserEmailDupCheck(HashMap<String, Object> map);


}
