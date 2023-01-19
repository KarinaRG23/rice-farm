package com.farm.farm.controller;

import com.farm.farm.entity.labores_entity;
import com.farm.farm.service.labores_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("Labores")
public class labores_controller {

    @Autowired
    labores_service labores_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAlllabores(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), labores_service.getAlllabores()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savelabores(@RequestBody labores_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(labores_service.savelabores(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
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
