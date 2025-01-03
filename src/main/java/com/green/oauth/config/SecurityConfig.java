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
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;

import com.green.oauth.handler.CustomAccessDeniedHandler;
import com.green.oauth.handler.CustomAuthenticationSuccessHandler;
import com.green.oauth.service.CustomOAuth2UserService;
import com.green.userDetails.service.CustomUserDetailsService;

@Configuration  
@EnableWebSecurity // 웹 보안을 활성화
public class SecurityConfig {
	    
    private final CustomOAuth2UserService      customOAuth2UserService;
   
    private CustomUserDetailsService           customUserDetailsService;
    
    private CustomAuthenticationSuccessHandler successHandler;
    
    private CustomAccessDeniedHandler          deniedHandler;

    public SecurityConfig(CustomOAuth2UserService            customOAuth2UserService, CustomUserDetailsService  customUserDetailsService,
    		              CustomAuthenticationSuccessHandler successHandler,          CustomAccessDeniedHandler deniedHandler) {
        this.customOAuth2UserService  = customOAuth2UserService;
        this.customUserDetailsService = customUserDetailsService;
        this.successHandler           = successHandler;
        this.deniedHandler            = deniedHandler;
    }
    
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService);
    }
    
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf((csrf) -> csrf.disable())                        // 일반 사용자에 대해 Session을 저장하지 않으므로 csrf을 disable 처리함.
            .authorizeHttpRequests((auth) -> auth                  // 요청에 대한 인가를 설정
            		.requestMatchers("/admin/**").hasRole("ADMIN") // ADMIN권한을 가진 유저만 허용할 엔드포인트 설정
            		.requestMatchers("/user/**").hasRole("USER")   // USER 권한을 가진 유저만 허용할 엔드포인트 설정
                    .anyRequest().permitAll())                     // 위에 설정한 엔드포인트 제외하곤 인가 
            .userDetailsService(customUserDetailsService)
            .formLogin((login) -> login
                .loginPage("/loginForm")                           // 폼 로그인할 커스텀 로그인 페이지 엔드포인트 설정
                .loginProcessingUrl("/login")                      // 로그인 처리 엔드포인트 설정
                .usernameParameter("email")                        // 사용자명 파라미터를 'email'로 설정
                .passwordParameter("password")                     // 비밀번호 파라미터를 'password'로 설정
                .defaultSuccessUrl("/")                            // 로그인 성공 시 리다이렉트할 기본 엔드포인트 설정
                .failureUrl("/loginForm?loginederror")             // 로그인 실패 시 리다이렉트할 엔드포인트 설정
                .permitAll()                                       // 모든 사용자에게 로그인 페이지 접근 허용
                .successHandler(successHandler))                   // 로그인 성공 시 실행할 핸들러 설정
            .httpBasic((basic) -> basic.disable())                 // HTTP 기본 인증 비활성화
            // Oauth2Login
            // - OAuth2 로그인 관련 필터를 자동으로 처리
            // Oauth2Client
            // - OAuth2 클라이언트 관련 필터 및 내부 등록 정보를 수동으로 설정해야 함
            .oauth2Login((oauth2) -> oauth2
                .loginPage("/loginForm")                           // OAuth2 로그인을 할 커스텀 로그인 페이지 설정
                .userInfoEndpoint((userInfoEndpointConfig) -> userInfoEndpointConfig
                    .userService(customOAuth2UserService))         // OAuth2 사용자 정보를 처리할 서비스 설정
                .defaultSuccessUrl("/", true)                      // OAuth2 로그인 성공 시 리다이렉트할 엔드포인트 설정
                .successHandler(successHandler))                   // OAuth2 로그인 성공 시 실행할 핸들러 설정
            .logout((logout) -> logout
                .logoutUrl("/logout")                              // 로그아웃 엔드포인트 설정
                .logoutSuccessUrl("/")                             // 로그아웃 성공 시 리다이렉트할 엔드포인트 설정
                .deleteCookies("JSESSIONID")                       // 로그아웃 시 삭제할 쿠키 지정
                .invalidateHttpSession(true)                       // HTTP 세션 무효화
                .clearAuthentication(true))                        // 인증 정보 제거
            .exceptionHandling(exceptionHandling -> exceptionHandling
                .accessDeniedHandler(deniedHandler))               // 접근 거부 시(403에러) 처리할 핸들러 설정
            .sessionManagement((session) -> session
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED));  // 세션 생성 정책 설정(필요하면 생)
        return http.build();
    }

    // 비밀번호 암호화 사용
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    /* 비밀번호 암호화 사용X
    @Bean
    public PasswordEncoder passwordEncoder() {
    	return NoOpPasswordEncoder.getInstance();
    }
    */
}
    
    
