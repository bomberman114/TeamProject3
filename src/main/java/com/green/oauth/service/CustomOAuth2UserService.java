package com.green.oauth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.green.oauth.dto.CustomOAuth2User;
import com.green.oauth.dto.GoogleResponse;
import com.green.oauth.dto.NaverResponse;
import com.green.oauth.dto.OAuth2Response;
import com.green.oauth.mapper.UserMapper;
import com.green.oauth.vo.SocialUserVo;
import com.green.oauth.vo.UserVo;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
	// DefaultOAuth2UserService는 OAuth2UserService의 구현체
	// OAuth2UserService를 extends 해도 됨.

	@Autowired
	private UserMapper userMapper;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

		OAuth2User oAuth2User = super.loadUser(userRequest);
		System.out.println(oAuth2User.getAttributes());

		String registrationId = userRequest.getClientRegistration().getRegistrationId();
		OAuth2Response oAuth2Response = null;
		if (registrationId.equals("naver")) {

			oAuth2Response = new NaverResponse(oAuth2User.getAttributes());
		} else if (registrationId.equals("google")) {

			oAuth2Response = new GoogleResponse(oAuth2User.getAttributes());
		} else {

			return null;
		}

		String email = oAuth2Response.getEmail();
		String provider = oAuth2Response.getProvider();
		String socialId = oAuth2Response.getProviderId();
		String name = oAuth2Response.getName();
		String nickname = oAuth2Response.getNickname();
		String role = "ROLE_USER";
		UserVo existData = userMapper.findByProviderAndSocialId(socialId, provider);

		if (existData == null) {

			UserVo userVo = new UserVo();
			userVo.setUser_email(email);
			userVo.setUser_name(name);
			userVo.setUser_nickname(nickname);
			userVo.setUser_status(1);
			userVo.setUser_login_method(provider);
			userVo.setUser_role(role);

			userMapper.saveUser(userVo);

			SocialUserVo socialUserVo = new SocialUserVo();
			socialUserVo.setSocial_user_socialid(socialId);
			socialUserVo.setSocial_user_email(email);
			socialUserVo.setSocial_user_name(name);
			socialUserVo.setSocial_user_nickname(nickname);
			socialUserVo.setSocial_user_role(role);
			socialUserVo.setSocial_user_provider(provider);

			userMapper.saveSocialUser(socialUserVo);

		}else {
			existData.setUser_nickname(nickname);
			
			userMapper.updateSocialUser(existData);
			
		}
		return new CustomOAuth2User(oAuth2Response, role);
	}
}
