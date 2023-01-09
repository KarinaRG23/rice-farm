package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="f_insumos")
public class insumos_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_insumo;

    @Getter
    @Setter
    @Column(length = 128)
    private String nombre_insumo;
    @Getter
    @Setter
    @Column(length = 128)
    private String descripcion;
    @Getter
    @Setter
    @Column(length = 128)
    private String costo;
    @Getter
    @Setter
    @Column(length = 128)
    private String fecha_registro;
    @Getter
    @Setter
    @Column(length = 128)
    private String cantidad;

    @Getter
    @Setter
    @Column(length = 128)
    private Integer id_sub_cat;

    @ManyToOne
    @JoinColumn (name = "id_sub_cat", insertable = false, updatable = false)
    private subcategoria_entity subcate;

    @OneToMany(mappedBy = "insumos")
    @Setter@Getter
    @JsonIgnore
    private List<produccion_entity> peoduccion;
}
