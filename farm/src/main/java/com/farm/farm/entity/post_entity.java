package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
public class post_entity {
    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idpost;
    @Getter
    @Setter
    private String titulo;
    @Getter
    @Setter
    private String contenido;
    @Getter
    @Setter
    private String portada;
    @Getter
    @Setter
    private Timestamp datecreate;
    @Getter
    @Setter
    private String ruta;
    @Getter
    @Setter
    private Integer status;

}
