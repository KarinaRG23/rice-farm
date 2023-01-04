package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class user_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer dni;

    @Getter
    @Setter
    private String nombre_trab;
    @Getter
    @Setter
    private String telefono;
    @Getter
    @Setter
    private String correo;
    @Getter
    @Setter
    private String salario;
    @Getter
    @Setter
    private String foto;
    @Getter
    @Setter
    private String fech_regis_trab;
    @Getter
    @Setter
    private Integer id_rol_user;


}
