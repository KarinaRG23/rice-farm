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
    @DeleteMapping("/{id}")
    public String deleteTrabajadoresById(@PathVariable("id") int id) {
        boolean ok = this.TrabajadoresService.deleteTrabajadoresById(id);
        if (ok) {
            return "Se ha eliminado el Trabajadores con el Id: " + id;
        } else {
            return "Algo ha salido mal, el Trabajadores no ha sido eliminado";
        }
    }
}
