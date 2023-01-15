package com.farm.farm.repository;

import com.farm.farm.entity.insumos_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface insumos_repository extends CrudRepository<insumos_entity,Integer> {
}
