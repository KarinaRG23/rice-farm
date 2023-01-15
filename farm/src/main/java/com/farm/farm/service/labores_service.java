package com.farm.farm.service;

import com.farm.farm.entity.labores_entity;
import com.farm.farm.repository.labores_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class labores_service {

    @Autowired
    labores_repository labores_repository;

    public ArrayList<labores_entity> getAlllabores(){
        return (ArrayList<labores_entity>) labores_repository.findAll();
    }
    public labores_entity savelabores(labores_entity tc_labores){
        return labores_repository.save(tc_labores);

    }
    public Optional<labores_entity> getlaboresById(int id){
        return labores_repository.findById(id);

    }

    public boolean deletelaboresById (int id){
        try{
            labores_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
