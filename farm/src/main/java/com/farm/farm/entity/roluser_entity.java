package com.farm.farm.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name ="f_rol_usuario")
public class roluser_entity {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id_rol_user;

    @Getter
    @Setter
    private String nombre;

    @OneToMany(mappedBy = "rol")
    @Setter@Getter
    @JsonIgnore
    private List<user_entity> user;
}
