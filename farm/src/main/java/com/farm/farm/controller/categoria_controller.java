package com.farm.farm.controller;

import com.farm.farm.entity.categoria_entity;
import com.farm.farm.entity.rol_entity;
import com.farm.farm.service.categoria_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/categoria")
public class categoria_controller {

    @Autowired
    categoria_service categoria_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllcat(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), categoria_service.getAllCategoria()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savecat(@RequestBody categoria_entity cat){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(categoria_service.saveCategoria(cat));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<categoria_entity> getAttributesById(@PathVariable("id") int id){
        return this.categoria_service.getCategoriaById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.categoria_service.deleteCategoriaById(id);
        if (ok) {
            return "Se ha eliminado el categoria con el Id: " + id;
        } else {
            return "Algo ha salido mal, el categoria no ha sido eliminado";
        }
    }


}
