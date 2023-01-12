package com.farm.farm.service;


import com.farm.farm.entity.persona_entity;
import com.farm.farm.helper.Hashing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.farm.farm.repository.persona_repository;
@Service
public class PersonService {

    @Autowired
    persona_repository persona_repository;

    public boolean isPasswordValid(String email, String password){
        persona_entity persona = persona_repository.findByEmail(email);
        String hashedPassword = persona.getPassword();
        String salt = persona.getSalt();
        return Hashing.validatePassword(password, hashedPassword, salt);
    }
}
