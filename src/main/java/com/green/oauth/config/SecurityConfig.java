package com.green.oauth.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.green.oauth.handler.CustomAccessDeniedHandler;
import com.green.oauth.handler.CustomAuthenticationSuccessHandler;
import com.green.oauth.service.CustomOAuth2UserService;
import com.green.userDetails.service.CustomUserDetailsService;

@Configuration  
@EnableWebSecurity // 웹 보안을 활성화
public class SecurityConfig {
	    
    private final CustomOAuth2UserService customOAuth2UserService;
   
    private CustomUserDetailsService customUserDetailsService;
    
    private CustomAuthenticationSuccessHandler successHandler;
    
    private CustomAccessDeniedHandler deniedHandler;

    public SecurityConfig(CustomOAuth2UserService customOAuth2UserService, CustomUserDetailsService customUserDetailsService,
    		CustomAuthenticationSuccessHandler successHandler,CustomAccessDeniedHandler deniedHandler) {
        this.customOAuth2UserService = customOAuth2UserService;
        this.customUserDetailsService = customUserDetailsService;
        this.successHandler = successHandler;
        this.deniedHandler = deniedHandler;
    }
    
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService);
    }
    
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    	
    	
        http
            .csrf((csrf) -> csrf.disable())        //일반 사용자에 대해 Session을 저장하지 않으므로 csrf을 disable 처리함.
            .authorizeHttpRequests((auth) -> auth  // 요청에 대한 인가를 설정
            		.requestMatchers("/user/**").hasRole("USER")
            		.requestMatchers("/admin/**").hasRole("ADMIN")
                    .anyRequest().permitAll())
            .userDetailsService(customUserDetailsService)
            .formLogin((login) -> login
            		.loginPage("/loginForm")
            		.loginProcessingUrl("/login")
                    .usernameParameter("email")
                    .passwordParameter("password")
            		.defaultSuccessUrl("/")
                    .failureUrl("/loginForm?loginederror")
                    .permitAll()
                    .successHandler(successHandler))
            .httpBasic((basic) -> basic.disable())
	         // oauth2Login  -- 필터부분을 자동으로 처리해줌.
	         // oauth2Client -- 필터, 내부 등록 정보를 다 커스텀 해야 됨.
            .oauth2Login((oauth2) -> oauth2
            	.loginPage("/loginForm")   // 커스텀 로그인 페이지 등록
                .userInfoEndpoint((userInfoEndpointConfig) -> userInfoEndpointConfig
                    .userService(customOAuth2UserService))
                .defaultSuccessUrl("/", true)
                .successHandler(successHandler))
            .logout((logout) -> logout
            	.logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .deleteCookies("JSESSIONID")
                .invalidateHttpSession(true)
                .clearAuthentication(true))
            .exceptionHandling(exceptionHandling -> exceptionHandling
                    .accessDeniedHandler(deniedHandler))
            .sessionManagement((session) -> session
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED));
        return http.build();
    }

    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    /*
    @Bean
    public PasswordEncoder passwordEncoder() {
    	return NoOpPasswordEncoder.getInstance();
    }
    */
}
    
    
