package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="f_usuario")
public class user_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer dni;

    @Getter
    @Setter
    private String nombre_trab;
    @Getter
    @Setter
    private String telefono;
    @Getter
    @Setter
    private String correo;
    @Getter
    @Setter
    private String salario;
    @Getter
    @Setter
    private String foto;
    @Getter
    @Setter
    private String fech_regis_trab;
    @Getter
    @Setter
    private Integer id_rol_user;

    @OneToMany(mappedBy = "u_dni")
    @Setter@Getter
    @JsonIgnore
    private List<produccion_entity> u_dni;

    @OneToMany(mappedBy = "u_dni")
    @Setter@Getter
    @JsonIgnore
    private List<lote_entity> user;

    @ManyToOne
    @JoinColumn (name = "id_rol_user", insertable = false, updatable = false)
    private roluser_entity rol;

    @OneToMany(mappedBy = "user")
    @Setter@Getter
    @JsonIgnore
    private List<laboractividad_entity> labor;




}
