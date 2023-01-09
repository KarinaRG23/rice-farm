package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
public class tipodepago_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idtipopago;


    @Getter
    @Setter
    private String tipopago;

    @Getter
    @Setter
    private Integer status;

    @OneToMany(mappedBy = "tipag")
    @Setter@Getter
    @JsonIgnore
    private List<pedido_entity> ped;

}
