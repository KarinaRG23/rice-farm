package com.farm.farm.controller;

import com.farm.farm.entity.labores_entity;
import com.farm.farm.service.labores_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("Labores")
public class labores_controller {

    @Autowired
    labores_service labores_service;

    @GetMapping()
    public ArrayList<labores_entity> getAlllabores(){

        return labores_service.getAlllabores();
    }
    @PostMapping
    public labores_entity savelabores(@RequestBody labores_entity name) {
        return this.labores_service.savelabores(name);
    }
    @GetMapping(path="/{id}")
    public Optional<labores_entity> getAttributesById(@PathVariable("id") int id){
        return this.labores_service.getlaboresById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.labores_service.deletelaboresById(id);
        if (ok) {
            return "Se ha eliminado el labores con el Id: " + id;
        } else {
            return "Algo ha salido mal, el labores no ha sido eliminado";
        }
    }



}
