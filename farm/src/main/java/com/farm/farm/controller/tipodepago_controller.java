package com.farm.farm.controller;

import com.farm.farm.entity.tipodepago_entity;
import com.farm.farm.service.tipodepago_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Tipodepago")
public class tipodepago_controller {

    @Autowired
    tipodepago_service tipodepago_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAlltipodepago(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), tipodepago_service.getAlltipodepago()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savetipodepago(@RequestBody tipodepago_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(tipodepago_service.savetipodepago(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<tipodepago_entity> getAttributesById(@PathVariable("id") int id){
        return this.tipodepago_service.gettipodepagoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.tipodepago_service.deletetipodepagoById(id);
        if (ok) {
            return "Se ha eliminado el tipodepago con el Id: " + id;
        } else {
            return "Algo ha salido mal, el tipodepago no ha sido eliminado";
        }
    }

}
