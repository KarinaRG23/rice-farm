package com.farm.farm.entity;

import com.farm.farm.helper.Hashing;
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
    private String identificacion;

    @Getter
    @Setter
    private String nombres;

    @Getter
    @Setter
    private String apellidos;

    @Getter
    @Setter
    private Integer telefono;

    @Getter
    @Setter
    @Column(unique = true, length = 128)
    private String email;

    @Column(length = 128)
    private String password;

    @JsonIgnore
    public String getPassword(){
        return password;
    }


    @Column(length = 128)
    public String salt;


    public void setPassword(String passwordToHash){
        if (passwordToHash != null && !passwordToHash.isEmpty()) {
            Hashing.HashingResult hashingResult = Hashing.createHash(passwordToHash);
            password = hashingResult.getHash();
            salt = hashingResult.getSalt();
        }
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    @JsonIgnore
    public String getSalt() {
        return salt;
    }



    @Getter
    @Setter
    private String nit;
    @Getter
    @Setter
    private String nombrefiscal;
    @Getter
    @Setter
    private String direccionfiscal;
    @Getter
    @Setter
    private String token;

    @Getter
    @Setter
    private Integer rolid;

    @Getter
    @Setter
    private Timestamp datecreated;

    @Getter
    @Setter
    private Integer status;

    @OneToMany(mappedBy = "pers")
    @Setter@Getter
    @JsonIgnore
    private List<pedido_entity> ped;

    @ManyToOne
    @JoinColumn (name = "rolid", insertable = false, updatable = false)
    private rol_entity rol;

}
