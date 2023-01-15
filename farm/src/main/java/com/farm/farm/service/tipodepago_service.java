package com.farm.farm.service;

import com.farm.farm.entity.tipodepago_entity;
import com.farm.farm.repository.tipodepago_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class tipodepago_service {

    @Autowired
    tipodepago_repository tipodepago_repository;

    public ArrayList<tipodepago_entity> getAlltipodepago(){
        return (ArrayList<tipodepago_entity>) tipodepago_repository.findAll();
    }
    public tipodepago_entity savetipodepago(tipodepago_entity tc_tipodepago){
        return tipodepago_repository.save(tc_tipodepago);

    }
    public Optional<tipodepago_entity> gettipodepagoById(int id){
        return tipodepago_repository.findById(id);

    }

    public boolean deletetipodepagoById (int id){
        try{
            tipodepago_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }

}
