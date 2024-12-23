package com.green.config;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.boot.autoconfigure.SqlSessionFactoryBeanCustomizer;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler( "/files/**") 
	        // C:\dev\tools\TeamProject2\src\main\resources\static\img\commonImage\
	       // .addResourceLocations("file:///C:/dev/tools/TeamProject2/src/main/resources/static/img/commonImage/**")
	        .addResourceLocations("file:///C:/dev/tools/TeamProject2/src/main/resources/static/img/commonImage/**");
	    }
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// authInterceptor 를 동작시킬때 모든 페이지(/**)를 대상으로 한다
		// http://localhost:9090 밑의 모든 파일
		// 제외 "/css/**", "/img/**", "/js/**" 경로는 interceptor의 대상아님
		// .addPathPatterns("/Board/**")  
		//  -> http://localhost:9090/Board 밑의 모든 파일
		
		/* 로그인 기능 일시 정지 */
		
		/*
		registry.addInterceptor( authInterceptor )
		//        .addPathPatterns("/**")		        
		        .addPathPatterns("/Board/**", "/BoardPaging/**")		        
		        .excludePathPatterns("/css/**", "/img/**", "/js/**");
		
		WebMvcConfigurer.super.addInterceptors(registry);
		*/

	}
}








