package com.farm.farm.controller;

import com.farm.farm.entity.producto_entity;
import com.farm.farm.service.producto_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Producto")
public class producto_controller {

    @Autowired
    producto_service producto_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllproducto(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), producto_service.getAllproducto()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> saveproducto(@RequestBody producto_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(producto_service.saveproducto(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<producto_entity> getAttributesById(@PathVariable("id") int id){
        return this.producto_service.getproductoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.producto_service.deleteproductoById(id);
        if (ok) {
            return "Se ha eliminado el producto con el Id: " + id;
        } else {
            return "Algo ha salido mal, el producto no ha sido eliminado";
        }
    }

}
