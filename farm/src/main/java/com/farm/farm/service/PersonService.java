package com.farm.farm.service;


import com.farm.farm.entity.persona_entity;
import com.farm.farm.repository.RolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.farm.farm.repository.persona_repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class PersonService {

    persona_repository persona_repository;
    RolRepository repository;

    @Autowired
    public PersonService(persona_repository persona_repository, RolRepository rolRepository){
        this.persona_repository = persona_repository;
        this.repository = rolRepository;
    }

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


    /**
     * this is a customizable body to send the values
     * respective to the frontend about the person entity
     * the best way to send the values in the order desired
     * to avoid rewrite the rolId with the number of the rol
     * instead of the rol name
     * @return a list of hashmaps contained the Person body
     */
    public List<HashMap<Object, Object>> getAllPersons(){

        ArrayList<HashMap<Object, Object>> personObject = new ArrayList<>();

        ArrayList<persona_entity> persons = (ArrayList<persona_entity>) persona_repository.findAll();
        for(persona_entity person: persons){
            HashMap<Object,Object> personsBody = new HashMap<>();
            personsBody.put("idpersona", person.getIdpersona());
            personsBody.put("identificacion", person.getIdentificacion());
            personsBody.put("nombres", person.getNombres());
            personsBody.put("apellidos", person.getApellidos());
            personsBody.put("telefono", person.getTelefono());
            personsBody.put("email", person.getEmail());
            personsBody.put("nombrefiscal", person.getNombrefiscal());
            personsBody.put("direccionfiscal", person.getDireccionfiscal());
            personsBody.put("rolid", repository.findById(person.getRolid()).get().getNombrerol());
            if (person.getStatus() == 1){
                personsBody.put("status", "activo");
            }else{
                personsBody.put("status", "inactivo");
            }
            personObject.add(personsBody);
        }

        return personObject;
    }

    public HashMap<Object, Object> loginBody(String email, String token){
        HashMap<Object, Object> loginBodyFinal = new HashMap<>();
        persona_entity person = persona_repository.findByEmail(email);

        loginBodyFinal.put("username", person.getNombres()+" "+person.getApellidos());
        loginBodyFinal.put("correo", person.getEmail());
        loginBodyFinal.put("token",token);
        loginBodyFinal.put("user_rol", repository.findById(person.getRolid()).get().getNombrerol());
        return loginBodyFinal;
    }


    public List<HashMap<Object, Object>> getAllAdministrators(){
        ArrayList<HashMap<Object, Object>> personObject = new ArrayList<>();

        ArrayList<persona_entity> persons = (ArrayList<persona_entity>) persona_repository.findAll();
        for(persona_entity person: persons){
            if(repository.findById(person.getRolid()).get().getNombrerol().toLowerCase().equals("administrator") ||
                    repository.findById(person.getRolid()).get().getNombrerol().toLowerCase().equals("administrador")){
                HashMap<Object,Object> personsBody = new HashMap<>();
                personsBody.put("idpersona", person.getIdpersona());
                personsBody.put("identificacion", person.getIdentificacion());
                personsBody.put("nombres", person.getNombres());
                personsBody.put("apellidos", person.getApellidos());
                personsBody.put("telefono", person.getTelefono());
                personsBody.put("email", person.getEmail());
                personsBody.put("nombrefiscal", person.getNombrefiscal());
                personsBody.put("direccionfiscal", person.getDireccionfiscal());
                personsBody.put("rolid", repository.findById(person.getRolid()).get().getNombrerol());
                if (person.getStatus() == 1){
                    personsBody.put("status", "activo");
                }else{
                    personsBody.put("status", "inactivo");
                }
                personObject.add(personsBody);
            }else{
                continue;
            }

        }

        return personObject;
    }
}
