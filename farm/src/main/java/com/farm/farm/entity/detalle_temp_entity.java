package com.farm.farm.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.id.IntegralDataTypeHolder;

import javax.persistence.*;

@Entity
@Table(name="detalle_temp")
public class detalle_temp_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id;

    @Getter
    @Setter
    private String personaid;

    @Getter
    @Setter
    private Integer productoid;

    @Getter
    @Setter
    private Double precio;

    @Getter
    @Setter
    private Integer cantidad;

    @Getter
    @Setter
    private String transccionid;

    @ManyToOne
    @JoinColumn (name = "productoid", insertable = false, updatable = false)
    private producto_entity pro;


}
