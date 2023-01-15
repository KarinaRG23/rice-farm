package com.farm.farm.controller;

import com.farm.farm.entity.permisos_entity;
import com.farm.farm.service.permisos_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Permisos")
public class permisos_controller {

    @Autowired
    permisos_service permisos_service;

    @GetMapping()
    public ArrayList<permisos_entity> getAllpermisos(){

        return permisos_service.getAllpermisos();
    }
    @PostMapping
    public permisos_entity savepermisos(@RequestBody permisos_entity name) {
        return this.permisos_service.savepermisos(name);
    }
    @GetMapping(path="/{id}")
    public Optional<permisos_entity> getAttributesById(@PathVariable("id") int id){
        return this.permisos_service.getpermisosById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.permisos_service.deletepermisosById(id);
        if (ok) {
            return "Se ha eliminado el permisos con el Id: " + id;
        } else {
            return "Algo ha salido mal, el permisos no ha sido eliminado";
        }
    }
}
