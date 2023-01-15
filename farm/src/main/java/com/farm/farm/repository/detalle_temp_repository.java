package com.farm.farm.repository;

import com.farm.farm.entity.detalle_temp_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface detalle_temp_repository extends CrudRepository<detalle_temp_entity,Integer> {
}
