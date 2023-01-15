package com.farm.farm.repository;

import com.farm.farm.entity.permisos_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface permisos_repository extends CrudRepository<permisos_entity, Integer> {
}
