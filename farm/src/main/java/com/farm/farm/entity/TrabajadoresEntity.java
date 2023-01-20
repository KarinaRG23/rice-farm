package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="trabajadores")
public class TrabajadoresEntity {


    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer codigo;

    @Getter
    @Setter
    private String nombres;
    @Getter
    @Setter
    private String dni;
    @Getter
    @Setter
    private String telefono;
    @Getter
    @Setter
    private String direccion;
    @Getter
    @Setter
    private String email;
    @Getter
    @Setter
    private String salario;

    @Getter
    @Setter
    @Column(columnDefinition = "integer default 1")
    private Integer status;
}
