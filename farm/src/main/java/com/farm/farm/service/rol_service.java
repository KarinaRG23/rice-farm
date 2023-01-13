package com.farm.farm.service;

import com.farm.farm.entity.rol_entity;
import com.farm.farm.repository.RolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class rol_service {

    @Autowired
    RolRepository rol_repository;

    public ArrayList<rol_entity> getAllrol(){
        return (ArrayList<rol_entity>) rol_repository.findAll();
    }
    public rol_entity saverol(rol_entity tc_rol){
        return rol_repository.save(tc_rol);

    }
    public Optional<rol_entity> getrolById(int id){
        return rol_repository.findById(id);

    }

    public boolean deleterolById (int id){
        try{
            rol_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }


}
