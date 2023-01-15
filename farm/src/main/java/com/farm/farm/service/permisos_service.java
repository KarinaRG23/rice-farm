package com.farm.farm.service;

import com.farm.farm.entity.permisos_entity;
import com.farm.farm.repository.permisos_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class permisos_service {

    @Autowired
    permisos_repository permisos_repository;

    public ArrayList<permisos_entity> getAllpermisos(){
        return (ArrayList<permisos_entity>) permisos_repository.findAll();
    }
    public permisos_entity savepermisos(permisos_entity tc_permisos){
        return permisos_repository.save(tc_permisos);

    }
    public Optional<permisos_entity> getpermisosById(int id){
        return permisos_repository.findById(id);

    }

    public boolean deletepermisosById (int id){
        try{
            permisos_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }

}
