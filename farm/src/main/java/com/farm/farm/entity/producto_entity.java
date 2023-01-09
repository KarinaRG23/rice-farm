package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name="producto")
public class producto_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idproducto;

    @Getter
    @Setter
    private Integer categoriaid;

    @Getter
    @Setter
    private String codigo;

    @Getter
    @Setter
    private String nombre;

    @Getter
    @Setter
    private String descripcion;

    @Getter
    @Setter
    private Double precio;

    @Getter
    @Setter
    private Integer stock;

    @Getter
    @Setter
    private String imagen;

    @Getter
    @Setter
    private Timestamp datecreated;

    @Getter
    @Setter
    private String ruta;

    @Getter
    @Setter
    private Integer Status;

    @ManyToOne
    @JoinColumn (name = "categoriaid", insertable = false, updatable = false)
    private categoria_entity cat;

    @OneToMany(mappedBy = "prod")
    @Setter@Getter
    @JsonIgnore
    private List<imagen_entity> ima;

    @OneToMany(mappedBy = "pro")
    @Setter@Getter
    @JsonIgnore
    private List<detalle_pedido_entity> detped;

    @OneToMany(mappedBy = "pro")
    @Setter@Getter
    @JsonIgnore
    private List<detalle_temp_entity> detemp;



}
