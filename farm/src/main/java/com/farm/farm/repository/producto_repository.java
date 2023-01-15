package com.farm.farm.repository;

import com.farm.farm.entity.producto_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface producto_repository extends CrudRepository<producto_entity, Integer> {
}
