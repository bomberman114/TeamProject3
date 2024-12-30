package com.green.oauth.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.oauth.vo.SocialUserVo;
import com.green.oauth.vo.UserVo;
import com.green.userDetails.CustomUserDetails;

@Mapper
public interface UserMapper {

	UserVo findByProviderAndSocialId(String socialId, String provider);

	void saveUser(UserVo userVo);

	void saveSocialUser(SocialUserVo socialUserVo);

	void updateSocialUser(UserVo existData);

	CustomUserDetails findByEmail(String email);

	UserVo findUserVoAtEmail(String email);

	String isUserEmailDupCheck(String userEmail);

	void saveUserLocal(UserVo vo);

}
