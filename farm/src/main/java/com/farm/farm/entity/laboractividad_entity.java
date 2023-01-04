package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="f_labor_actividad")
public class laboractividad_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_labor;

    @Getter
    @Setter
    private String nombre_labor;

    @Getter
    @Setter
    private String descripcion;

    @Getter
    @Setter
    private Integer dni;

    @OneToMany(mappedBy = "labor")
    @Setter@Getter
    @JsonIgnore
    private List<produccion_entity> labor;

    @ManyToOne
    @JoinColumn (name = "dni", insertable = false, updatable = false)
    private user_entity user;



}
