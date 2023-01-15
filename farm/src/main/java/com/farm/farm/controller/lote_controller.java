package com.farm.farm.controller;

import com.farm.farm.entity.lote_entity;
import com.farm.farm.service.lote_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/lote")
public class lote_controller {

    @Autowired
    lote_service lote_service;

    @GetMapping()
    public ArrayList<lote_entity> getAlllote(){

        return lote_service.getAlllote();
    }
    @PostMapping
    public lote_entity savelote(@RequestBody lote_entity name) {
        return this.lote_service.savelote(name);
    }
    @GetMapping(path="/{id}")
    public Optional<lote_entity> getAttributesById(@PathVariable("id") int id){
        return this.lote_service.getloteById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.lote_service.deleteloteById(id);
        if (ok) {
            return "Se ha eliminado el lote con el Id: " + id;
        } else {
            return "Algo ha salido mal, el lote no ha sido eliminado";
        }
    }
}
