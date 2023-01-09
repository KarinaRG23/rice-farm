package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
public class categoria_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idcategoria;
    @Getter
    @Setter
<<<<<<< HEAD
    private String nombre;
    @Getter
    @Setter
    private String descripcion;
    @Getter
    @Setter
    private String portada;
    @Getter
    @Setter
    private Timestamp datacreated;
    @Getter
    @Setter
    private String ruta;
    @Getter
    @Setter
    private Integer status;
=======
    @Column(length = 128)
    private String nombre_cat;
>>>>>>> 460330df7bee96b5fb3d9b1ee178feb16635d53f

    @OneToMany(mappedBy = "cat")
    @Setter@Getter
    @JsonIgnore
    private List<producto_entity> prod;


}
