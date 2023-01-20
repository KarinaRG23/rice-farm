package com.farm.farm.service;

import com.farm.farm.entity.VentaEntity;
import com.farm.farm.repository.VentaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class VentaService {

    @Autowired
    VentaRepository VentaRepository;

    public ArrayList<VentaEntity> getAllVenta(){
        return (ArrayList<VentaEntity>) VentaRepository.findAll();
    }
    public VentaEntity saveVenta(VentaEntity data){
        return VentaRepository.save(data);

    }
    public Optional<VentaEntity> getVentaById(int id){
        return VentaRepository.findById(id);

    }

    public boolean deleteVentaById (int id){
        try{
            VentaRepository.deleteById(id);
            return true;
        }
        catch(Exception err){
            return false;
        }
    }
}
