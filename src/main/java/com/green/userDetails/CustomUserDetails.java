package com.green.userDetails;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.green.provider.EmailProvider;

public class CustomUserDetails implements UserDetails, EmailProvider{
	
	private static final long serialVersionUID = 1L;

    private Long userIdx;
    private String userEmail;
    private String userPassword;
    private String userName;
    private String userNickname;
    private int    userStatus;
    private String userLoginMethod;
    private String userRole;
    private LocalDateTime userCreatedAt;
    private LocalDateTime userUpdatedAt;

    // 생성자
    public CustomUserDetails(Long userIdx, String userEmail, String userPassword, String userName,
                             String userNickname, int userStatus, String userLoginMethod, String userRole,
                             LocalDateTime userCreatedAt, LocalDateTime userUpdatedAt) {
        this.userIdx = userIdx;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userName = userName;
        this.userNickname = userNickname;
        this.userStatus = userStatus;
        this.userLoginMethod = userLoginMethod;
        this.userRole = userRole;
        this.userCreatedAt = userCreatedAt;
        this.userUpdatedAt = userUpdatedAt;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singletonList(new SimpleGrantedAuthority(this.userRole));
    }

    @Override
    public String getPassword() {
        return userPassword;
    }

    @Override
    public String getUsername() {
        return userEmail; // 이메일을 username으로 사용
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; // 계정 만료 여부, 필요에 따라 로직 추가
    }

    @Override
    public boolean isAccountNonLocked() {
        return true; // 계정 잠금 여부, 필요에 따라 로직 추가
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true; // 인증 정보 만료 여부, 필요에 따라 로직 추가
    }

    @Override
    public boolean isEnabled() {
      return userStatus == 1;
    }
    // Getter 메소드들
    public Long getUserIdx() { return userIdx; }
    public String getUserEmail() { return userEmail; }
    public String getUserName() { return userName; }
    public String getUserNickname() { return userNickname; }
    public int getUserStatus() { return userStatus; }
    public String getUserLoginMethod() { return userLoginMethod; }
    public String getUserRole() { return userRole; }
    public LocalDateTime getUserCreatedAt() { return userCreatedAt; }
    public LocalDateTime getUserUpdatedAt() { return userUpdatedAt; }

	@Override
	public String getEmail() {
		return userEmail;
	}
}

