package com.farm.farm.controller;

import com.farm.farm.entity.modulo_entity;
import com.farm.farm.service.modulo_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Modulo")
public class modulo_controller {

    @Autowired
    modulo_service modulo_service;

    @GetMapping()
    public ArrayList<modulo_entity> getAllmodulo(){

        return modulo_service.getAllmodulo();
    }
    @PostMapping
    public modulo_entity savemodulo(@RequestBody modulo_entity name) {
        return this.modulo_service.savemodulo(name);
    }
    @GetMapping(path="/{id}")
    public Optional<modulo_entity> getAttributesById(@PathVariable("id") int id){
        return this.modulo_service.getmoduloById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.modulo_service.deletemoduloById(id);
        if (ok) {
            return "Se ha eliminado el modulo con el Id: " + id;
        } else {
            return "Algo ha salido mal, el modulo no ha sido eliminado";
        }
    }

}
