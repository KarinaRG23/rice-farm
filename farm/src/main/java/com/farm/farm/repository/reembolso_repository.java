package com.farm.farm.repository;

import com.farm.farm.entity.reembolso_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface reembolso_repository extends CrudRepository<reembolso_entity, Integer> {
}
