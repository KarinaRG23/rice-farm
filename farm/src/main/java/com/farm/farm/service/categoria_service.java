package com.farm.farm.service;

import com.farm.farm.entity.categoria_entity;
import com.farm.farm.repository.categoria_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class categoria_service {

    @Autowired
    categoria_repository categoria_repository;

    public ArrayList<categoria_entity> getAllCategoria(){
        return (ArrayList<categoria_entity>) categoria_repository.findAll();
    }
    public categoria_entity saveCategoria(categoria_entity tc_categoria){
        return categoria_repository.save(tc_categoria);

    }
    public Optional<categoria_entity> getCategoriaById(int id){
        return categoria_repository.findById(id);

    }

    public boolean deleteCategoriaById (int id){
        try{
            categoria_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }


}
