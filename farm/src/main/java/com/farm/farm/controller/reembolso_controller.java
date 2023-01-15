package com.farm.farm.controller;

import com.farm.farm.entity.reembolso_entity;
import com.farm.farm.service.reembolso_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Reembolso")
public class reembolso_controller {

    @Autowired
    reembolso_service reembolso_service;

    @GetMapping()
    public ArrayList<reembolso_entity> getAllreembolso(){

        return reembolso_service.getAllreembolso();
    }
    @PostMapping
    public reembolso_entity savereembolso(@RequestBody reembolso_entity name) {
        return this.reembolso_service.savereembolso(name);
    }
    @GetMapping(path="/{id}")
    public Optional<reembolso_entity> getAttributesById(@PathVariable("id") int id){
        return this.reembolso_service.getreembolsoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.reembolso_service.deletereembolsoById(id);
        if (ok) {
            return "Se ha eliminado el reembolso con el Id: " + id;
        } else {
            return "Algo ha salido mal, el reembolso no ha sido eliminado";
        }
    }
}
