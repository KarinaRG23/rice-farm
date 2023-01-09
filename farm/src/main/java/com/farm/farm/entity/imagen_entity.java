package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="imagen")
public class imagen_entity {
    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id;

    @Getter
    @Setter
    private Integer productoid;

    @Getter
    @Setter
    private String img;

    @ManyToOne
    @JoinColumn (name = "productoid", insertable = false, updatable = false)
    private producto_entity prod;




}
