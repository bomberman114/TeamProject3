package com.green.config;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
/*
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@EnableWebSecurity
@Configuration
*/
public class WebSecurityConfig {   // 스프링 시큐리티 관련 설정을 담당
/*
    private final UserDetailsService userService; 
     // 사용자의 인증 및 사용자 정보를 관리하는 데 사용

    // 특정 스프링 시큐리티 기능 비활성화
    @Bean
    public WebSecurityCustomizer configure() {
        return (web) -> web.ignoring()    // 특정 요청을 스프링 시큐리티의 인증 및 인가 처리에서 제외
                .requestMatchers(PathRequest.toH2Console())  // H2 데이터베이스의 콘솔 페이지에 대한 요청을 제외
                .requestMatchers("/static/**", "/index.html", "/");  // /static/** 경로로 시작하는 모든 요청을 시큐리티의 인증 과정에서 제외
    }

    // HTTP 요청에 대한 웹 보안 구성
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            // 인증 및 권한 설정: 특정 경로에 대해 접근 권한을 설정합니다.
            .authorizeHttpRequests(auth -> auth
                // "/login", "/signup", "/user" 경로는 누구나 접근할 수 있도록 허용합니다.
        	    .requestMatchers("/", "/index.html", "/login", "/signup", "/user").permitAll() // index.html 접근 허용
                .requestMatchers("/home").authenticated()  // /home은 인증된 사용자만 접근 가능
                .anyRequest().authenticated()  // 그 외의 모든 요청은 인증이 필요
            )
            // 폼 기반 로그인 설정: 커스텀 로그인 페이지를 설정합니다.
            .formLogin(form -> form
                // 사용자가 로그인할 페이지 경로를 설정합니다.
                .loginPage("/login")
                .loginProcessingUrl("/login")      // md파일 참조
                // 로그인 성공 시 이동할 기본 URL을 설정하고 강제로 리디렉션합니다.
                .defaultSuccessUrl("/home", true)
                .failureUrl("/login?error=true") // 로그인 실패 시 다시 로그인 페이지로 리디렉션
                .permitAll()
            )
            // 로그아웃 설정: 로그아웃 시 동작을 정의합니다.
            .logout(logout -> logout
                // 로그아웃 후 리디렉션될 URL을 설정합니다.
                .logoutSuccessUrl("/login")
                // 세션 무효화 설정으로, 로그아웃 시 세션을 무효화합니다.
                .invalidateHttpSession(true)
            )
            // CSRF 보호 비활성화: 개발 중 테스트 시에는 비활성화할 수 있지만, 실제 배포 시에는 활성화하는 것이 좋습니다.
            .csrf(csrf -> csrf.disable());

        // 최종적으로 SecurityFilterChain 객체를 반환합니다.
        return http.build();
    }

    //  AuthenticationManager가 인증 시도
    // 생성된 UsernamePasswordAuthenticationToken 객체는 Spring Security의
    // **AuthenticationManager**에 전달되어 인증 절차가 시작됩니다.
    // 이 경우, AuthenticationManager는 DaoAuthenticationProvider를 사용하여
    // 데이터베이스 기반 인증을 처리합니다.
    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
         // 인증 과정에서 사용자 정보를 확인하고 비밀번호를 검증하는 데 사용
        daoAuthenticationProvider.setUserDetailsService(userService);
         // 사용자 정보를 로드하는 데 사용하는 한다.
         //   사용자 정보를 제공할 서비스(UserDetailsService)를 설정
        daoAuthenticationProvider.setPasswordEncoder(bCryptPasswordEncoder());
         // 비밀번호를 검증할 때 사용할 암호화 인코더를 설정  
        
        // 기본적으로 DaoAuthenticationProvider는 사용자 정보가 없을 때 예외(UsernameNotFoundException)를 숨깁니다. (true)
        // 예외가 발생할 때 디버깅 정보를 추가로 확인할 수 있도록 예외 핸들러 추가
        daoAuthenticationProvider.setHideUserNotFoundExceptions(false);
        
        return daoAuthenticationProvider;
    }

    // 패스워드 인코더로 사용할 빈 등록
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
    */
}
