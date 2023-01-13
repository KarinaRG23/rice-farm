package com.farm.farm.controller;

import com.farm.farm.entity.rol_entity;
import com.farm.farm.service.rol_service;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rol")
public class rol_controller {
    @Autowired
    rol_service  rol_service;

    @GetMapping("")
    public ResponseEntity<JsonResponseBody> getAllrol(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), rol_service.getAllrol()));
    }

    @PostMapping("")
    public ResponseEntity<JsonResponseBody> saverol(@RequestBody rol_entity rol){
        try {
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(), rol_service.saverol(rol)));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
}
