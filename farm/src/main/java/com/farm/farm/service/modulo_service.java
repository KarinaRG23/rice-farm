package com.farm.farm.service;

import com.farm.farm.entity.modulo_entity;
import com.farm.farm.repository.modulo_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class modulo_service {

    @Autowired
    modulo_repository modulo_repository;

    public ArrayList<modulo_entity> getAllmodulo(){
        return (ArrayList<modulo_entity>) modulo_repository.findAll();
    }
    public modulo_entity savemodulo(modulo_entity tc_modulo){
        return modulo_repository.save(tc_modulo);

    }
    public Optional<modulo_entity> getmoduloById(int id){
        return modulo_repository.findById(id);

    }

    public boolean deletemoduloById (int id){
        try{
            modulo_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }

}
