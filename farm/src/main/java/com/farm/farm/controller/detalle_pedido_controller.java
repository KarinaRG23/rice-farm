package com.farm.farm.controller;

import com.farm.farm.entity.detalle_pedido_entity;
import com.farm.farm.service.detalle_pedido_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/DetallePedido")
public class detalle_pedido_controller {
    @Autowired
    detalle_pedido_service detalle_pedido_service;

    @GetMapping()
    public ArrayList<detalle_pedido_entity> getAlldetalle_pedido(){

        return detalle_pedido_service.getAlldetalle_pedido();
    }
    @PostMapping
    public detalle_pedido_entity savedetalle_pedido(@RequestBody detalle_pedido_entity name) {
        return this.detalle_pedido_service.savedetalle_pedido(name);
    }
    @GetMapping(path="/{id}")
    public Optional<detalle_pedido_entity> getAttributesById(@PathVariable("id") int id){
        return this.detalle_pedido_service.getdetalle_pedidoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.detalle_pedido_service.deletedetalle_pedidoById(id);
        if (ok) {
            return "Se ha eliminado el detalle_pedido con el Id: " + id;
        } else {
            return "Algo ha salido mal, el detalle_pedido no ha sido eliminado";
        }
    }

}
