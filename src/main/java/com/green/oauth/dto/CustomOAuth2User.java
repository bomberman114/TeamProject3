package com.green.oauth.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.green.provider.EmailProvider;

public class CustomOAuth2User implements OAuth2User, EmailProvider {

    private final OAuth2Response oAuth2Response;
    private final String role;

    public CustomOAuth2User(OAuth2Response oAuth2Response, String role) {

        this.oAuth2Response = oAuth2Response;
        this.role = role;
    }

    @Override
    public Map<String, Object> getAttributes() {
    	// 소셜로그인마다 리턴하는 값이 달라서 안 씀.
        return null;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        Collection<GrantedAuthority> collection = new ArrayList<>();

        collection.add(new GrantedAuthority() {

            @Override
            public String getAuthority() {

                return role;
            }
        });

        return collection;
    }

    @Override
    public String getName() {

        return oAuth2Response.getName();
    }

    public String getUsername() {

        return oAuth2Response.getProvider()+" "+oAuth2Response.getProviderId();
        
    }
    
    public String getProvider() {
    	
    	return (String) oAuth2Response.getProvider();
    }
    public String getSocialId() { 
    	
    	return (String) oAuth2Response.getProviderId();
    }

	@Override
	public String getEmail() {
		return oAuth2Response.getEmail();
	}
    
}