package com.farm.farm.repository;

import com.farm.farm.entity.produccion_entity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface produccion_repository extends CrudRepository<produccion_entity,Integer> {

    @Query(value = "SELECT producciones.estado, producciones.f_culminacion, " +
            "producciones.f_siembra, lotes.nombre as lote, " +
            "producciones.numero " +
            "from producciones, lotes where producciones.loteid=lotes.codigo",nativeQuery = true)
    List<List> produccion();





}
