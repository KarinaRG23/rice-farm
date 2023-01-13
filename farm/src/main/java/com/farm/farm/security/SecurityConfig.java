package com.farm.farm.security;


import com.farm.farm.security.filter.JwtFilterRequest;
import com.farm.farm.service.FarmUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    JwtFilterRequest jwtFilterRequest;

    @Autowired
    FarmUserDetailService farmUserDetailService;


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(farmUserDetailService);
        super.configure(auth);
    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers( "/person/**/").permitAll()
                //.antMatchers( "/Planes/**/").permitAll()
                //.antMatchers( "/Positions/**/").permitAll()
                //.antMatchers( "/Events/**/").permitAll()
                //.antMatchers( "/Devices/**/").permitAll()
                //.antMatchers( "/**/signup").permitAll()
                .antMatchers( "/**/login").permitAll()
                .anyRequest().authenticated().and().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        //.anyRequest().authenticated();
        //.antMatchers("/**/login").permitAll()
        //.antMatchers("/**/saveUsers").permitAll()
        //.antMatchers("/**/newPreference/{userId}").permitAll()
        //.antMatchers("/**/updatePreference").permitAll()
        //.anyRequest().authenticated().and().sessionManagement()
        //.sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        http.addFilterBefore(jwtFilterRequest, UsernamePasswordAuthenticationFilter.class);
    }




}
