package com.farm.farm.controller;

import com.farm.farm.entity.detalle_temp_entity;
import com.farm.farm.service.detalle_temp_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/DetalleTemp")
public class detalle_temp_controller {

    @Autowired
    detalle_temp_service detalle_temp_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAlldetalle_temp(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), detalle_temp_service.getAlldetalle_temp()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savedetalle_temp(@RequestBody detalle_temp_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(detalle_temp_service.savedetalle_temp(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<detalle_temp_entity> getAttributesById(@PathVariable("id") int id){
        return this.detalle_temp_service.getdetalle_tempById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.detalle_temp_service.deletedetalle_tempById(id);
        if (ok) {
            return "Se ha eliminado el detalle_temp con el Id: " + id;
        } else {
            return "Algo ha salido mal, el detalle_temp no ha sido eliminado";
        }
    }
}
