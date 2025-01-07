package com.green.oauth.dto;

import java.util.Map;

public class GoogleResponse implements OAuth2Response{

    private final Map<String, Object> attribute;

    public GoogleResponse(Map<String, Object> attribute) {

        this.attribute = attribute;
    }

    @Override
    public String getProvider() {

        return "google";
    }

    @Override
    public String getProviderId() {

        return attribute.get("sub").toString();
    }

    @Override
    public String getEmail() {

        return attribute.get("email").toString();
    }

    @Override
    public String getName() {
        return attribute.get("family_name").toString().trim() + attribute.get("given_name").toString().trim() ;
    }

	@Override
	public String getNickname() {
		return attribute.get("name").toString().trim();
	}
}
