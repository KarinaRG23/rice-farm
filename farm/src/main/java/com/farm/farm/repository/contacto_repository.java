package com.farm.farm.repository;

import com.farm.farm.entity.contacto_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface contacto_repository extends CrudRepository<contacto_entity,Integer> {
}
