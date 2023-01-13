package com.farm.farm.service;


import com.farm.farm.entity.persona_entity;
import com.farm.farm.helper.Hashing;
import com.farm.farm.repository.RolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.farm.farm.repository.persona_repository;

import java.util.HashMap;
import java.util.List;

@Service
public class PersonService {

    @Autowired
    persona_repository persona_repository;

    @Autowired
    RolRepository repository;

    public boolean isPasswordValid(String email, String password){
        persona_entity persona = persona_repository.findByEmail(email);
        String hashedPassword = persona.getPassword();
        return hashedPassword.equals(password);
    }


    public boolean isNotUserCreated(String email){
        return persona_repository.findByEmail(email) == null;
    }

    public persona_entity save(persona_entity person){
        if(isNotUserCreated(person.getEmail())){
            return persona_repository.save(person);
        }
        return null;
    }

    public List<persona_entity> getAllPersons(){
        return (List<persona_entity>) persona_repository.findAll();
    }

    public HashMap<Object, Object> loginBody(String email, String token){
        HashMap<Object, Object> loginBodyFinal = new HashMap();
        persona_entity person = persona_repository.findByEmail(email);

        loginBodyFinal.put("username", person.getNombres()+" "+person.getApellidos());
        loginBodyFinal.put("correo", person.getEmail());
        loginBodyFinal.put("token",token);
        loginBodyFinal.put("user_rol", repository.findById(person.getRolid()).get().getNombrerol());
        return loginBodyFinal;
    }
}
