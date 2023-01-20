package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="producciones")
public class produccion_entity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    @Column(unique = true)
    private Integer codigo;

    @Getter
    @Setter
    private String numero;
    @Getter
    @Setter
    private Date f_siembra;
    @Getter
    @Setter
    private Date f_culminacion;
    @Getter
    @Setter
    private Integer loteid;
    @Getter
    @Setter
    private String estado;

    @Getter
    @Setter
    private String sacas;

    @Getter
    @Setter
    private String tipodearroz;

    @ManyToOne
    @JoinColumn (name = "loteid", insertable = false, updatable = false)
    private lote_entity lote;




}
