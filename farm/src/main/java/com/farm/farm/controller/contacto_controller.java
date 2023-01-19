package com.farm.farm.controller;


import com.farm.farm.entity.contacto_entity;
import com.farm.farm.entity.contacto_entity;
import com.farm.farm.service.contacto_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/contacto")
public class contacto_controller {

    @Autowired
    contacto_service contacto_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllcontacto(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), contacto_service.getAllcontacto()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savecontacto(@RequestBody contacto_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(contacto_service.savecontacto(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<contacto_entity> getAttributesById(@PathVariable("id") int id){
        return this.contacto_service.getcontactoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.contacto_service.deletecontactoById(id);
        if (ok) {
            return "Se ha eliminado el contacto con el Id: " + id;
        } else {
            return "Algo ha salido mal, el contacto no ha sido eliminado";
        }
    }
}
