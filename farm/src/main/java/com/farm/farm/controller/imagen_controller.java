package com.farm.farm.controller;

import com.farm.farm.entity.imagen_entity;
import com.farm.farm.service.imagen_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/imagen")
public class imagen_controller {
    @Autowired
    imagen_service imagen_service;

    @GetMapping()
    public ArrayList<imagen_entity> getAllimagen(){

        return imagen_service.getAllimagen();
    }
    @PostMapping
    public imagen_entity saveimagen(@RequestBody imagen_entity name) {
        return this.imagen_service.saveimagen(name);
    }
    @GetMapping(path="/{id}")
    public Optional<imagen_entity> getAttributesById(@PathVariable("id") int id){
        return this.imagen_service.getimagenById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.imagen_service.deleteimagenById(id);
        if (ok) {
            return "Se ha eliminado el imagen con el Id: " + id;
        } else {
            return "Algo ha salido mal, el imagen no ha sido eliminado";
        }
    }
}
