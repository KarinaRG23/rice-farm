package com.farm.farm.controller;

import com.farm.farm.entity.post_entity;
import com.farm.farm.service.post_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Post")
public class post_controller {

    @Autowired
    post_service post_service;

    @GetMapping()
    public ArrayList<post_entity> getAllpost(){

        return post_service.getAllpost();
    }
    @PostMapping
    public post_entity savepost(@RequestBody post_entity name) {
        return this.post_service.savepost(name);
    }
    @GetMapping(path="/{id}")
    public Optional<post_entity> getAttributesById(@PathVariable("id") int id){
        return this.post_service.getpostById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.post_service.deletepostById(id);
        if (ok) {
            return "Se ha eliminado el post con el Id: " + id;
        } else {
            return "Algo ha salido mal, el post no ha sido eliminado";
        }
    }

}
