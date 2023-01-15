package com.farm.farm.repository;

import com.farm.farm.entity.tipodepago_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface tipodepago_repository extends CrudRepository<tipodepago_entity, Integer> {
}
