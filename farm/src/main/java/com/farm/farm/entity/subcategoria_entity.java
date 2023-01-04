package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class subcategoria_entity {
    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_sub_categoria;

    @Getter
    @Setter
    private String nombre_sub_cat;

    @Getter
    @Setter
    private Integer id_categoria;
}
