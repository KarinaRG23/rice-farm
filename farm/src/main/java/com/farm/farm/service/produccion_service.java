package com.farm.farm.service;

import com.farm.farm.entity.produccion_entity;
import com.farm.farm.repository.produccion_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class produccion_service {

    @Autowired
    produccion_repository produccion_repository;

    public ArrayList<produccion_entity> getAllproduccion(){
        return (ArrayList<produccion_entity>) produccion_repository.findAll();
    }
    public produccion_entity saveproduccion(produccion_entity tc_produccion){
        return produccion_repository.save(tc_produccion);

    }
    public Optional<produccion_entity> getproduccionById(int id){
        return produccion_repository.findById(id);

    }

    public boolean deleteproduccionById (int id){
        try{
            produccion_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
