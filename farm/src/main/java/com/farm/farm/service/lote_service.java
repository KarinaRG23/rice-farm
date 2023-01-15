package com.farm.farm.service;

import com.farm.farm.entity.lote_entity;
import com.farm.farm.repository.lote_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class lote_service {

    @Autowired
    lote_repository lote_repository;

    public ArrayList<lote_entity> getAlllote(){
        return (ArrayList<lote_entity>) lote_repository.findAll();
    }
    public lote_entity savelote(lote_entity tc_lote){
        return lote_repository.save(tc_lote);

    }
    public Optional<lote_entity> getloteById(int id){
        return lote_repository.findById(id);

    }

    public boolean deleteloteById (int id){
        try{
            lote_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
