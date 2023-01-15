package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name="pedido")
public class pedido_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idpedido;

    @Getter
    @Setter
    private String referenciacobro;

    @Getter
    @Setter
    private String latitud;

    @Getter
    @Setter
    private String longitud;

    @Getter
    @Setter
    private Integer personaid;

    @Getter
    @Setter
    @JsonFormat(pattern="yyyy-MM-dd HH:mm")
    private Timestamp fecha;

    @Getter
    @Setter
    private Double costo_envio;

    @Getter
    @Setter
    private Double monto;

    @Getter
    @Setter
    private Integer tipopagoid;

    @Getter
    @Setter
    private String direccion_envio;

    @Getter
    @Setter
    private String status;

    @Getter
    @Setter
    private String imagen;

    @ManyToOne
    @JoinColumn (name = "tipopagoid", insertable = false, updatable = false)
    private tipodepago_entity tipag;

    @ManyToOne
    @JoinColumn (name = "personaid", insertable = false, updatable = false)
    private persona_entity pers;


    @OneToMany(mappedBy = "pro")
    @Setter@Getter
    @JsonIgnore
    private List<detalle_pedido_entity> ped;

    @OneToMany(mappedBy = "pedi")
    @Setter@Getter
    @JsonIgnore
    private List<reembolso_entity> pedi;





}
