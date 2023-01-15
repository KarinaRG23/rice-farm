package com.farm.farm.repository;

import com.farm.farm.entity.lote_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface lote_repository extends CrudRepository<lote_entity,Integer> {
}
