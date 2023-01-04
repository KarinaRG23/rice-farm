package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="f_tipo_etapa")
public class tipoetapas_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_tipo_etapa;

    @Getter
    @Setter
    private String nom_etapa;

    @Getter
    @Setter
    private String fecha_inicio;

    @Getter
    @Setter
    private String fecha_finalizacion;

    @OneToMany(mappedBy = "tipo")
    @Setter@Getter
    @JsonIgnore
    private List<lote_entity> lote;

}
