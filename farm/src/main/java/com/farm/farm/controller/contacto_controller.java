package com.farm.farm.controller;


import com.farm.farm.entity.contacto_entity;
import com.farm.farm.service.contacto_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/contacto")
public class contacto_controller {

    @Autowired
    contacto_service contacto_service;

    @GetMapping()
    public ArrayList<contacto_entity> getAllcontacto(){

        return contacto_service.getAllcontacto();
    }
    @PostMapping
    public contacto_entity savecontacto(@RequestBody contacto_entity name) {
        return this.contacto_service.savecontacto(name);
    }
    @GetMapping(path="/{id}")
    public Optional<contacto_entity> getAttributesById(@PathVariable("id") int id){
        return this.contacto_service.getcontactoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.contacto_service.deletecontactoById(id);
        if (ok) {
            return "Se ha eliminado el contacto con el Id: " + id;
        } else {
            return "Algo ha salido mal, el contacto no ha sido eliminado";
        }
    }
}
