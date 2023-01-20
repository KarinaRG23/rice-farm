package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="venta")
public class VentaEntity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_venta;

    @Getter
    @Setter
    private String fecha_venta;
    @Getter
    @Setter
    private String descripcion;
    @Getter
    @Setter
    private String cliente;
    @Getter
    @Setter
    private String direccion;
    @Getter
    @Setter
    private String telefono;

    @Getter
    @Setter
    private String monto;




}
