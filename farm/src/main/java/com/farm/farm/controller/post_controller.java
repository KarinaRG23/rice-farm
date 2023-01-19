package com.farm.farm.controller;

import com.farm.farm.entity.post_entity;
import com.farm.farm.service.post_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Post")
public class post_controller {

    @Autowired
    post_service post_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllpost(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), post_service.getAllpost()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savepost(@RequestBody post_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(post_service.savepost(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
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
