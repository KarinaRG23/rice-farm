package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name ="f_categoria")
public class categoria_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_categoria;
    @Getter
    @Setter
    private String nombre_cat;

}
