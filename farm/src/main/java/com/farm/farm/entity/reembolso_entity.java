package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="reembolso")
public class reembolso_entity {
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
    private String idtransaccion;
    @Getter
    @Setter
    private String datoreembolso;
    @Getter
    @Setter
    private String observacion;
    @Getter
    @Setter
    private String status;

    @ManyToOne
    @JoinColumn (name = "pedidoid", insertable = false, updatable = false)
    private pedido_entity pedi;




}
