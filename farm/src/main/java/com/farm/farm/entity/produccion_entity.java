package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class produccion_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_produccion;

    @Getter
    @Setter
    private String fecha_inicio;

    @Getter
    @Setter
    private String fecha_culminacion;

    @Getter
    @Setter
    private String presupuesto;

    @Getter
    @Setter
    private Integer id_lote;

    @Getter
    @Setter
    private Integer id_labor;

    @Getter
    @Setter
    private Integer dni;

    @Getter
    @Setter
    private Integer id_insumo;

    @Getter
    @Setter
    private String estado;

}
