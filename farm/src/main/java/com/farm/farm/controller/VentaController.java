package com.farm.farm.controller;

import com.farm.farm.entity.VentaEntity;
import com.farm.farm.service.VentaService;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/venta")
public class VentaController {

    @Autowired
    VentaService VentaService;

    @GetMapping()
    public ResponseEntity<JsonResponseBody> getAllVenta(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), VentaService.getAllVenta()));
    }
    @PostMapping
    public ResponseEntity<JsonResponseBody> saveVenta(@RequestBody VentaEntity data){
        try {
            ArrayList<Object> response = new ArrayList<>();
            response.add(VentaService.saveVenta(data));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),response ));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error"));
        }
    }
    @GetMapping(path="/{id}")
    public ResponseEntity<JsonResponseBody> getVentaById(@PathVariable("id") int id){
        ArrayList<Object> response = new ArrayList<>();
        response.add(VentaService.getVentaById(id));
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(),response));
    }
    @DeleteMapping("/{id}")
    public String deleteVentaById(@PathVariable("id") int id) {
        boolean ok = this.VentaService.deleteVentaById(id);
        if (ok) {
            return "Se ha eliminado el Venta con el Id: " + id;
        } else {
            return "Algo ha salido mal, el Venta no ha sido eliminado";
        }
    }
}
