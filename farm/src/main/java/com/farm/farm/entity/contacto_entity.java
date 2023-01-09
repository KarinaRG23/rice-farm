package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
public class contacto_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id;
    @Getter
    @Setter
    private String nombre;
    @Getter
    @Setter
    private String email;
    @Getter
    @Setter
    private String mensaje;
    @Getter
    @Setter
    private String ip;
    @Getter
    @Setter
    private String dispocitivo;
    @Getter
    @Setter
    private String useragent;

    @Getter
    @Setter
    private Timestamp datacreated;



}
