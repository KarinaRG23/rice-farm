package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="f_lote")
public class lote_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_lote;

    @Getter
    @Setter
    private String nombre_lote;
    @Getter
    @Setter
    private String recoleccion_arroz;
    //@Getter
    //@Setter
    //private Integer id_produccion;
    @Getter
    @Setter
    private Integer dni;
    @Getter
    @Setter
    private Integer id_tipo_etapa;

    @OneToMany(mappedBy = "lote")
    @Setter@Getter
    @JsonIgnore
    private List<prodfac_entity> procfact;

    @ManyToOne
    @JoinColumn (name = "id_tipo_etapa", insertable = false, updatable = false)
    private tipoetapas_entity tipo;

    @OneToMany(mappedBy = "lote")
    @Setter@Getter
    @JsonIgnore
    private List<produccion_entity> produc;

    @ManyToOne
    @JoinColumn (name = "dni", insertable = false, updatable = false)
    private user_entity u_dni;




}
