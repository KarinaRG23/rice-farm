package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name ="f_produccion")
public class produccion_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_produccion;

    @Getter
    @Setter
    private String fecha_inicio;

    @Getter
    @Setter
    private String fecha_culminacion;

    @Getter
    @Setter
    private String presupuesto;

    @Getter
    @Setter
    private Integer id_lote;

    @Getter
    @Setter
    private Integer id_labor;

    @Getter
    @Setter
    private Integer dni;

    @Getter
    @Setter
    private Integer id_insumo;

    @Getter
    @Setter
    private String estado;



    @ManyToOne
    @JoinColumn (name = "id_insumos", insertable = false, updatable = false)
    private insumos_entity insumos;
    @ManyToOne
    @JoinColumn (name = "dni", insertable = false, updatable = false)
    private user_entity u_dni;
    @ManyToOne
    @JoinColumn (name = "id_labor", insertable = false, updatable = false)
    private laboractividad_entity labor;
    @ManyToOne
    @JoinColumn (name = "id_lote", insertable = false, updatable = false)
    private lote_entity lote;
}
