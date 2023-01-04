package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class prodfac_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_pro_fac;

    @Getter
    @Setter
    private Integer id_lote;

    @Getter
    @Setter
    private String cantidad;
    @Getter
    @Setter
    private String descripcion;

    @Getter
    @Setter
    private String precio_p;
    @Getter
    @Setter
    private String total_p;

    @Getter
    @Setter
    private Integer id_venta;

}
