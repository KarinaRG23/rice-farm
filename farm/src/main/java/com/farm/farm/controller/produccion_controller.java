package com.farm.farm.controller;

import com.farm.farm.entity.produccion_entity;
import com.farm.farm.service.produccion_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Optional;

@RestController
@RequestMapping("/Produccion")
public class produccion_controller {

    @Autowired
    produccion_service produccion_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllproduccion(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), produccion_service.getAllproduccion()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> saveproduccion(@RequestBody produccion_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(produccion_service.saveproduccion(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<produccion_entity> getprodeuccionById(@PathVariable("id") int id){
        return this.produccion_service.getproduccionById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteproduccionById(@PathVariable("id") int id) {
        boolean ok = this.produccion_service.deleteproduccionById(id);
        if (ok) {
            return "Se ha eliminado el produccion con el Id: " + id;
        } else {
            return "Algo ha salido mal, el produccion no ha sido eliminado";
        }
    }
}
