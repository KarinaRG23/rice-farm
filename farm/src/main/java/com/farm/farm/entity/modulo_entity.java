package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="modulo")
public class modulo_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idmodulo;

    @Getter
    @Setter
    private String titulo;

    @Getter
    @Setter
    private String descripcion;

    @Getter
    @Setter
    @Column(columnDefinition="integer default 1")
    private Integer status;

    @OneToMany(mappedBy = "modu")
    @Setter@Getter
    @JsonIgnore
    private List<permisos_entity> perm;

}
