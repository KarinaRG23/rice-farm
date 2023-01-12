package com.farm.farm.controller;


import com.farm.farm.security.JWTUtil;
import com.farm.farm.service.FarmUserDetailService;
import com.farm.farm.service.PersonService;
import com.farm.farm.utilities.AuthenticationRequest;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
public class LoginController {

    PersonService personService;

    JWTUtil jwtUtil;

    FarmUserDetailService farmUserDetailService;

    AuthenticationManager authenticationManager;

    @Autowired
    public LoginController(PersonService personService,
                           JWTUtil jwtUtil,
                           FarmUserDetailService farmUserDetailService,
                           AuthenticationManager authenticationManager){
        this.personService = personService;
        this.jwtUtil = jwtUtil;
        this.farmUserDetailService = farmUserDetailService;
        this.authenticationManager = authenticationManager;
    }

    @PostMapping("/login")
    public ResponseEntity<JsonResponseBody>loginUser(@RequestBody AuthenticationRequest login){
        try {
            if(personService.isPasswordValid(login.getEmail(), login.getPassword())){
                String jwt = jwtUtil.generateToken(login.getEmail());
                return ResponseEntity.status(HttpStatus.OK)
                        .body(new JsonResponseBody(HttpStatus.OK.value(), "ok",
                                jwt));
            }else{
                return ResponseEntity.status(HttpStatus.FORBIDDEN)
                        .body(new JsonResponseBody(HttpStatus.FORBIDDEN.value(), "FORBIDDEN",
                                "Incorrect password or email"));
            }
        } catch (BadCredentialsException badCredentialsException) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(new JsonResponseBody(HttpStatus.FORBIDDEN.value(), "ERROR",
                            "Credenciales incorrectas"));
        }
    }

}
