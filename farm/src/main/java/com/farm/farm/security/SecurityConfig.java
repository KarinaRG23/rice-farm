package com.farm.farm.security;


import com.farm.farm.security.filter.JwtFilterRequest;
import com.farm.farm.service.FarmUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    JwtFilterRequest jwtFilterRequest;

    @Autowired
    FarmUserDetailService farmUserDetailService;




}
