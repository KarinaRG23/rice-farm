package com.farm.farm.repository;

import com.farm.farm.entity.VentaEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VentaRepository extends CrudRepository<VentaEntity,Integer> {
}
