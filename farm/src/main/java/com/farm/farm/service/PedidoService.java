package com.farm.farm.service;


import com.farm.farm.entity.pedido_entity;
import com.farm.farm.repository.Pedido;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.farm.farm.repository.persona_repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PedidoService {

    @Autowired
    persona_repository persona_repository;

    @Autowired
    Pedido pedido;

    public List<pedido_entity> getPedidosByEmail(String email){
        List<pedido_entity> pedidos = persona_repository.findByEmail(email).getPed();
        return pedidos;
    }

    public ArrayList<pedido_entity> getAllpedido(){
        return (ArrayList<pedido_entity>) pedido.findAll();
    }
    public pedido_entity savepedido(pedido_entity tc_pedido){
        return pedido.save(tc_pedido);

    }
    public Optional<pedido_entity> getpedidoById(int id){
        return pedido.findById(id);

    }

    public boolean deletepedidoById (int id){
        try{
            pedido.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
