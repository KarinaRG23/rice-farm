package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
public class detalle_pedido_entity {
    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id;
    @Getter
    @Setter
    private Integer pedidoid;
    @Getter
    @Setter
    private Integer productoid;
    @Getter
    @Setter
    private Double precio;
    @Getter
    @Setter
    private Integer cantidad;

    @ManyToOne
    @JoinColumn (name = "pedidoid", insertable = false, updatable = false)
    private pedido_entity ped;

    @ManyToOne
    @JoinColumn (name = "productoid", insertable = false, updatable = false)
    private producto_entity pro;

}
