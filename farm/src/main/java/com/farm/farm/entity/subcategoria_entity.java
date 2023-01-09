package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="f_subcategoria")
public class subcategoria_entity {
    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_sub_categoria;

    @Getter
    @Setter
    private String nombre_sub_cat;

    @Getter
    @Setter
    private Integer id_categoria;

    @ManyToOne
    @JoinColumn (name = "id_categoria", insertable = false, updatable = false)
    private categoria_entity categoria;

    @OneToMany(mappedBy = "subcate")
    @Setter@Getter
    @JsonIgnore
    private List<insumos_entity> insumo;
}
