package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class tipoetapas_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_tipo_etapa;

    @Getter
    @Setter
    private String nom_etapa;

    @Getter
    @Setter
    private String fecha_inicio;

    @Getter
    @Setter
    private String fecha_finalizacion;

}
