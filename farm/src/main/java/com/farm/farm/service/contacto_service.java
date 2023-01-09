package com.farm.farm.service;


import com.farm.farm.entity.contacto_entity;
import com.farm.farm.repository.contacto_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class contacto_service {
    @Autowired
    contacto_repository contacto_repository;

    public ArrayList<contacto_entity> getAllcontacto(){
        return (ArrayList<contacto_entity>) contacto_repository.findAll();
    }
    public contacto_entity savecontacto(contacto_entity tc_contacto){
        return contacto_repository.save(tc_contacto);

    }
    public Optional<contacto_entity> getcontactoById(int id){
        return contacto_repository.findById(id);

    }

    public boolean deletecontactoById (int id){
        try{
            contacto_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
