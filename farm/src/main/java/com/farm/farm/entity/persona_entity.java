package com.farm.farm.entity;

import com.farm.farm.helper.Hashing;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name="persona")
public class persona_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer idpersona;

    @Getter
    @Setter
    @Column(unique = true)
    private String identificacion;

    @Getter
    @Setter
    private String nombres;

    @Getter
    @Setter
    private String apellidos;

    @Getter
    @Setter
    @Column(length = 20)
    private String telefono;

    @Getter
    @Setter
    @Column(unique = true, length = 128)
    private String email;

    @Getter
    @Setter
    @JsonIgnore
    @Column(length = 128)
    private String password;


    @Setter
    @Getter
    @Column(length = 128)
    public String salt;


    @Getter
    @Setter
    @JsonIgnore
    private String nit;
    @Getter
    @Setter
    private String nombrefiscal;
    @Getter
    @Setter
    private String direccionfiscal;
    @Getter
    @Setter
    @JsonIgnore
    private String token;

    @Getter
    @Setter
    private Integer rolid;

    @Getter
    @Setter
    @Column(columnDefinition = "timestamp")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm")
    @JsonIgnore
    private Timestamp datecreated;

    @Getter
    @Setter
    @Column(columnDefinition = "integer default 1")
    private Integer status;

    @OneToMany(mappedBy = "pers")
    @Setter@Getter
    @JsonIgnore
    private List<pedido_entity> ped;

    @ManyToOne
    @JoinColumn (name = "rolid", insertable = false, updatable = false)
    private rol_entity rol;

}
