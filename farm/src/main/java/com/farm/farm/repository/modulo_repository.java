package com.farm.farm.repository;

import com.farm.farm.entity.modulo_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface modulo_repository  extends CrudRepository<modulo_entity, Integer> {
}
