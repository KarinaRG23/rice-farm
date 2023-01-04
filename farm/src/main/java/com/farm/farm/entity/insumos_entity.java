package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name ="f_insumos")
public class insumos_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_insumo;

    @Getter
    @Setter
    private String nombre_insumo;
    @Getter
    @Setter
    private String descripcion;
    @Getter
    @Setter
    private String costo;
    @Getter
    @Setter
    private String fecha_registro;
    @Getter
    @Setter
    private String cantidad;

    @Getter
    @Setter
    private Integer id_sub_cat;
}
