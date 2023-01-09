package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="f_categoria")
public class categoria_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_categoria;
    @Getter
    @Setter
    @Column(length = 128)
    private String nombre_cat;

    @OneToMany(mappedBy = "categoria")
    @Setter@Getter
    @JsonIgnore
    private List<subcategoria_entity> subcat;

}
