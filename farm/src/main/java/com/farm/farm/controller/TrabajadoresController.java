package com.farm.farm.controller;

import com.farm.farm.entity.TrabajadoresEntity;
import com.farm.farm.service.TrabajadoresService;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/Trabajadores")
public class TrabajadoresController {

    @Autowired
    TrabajadoresService TrabajadoresService;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllTrabajadores(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), TrabajadoresService.getAllTrabajadores()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> saveTrabajadores(@RequestBody TrabajadoresEntity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(TrabajadoresService.saveTrabajadores(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public Optional<TrabajadoresEntity> getTrabajadoresById(@PathVariable("id") int id){
        return this.TrabajadoresService.getTrabajadoresById(id);
    }
    @GetMapping("/delete/{id}")
    public ResponseEntity<JsonResponseBody> deleteTrabajadoresById(@PathVariable("id") int id) {
        TrabajadoresService.deleteTrabajadoresById(id);
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(),"trabajador borrado" ));
    }
}
