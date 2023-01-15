package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="labores")
public class labores_entity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    @Column(unique = true)
    private Integer codigo;
    @Getter
    @Setter
    private String nombre;
    @Getter
    @Setter
    private String descripcion;
}
