package com.farm.farm.controller;

import com.farm.farm.entity.detalle_pedido_entity;
import com.farm.farm.entity.detalle_pedido_entity;
import com.farm.farm.service.detalle_pedido_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/DetallePedido")
public class detalle_pedido_controller {
    @Autowired
    detalle_pedido_service detalle_pedido_service;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAlldetalle_pedido(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), detalle_pedido_service.getAlldetalle_pedido()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> savedetalle_pedido(@RequestBody detalle_pedido_entity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(detalle_pedido_service.savedetalle_pedido(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<detalle_pedido_entity> getAttributesById(@PathVariable("id") int id){
        return this.detalle_pedido_service.getdetalle_pedidoById(id);
    }
    @DeleteMapping("/{id}")
    public String deleteAttributeById(@PathVariable("id") int id) {
        boolean ok = this.detalle_pedido_service.deletedetalle_pedidoById(id);
        if (ok) {
            return "Se ha eliminado el detalle_pedido con el Id: " + id;
        } else {
            return "Algo ha salido mal, el detalle_pedido no ha sido eliminado";
        }
    }

}
