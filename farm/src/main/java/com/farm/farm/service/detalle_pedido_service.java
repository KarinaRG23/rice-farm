package com.farm.farm.service;


import com.farm.farm.entity.detalle_pedido_entity;
import com.farm.farm.repository.detalle_pedido_repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class detalle_pedido_service {

    @Autowired
    detalle_pedido_repository detalle_pedido_repository;

    public ArrayList<detalle_pedido_entity> getAlldetalle_pedido(){
        return (ArrayList<detalle_pedido_entity>) detalle_pedido_repository.findAll();
    }
    public detalle_pedido_entity savedetalle_pedido(detalle_pedido_entity tc_detalle_pedido){
        return detalle_pedido_repository.save(tc_detalle_pedido);

    }
    public Optional<detalle_pedido_entity> getdetalle_pedidoById(int id){
        return detalle_pedido_repository.findById(id);

    }

    public boolean deletedetalle_pedidoById (int id){
        try{
            detalle_pedido_repository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
