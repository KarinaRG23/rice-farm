package com.farm.farm.controller;

import com.farm.farm.entity.insumos_entity;
import com.farm.farm.service.insumos_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/insumos")
public class insumos_controller {

    @Autowired
    insumos_service insumos_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllinsumos(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), insumos_service.getAllinsumos()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> saveinsumos(@RequestBody insumos_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(insumos_service.saveinsumos(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<insumos_entity> getAttributesById(@PathVariable("id") int id){
        return this.insumos_service.getinsumosById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.insumos_service.deleteinsumosById(id);
        if (ok) {
            return "Se ha eliminado el insumos con el Id: " + id;
        } else {
            return "Algo ha salido mal, el insumos no ha sido eliminado";
        }
    }

}
