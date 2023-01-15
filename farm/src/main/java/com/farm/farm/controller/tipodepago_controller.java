package com.farm.farm.controller;

import com.farm.farm.entity.tipodepago_entity;
import com.farm.farm.service.tipodepago_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Tipodepago")
public class tipodepago_controller {

    @Autowired
    tipodepago_service tipodepago_service;

    @GetMapping()
    public ArrayList<tipodepago_entity> getAlltipodepago(){

        return tipodepago_service.getAlltipodepago();
    }
    @PostMapping
    public tipodepago_entity savetipodepago(@RequestBody tipodepago_entity name) {
        return this.tipodepago_service.savetipodepago(name);
    }
    @GetMapping(path="/{id}")
    public Optional<tipodepago_entity> getAttributesById(@PathVariable("id") int id){
        return this.tipodepago_service.gettipodepagoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.tipodepago_service.deletetipodepagoById(id);
        if (ok) {
            return "Se ha eliminado el tipodepago con el Id: " + id;
        } else {
            return "Algo ha salido mal, el tipodepago no ha sido eliminado";
        }
    }

}
