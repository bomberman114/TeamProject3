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
    	
    	// 로그인 인증 후 email로 UserVO 조회해서 세션에 저장
        HttpSession session = request.getSession();
        String 		email   = ((EmailProvider) authentication.getPrincipal()).getEmail();
        UserVo 		user    = userMapper.findUserVoAtEmail(email);
        session.setAttribute("user", user);

        // 세션에서 저장된 이전 페이지 URL 가져오기
        String targetUrl    = (String) session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");
        if (targetUrl == null) {
            // 저장된 URL이 없으면 Referer 헤더 확인
        	targetUrl = request.getHeader("Referer");
        	if (targetUrl == null) {
        	    targetUrl = request.getHeader("Referer");
        	    if (targetUrl == null || targetUrl.contains("/login") || targetUrl.contains("/register")) {
        	        targetUrl = "/";
        	    }
        	}
        } else {
            // 사용 후 세션에서 제거
            session.removeAttribute("SPRING_SECURITY_SAVED_REQUEST");
        }

        // 이전 페이지로 리다이렉트
        response.sendRedirect(targetUrl);
    }
}

