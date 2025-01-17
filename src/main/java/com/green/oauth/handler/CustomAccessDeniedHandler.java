package com.green.oauth.handler;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
            AccessDeniedException accessDeniedException) throws IOException, ServletException {
        
    	// 403 접근시에 예외메시지 세션에 담으면서 "/"로 리다이렉트
        request.getSession().setAttribute("errorMessage", "접근 권한이 없습니다.");
        response.sendRedirect("/");
    }
}