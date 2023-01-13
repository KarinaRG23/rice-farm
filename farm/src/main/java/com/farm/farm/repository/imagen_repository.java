package com.farm.farm.repository;

import com.farm.farm.entity.imagen_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface imagen_repository extends CrudRepository<imagen_entity,Integer> {
}
