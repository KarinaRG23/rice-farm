package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="rol")
public class rol_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idrol;

    @Getter
    @Setter
    private String nombrerol;

    @Getter
    @Setter
    private String descripcion;

    @Getter
    @Setter
    private Integer status;

    @OneToMany(mappedBy = "rol")
    @Setter@Getter
    @JsonIgnore
    private List<persona_entity> per;

    @OneToMany(mappedBy = "rol")
    @Setter@Getter
    @JsonIgnore
    private List<permisos_entity> rol;

}
