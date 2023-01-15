package com.farm.farm.service;

import com.farm.farm.entity.reembolso_entity;
import com.farm.farm.repository.reembolso_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class reembolso_service {

    @Autowired
    reembolso_repository reembolso_repository;

    public ArrayList<reembolso_entity> getAllreembolso(){
        return (ArrayList<reembolso_entity>) reembolso_repository.findAll();
    }
    public reembolso_entity savereembolso(reembolso_entity tc_reembolso){
        return reembolso_repository.save(tc_reembolso);

    }
    public Optional<reembolso_entity> getreembolsoById(int id){
        return reembolso_repository.findById(id);

    }

    public boolean deletereembolsoById (int id){
        try{
            reembolso_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }

}
