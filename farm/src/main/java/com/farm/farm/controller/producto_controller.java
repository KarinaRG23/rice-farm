package com.farm.farm.controller;

import com.farm.farm.entity.producto_entity;
import com.farm.farm.service.producto_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Producto")
public class producto_controller {

    @Autowired
    producto_service producto_service;

    @GetMapping()
    public ArrayList<producto_entity> getAllproducto(){

        return producto_service.getAllproducto();
    }
    @PostMapping
    public producto_entity saveproducto(@RequestBody producto_entity name) {
        return this.producto_service.saveproducto(name);
    }
    @GetMapping(path="/{id}")
    public Optional<producto_entity> getAttributesById(@PathVariable("id") int id){
        return this.producto_service.getproductoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.producto_service.deleteproductoById(id);
        if (ok) {
            return "Se ha eliminado el producto con el Id: " + id;
        } else {
            return "Algo ha salido mal, el producto no ha sido eliminado";
        }
    }

}
