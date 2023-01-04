package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class lote_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_lote;

    @Getter
    @Setter
    private String nombre_lote;
    @Getter
    @Setter
    private String recoleccion_arroz;
    @Getter
    @Setter
    private Integer id_produccion;
    @Getter
    @Setter
    private Integer dni;
    @Getter
    @Setter
    private Integer id_tipo_etapa;


}
