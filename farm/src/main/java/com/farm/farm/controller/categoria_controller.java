package com.farm.farm.controller;

import com.farm.farm.entity.categoria_entity;
import com.farm.farm.service.categoria_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/categoria")
public class categoria_controller {

    @Autowired
    categoria_service categoria_service;

    @GetMapping()
    public ArrayList<categoria_entity> getAllCategoria(){

        return categoria_service.getAllCategoria();
    }
    @PostMapping
    public categoria_entity saveCategoria(@RequestBody categoria_entity name) {
        return this.categoria_service.saveCategoria(name);
    }
    @GetMapping(path="/{id}")
    public Optional<categoria_entity> getAttributesById(@PathVariable("id") int id){
        return this.categoria_service.getCategoriaById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.categoria_service.deleteCategoriaById(id);
        if (ok) {
            return "Se ha eliminado el categoria con el Id: " + id;
        } else {
            return "Algo ha salido mal, el categoria no ha sido eliminado";
        }
    }


}
