package com.farm.farm.service;

import com.farm.farm.entity.producto_entity;
import com.farm.farm.repository.producto_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class producto_service {

    @Autowired
    producto_repository producto_repository;

    public ArrayList<producto_entity> getAllproducto(){
        return (ArrayList<producto_entity>) producto_repository.findAll();
    }
    public producto_entity saveproducto(producto_entity tc_producto){
        return producto_repository.save(tc_producto);

    }
    public Optional<producto_entity> getproductoById(int id){
        return producto_repository.findById(id);

    }

    public boolean deleteproductoById (int id){
        try{
            producto_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
