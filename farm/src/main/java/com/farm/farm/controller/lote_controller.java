package com.farm.farm.controller;

import com.farm.farm.entity.lote_entity;
import com.farm.farm.service.lote_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/lote")
public class lote_controller {

    @Autowired
    lote_service lote_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAlllote(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), lote_service.getAlllote()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savelote(@RequestBody lote_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(lote_service.savelote(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<lote_entity> getAttributesById(@PathVariable("id") int id){
        return this.lote_service.getloteById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.lote_service.deleteloteById(id);
        if (ok) {
            return "Se ha eliminado el lote con el Id: " + id;
        } else {
            return "Algo ha salido mal, el lote no ha sido eliminado";
        }
    }
}
