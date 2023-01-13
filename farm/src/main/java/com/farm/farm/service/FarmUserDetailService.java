package com.farm.farm.service;


import com.farm.farm.entity.persona_entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.farm.farm.repository.persona_repository;

import java.util.ArrayList;
import java.util.List;

@Service
public class FarmUserDetailService implements UserDetailsService {

    @Autowired
    persona_repository persona_repository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        persona_entity persona = persona_repository.findByEmail(email);
        List<GrantedAuthority> roles = new ArrayList<>();
        roles.add(new SimpleGrantedAuthority("USER"));
        return new User(persona.getEmail(), "{noop}"+persona.getPassword(), roles);
    }
}
