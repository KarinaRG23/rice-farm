package com.farm.farm.repository;

import com.farm.farm.entity.persona_entity;
import org.springframework.data.repository.CrudRepository;

public interface persona_repository extends CrudRepository<persona_entity,Integer> {

    public persona_entity findByEmail(String email);
}
