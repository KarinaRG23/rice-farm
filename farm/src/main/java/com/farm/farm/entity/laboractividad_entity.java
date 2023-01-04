package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class laboractividad_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_labor;

    @Getter
    @Setter
    private String nombre_labor;

    @Getter
    @Setter
    private String descripcion;

    @Getter
    @Setter
    private Integer DNI;

}
