package com.farm.farm.repository;

import com.farm.farm.entity.categoria_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface categoria_repository extends CrudRepository<categoria_entity,Integer> {

}
