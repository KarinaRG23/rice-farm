package com.farm.farm.security.filter;


import com.farm.farm.security.JWTUtil;
import com.farm.farm.service.FarmUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtFilterRequest extends OncePerRequestFilter {

    JWTUtil jwtUtil;
    FarmUserDetailService farmUserDetailService;

    @Autowired
    public JwtFilterRequest(JWTUtil jwtUtil,FarmUserDetailService farmUserDetailService){
        this.jwtUtil = jwtUtil;
        this.farmUserDetailService = farmUserDetailService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String authorizationHeader = request.getHeader("Authorization");
        if (authorizationHeader != null &&  authorizationHeader.startsWith("Bearer")){
            String jwt = authorizationHeader.substring(7);
            String email = jwtUtil.extractUsername(jwt);
            if (email != null && SecurityContextHolder.getContext().getAuthentication() == null){
                UserDetails userDetails = farmUserDetailService.loadUserByUsername(email);


                if (jwtUtil.validateToken(jwt, userDetails)){
                    UsernamePasswordAuthenticationToken authenticationToken  = new
                            UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());

                    // to know which browser is currently using
                    authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                    SecurityContextHolder.getContext().setAuthentication(authenticationToken);
                }
            }
        }

        filterChain.doFilter(request, response);
    }
}
