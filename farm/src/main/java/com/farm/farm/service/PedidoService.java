package com.farm.farm.service;


import com.farm.farm.entity.pedido_entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.farm.farm.repository.persona_repository;

import java.util.ArrayList;
import java.util.List;

@Service
public class PedidoService {

    @Autowired
    persona_repository persona_repository;

    public List<pedido_entity> getPedidosByEmail(String email){
        List<pedido_entity> pedidos = persona_repository.findByEmail(email).getPed();
        return pedidos;
    }
}
