package com.farm.farm.service;
import com.farm.farm.entity.TrabajadoresEntity;
import com.farm.farm.entity.TrabajadoresEntity;
import com.farm.farm.repository.TrabajadoresRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class TrabajadoresService {
    @Autowired
    TrabajadoresRepository TrabajadoresRepository;



    public ArrayList<TrabajadoresEntity> getAllTrabajadores(){
        ArrayList<TrabajadoresEntity> trabajadores = new ArrayList<>();
        for(TrabajadoresEntity trabajadoresEntity: TrabajadoresRepository.findAll()){
            if(trabajadoresEntity.getStatus() == 1){
                trabajadores.add(trabajadoresEntity);
            }else{
                continue;
            }
        }
        return trabajadores;
    }
    public TrabajadoresEntity saveTrabajadores(TrabajadoresEntity data){
        return TrabajadoresRepository.save(data);

    }
    public Optional<TrabajadoresEntity> getTrabajadoresById(int id){
        return TrabajadoresRepository.findById(id);

    }

    public void deleteTrabajadoresById (int id){
        TrabajadoresEntity trabajador = TrabajadoresRepository.findById(id).get();
        trabajador.setStatus(0);
        TrabajadoresRepository.save(trabajador);
    }

}
