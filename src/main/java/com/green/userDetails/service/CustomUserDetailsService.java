package com.green.userDetails.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.green.oauth.mapper.UserMapper;
import com.green.userDetails.CustomUserDetails;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UserMapper userMapper;
    
    private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        logger.debug("Attempting to load user by email: {}", email);
        CustomUserDetails user = userMapper.findByEmail(email);
        logger.debug("user: {}", user);
        if(user == null) {
            logger.error("User not found with email: {}", email);
            throw new UsernameNotFoundException("email " + email + " not found");
        }
        logger.info("User found: {}", user.getUsername());
        return user;
    }

}
