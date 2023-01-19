package com.farm.farm.service;
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
        return (ArrayList<TrabajadoresEntity>) TrabajadoresRepository.findAll();
    }
    public TrabajadoresEntity saveTrabajadores(TrabajadoresEntity data){
        return TrabajadoresRepository.save(data);

    }
    public Optional<TrabajadoresEntity> getTrabajadoresById(int id){
        return TrabajadoresRepository.findById(id);

    }

    public boolean deleteTrabajadoresById (int id){
        try{
            TrabajadoresRepository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
