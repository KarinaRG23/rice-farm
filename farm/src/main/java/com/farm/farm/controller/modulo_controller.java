package com.farm.farm.controller;

import com.farm.farm.entity.modulo_entity;
import com.farm.farm.service.modulo_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Modulo")
public class modulo_controller {

    @Autowired
    modulo_service modulo_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllmodulo(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), modulo_service.getAllmodulo()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savemodulo(@RequestBody modulo_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(modulo_service.savemodulo(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<modulo_entity> getAttributesById(@PathVariable("id") int id){
        return this.modulo_service.getmoduloById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.modulo_service.deletemoduloById(id);
        if (ok) {
            return "Se ha eliminado el modulo con el Id: " + id;
        } else {
            return "Algo ha salido mal, el modulo no ha sido eliminado";
        }
    }

}
