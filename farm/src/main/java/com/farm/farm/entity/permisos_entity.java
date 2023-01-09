package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="permisos")
public class permisos_entity {
    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idpermiso;

    @Getter
    @Setter
    private Integer rolid;

    @Getter
    @Setter
    private Integer moduloid;

    @Getter
    @Setter
    private Integer r;

    @Getter
    @Setter
    private Integer w;

    @Getter
    @Setter
    private Integer u;

    @Getter
    @Setter
    private Integer d;

    @ManyToOne
    @JoinColumn (name = "rolid", insertable = false, updatable = false)
    private rol_entity rol;

    @ManyToOne
    @JoinColumn (name = "moduloid", insertable = false, updatable = false)
    private modulo_entity modu;
}
