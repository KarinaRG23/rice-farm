package com.farm.farm.repository;

import com.farm.farm.entity.pedido_entity;
import org.springframework.data.repository.CrudRepository;

public interface Pedido extends CrudRepository<pedido_entity, Integer> {
}
