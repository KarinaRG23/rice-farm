package com.farm.farm.controller;


import com.farm.farm.entity.persona_entity;
import com.farm.farm.service.PersonService;
import com.farm.farm.utilities.JsonResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/person")
public class PersonController {

    PersonService personService;

    @Autowired
    public PersonController(PersonService personService){
        this.personService = personService;
    }

    @GetMapping("")
    public ResponseEntity<JsonResponseBody>getAllUsers(){
        return ResponseEntity.status(HttpStatus.OK)
                .body(new JsonResponseBody(HttpStatus.OK.value(), personService.getAllPersons()));
    }

    @PostMapping("")
    public ResponseEntity<JsonResponseBody> savePerson(@RequestBody persona_entity person){
        try {
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(), personService.save(person)));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(),
                            "Error guardando creando persona"));
        }
    }

    @GetMapping("/admin")
    public ResponseEntity<JsonResponseBody> getAdministrators(){
        try {
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new JsonResponseBody(HttpStatus.OK.value(),personService.getAllAdministrators()));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new JsonResponseBody(HttpStatus.BAD_REQUEST.value(), "no hay administradores"));
        }
    }
}
