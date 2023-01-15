package com.farm.farm.service;

import com.farm.farm.entity.insumos_entity;
import com.farm.farm.repository.insumos_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class insumos_service {

    @Autowired
    insumos_repository insumos_repository;

    public ArrayList<insumos_entity> getAllinsumos(){
        return (ArrayList<insumos_entity>) insumos_repository.findAll();
    }
    public insumos_entity saveinsumos(insumos_entity tc_insumos){
        return insumos_repository.save(tc_insumos);

    }
    public Optional<insumos_entity> getinsumosById(int id){
        return insumos_repository.findById(id);

    }

    public boolean deleteinsumosById (int id){
        try{
            insumos_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
