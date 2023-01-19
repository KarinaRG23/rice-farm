package com.farm.farm.repository;

import com.farm.farm.entity.TrabajadoresEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrabajadoresRepository extends CrudRepository<TrabajadoresEntity, Integer> {
}
