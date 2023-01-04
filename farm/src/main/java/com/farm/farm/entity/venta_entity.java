package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class venta_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_venta;

    @Getter
    @Setter
    private String fecha_venta;
    @Getter
    @Setter
    private String cliente;
    @Getter
    @Setter
    private String direccion;
    @Getter
    @Setter
    private String telefono;

}
