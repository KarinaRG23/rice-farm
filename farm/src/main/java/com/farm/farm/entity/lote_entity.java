package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="lotes")
public class lote_entity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    @Column(unique = true)
    private Integer codigo;

    @Getter
    @Setter
    private String numero_lote;
    @Getter
    @Setter
    private String area;

    @Getter
    @Setter
    private String etapa;

    @Getter
    @Setter
    private Double inversion;

    @Getter
    @Setter
    private Double costo;

    @Getter
    @Setter
    private Double Total;

    @OneToMany(mappedBy = "lote")
    @Setter@Getter
    @JsonIgnore
    private List<produccion_entity> lot;



}
