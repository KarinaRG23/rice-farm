package com.farm.farm.controller;

import com.farm.farm.entity.produccion_entity;
import com.farm.farm.service.produccion_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Optional;

@RestController
@RequestMapping("/Produccion")
public class produccion_controller {

    @Autowired
    produccion_service produccion_service;

    @GetMapping()
    public ArrayList<produccion_entity> getAllproduccion(){

        return produccion_service.getAllproduccion();
    }

    @PostMapping
    public produccion_entity saveproduccion(@RequestBody produccion_entity name) {
        return this.produccion_service.saveproduccion(name);
    }
    @GetMapping(path="/{id}")
    public Optional<produccion_entity> getprodeuccionById(@PathVariable("id") int id){
        return this.produccion_service.getproduccionById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteproduccionById(@PathVariable("id") int id) {
        boolean ok = this.produccion_service.deleteproduccionById(id);
        if (ok) {
            return "Se ha eliminado el produccion con el Id: " + id;
        } else {
            return "Algo ha salido mal, el produccion no ha sido eliminado";
        }
    }
}
