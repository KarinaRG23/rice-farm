package com.farm.farm.controller;


import com.farm.farm.security.JWTUtil;
import com.farm.farm.service.PedidoService;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/pedido")
public class PedidoController {

    @Autowired
    PedidoService pedidoService;

    @Autowired
    JWTUtil  jwtUtil;


    @GetMapping()
    public ResponseEntity<JsonResponseBody>getPedidos(@RequestHeader("Authorization") String token){
        if (token.isEmpty() || token.isBlank()){
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(new JsonResponseBody(HttpStatus.FORBIDDEN.value(), "Acceso no autorizado"));
        }
        String jwt = token.substring(7);
        String email = jwtUtil.extractUsername(jwt);
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), pedidoService.getPedidosByEmail(email)));
    }
}
