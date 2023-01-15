package com.farm.farm.controller;

import com.farm.farm.entity.insumos_entity;
import com.farm.farm.service.insumos_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/insumos")
public class insumos_controller {

    @Autowired
    insumos_service insumos_service;

    @GetMapping()
    public ArrayList<insumos_entity> getAllinsumos(){

        return insumos_service.getAllinsumos();
    }
    @PostMapping
    public insumos_entity saveinsumos(@RequestBody insumos_entity name) {
        return this.insumos_service.saveinsumos(name);
    }
    @GetMapping(path="/{id}")
    public Optional<insumos_entity> getAttributesById(@PathVariable("id") int id){
        return this.insumos_service.getinsumosById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.insumos_service.deleteinsumosById(id);
        if (ok) {
            return "Se ha eliminado el insumos con el Id: " + id;
        } else {
            return "Algo ha salido mal, el insumos no ha sido eliminado";
        }
    }

}
