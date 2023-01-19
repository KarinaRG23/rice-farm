package com.farm.farm.controller;

import com.farm.farm.entity.permisos_entity;
import com.farm.farm.service.permisos_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Permisos")
public class permisos_controller {

    @Autowired
    permisos_service permisos_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllpermisos(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), permisos_service.getAllpermisos()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savepermisos(@RequestBody permisos_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(permisos_service.savepermisos(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<permisos_entity> getAttributesById(@PathVariable("id") int id){
        return this.permisos_service.getpermisosById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.permisos_service.deletepermisosById(id);
        if (ok) {
            return "Se ha eliminado el permisos con el Id: " + id;
        } else {
            return "Algo ha salido mal, el permisos no ha sido eliminado";
        }
    }
}
