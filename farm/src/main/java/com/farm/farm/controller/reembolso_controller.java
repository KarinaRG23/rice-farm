package com.farm.farm.controller;

import com.farm.farm.entity.reembolso_entity;
import com.farm.farm.service.reembolso_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Reembolso")
public class reembolso_controller {

    @Autowired
    reembolso_service reembolso_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllreembolso(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), reembolso_service.getAllreembolso()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savereembolso(@RequestBody reembolso_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(reembolso_service.savereembolso(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<reembolso_entity> getAttributesById(@PathVariable("id") int id){
        return this.reembolso_service.getreembolsoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.reembolso_service.deletereembolsoById(id);
        if (ok) {
            return "Se ha eliminado el reembolso con el Id: " + id;
        } else {
            return "Algo ha salido mal, el reembolso no ha sido eliminado";
        }
    }
}
