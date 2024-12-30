package com.green.oauth.handler;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.green.oauth.mapper.UserMapper;
import com.green.oauth.vo.UserVo;
import com.green.provider.EmailProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private UserMapper userMapper;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// 로그인 성공 시 수행할 로직 작성
		// 예: 사용자 정보를 세션에 저장
		HttpSession session = request.getSession();
		String email = ((EmailProvider) authentication.getPrincipal()).getEmail();

		UserVo user = userMapper.findUserVoAtEmail(email);
		// 세션에 사용자 정보 저장
		session.setAttribute("user", user);

		// 원하는 페이지로 리다이렉트
		response.sendRedirect("/");
	}
}
