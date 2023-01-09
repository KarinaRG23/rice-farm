package com.farm.farm.service;


import com.farm.farm.entity.imagen_entity;
import com.farm.farm.repository.imagen_repository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class imagen_service {
    imagen_repository imagen_repository;

    public ArrayList<imagen_entity> getAllimagen(){
        return (ArrayList<imagen_entity>) imagen_repository.findAll();
    }
    public imagen_entity saveimagen(imagen_entity tc_imagen){
        return imagen_repository.save(tc_imagen);

    }
    public Optional<imagen_entity> getimagenById(int id){
        return imagen_repository.findById(id);

    }

    public boolean deleteimagenById (int id){
        try{
            imagen_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
