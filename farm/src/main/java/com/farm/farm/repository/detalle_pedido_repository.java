package com.farm.farm.repository;

import com.farm.farm.entity.detalle_pedido_entity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface detalle_pedido_repository extends CrudRepository<detalle_pedido_entity,Integer> {
}
