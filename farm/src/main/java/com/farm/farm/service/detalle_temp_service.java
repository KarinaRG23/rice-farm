package com.farm.farm.service;

import com.farm.farm.entity.detalle_temp_entity;
import com.farm.farm.repository.detalle_temp_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class detalle_temp_service {

    @Autowired
    detalle_temp_repository detalle_temp_repository;

    public ArrayList<detalle_temp_entity> getAlldetalle_temp(){
        return (ArrayList<detalle_temp_entity>) detalle_temp_repository.findAll();
    }
    public detalle_temp_entity savedetalle_temp(detalle_temp_entity tc_detalle_temp){
        return detalle_temp_repository.save(tc_detalle_temp);

    }
    public Optional<detalle_temp_entity> getdetalle_tempById(int id){
        return detalle_temp_repository.findById(id);

    }

    public boolean deletedetalle_tempById (int id){
        try{
            detalle_temp_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
